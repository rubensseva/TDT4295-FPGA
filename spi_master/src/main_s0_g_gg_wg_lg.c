/*******************************************************************************
 * @file main_s0_g_gg_wg_lg.c
 * @brief Demonstrates USART1 as SPI master.
 *******************************************************************************
 * # License
 * <b>Copyright 2020 Silicon Laboratories Inc. www.silabs.com</b>
 *******************************************************************************/

#include "em_device.h"
#include "em_chip.h"
#include "em_cmu.h"
#include "em_emu.h"
#include "em_gpio.h"
#include "bsp.h"
#include "em_usart.h"

// Breadboard buttons.
// #define BTN1_PIN        0
// #define BTN2_PIN        3
// #define BTN3_PIN        4
// #define BTN4_PIN        5

// PCB Buttons.
#define PCB_BTN1        4
#define PCB_BTN2        5
#define PCB_SW1         6
#define PCB_SW2         7

// PCB Buttons PORT.
#define PCB_PORT        gpioPortE

// PCB DEBUG pins.
#define PCB_PIN1        14
#define PCB_PIN2        15

// Bredboard Button port.
// #define BTN_PORT        gpioPortC

// Transfer Buffer Size.
#define TX_BUFFER_SIZE  1
#define RX_BUFFER_SIZE  TX_BUFFER_SIZE

// Image processing constants.
#define filterAmount    6
uint8_t filterIndex   = 0;
uint8_t filterExtra   = 0;

// Transfer Buffer MOSI Data.
uint8_t TxBuffer[TX_BUFFER_SIZE] = {0x01};
uint32_t TxBufferIndex           = 0;

// Receive Buffer MISO Data.
uint8_t RxBuffer[RX_BUFFER_SIZE] = {0};
uint32_t RxBufferIndex           = 0;

// Button status.
bool bt1 = 0;
bool bt2 = 0;
bool bt3 = 0;
bool bt4 = 0;

// GPIO Even IRQ For Pushbuttons On Even-numbered Pins.
void GPIO_EVEN_IRQHandler(void) 
{
  // Toggle GPIO pin For Debugging.
  GPIO_PinModeSet(PCB_PORT, PCB_PIN1, gpioModePushPull, 1);
  // GPIO_PinOutToggle(PCB_PORT, PCB_PIN1);

  // bt1 = GPIO_PinInGet(BTN_PORT, BTN1_PIN);
  // bt3 = GPIO_PinInGet(BTN_PORT, BTN3_PIN);

  bt1 = GPIO_PinInGet(PCB_PORT, PCB_BTN1);
  bt3 = GPIO_PinInGet(PCB_PORT, PCB_SW1);

  // Clear All Even Pin Interrupt Flags.
  GPIO_IntClear(0x5555);

  // Toggle LED1 - Debugging Purposes.
  // GPIO_PinOutToggle(BSP_GPIO_LED1_PORT, BSP_GPIO_LED1_PIN);

  // Enable USART1.
  // USART_Enable(USART1, usartEnable);

  if(bt1 == 1){
      filterIndex += 1;
      if(filterIndex == filterAmount){
          filterIndex = 0;
      }
  }

  if (bt3 == 1) {
      filterExtra ^= 0b01;
  }

  USART_SpiTransfer(USART1, 0b01 << 6 | filterExtra << 4 | filterIndex);
}

