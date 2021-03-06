
module video_gen
//-----------------------------------------------------------------
// Params
//-----------------------------------------------------------------
#(
     parameter WIDTH            = 1920
    ,parameter HEIGHT           = 1080
    ,parameter REFRESH          = 60
)
//-----------------------------------------------------------------
// Ports
//-----------------------------------------------------------------
(
    // Inputs
     input           clk_i
    ,input           rst_i
    ,input           io_SPISignals_MOSI
    ,input           io_SPISignals_SS
    ,input           io_SPISignals_SCLK

    // Outputs
    ,output [  7:0]  vga_red_o
    ,output [  7:0]  vga_green_o
    ,output [  7:0]  vga_blue_o
    ,output          vga_blank_o
    ,output          vga_hsync_o
    ,output          vga_vsync_o
);



//-----------------------------------------------------------------
// Video Timings
//-----------------------------------------------------------------
localparam H_REZ         = WIDTH;
localparam V_REZ         = HEIGHT;
localparam CLK_MHZ       = (WIDTH == 640 && REFRESH == 60)  ? 25.175 :
                           (WIDTH == 800 && REFRESH == 72)  ? 50.00  :
                           (WIDTH == 1280 && REFRESH == 60) ? 74.25  :
                           (WIDTH == 1920 && REFRESH == 60) ? 148.5  :
                                                              0;
localparam H_SYNC_START  = (WIDTH == 640 && REFRESH == 60)  ? 656 :
                           (WIDTH == 800 && REFRESH == 72)  ? 856 :
                           (WIDTH == 1280 && REFRESH == 60) ? 1390:
                           (WIDTH == 1920 && REFRESH == 60) ? 2008:
                                                              0;
localparam H_SYNC_END    = (WIDTH == 640 && REFRESH == 60)  ? 752 :
                           (WIDTH == 800 && REFRESH == 72)  ? 976 :
                           (WIDTH == 1280 && REFRESH == 60) ? 1430:
                           (WIDTH == 1920 && REFRESH == 60) ? 2052:
                                                              0;
localparam H_MAX         = (WIDTH == 640 && REFRESH == 60)  ? 800 :
                           (WIDTH == 800 && REFRESH == 72)  ? 1040:
                           (WIDTH == 1280 && REFRESH == 60) ? 1650:
                           (WIDTH == 1920 && REFRESH == 60) ? 2200:
                                                              0;
localparam V_SYNC_START  = (HEIGHT == 480 && REFRESH == 60) ? 490 :
                           (HEIGHT == 600 && REFRESH == 72) ? 637 :
                           (HEIGHT == 720 && REFRESH == 60) ? 725 :
                           (HEIGHT == 1080 && REFRESH == 60)? 1084 :
                                                              0;
localparam V_SYNC_END    = (HEIGHT == 480 && REFRESH == 60) ? 492 :
                           (HEIGHT == 600 && REFRESH == 72) ? 643 :
                           (HEIGHT == 720 && REFRESH == 60) ? 730 :
                           (HEIGHT == 1080 && REFRESH == 60)? 1089:
                                                              0;
localparam V_MAX         = (HEIGHT == 480 && REFRESH == 60) ? 525 :
                           (HEIGHT == 600 && REFRESH == 72) ? 666 :
                           (HEIGHT == 720 && REFRESH == 60) ? 750 :
                           (HEIGHT == 1080 && REFRESH == 60)? 1125:
                                                              0;

//-----------------------------------------------------------------
// Colour Bars
//-----------------------------------------------------------------
localparam H_STRIDE = WIDTH / 7;
localparam C0_S     = 0;
localparam C0_E     = H_STRIDE-1;
localparam C1_S     = C0_E + 1;
localparam C1_E     = C1_S + H_STRIDE - 1;
localparam C2_S     = C1_E + 1;
localparam C2_E     = C2_S + H_STRIDE - 1;
localparam C3_S     = C2_E + 1;
localparam C3_E     = C3_S + H_STRIDE - 1;
localparam C4_S     = C3_E + 1;
localparam C4_E     = C4_S + H_STRIDE - 1;
localparam C5_S     = C4_E + 1;
localparam C5_E     = C5_S + H_STRIDE - 1;
localparam C6_S     = C5_E + 1;
localparam C6_E     = C6_S + H_STRIDE - 1;

//-----------------------------------------------------------------
// HSYNC, VSYNC
//-----------------------------------------------------------------
reg [11:0] h_pos_q;
reg [11:0] v_pos_q;
reg        h_sync_q;
reg        v_sync_q;
reg        active_q;

always @ (posedge clk_i or posedge rst_i)
if (rst_i)
    h_pos_q  <= 12'b0;
else if (h_pos_q == H_MAX)
    h_pos_q  <= 12'b0;
else
    h_pos_q  <= h_pos_q + 12'd1;

always @ (posedge clk_i or posedge rst_i)
if (rst_i)
    v_pos_q  <= 12'b0;
else if (h_pos_q == H_MAX)
begin
    if (v_pos_q == V_MAX)
        v_pos_q  <= 12'b0;
    else
        v_pos_q  <= v_pos_q + 12'd1;
end

always @ (posedge clk_i or posedge rst_i)
if (rst_i)
    h_sync_q  <= 1'b0;
else if (h_pos_q >= H_SYNC_START && h_pos_q < H_SYNC_END)
    h_sync_q  <= 1'b1;
else
    h_sync_q  <= 1'b0;

always @ (posedge clk_i or posedge rst_i)
if (rst_i)
    v_sync_q  <= 1'b0;
else if (v_pos_q >= V_SYNC_START && v_pos_q < V_SYNC_END)
    v_sync_q  <= 1'b1;
else
    v_sync_q  <= 1'b0;

reg [10:0] rowIndex;
reg [10:0] colIndex;
wire [3:0] pixelValueR;
wire [3:0] pixelValueG;
wire [3:0] pixelValueB;
wire [5:0] filterIndex_r;
wire filterInvert_r;
wire filterDistort_r;

spiTop spi(
    .clock(clk_i),
    .reset(rst_i),
    .MOSI(io_SPISignals_MOSI),
    .SS(io_SPISignals_SS),
    .CLK(io_SPISignals_SCLK),
    .filterIndex(filterIndex_r),
    .colorInvert(filterInvert_r),
    .grayscale(filterDistort_r)
    );

ImageProcessing imageProcessing(
    .clock(clk_i),
    .reset(rst_i),
    .io_rowIndex(rowIndex),
    .io_colIndex(colIndex),
    .io_SPI_filterIndex(filterIndex_r),
    .io_SPI_invert(filterInvert_r),
    .io_SPI_distort(filterDistort_r),
    .io_pixelVal_out_0(pixelValueR),
    .io_pixelVal_out_1(pixelValueG),
    .io_pixelVal_out_2(pixelValueB)
);

always @ * begin
    rowIndex = v_pos_q / 90;
    colIndex = h_pos_q / 120;
end

assign vga_red_o   = pixelValueR << 4;
assign vga_green_o = pixelValueG << 4;
assign vga_blue_o  = pixelValueB << 4;
assign vga_hsync_o = h_sync_q;
assign vga_vsync_o = v_sync_q;
assign vga_blank_o = (h_pos_q < H_REZ && v_pos_q < V_REZ) ? 1'b0 : 1'b1;

endmodule