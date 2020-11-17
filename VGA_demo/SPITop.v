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
  
  output reg [5:0] filterIndex,
  output reg colorInvert,
  output reg grayscale

);


    wire [7:0] byte;
    wire reading;

    SPISlave(
        .clock(clock),
        .reset(reset),
        .io_SPISignals_SCLK(CLK),
        .io_SPISignals_MOSI(MOSI),
        .io_SPISignals_SS(SS),
        
        .io_currentByte(byte),
        .io_isCurrentlyReading(reading)
    );
    
    always @ * begin
        if (byte[7] == 1'b0) begin
            filterIndex <= byte[3:0];
            colorInvert <= byte[4];
            grayscale <= byte[5];
        end else begin
            filterIndex <= byte[4:1];
            colorInvert <= byte[5];
            grayscale <= byte[6];
        end
    end
      
endmodule