// GPIO Odd IRQ for pushbuttons on odd-numbered Pins.
void GPIO_ODD_IRQHandler(void) 
{
  // Toggle GPIO pin For Debugging.
  GPIO_PinModeSet(PCB_PORT, PCB_PIN1, gpioModePushPull, 1);
  // GPIO_PinOutToggle(PCB_PORT, PCB_PIN1);

  // bt2 = GPIO_PinInGet(BTN_PORT, BTN2_PIN);
  // bt4 = GPIO_PinInGet(BTN_PORT, BTN4_PIN);

  bt2 = GPIO_PinInGet(PCB_PORT, PCB_BTN2);
  bt4 = GPIO_PinInGet(PCB_PORT, PCB_SW2);

  // Clear all odd pin interrupt flags
  GPIO_IntClear(0xAAAA);

  // Toggle LED0 _ Debugging Purposes.
  // GPIO_PinOutToggle(BSP_GPIO_LED0_PORT, BSP_GPIO_LED0_PIN);

  if(bt2 == 1){
      filterIndex -= 1;
      if(filterIndex == 255){
          filterIndex = 5;
      }
  }

  if (bt4 == 1) {
      filterExtra ^= 0b10;
  }

  USART_SpiTransfer(USART1, 0b01 << 6 | filterExtra << 4 | filterIndex);
}

// USART1 TX IRQ Handler.
void USART1_TX_IRQHandler(void)
{
  // Send And Receive Incoming Data.
  USART_Tx(USART1, TxBuffer[TxBufferIndex++]);
  // USART_Tx(USART1, filterIndex);
  // USART_Enable(USART1, usartDisable);

  // Stop Sending Once We've Gone Through The Whole TxBuffer.
  if (TxBufferIndex == TX_BUFFER_SIZE)
  {
    TxBufferIndex = 0;
    USART_Enable(USART1, usartDisable);
  }
}

// USART1 RX IRQ Handler.
void USART1_RX_IRQHandler(void)
{
  // Send and receive incoming data.
  RxBuffer[RxBufferIndex++] = USART_Rx(USART1);

  // Stop once we've filled up our buffer
  if (RxBufferIndex == RX_BUFFER_SIZE)
  {
    RxBufferIndex = 0;
    // Disable USART1 -> Disable SPI handshake.
    // USART_Enable(USART1, usartDisable);
  }
}

// Initialize USART1.
void initUSART1 (void)
{
  CMU_ClockEnable(cmuClock_GPIO, true);
  CMU_ClockEnable(cmuClock_USART1, true);

  // Configure GPIO Mode
  GPIO_PinModeSet(gpioPortD, 2, gpioModePushPull, 0); // US1_CLK is push pull
  GPIO_PinModeSet(gpioPortD, 3, gpioModePushPull, 1); // US1_CS is push pull
  GPIO_PinModeSet(gpioPortD, 0, gpioModePushPull, 1); // US1_TX (MOSI) is push pull
  GPIO_PinModeSet(gpioPortD, 1, gpioModeInput, 1);    // US1_RX (MISO) is input

  // Start With Default Configuration, Then Modify As Necessary
  USART_InitSync_TypeDef config = USART_INITSYNC_DEFAULT;
  config.master       = true;            // master mode
  config.baudrate     = 1000000;         // CLK frequency is 1 MHz
  config.autoCsEnable = true;            // CS pin controlled by hardware, not firmware
  config.clockMode    = usartClockMode0; // clock idle low, sample on rising/first edge
  config.msbf         = true;            // send MSB first
  config.enable       = usartDisable;    // making sure to keep USART disabled until we've set everything up
  USART_InitSync(USART1, &config);

  // Set And Enable USART Pin Locations.
  USART1->ROUTE = USART_ROUTE_CLKPEN | USART_ROUTE_CSPEN | USART_ROUTE_TXPEN | USART_ROUTE_RXPEN | USART_ROUTE_LOCATION_LOC1;

  // Enabling TX Interrupts To Transfer Whenever there Is Room In The Transmit Buffer.
  // USART_IntClear(USART1, USART_IF_TXBL);
  // USART_IntEnable(USART1, USART_IF_TXBL);
  // NVIC_ClearPendingIRQ(USART1_TX_IRQn);
  // NVIC_EnableIRQ(USART1_TX_IRQn);

  // Enabling RX Interrupts To Trigger Whenever a new packet arrives from the slave
  // USART_IntClear(USART1, USART_IF_RXDATAV);
  // USART_IntEnable(USART1, USART_IF_RXDATAV);
  // NVIC_ClearPendingIRQ(USART1_RX_IRQn);
  // NVIC_EnableIRQ(USART1_RX_IRQn);

  // Enable USART1
  USART_Enable(USART1, usartEnable);
}

