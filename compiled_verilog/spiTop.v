`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2020 03:26:01 PM
// Design Name: 
// Module Name: spiTop
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module spiTop(
  input        clock,
  input        reset,
  input        MOSI,
  input        SS,
  input        CLK,
  
  
  output currentByte,
  output isCurrentlyReading

);

Splitter split (
    .in1(clock)
);

Synchronizer syn (
    .SPI_clock(CLK),
    .clock(split.out2)
);

SPISlave(
    .clock(split.out1),
    .reset(reset),
    .io_SPISignals_SCLK(syn.SPI_clock_synced),
    .io_SPISignals_MOSI(MOSI),
    .io_SPISignals_SS(SS),
    
    .io_currentByte(Byte),
    .io_isCurrentlyReading(Reading)
    
);

    wire Byte;
    wire Reading;
    
    assign currentByte = Byte;
    assign isCurrentlyReading = Reading;
      
endmodule
