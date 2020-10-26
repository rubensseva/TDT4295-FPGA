package morphinator

import chisel3._

class SPISignals extends Bundle {
  val SCLK                = UInt(1.W)  // SPI clock, should be set by SPI master
  val MOSI                = UInt(1.W)  // Slave input
  val SS                  = UInt(1.W)  // Slave Select, only do stuff when this signal is low 
}