// GPIO initialization.
void initGPIO(void)
{
  // Enable GPIO clock
  CMU_ClockEnable(cmuClock_GPIO, true);

  // Configure PB0 and PB1 as input with glitch filter enabled
  GPIO_PinModeSet(BSP_GPIO_PB0_PORT, BSP_GPIO_PB0_PIN, gpioModeInputPullFilter, 1);
  GPIO_PinModeSet(BSP_GPIO_PB1_PORT, BSP_GPIO_PB1_PIN, gpioModeInputPullFilter, 1);

  // Set bredboard buttons to input.
  // GPIO_PinModeSet(BTN_PORT, BTN1_PIN, gpioModeInput, 0);
  // GPIO_PinModeSet(BTN_PORT, BTN2_PIN, gpioModeInput, 0);
  // GPIO_PinModeSet(BTN_PORT, BTN3_PIN, gpioModeInput, 0);
  // GPIO_PinModeSet(BTN_PORT, BTN4_PIN, gpioModeInput, 0);

  // PCB Buttons Pins.
  GPIO_PinModeSet(PCB_PORT, PCB_BTN1, gpioModeInput, 0);
  GPIO_PinModeSet(PCB_PORT, PCB_BTN2, gpioModeInput, 0);
  GPIO_PinModeSet(PCB_PORT, PCB_SW1, gpioModeInput, 0);
  GPIO_PinModeSet(PCB_PORT, PCB_SW2, gpioModeInput, 0);

  // Configure LED0 and LED1 as output
  // GPIO_PinModeSet(BSP_GPIO_LED0_PORT, BSP_GPIO_LED0_PIN, gpioModePushPull, 0);
  // GPIO_PinModeSet(BSP_GPIO_LED1_PORT, BSP_GPIO_LED1_PIN, gpioModePushPull, 0);

  // Enable IRQ for even numbered GPIO pins
  NVIC_EnableIRQ(GPIO_EVEN_IRQn);

  // Enable IRQ for odd numbered GPIO pins
  NVIC_EnableIRQ(GPIO_ODD_IRQn);

  // Enable falling-edge interrupts for PB pins
  // GPIO_ExtIntConfig(BSP_GPIO_PB0_PORT, BSP_GPIO_PB0_PIN, BSP_GPIO_PB0_PIN, 0, 1, true);
  // GPIO_ExtIntConfig(BSP_GPIO_PB1_PORT, BSP_GPIO_PB1_PIN, BSP_GPIO_PB1_PIN, 0, 1, true);

  // Setup Interrupts bredboard.
  // GPIO_ExtIntConfig(BTN_PORT, BTN1_PIN, BTN1_PIN, 1, 0, true);
  // GPIO_ExtIntConfig(BTN_PORT, BTN2_PIN, BTN2_PIN, 1, 0, true);
  // GPIO_ExtIntConfig(BTN_PORT, BTN3_PIN, BTN3_PIN, 1, 0, true);
  // GPIO_ExtIntConfig(BTN_PORT, BTN4_PIN, BTN4_PIN, 1, 0, true);

  // Setup interrupts PCB.
  GPIO_ExtIntConfig(PCB_PORT, PCB_BTN1, PCB_BTN1, 1, 0, true);
  GPIO_ExtIntConfig(PCB_PORT, PCB_BTN2, PCB_BTN2, 1, 0, true);
  GPIO_ExtIntConfig(PCB_PORT, PCB_SW1, PCB_SW1, 1, 0, true);
  GPIO_ExtIntConfig(PCB_PORT, PCB_SW2, PCB_SW2, 1, 0, true);

}

// Main.
int main(void)
{
  // Initialize chip.
  CHIP_Init();

  // Initialize Buttons Interrupts.
  initGPIO();

  // Initialize USART1 as SPI master
  initUSART1();

  while(1);
}
