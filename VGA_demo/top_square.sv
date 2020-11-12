// Project F: FPGA Graphics - Top Square (Arty with Pmod VGA)
// (C)2020 Will Green, open source hardware released under the MIT License
// Learn more at https://projectf.io

`default_nettype none
`timescale 1ns / 1ps

module top_square (
    input wire logic clk_100m,     // 100 MHz clock
    input wire logic btn_rst,      // reset button (active low)
    input wire logic [1:0] btn,    // filter button
    input wire logic [3:0] sw,     // filter switch
    input wire logic io_SPISignals_MOSI,
    input wire logic io_SPISignals_SCLK,
    output wire logic io_SPISignals_SS,
    output logic [3:0] led,
    output logic [3:0] led_r,
    output logic [3:0] led_g,
    output logic [3:0] led_b, 
    output logic vga_hsync,    // horizontal sync
    output logic vga_vsync,    // vertical sync
    output logic [3:0] vga_r,  // 4-bit VGA red
    output logic [3:0] vga_g,  // 4-bit VGA green
    output logic [3:0] vga_b   // 4-bit VGA blue
    );

    // generate pixel clock
    logic clk_pix;
    logic clk_locked;
    clock_gen clock_640x480 (
       .clk(clk_100m),
       .rst(!btn_rst),  // reset button is active low
       .clk_pix,
       .clk_locked
    );

    // display timings
    localparam CORDW = 10;  // screen coordinate width in bits
    logic [CORDW-1:0] sx, sy;
    logic de;
    display_timings timings_640x480 (
        .clk_pix,
        .rst(!clk_locked),  // wait for clock lock
        .sx,
        .sy,
        .hsync(vga_hsync),
        .vsync(vga_vsync),
        .de
    );
    
    
    logic clk_25m;
    logic clk_10m;
    
    reg [1:0] clock_count_25m = 2'd0;
    reg [3:0] clock_count_10m = 4'd0;
    
    //reg [1:0] prevbtn;
    
    always_ff @ (posedge clk_100m) begin
    
        clock_count_25m <= clock_count_25m + 2'd1;
        clk_25m <= (clock_count_25m == 2'd0) ? 1'b1 : 1'b0;
        
        clock_count_10m <= (clock_count_10m == 4'd10) ? 4'd0 : clock_count_10m + 4'd1;
        clk_10m <= (clock_count_10m == 4'd0) ? 1'b1 : 1'b0;
        
        
        /*if(btn[0] && !prevbtn[0]) begin
            filterIndex <= filterIndex + 6'd1;
            if(filterIndex == 6'd6) begin
                filterIndex <= 6'd0;
            end
        end
        
        if(btn[1] && !prevbtn[1]) begin
            filterIndex <= filterIndex - 6'd1;
            if(filterIndex == (6'd0 - 6'd1)) begin
                filterIndex <= 6'd5;
            end
        end
        
        grayscale = sw[0];
        colorInvert = sw[1];
        
        prevbtn[0] = btn[0];
        prevbtn[1] = btn[1];*/
    end
    
    logic [10:0] rowIndex;
    logic [10:0] colIndex;
    logic [3:0] pixelValueR;
    logic [3:0] pixelValueG;
    logic [3:0] pixelValueB;
    logic [5:0] filterIndex;
    logic colorInvert;
    logic grayscale;
    
    spiTop spi(
        .clock(clk_10m),
        .reset(!btn_rst),
        .MOSI(io_SPISignals_MOSI),
        .SS(io_SPISignals_SS),
        .CLK(io_SPISignals_SCLK),
        
        .filterIndex,
        .colorInvert,
        .grayscale
    );
    
    ImageProcessing imageProcessing(
        .clock(clk_25m),
        .reset(!btn_rst),
        .io_rowIndex(rowIndex),
        .io_colIndex(colIndex),
        .io_SPI_filterIndex(filterIndex),
        .io_SPI_invert(colorInvert),
        .io_SPI_distort(grayscale),
        .io_pixelVal_out_0(pixelValueR),
        .io_pixelVal_out_1(pixelValueG),
        .io_pixelVal_out_2(pixelValueB)
    );

    always_comb begin
        led[0] <= filterIndex[0];
        led[1] <= filterIndex[1];
        led[2] <= filterIndex[2];
        led[3] <= filterIndex[3];
        led_g[0] <= filterIndex[4];
        led_g[1] <= filterIndex[5];
        led_g[2] <= colorInvert;
        led_g[3] <= grayscale;
    end
    
    always_ff @ (posedge clk_pix) begin
    
        rowIndex = sy / 40;
        colIndex = sx / 40;
        vga_r = !de ? 4'h0 : pixelValueR;
        vga_g = !de ? 4'h0 : pixelValueG;
        vga_b = !de ? 4'h0 : pixelValueB;
    end
endmodule