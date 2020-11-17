module DotProd(
  input        clock,
  input        reset,
  input  [7:0] io_dataInA,
  input  [7:0] io_dataInB,
  output [8:0] io_dataOut,
  output       io_outputValid
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] countVal; // @[Counter.scala 29:33]
  wire  countReset = countVal == 4'h8; // @[Counter.scala 38:24]
  wire [3:0] _T_2 = countVal + 4'h1; // @[Counter.scala 39:22]
  reg [8:0] accumulator; // @[DotProd.scala 19:28]
  wire [15:0] product = $signed(io_dataInA) * $signed(io_dataInB); // @[DotProd.scala 20:35]
  wire [15:0] _GEN_5 = {{7{accumulator[8]}},accumulator}; // @[DotProd.scala 21:30]
  wire [15:0] _T_6 = $signed(_GEN_5) + $signed(product); // @[DotProd.scala 21:30]
  wire [15:0] _GEN_4 = countReset ? $signed(16'sh0) : $signed(_T_6); // @[DotProd.scala 25:20]
  assign io_dataOut = _T_6[8:0]; // @[DotProd.scala 23:14]
  assign io_outputValid = countVal == 4'h8; // @[DotProd.scala 26:20 DotProd.scala 29:20]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  countVal = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  accumulator = _RAND_1[8:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      countVal <= 4'h0;
    end else if (countReset) begin
      countVal <= 4'h0;
    end else begin
      countVal <= _T_2;
    end
    if (reset) begin
      accumulator <= 9'sh0;
    end else begin
      accumulator <= _GEN_4[8:0];
    end
  end
endmodule
module KernelConvolution(
  input        clock,
  input        reset,
  input  [4:0] io_kernelVal_in,
  input  [3:0] io_pixelVal_in_0,
  input  [3:0] io_pixelVal_in_1,
  input  [3:0] io_pixelVal_in_2,
  input  [3:0] io_pixelVal_in_3,
  input  [3:0] io_pixelVal_in_4,
  input  [3:0] io_pixelVal_in_5,
  input  [3:0] io_pixelVal_in_6,
  input  [3:0] io_pixelVal_in_7,
  output [8:0] io_pixelVal_out_0,
  output [8:0] io_pixelVal_out_1,
  output [8:0] io_pixelVal_out_2,
  output [8:0] io_pixelVal_out_3,
  output [8:0] io_pixelVal_out_4,
  output [8:0] io_pixelVal_out_5,
  output [8:0] io_pixelVal_out_6,
  output [8:0] io_pixelVal_out_7,
  output       io_valid_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
`endif // RANDOMIZE_REG_INIT
  wire  DotProd_clock; // @[KernelConvolution.scala 21:58]
  wire  DotProd_reset; // @[KernelConvolution.scala 21:58]
  wire [7:0] DotProd_io_dataInA; // @[KernelConvolution.scala 21:58]
  wire [7:0] DotProd_io_dataInB; // @[KernelConvolution.scala 21:58]
  wire [8:0] DotProd_io_dataOut; // @[KernelConvolution.scala 21:58]
  wire  DotProd_io_outputValid; // @[KernelConvolution.scala 21:58]
  wire  DotProd_1_clock; // @[KernelConvolution.scala 21:58]
  wire  DotProd_1_reset; // @[KernelConvolution.scala 21:58]
  wire [7:0] DotProd_1_io_dataInA; // @[KernelConvolution.scala 21:58]
  wire [7:0] DotProd_1_io_dataInB; // @[KernelConvolution.scala 21:58]
  wire [8:0] DotProd_1_io_dataOut; // @[KernelConvolution.scala 21:58]
  wire  DotProd_1_io_outputValid; // @[KernelConvolution.scala 21:58]
  wire  DotProd_2_clock; // @[KernelConvolution.scala 21:58]
  wire  DotProd_2_reset; // @[KernelConvolution.scala 21:58]
  wire [7:0] DotProd_2_io_dataInA; // @[KernelConvolution.scala 21:58]
  wire [7:0] DotProd_2_io_dataInB; // @[KernelConvolution.scala 21:58]
  wire [8:0] DotProd_2_io_dataOut; // @[KernelConvolution.scala 21:58]
  wire  DotProd_2_io_outputValid; // @[KernelConvolution.scala 21:58]
  wire  DotProd_3_clock; // @[KernelConvolution.scala 21:58]
  wire  DotProd_3_reset; // @[KernelConvolution.scala 21:58]
  wire [7:0] DotProd_3_io_dataInA; // @[KernelConvolution.scala 21:58]
  wire [7:0] DotProd_3_io_dataInB; // @[KernelConvolution.scala 21:58]
  wire [8:0] DotProd_3_io_dataOut; // @[KernelConvolution.scala 21:58]
  wire  DotProd_3_io_outputValid; // @[KernelConvolution.scala 21:58]
  wire  DotProd_4_clock; // @[KernelConvolution.scala 21:58]
  wire  DotProd_4_reset; // @[KernelConvolution.scala 21:58]
  wire [7:0] DotProd_4_io_dataInA; // @[KernelConvolution.scala 21:58]
  wire [7:0] DotProd_4_io_dataInB; // @[KernelConvolution.scala 21:58]
  wire [8:0] DotProd_4_io_dataOut; // @[KernelConvolution.scala 21:58]
  wire  DotProd_4_io_outputValid; // @[KernelConvolution.scala 21:58]
  wire  DotProd_5_clock; // @[KernelConvolution.scala 21:58]
  wire  DotProd_5_reset; // @[KernelConvolution.scala 21:58]
  wire [7:0] DotProd_5_io_dataInA; // @[KernelConvolution.scala 21:58]
  wire [7:0] DotProd_5_io_dataInB; // @[KernelConvolution.scala 21:58]
  wire [8:0] DotProd_5_io_dataOut; // @[KernelConvolution.scala 21:58]
  wire  DotProd_5_io_outputValid; // @[KernelConvolution.scala 21:58]
  wire  DotProd_6_clock; // @[KernelConvolution.scala 21:58]
  wire  DotProd_6_reset; // @[KernelConvolution.scala 21:58]
  wire [7:0] DotProd_6_io_dataInA; // @[KernelConvolution.scala 21:58]
  wire [7:0] DotProd_6_io_dataInB; // @[KernelConvolution.scala 21:58]
  wire [8:0] DotProd_6_io_dataOut; // @[KernelConvolution.scala 21:58]
  wire  DotProd_6_io_outputValid; // @[KernelConvolution.scala 21:58]
  wire  DotProd_7_clock; // @[KernelConvolution.scala 21:58]
  wire  DotProd_7_reset; // @[KernelConvolution.scala 21:58]
  wire [7:0] DotProd_7_io_dataInA; // @[KernelConvolution.scala 21:58]
  wire [7:0] DotProd_7_io_dataInB; // @[KernelConvolution.scala 21:58]
  wire [8:0] DotProd_7_io_dataOut; // @[KernelConvolution.scala 21:58]
  wire  DotProd_7_io_outputValid; // @[KernelConvolution.scala 21:58]
  reg  validOut; // @[KernelConvolution.scala 30:27]
  reg [8:0] pixOut_0; // @[KernelConvolution.scala 32:29]
  reg [8:0] pixOut_1; // @[KernelConvolution.scala 32:29]
  reg [8:0] pixOut_2; // @[KernelConvolution.scala 32:29]
  reg [8:0] pixOut_3; // @[KernelConvolution.scala 32:29]
  reg [8:0] pixOut_4; // @[KernelConvolution.scala 32:29]
  reg [8:0] pixOut_5; // @[KernelConvolution.scala 32:29]
  reg [8:0] pixOut_6; // @[KernelConvolution.scala 32:29]
  reg [8:0] pixOut_7; // @[KernelConvolution.scala 32:29]
  wire [8:0] dotProdCalc_0_dataOut = DotProd_io_dataOut; // @[KernelConvolution.scala 21:32 KernelConvolution.scala 21:32]
  wire  dotProdCalc_0_outputValid = DotProd_io_outputValid; // @[KernelConvolution.scala 21:32 KernelConvolution.scala 21:32]
  wire [8:0] dotProdCalc_1_dataOut = DotProd_1_io_dataOut; // @[KernelConvolution.scala 21:32 KernelConvolution.scala 21:32]
  wire [8:0] dotProdCalc_2_dataOut = DotProd_2_io_dataOut; // @[KernelConvolution.scala 21:32 KernelConvolution.scala 21:32]
  wire [8:0] dotProdCalc_3_dataOut = DotProd_3_io_dataOut; // @[KernelConvolution.scala 21:32 KernelConvolution.scala 21:32]
  wire [8:0] dotProdCalc_4_dataOut = DotProd_4_io_dataOut; // @[KernelConvolution.scala 21:32 KernelConvolution.scala 21:32]
  wire [8:0] dotProdCalc_5_dataOut = DotProd_5_io_dataOut; // @[KernelConvolution.scala 21:32 KernelConvolution.scala 21:32]
  wire [8:0] dotProdCalc_6_dataOut = DotProd_6_io_dataOut; // @[KernelConvolution.scala 21:32 KernelConvolution.scala 21:32]
  wire [8:0] dotProdCalc_7_dataOut = DotProd_7_io_dataOut; // @[KernelConvolution.scala 21:32 KernelConvolution.scala 21:32]
  DotProd DotProd ( // @[KernelConvolution.scala 21:58]
    .clock(DotProd_clock),
    .reset(DotProd_reset),
    .io_dataInA(DotProd_io_dataInA),
    .io_dataInB(DotProd_io_dataInB),
    .io_dataOut(DotProd_io_dataOut),
    .io_outputValid(DotProd_io_outputValid)
  );
  DotProd DotProd_1 ( // @[KernelConvolution.scala 21:58]
    .clock(DotProd_1_clock),
    .reset(DotProd_1_reset),
    .io_dataInA(DotProd_1_io_dataInA),
    .io_dataInB(DotProd_1_io_dataInB),
    .io_dataOut(DotProd_1_io_dataOut),
    .io_outputValid(DotProd_1_io_outputValid)
  );
  DotProd DotProd_2 ( // @[KernelConvolution.scala 21:58]
    .clock(DotProd_2_clock),
    .reset(DotProd_2_reset),
    .io_dataInA(DotProd_2_io_dataInA),
    .io_dataInB(DotProd_2_io_dataInB),
    .io_dataOut(DotProd_2_io_dataOut),
    .io_outputValid(DotProd_2_io_outputValid)
  );
  DotProd DotProd_3 ( // @[KernelConvolution.scala 21:58]
    .clock(DotProd_3_clock),
    .reset(DotProd_3_reset),
    .io_dataInA(DotProd_3_io_dataInA),
    .io_dataInB(DotProd_3_io_dataInB),
    .io_dataOut(DotProd_3_io_dataOut),
    .io_outputValid(DotProd_3_io_outputValid)
  );
  DotProd DotProd_4 ( // @[KernelConvolution.scala 21:58]
    .clock(DotProd_4_clock),
    .reset(DotProd_4_reset),
    .io_dataInA(DotProd_4_io_dataInA),
    .io_dataInB(DotProd_4_io_dataInB),
    .io_dataOut(DotProd_4_io_dataOut),
    .io_outputValid(DotProd_4_io_outputValid)
  );
  DotProd DotProd_5 ( // @[KernelConvolution.scala 21:58]
    .clock(DotProd_5_clock),
    .reset(DotProd_5_reset),
    .io_dataInA(DotProd_5_io_dataInA),
    .io_dataInB(DotProd_5_io_dataInB),
    .io_dataOut(DotProd_5_io_dataOut),
    .io_outputValid(DotProd_5_io_outputValid)
  );
  DotProd DotProd_6 ( // @[KernelConvolution.scala 21:58]
    .clock(DotProd_6_clock),
    .reset(DotProd_6_reset),
    .io_dataInA(DotProd_6_io_dataInA),
    .io_dataInB(DotProd_6_io_dataInB),
    .io_dataOut(DotProd_6_io_dataOut),
    .io_outputValid(DotProd_6_io_outputValid)
  );
  DotProd DotProd_7 ( // @[KernelConvolution.scala 21:58]
    .clock(DotProd_7_clock),
    .reset(DotProd_7_reset),
    .io_dataInA(DotProd_7_io_dataInA),
    .io_dataInB(DotProd_7_io_dataInB),
    .io_dataOut(DotProd_7_io_dataOut),
    .io_outputValid(DotProd_7_io_outputValid)
  );
  assign io_pixelVal_out_0 = pixOut_0; // @[KernelConvolution.scala 38:34]
  assign io_pixelVal_out_1 = pixOut_1; // @[KernelConvolution.scala 38:34]
  assign io_pixelVal_out_2 = pixOut_2; // @[KernelConvolution.scala 38:34]
  assign io_pixelVal_out_3 = pixOut_3; // @[KernelConvolution.scala 38:34]
  assign io_pixelVal_out_4 = pixOut_4; // @[KernelConvolution.scala 38:34]
  assign io_pixelVal_out_5 = pixOut_5; // @[KernelConvolution.scala 38:34]
  assign io_pixelVal_out_6 = pixOut_6; // @[KernelConvolution.scala 38:34]
  assign io_pixelVal_out_7 = pixOut_7; // @[KernelConvolution.scala 38:34]
  assign io_valid_out = validOut; // @[KernelConvolution.scala 40:30]
  assign DotProd_clock = clock;
  assign DotProd_reset = reset;
  assign DotProd_io_dataInA = {{4'd0}, io_pixelVal_in_0}; // @[KernelConvolution.scala 21:32]
  assign DotProd_io_dataInB = {{3{io_kernelVal_in[4]}},io_kernelVal_in}; // @[KernelConvolution.scala 21:32]
  assign DotProd_1_clock = clock;
  assign DotProd_1_reset = reset;
  assign DotProd_1_io_dataInA = {{4'd0}, io_pixelVal_in_1}; // @[KernelConvolution.scala 21:32]
  assign DotProd_1_io_dataInB = {{3{io_kernelVal_in[4]}},io_kernelVal_in}; // @[KernelConvolution.scala 21:32]
  assign DotProd_2_clock = clock;
  assign DotProd_2_reset = reset;
  assign DotProd_2_io_dataInA = {{4'd0}, io_pixelVal_in_2}; // @[KernelConvolution.scala 21:32]
  assign DotProd_2_io_dataInB = {{3{io_kernelVal_in[4]}},io_kernelVal_in}; // @[KernelConvolution.scala 21:32]
  assign DotProd_3_clock = clock;
  assign DotProd_3_reset = reset;
  assign DotProd_3_io_dataInA = {{4'd0}, io_pixelVal_in_3}; // @[KernelConvolution.scala 21:32]
  assign DotProd_3_io_dataInB = {{3{io_kernelVal_in[4]}},io_kernelVal_in}; // @[KernelConvolution.scala 21:32]
  assign DotProd_4_clock = clock;
  assign DotProd_4_reset = reset;
  assign DotProd_4_io_dataInA = {{4'd0}, io_pixelVal_in_4}; // @[KernelConvolution.scala 21:32]
  assign DotProd_4_io_dataInB = {{3{io_kernelVal_in[4]}},io_kernelVal_in}; // @[KernelConvolution.scala 21:32]
  assign DotProd_5_clock = clock;
  assign DotProd_5_reset = reset;
  assign DotProd_5_io_dataInA = {{4'd0}, io_pixelVal_in_5}; // @[KernelConvolution.scala 21:32]
  assign DotProd_5_io_dataInB = {{3{io_kernelVal_in[4]}},io_kernelVal_in}; // @[KernelConvolution.scala 21:32]
  assign DotProd_6_clock = clock;
  assign DotProd_6_reset = reset;
  assign DotProd_6_io_dataInA = {{4'd0}, io_pixelVal_in_6}; // @[KernelConvolution.scala 21:32]
  assign DotProd_6_io_dataInB = {{3{io_kernelVal_in[4]}},io_kernelVal_in}; // @[KernelConvolution.scala 21:32]
  assign DotProd_7_clock = clock;
  assign DotProd_7_reset = reset;
  assign DotProd_7_io_dataInA = {{4'd0}, io_pixelVal_in_7}; // @[KernelConvolution.scala 21:32]
  assign DotProd_7_io_dataInB = {{3{io_kernelVal_in[4]}},io_kernelVal_in}; // @[KernelConvolution.scala 21:32]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  validOut = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  pixOut_0 = _RAND_1[8:0];
  _RAND_2 = {1{`RANDOM}};
  pixOut_1 = _RAND_2[8:0];
  _RAND_3 = {1{`RANDOM}};
  pixOut_2 = _RAND_3[8:0];
  _RAND_4 = {1{`RANDOM}};
  pixOut_3 = _RAND_4[8:0];
  _RAND_5 = {1{`RANDOM}};
  pixOut_4 = _RAND_5[8:0];
  _RAND_6 = {1{`RANDOM}};
  pixOut_5 = _RAND_6[8:0];
  _RAND_7 = {1{`RANDOM}};
  pixOut_6 = _RAND_7[8:0];
  _RAND_8 = {1{`RANDOM}};
  pixOut_7 = _RAND_8[8:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      validOut <= 1'h0;
    end else begin
      validOut <= dotProdCalc_0_outputValid;
    end
    if (reset) begin
      pixOut_0 <= 9'sh0;
    end else begin
      pixOut_0 <= dotProdCalc_0_dataOut;
    end
    if (reset) begin
      pixOut_1 <= 9'sh0;
    end else begin
      pixOut_1 <= dotProdCalc_1_dataOut;
    end
    if (reset) begin
      pixOut_2 <= 9'sh0;
    end else begin
      pixOut_2 <= dotProdCalc_2_dataOut;
    end
    if (reset) begin
      pixOut_3 <= 9'sh0;
    end else begin
      pixOut_3 <= dotProdCalc_3_dataOut;
    end
    if (reset) begin
      pixOut_4 <= 9'sh0;
    end else begin
      pixOut_4 <= dotProdCalc_4_dataOut;
    end
    if (reset) begin
      pixOut_5 <= 9'sh0;
    end else begin
      pixOut_5 <= dotProdCalc_5_dataOut;
    end
    if (reset) begin
      pixOut_6 <= 9'sh0;
    end else begin
      pixOut_6 <= dotProdCalc_6_dataOut;
    end
    if (reset) begin
      pixOut_7 <= 9'sh0;
    end else begin
      pixOut_7 <= dotProdCalc_7_dataOut;
    end
  end
endmodule
module Filter(
  input        clock,
  input        reset,
  input  [5:0] io_SPI_filterIndex,
  input        io_SPI_invert,
  input        io_SPI_distort,
  output [3:0] io_pixelVal_out_0_0,
  output [3:0] io_pixelVal_out_0_1,
  output [3:0] io_pixelVal_out_0_2,
  output [3:0] io_pixelVal_out_0_3,
  output [3:0] io_pixelVal_out_0_4,
  output [3:0] io_pixelVal_out_0_5,
  output [3:0] io_pixelVal_out_0_6,
  output [3:0] io_pixelVal_out_0_7,
  output [3:0] io_pixelVal_out_1_0,
  output [3:0] io_pixelVal_out_1_1,
  output [3:0] io_pixelVal_out_1_2,
  output [3:0] io_pixelVal_out_1_3,
  output [3:0] io_pixelVal_out_1_4,
  output [3:0] io_pixelVal_out_1_5,
  output [3:0] io_pixelVal_out_1_6,
  output [3:0] io_pixelVal_out_1_7,
  output [3:0] io_pixelVal_out_2_0,
  output [3:0] io_pixelVal_out_2_1,
  output [3:0] io_pixelVal_out_2_2,
  output [3:0] io_pixelVal_out_2_3,
  output [3:0] io_pixelVal_out_2_4,
  output [3:0] io_pixelVal_out_2_5,
  output [3:0] io_pixelVal_out_2_6,
  output [3:0] io_pixelVal_out_2_7,
  output       io_valid_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  wire  KernelConvolution_clock; // @[Filter.scala 188:36]
  wire  KernelConvolution_reset; // @[Filter.scala 188:36]
  wire [4:0] KernelConvolution_io_kernelVal_in; // @[Filter.scala 188:36]
  wire [3:0] KernelConvolution_io_pixelVal_in_0; // @[Filter.scala 188:36]
  wire [3:0] KernelConvolution_io_pixelVal_in_1; // @[Filter.scala 188:36]
  wire [3:0] KernelConvolution_io_pixelVal_in_2; // @[Filter.scala 188:36]
  wire [3:0] KernelConvolution_io_pixelVal_in_3; // @[Filter.scala 188:36]
  wire [3:0] KernelConvolution_io_pixelVal_in_4; // @[Filter.scala 188:36]
  wire [3:0] KernelConvolution_io_pixelVal_in_5; // @[Filter.scala 188:36]
  wire [3:0] KernelConvolution_io_pixelVal_in_6; // @[Filter.scala 188:36]
  wire [3:0] KernelConvolution_io_pixelVal_in_7; // @[Filter.scala 188:36]
  wire [8:0] KernelConvolution_io_pixelVal_out_0; // @[Filter.scala 188:36]
  wire [8:0] KernelConvolution_io_pixelVal_out_1; // @[Filter.scala 188:36]
  wire [8:0] KernelConvolution_io_pixelVal_out_2; // @[Filter.scala 188:36]
  wire [8:0] KernelConvolution_io_pixelVal_out_3; // @[Filter.scala 188:36]
  wire [8:0] KernelConvolution_io_pixelVal_out_4; // @[Filter.scala 188:36]
  wire [8:0] KernelConvolution_io_pixelVal_out_5; // @[Filter.scala 188:36]
  wire [8:0] KernelConvolution_io_pixelVal_out_6; // @[Filter.scala 188:36]
  wire [8:0] KernelConvolution_io_pixelVal_out_7; // @[Filter.scala 188:36]
  wire  KernelConvolution_io_valid_out; // @[Filter.scala 188:36]
  wire  KernelConvolution_1_clock; // @[Filter.scala 189:36]
  wire  KernelConvolution_1_reset; // @[Filter.scala 189:36]
  wire [4:0] KernelConvolution_1_io_kernelVal_in; // @[Filter.scala 189:36]
  wire [3:0] KernelConvolution_1_io_pixelVal_in_0; // @[Filter.scala 189:36]
  wire [3:0] KernelConvolution_1_io_pixelVal_in_1; // @[Filter.scala 189:36]
  wire [3:0] KernelConvolution_1_io_pixelVal_in_2; // @[Filter.scala 189:36]
  wire [3:0] KernelConvolution_1_io_pixelVal_in_3; // @[Filter.scala 189:36]
  wire [3:0] KernelConvolution_1_io_pixelVal_in_4; // @[Filter.scala 189:36]
  wire [3:0] KernelConvolution_1_io_pixelVal_in_5; // @[Filter.scala 189:36]
  wire [3:0] KernelConvolution_1_io_pixelVal_in_6; // @[Filter.scala 189:36]
  wire [3:0] KernelConvolution_1_io_pixelVal_in_7; // @[Filter.scala 189:36]
  wire [8:0] KernelConvolution_1_io_pixelVal_out_0; // @[Filter.scala 189:36]
  wire [8:0] KernelConvolution_1_io_pixelVal_out_1; // @[Filter.scala 189:36]
  wire [8:0] KernelConvolution_1_io_pixelVal_out_2; // @[Filter.scala 189:36]
  wire [8:0] KernelConvolution_1_io_pixelVal_out_3; // @[Filter.scala 189:36]
  wire [8:0] KernelConvolution_1_io_pixelVal_out_4; // @[Filter.scala 189:36]
  wire [8:0] KernelConvolution_1_io_pixelVal_out_5; // @[Filter.scala 189:36]
  wire [8:0] KernelConvolution_1_io_pixelVal_out_6; // @[Filter.scala 189:36]
  wire [8:0] KernelConvolution_1_io_pixelVal_out_7; // @[Filter.scala 189:36]
  wire  KernelConvolution_1_io_valid_out; // @[Filter.scala 189:36]
  wire  KernelConvolution_2_clock; // @[Filter.scala 190:36]
  wire  KernelConvolution_2_reset; // @[Filter.scala 190:36]
  wire [4:0] KernelConvolution_2_io_kernelVal_in; // @[Filter.scala 190:36]
  wire [3:0] KernelConvolution_2_io_pixelVal_in_0; // @[Filter.scala 190:36]
  wire [3:0] KernelConvolution_2_io_pixelVal_in_1; // @[Filter.scala 190:36]
  wire [3:0] KernelConvolution_2_io_pixelVal_in_2; // @[Filter.scala 190:36]
  wire [3:0] KernelConvolution_2_io_pixelVal_in_3; // @[Filter.scala 190:36]
  wire [3:0] KernelConvolution_2_io_pixelVal_in_4; // @[Filter.scala 190:36]
  wire [3:0] KernelConvolution_2_io_pixelVal_in_5; // @[Filter.scala 190:36]
  wire [3:0] KernelConvolution_2_io_pixelVal_in_6; // @[Filter.scala 190:36]
  wire [3:0] KernelConvolution_2_io_pixelVal_in_7; // @[Filter.scala 190:36]
  wire [8:0] KernelConvolution_2_io_pixelVal_out_0; // @[Filter.scala 190:36]
  wire [8:0] KernelConvolution_2_io_pixelVal_out_1; // @[Filter.scala 190:36]
  wire [8:0] KernelConvolution_2_io_pixelVal_out_2; // @[Filter.scala 190:36]
  wire [8:0] KernelConvolution_2_io_pixelVal_out_3; // @[Filter.scala 190:36]
  wire [8:0] KernelConvolution_2_io_pixelVal_out_4; // @[Filter.scala 190:36]
  wire [8:0] KernelConvolution_2_io_pixelVal_out_5; // @[Filter.scala 190:36]
  wire [8:0] KernelConvolution_2_io_pixelVal_out_6; // @[Filter.scala 190:36]
  wire [8:0] KernelConvolution_2_io_pixelVal_out_7; // @[Filter.scala 190:36]
  wire  KernelConvolution_2_io_valid_out; // @[Filter.scala 190:36]
  reg [3:0] kernelCounter; // @[Counter.scala 29:33]
  wire  kernelCountReset = kernelCounter == 4'h8; // @[Counter.scala 38:24]
  wire [3:0] _T_14 = kernelCounter + 4'h1; // @[Counter.scala 39:22]
  wire  _GEN_539 = 3'h0 == io_SPI_filterIndex[2:0]; // @[Filter.scala 196:41]
  wire  _GEN_540 = 4'h4 == kernelCounter; // @[Filter.scala 196:41]
  wire [4:0] _GEN_7 = _GEN_539 & _GEN_540 ? $signed(5'sh1) : $signed(5'sh0); // @[Filter.scala 196:41]
  wire  _GEN_542 = 4'h5 == kernelCounter; // @[Filter.scala 196:41]
  wire [4:0] _GEN_8 = _GEN_539 & _GEN_542 ? $signed(5'sh0) : $signed(_GEN_7); // @[Filter.scala 196:41]
  wire  _GEN_544 = 4'h6 == kernelCounter; // @[Filter.scala 196:41]
  wire [4:0] _GEN_9 = _GEN_539 & _GEN_544 ? $signed(5'sh0) : $signed(_GEN_8); // @[Filter.scala 196:41]
  wire  _GEN_546 = 4'h7 == kernelCounter; // @[Filter.scala 196:41]
  wire [4:0] _GEN_10 = _GEN_539 & _GEN_546 ? $signed(5'sh0) : $signed(_GEN_9); // @[Filter.scala 196:41]
  wire  _GEN_548 = 4'h8 == kernelCounter; // @[Filter.scala 196:41]
  wire [4:0] _GEN_11 = _GEN_539 & _GEN_548 ? $signed(5'sh0) : $signed(_GEN_10); // @[Filter.scala 196:41]
  wire  _GEN_549 = 3'h1 == io_SPI_filterIndex[2:0]; // @[Filter.scala 196:41]
  wire  _GEN_550 = 4'h0 == kernelCounter; // @[Filter.scala 196:41]
  wire [4:0] _GEN_12 = _GEN_549 & _GEN_550 ? $signed(5'sh1) : $signed(_GEN_11); // @[Filter.scala 196:41]
  wire  _GEN_552 = 4'h1 == kernelCounter; // @[Filter.scala 196:41]
  wire [4:0] _GEN_13 = _GEN_549 & _GEN_552 ? $signed(5'sh1) : $signed(_GEN_12); // @[Filter.scala 196:41]
  wire  _GEN_554 = 4'h2 == kernelCounter; // @[Filter.scala 196:41]
  wire [4:0] _GEN_14 = _GEN_549 & _GEN_554 ? $signed(5'sh1) : $signed(_GEN_13); // @[Filter.scala 196:41]
  wire  _GEN_556 = 4'h3 == kernelCounter; // @[Filter.scala 196:41]
  wire [4:0] _GEN_15 = _GEN_549 & _GEN_556 ? $signed(5'sh1) : $signed(_GEN_14); // @[Filter.scala 196:41]
  wire [4:0] _GEN_16 = _GEN_549 & _GEN_540 ? $signed(5'sh1) : $signed(_GEN_15); // @[Filter.scala 196:41]
  wire [4:0] _GEN_17 = _GEN_549 & _GEN_542 ? $signed(5'sh1) : $signed(_GEN_16); // @[Filter.scala 196:41]
  wire [4:0] _GEN_18 = _GEN_549 & _GEN_544 ? $signed(5'sh1) : $signed(_GEN_17); // @[Filter.scala 196:41]
  wire [4:0] _GEN_19 = _GEN_549 & _GEN_546 ? $signed(5'sh1) : $signed(_GEN_18); // @[Filter.scala 196:41]
  wire [4:0] _GEN_20 = _GEN_549 & _GEN_548 ? $signed(5'sh1) : $signed(_GEN_19); // @[Filter.scala 196:41]
  wire  _GEN_567 = 3'h2 == io_SPI_filterIndex[2:0]; // @[Filter.scala 196:41]
  wire [4:0] _GEN_21 = _GEN_567 & _GEN_550 ? $signed(5'sh1) : $signed(_GEN_20); // @[Filter.scala 196:41]
  wire [4:0] _GEN_22 = _GEN_567 & _GEN_552 ? $signed(5'sh2) : $signed(_GEN_21); // @[Filter.scala 196:41]
  wire [4:0] _GEN_23 = _GEN_567 & _GEN_554 ? $signed(5'sh1) : $signed(_GEN_22); // @[Filter.scala 196:41]
  wire [4:0] _GEN_24 = _GEN_567 & _GEN_556 ? $signed(5'sh2) : $signed(_GEN_23); // @[Filter.scala 196:41]
  wire [4:0] _GEN_25 = _GEN_567 & _GEN_540 ? $signed(5'sh4) : $signed(_GEN_24); // @[Filter.scala 196:41]
  wire [4:0] _GEN_26 = _GEN_567 & _GEN_542 ? $signed(5'sh2) : $signed(_GEN_25); // @[Filter.scala 196:41]
  wire [4:0] _GEN_27 = _GEN_567 & _GEN_544 ? $signed(5'sh1) : $signed(_GEN_26); // @[Filter.scala 196:41]
  wire [4:0] _GEN_28 = _GEN_567 & _GEN_546 ? $signed(5'sh2) : $signed(_GEN_27); // @[Filter.scala 196:41]
  wire [4:0] _GEN_29 = _GEN_567 & _GEN_548 ? $signed(5'sh1) : $signed(_GEN_28); // @[Filter.scala 196:41]
  wire  _GEN_585 = 3'h3 == io_SPI_filterIndex[2:0]; // @[Filter.scala 196:41]
  wire [4:0] _GEN_30 = _GEN_585 & _GEN_550 ? $signed(5'sh0) : $signed(_GEN_29); // @[Filter.scala 196:41]
  wire [4:0] _GEN_31 = _GEN_585 & _GEN_552 ? $signed(-5'sh1) : $signed(_GEN_30); // @[Filter.scala 196:41]
  wire [4:0] _GEN_32 = _GEN_585 & _GEN_554 ? $signed(5'sh0) : $signed(_GEN_31); // @[Filter.scala 196:41]
  wire [4:0] _GEN_33 = _GEN_585 & _GEN_556 ? $signed(-5'sh1) : $signed(_GEN_32); // @[Filter.scala 196:41]
  wire [4:0] _GEN_34 = _GEN_585 & _GEN_540 ? $signed(5'sh4) : $signed(_GEN_33); // @[Filter.scala 196:41]
  wire [4:0] _GEN_35 = _GEN_585 & _GEN_542 ? $signed(-5'sh1) : $signed(_GEN_34); // @[Filter.scala 196:41]
  wire [4:0] _GEN_36 = _GEN_585 & _GEN_544 ? $signed(5'sh0) : $signed(_GEN_35); // @[Filter.scala 196:41]
  wire [4:0] _GEN_37 = _GEN_585 & _GEN_546 ? $signed(-5'sh1) : $signed(_GEN_36); // @[Filter.scala 196:41]
  wire [4:0] _GEN_38 = _GEN_585 & _GEN_548 ? $signed(5'sh0) : $signed(_GEN_37); // @[Filter.scala 196:41]
  wire  _GEN_603 = 3'h4 == io_SPI_filterIndex[2:0]; // @[Filter.scala 196:41]
  wire [4:0] _GEN_39 = _GEN_603 & _GEN_550 ? $signed(-5'sh1) : $signed(_GEN_38); // @[Filter.scala 196:41]
  wire [4:0] _GEN_40 = _GEN_603 & _GEN_552 ? $signed(-5'sh1) : $signed(_GEN_39); // @[Filter.scala 196:41]
  wire [4:0] _GEN_41 = _GEN_603 & _GEN_554 ? $signed(-5'sh1) : $signed(_GEN_40); // @[Filter.scala 196:41]
  wire [4:0] _GEN_42 = _GEN_603 & _GEN_556 ? $signed(-5'sh1) : $signed(_GEN_41); // @[Filter.scala 196:41]
  wire [4:0] _GEN_43 = _GEN_603 & _GEN_540 ? $signed(5'sh8) : $signed(_GEN_42); // @[Filter.scala 196:41]
  wire [4:0] _GEN_44 = _GEN_603 & _GEN_542 ? $signed(-5'sh1) : $signed(_GEN_43); // @[Filter.scala 196:41]
  wire [4:0] _GEN_45 = _GEN_603 & _GEN_544 ? $signed(-5'sh1) : $signed(_GEN_44); // @[Filter.scala 196:41]
  wire [4:0] _GEN_46 = _GEN_603 & _GEN_546 ? $signed(-5'sh1) : $signed(_GEN_45); // @[Filter.scala 196:41]
  wire [4:0] _GEN_47 = _GEN_603 & _GEN_548 ? $signed(-5'sh1) : $signed(_GEN_46); // @[Filter.scala 196:41]
  wire  _GEN_621 = 3'h5 == io_SPI_filterIndex[2:0]; // @[Filter.scala 196:41]
  wire [4:0] _GEN_48 = _GEN_621 & _GEN_550 ? $signed(5'sh0) : $signed(_GEN_47); // @[Filter.scala 196:41]
  wire [4:0] _GEN_49 = _GEN_621 & _GEN_552 ? $signed(-5'sh1) : $signed(_GEN_48); // @[Filter.scala 196:41]
  wire [4:0] _GEN_50 = _GEN_621 & _GEN_554 ? $signed(5'sh0) : $signed(_GEN_49); // @[Filter.scala 196:41]
  wire [4:0] _GEN_51 = _GEN_621 & _GEN_556 ? $signed(-5'sh1) : $signed(_GEN_50); // @[Filter.scala 196:41]
  wire [4:0] _GEN_52 = _GEN_621 & _GEN_540 ? $signed(5'sh5) : $signed(_GEN_51); // @[Filter.scala 196:41]
  wire [4:0] _GEN_53 = _GEN_621 & _GEN_542 ? $signed(-5'sh1) : $signed(_GEN_52); // @[Filter.scala 196:41]
  wire [4:0] _GEN_54 = _GEN_621 & _GEN_544 ? $signed(5'sh0) : $signed(_GEN_53); // @[Filter.scala 196:41]
  wire [4:0] _GEN_55 = _GEN_621 & _GEN_546 ? $signed(-5'sh1) : $signed(_GEN_54); // @[Filter.scala 196:41]
  reg [1:0] imageCounterX; // @[Counter.scala 29:33]
  wire  imageCounterXReset = imageCounterX == 2'h2; // @[Counter.scala 38:24]
  wire [1:0] _T_20 = imageCounterX + 2'h1; // @[Counter.scala 39:22]
  reg [1:0] imageCounterY; // @[Counter.scala 29:33]
  wire  _T_21 = imageCounterY == 2'h2; // @[Counter.scala 38:24]
  wire [1:0] _T_23 = imageCounterY + 2'h1; // @[Counter.scala 39:22]
  reg [31:0] pixelIndex; // @[Filter.scala 201:31]
  wire [32:0] _T_24 = {{1'd0}, pixelIndex}; // @[Filter.scala 204:31]
  wire [31:0] _GEN_0 = _T_24[31:0] % 32'h2; // @[Filter.scala 204:38]
  wire [1:0] _T_26 = _GEN_0[1:0]; // @[Filter.scala 204:38]
  wire [1:0] _T_28 = _T_26 + imageCounterX; // @[Filter.scala 204:53]
  wire [1:0] _T_30 = _T_28 - 2'h1; // @[Filter.scala 204:69]
  wire [31:0] _T_33 = _T_24[31:0] / 32'h2; // @[Filter.scala 205:38]
  wire [31:0] _GEN_839 = {{30'd0}, imageCounterY}; // @[Filter.scala 205:53]
  wire [31:0] _T_35 = _T_33 + _GEN_839; // @[Filter.scala 205:53]
  wire [31:0] _T_37 = _T_35 - 32'h1; // @[Filter.scala 205:69]
  wire [33:0] _T_38 = _T_37 * 32'h2; // @[Filter.scala 206:42]
  wire [33:0] _GEN_840 = {{32'd0}, _T_30}; // @[Filter.scala 206:57]
  wire [33:0] _T_40 = _T_38 + _GEN_840; // @[Filter.scala 206:57]
  wire [3:0] _GEN_172 = 2'h1 == _T_40[1:0] ? 4'h0 : 4'hf; // @[Filter.scala 206:62]
  wire [3:0] _GEN_173 = 2'h2 == _T_40[1:0] ? 4'h0 : _GEN_172; // @[Filter.scala 206:62]
  wire [3:0] _GEN_174 = 2'h3 == _T_40[1:0] ? 4'hf : _GEN_173; // @[Filter.scala 206:62]
  wire [4:0] _GEN_841 = {{1'd0}, _GEN_174}; // @[Filter.scala 206:62]
  wire [8:0] _T_42 = _GEN_841 * 5'h14; // @[Filter.scala 206:62]
  wire [3:0] _GEN_177 = 2'h2 == _T_40[1:0] ? 4'hf : 4'h0; // @[Filter.scala 206:102]
  wire [3:0] _GEN_178 = 2'h3 == _T_40[1:0] ? 4'hf : _GEN_177; // @[Filter.scala 206:102]
  wire [6:0] _GEN_843 = {{3'd0}, _GEN_178}; // @[Filter.scala 206:102]
  wire [10:0] _T_47 = _GEN_843 * 7'h46; // @[Filter.scala 206:102]
  wire [10:0] _GEN_844 = {{2'd0}, _T_42}; // @[Filter.scala 206:69]
  wire [10:0] _T_49 = _GEN_844 + _T_47; // @[Filter.scala 206:69]
  wire [3:0] _GEN_180 = 2'h1 == _T_40[1:0] ? 4'hf : 4'h0; // @[Filter.scala 206:142]
  wire [3:0] _GEN_181 = 2'h2 == _T_40[1:0] ? 4'h0 : _GEN_180; // @[Filter.scala 206:142]
  wire [3:0] _GEN_182 = 2'h3 == _T_40[1:0] ? 4'hf : _GEN_181; // @[Filter.scala 206:142]
  wire [7:0] _T_54 = _GEN_182 * 4'ha; // @[Filter.scala 206:142]
  wire [10:0] _GEN_846 = {{3'd0}, _T_54}; // @[Filter.scala 206:109]
  wire [10:0] _T_56 = _T_49 + _GEN_846; // @[Filter.scala 206:109]
  wire [10:0] _T_57 = _T_56 / 11'h64; // @[Filter.scala 206:150]
  wire  _T_59 = _T_30 >= 2'h2; // @[Filter.scala 209:31]
  wire  _T_63 = _T_37 >= 32'h2; // @[Filter.scala 209:63]
  wire  _T_64 = _T_59 | _T_63; // @[Filter.scala 209:58]
  wire [10:0] _GEN_187 = io_SPI_distort ? _T_57 : {{7'd0}, _GEN_174}; // @[Filter.scala 211:35]
  wire [10:0] _GEN_188 = _T_64 ? 11'h0 : _GEN_187; // @[Filter.scala 209:80]
  wire [10:0] _GEN_193 = io_SPI_distort ? _T_57 : {{7'd0}, _GEN_178}; // @[Filter.scala 211:35]
  wire [10:0] _GEN_194 = _T_64 ? 11'h0 : _GEN_193; // @[Filter.scala 209:80]
  wire [10:0] _GEN_199 = io_SPI_distort ? _T_57 : {{7'd0}, _GEN_182}; // @[Filter.scala 211:35]
  wire [10:0] _GEN_200 = _T_64 ? 11'h0 : _GEN_199; // @[Filter.scala 209:80]
  wire [31:0] _T_92 = pixelIndex + 32'h1; // @[Filter.scala 204:31]
  wire [31:0] _GEN_1 = _T_92 % 32'h2; // @[Filter.scala 204:38]
  wire [1:0] _T_93 = _GEN_1[1:0]; // @[Filter.scala 204:38]
  wire [1:0] _T_95 = _T_93 + imageCounterX; // @[Filter.scala 204:53]
  wire [1:0] _T_97 = _T_95 - 2'h1; // @[Filter.scala 204:69]
  wire [31:0] _T_100 = _T_92 / 32'h2; // @[Filter.scala 205:38]
  wire [31:0] _T_102 = _T_100 + _GEN_839; // @[Filter.scala 205:53]
  wire [31:0] _T_104 = _T_102 - 32'h1; // @[Filter.scala 205:69]
  wire [33:0] _T_105 = _T_104 * 32'h2; // @[Filter.scala 206:42]
  wire [33:0] _GEN_851 = {{32'd0}, _T_97}; // @[Filter.scala 206:57]
  wire [33:0] _T_107 = _T_105 + _GEN_851; // @[Filter.scala 206:57]
  wire [3:0] _GEN_202 = 2'h1 == _T_107[1:0] ? 4'h0 : 4'hf; // @[Filter.scala 206:62]
  wire [3:0] _GEN_203 = 2'h2 == _T_107[1:0] ? 4'h0 : _GEN_202; // @[Filter.scala 206:62]
  wire [3:0] _GEN_204 = 2'h3 == _T_107[1:0] ? 4'hf : _GEN_203; // @[Filter.scala 206:62]
  wire [4:0] _GEN_852 = {{1'd0}, _GEN_204}; // @[Filter.scala 206:62]
  wire [8:0] _T_109 = _GEN_852 * 5'h14; // @[Filter.scala 206:62]
  wire [3:0] _GEN_207 = 2'h2 == _T_107[1:0] ? 4'hf : 4'h0; // @[Filter.scala 206:102]
  wire [3:0] _GEN_208 = 2'h3 == _T_107[1:0] ? 4'hf : _GEN_207; // @[Filter.scala 206:102]
  wire [6:0] _GEN_854 = {{3'd0}, _GEN_208}; // @[Filter.scala 206:102]
  wire [10:0] _T_114 = _GEN_854 * 7'h46; // @[Filter.scala 206:102]
  wire [10:0] _GEN_855 = {{2'd0}, _T_109}; // @[Filter.scala 206:69]
  wire [10:0] _T_116 = _GEN_855 + _T_114; // @[Filter.scala 206:69]
  wire [3:0] _GEN_210 = 2'h1 == _T_107[1:0] ? 4'hf : 4'h0; // @[Filter.scala 206:142]
  wire [3:0] _GEN_211 = 2'h2 == _T_107[1:0] ? 4'h0 : _GEN_210; // @[Filter.scala 206:142]
  wire [3:0] _GEN_212 = 2'h3 == _T_107[1:0] ? 4'hf : _GEN_211; // @[Filter.scala 206:142]
  wire [7:0] _T_121 = _GEN_212 * 4'ha; // @[Filter.scala 206:142]
  wire [10:0] _GEN_857 = {{3'd0}, _T_121}; // @[Filter.scala 206:109]
  wire [10:0] _T_123 = _T_116 + _GEN_857; // @[Filter.scala 206:109]
  wire [10:0] _T_124 = _T_123 / 11'h64; // @[Filter.scala 206:150]
  wire  _T_126 = _T_97 >= 2'h2; // @[Filter.scala 209:31]
  wire  _T_130 = _T_104 >= 32'h2; // @[Filter.scala 209:63]
  wire  _T_131 = _T_126 | _T_130; // @[Filter.scala 209:58]
  wire [10:0] _GEN_217 = io_SPI_distort ? _T_124 : {{7'd0}, _GEN_204}; // @[Filter.scala 211:35]
  wire [10:0] _GEN_218 = _T_131 ? 11'h0 : _GEN_217; // @[Filter.scala 209:80]
  wire [10:0] _GEN_223 = io_SPI_distort ? _T_124 : {{7'd0}, _GEN_208}; // @[Filter.scala 211:35]
  wire [10:0] _GEN_224 = _T_131 ? 11'h0 : _GEN_223; // @[Filter.scala 209:80]
  wire [10:0] _GEN_229 = io_SPI_distort ? _T_124 : {{7'd0}, _GEN_212}; // @[Filter.scala 211:35]
  wire [10:0] _GEN_230 = _T_131 ? 11'h0 : _GEN_229; // @[Filter.scala 209:80]
  wire [31:0] _T_159 = pixelIndex + 32'h2; // @[Filter.scala 204:31]
  wire [31:0] _GEN_2 = _T_159 % 32'h2; // @[Filter.scala 204:38]
  wire [1:0] _T_160 = _GEN_2[1:0]; // @[Filter.scala 204:38]
  wire [1:0] _T_162 = _T_160 + imageCounterX; // @[Filter.scala 204:53]
  wire [1:0] _T_164 = _T_162 - 2'h1; // @[Filter.scala 204:69]
  wire [31:0] _T_167 = _T_159 / 32'h2; // @[Filter.scala 205:38]
  wire [31:0] _T_169 = _T_167 + _GEN_839; // @[Filter.scala 205:53]
  wire [31:0] _T_171 = _T_169 - 32'h1; // @[Filter.scala 205:69]
  wire [33:0] _T_172 = _T_171 * 32'h2; // @[Filter.scala 206:42]
  wire [33:0] _GEN_862 = {{32'd0}, _T_164}; // @[Filter.scala 206:57]
  wire [33:0] _T_174 = _T_172 + _GEN_862; // @[Filter.scala 206:57]
  wire [3:0] _GEN_232 = 2'h1 == _T_174[1:0] ? 4'h0 : 4'hf; // @[Filter.scala 206:62]
  wire [3:0] _GEN_233 = 2'h2 == _T_174[1:0] ? 4'h0 : _GEN_232; // @[Filter.scala 206:62]
  wire [3:0] _GEN_234 = 2'h3 == _T_174[1:0] ? 4'hf : _GEN_233; // @[Filter.scala 206:62]
  wire [4:0] _GEN_863 = {{1'd0}, _GEN_234}; // @[Filter.scala 206:62]
  wire [8:0] _T_176 = _GEN_863 * 5'h14; // @[Filter.scala 206:62]
  wire [3:0] _GEN_237 = 2'h2 == _T_174[1:0] ? 4'hf : 4'h0; // @[Filter.scala 206:102]
  wire [3:0] _GEN_238 = 2'h3 == _T_174[1:0] ? 4'hf : _GEN_237; // @[Filter.scala 206:102]
  wire [6:0] _GEN_865 = {{3'd0}, _GEN_238}; // @[Filter.scala 206:102]
  wire [10:0] _T_181 = _GEN_865 * 7'h46; // @[Filter.scala 206:102]
  wire [10:0] _GEN_866 = {{2'd0}, _T_176}; // @[Filter.scala 206:69]
  wire [10:0] _T_183 = _GEN_866 + _T_181; // @[Filter.scala 206:69]
  wire [3:0] _GEN_240 = 2'h1 == _T_174[1:0] ? 4'hf : 4'h0; // @[Filter.scala 206:142]
  wire [3:0] _GEN_241 = 2'h2 == _T_174[1:0] ? 4'h0 : _GEN_240; // @[Filter.scala 206:142]
  wire [3:0] _GEN_242 = 2'h3 == _T_174[1:0] ? 4'hf : _GEN_241; // @[Filter.scala 206:142]
  wire [7:0] _T_188 = _GEN_242 * 4'ha; // @[Filter.scala 206:142]
  wire [10:0] _GEN_868 = {{3'd0}, _T_188}; // @[Filter.scala 206:109]
  wire [10:0] _T_190 = _T_183 + _GEN_868; // @[Filter.scala 206:109]
  wire [10:0] _T_191 = _T_190 / 11'h64; // @[Filter.scala 206:150]
  wire  _T_193 = _T_164 >= 2'h2; // @[Filter.scala 209:31]
  wire  _T_197 = _T_171 >= 32'h2; // @[Filter.scala 209:63]
  wire  _T_198 = _T_193 | _T_197; // @[Filter.scala 209:58]
  wire [10:0] _GEN_247 = io_SPI_distort ? _T_191 : {{7'd0}, _GEN_234}; // @[Filter.scala 211:35]
  wire [10:0] _GEN_248 = _T_198 ? 11'h0 : _GEN_247; // @[Filter.scala 209:80]
  wire [10:0] _GEN_253 = io_SPI_distort ? _T_191 : {{7'd0}, _GEN_238}; // @[Filter.scala 211:35]
  wire [10:0] _GEN_254 = _T_198 ? 11'h0 : _GEN_253; // @[Filter.scala 209:80]
  wire [10:0] _GEN_259 = io_SPI_distort ? _T_191 : {{7'd0}, _GEN_242}; // @[Filter.scala 211:35]
  wire [10:0] _GEN_260 = _T_198 ? 11'h0 : _GEN_259; // @[Filter.scala 209:80]
  wire [31:0] _T_226 = pixelIndex + 32'h3; // @[Filter.scala 204:31]
  wire [31:0] _GEN_3 = _T_226 % 32'h2; // @[Filter.scala 204:38]
  wire [1:0] _T_227 = _GEN_3[1:0]; // @[Filter.scala 204:38]
  wire [1:0] _T_229 = _T_227 + imageCounterX; // @[Filter.scala 204:53]
  wire [1:0] _T_231 = _T_229 - 2'h1; // @[Filter.scala 204:69]
  wire [31:0] _T_234 = _T_226 / 32'h2; // @[Filter.scala 205:38]
  wire [31:0] _T_236 = _T_234 + _GEN_839; // @[Filter.scala 205:53]
  wire [31:0] _T_238 = _T_236 - 32'h1; // @[Filter.scala 205:69]
  wire [33:0] _T_239 = _T_238 * 32'h2; // @[Filter.scala 206:42]
  wire [33:0] _GEN_873 = {{32'd0}, _T_231}; // @[Filter.scala 206:57]
  wire [33:0] _T_241 = _T_239 + _GEN_873; // @[Filter.scala 206:57]
  wire [3:0] _GEN_262 = 2'h1 == _T_241[1:0] ? 4'h0 : 4'hf; // @[Filter.scala 206:62]
  wire [3:0] _GEN_263 = 2'h2 == _T_241[1:0] ? 4'h0 : _GEN_262; // @[Filter.scala 206:62]
  wire [3:0] _GEN_264 = 2'h3 == _T_241[1:0] ? 4'hf : _GEN_263; // @[Filter.scala 206:62]
  wire [4:0] _GEN_874 = {{1'd0}, _GEN_264}; // @[Filter.scala 206:62]
  wire [8:0] _T_243 = _GEN_874 * 5'h14; // @[Filter.scala 206:62]
  wire [3:0] _GEN_267 = 2'h2 == _T_241[1:0] ? 4'hf : 4'h0; // @[Filter.scala 206:102]
  wire [3:0] _GEN_268 = 2'h3 == _T_241[1:0] ? 4'hf : _GEN_267; // @[Filter.scala 206:102]
  wire [6:0] _GEN_876 = {{3'd0}, _GEN_268}; // @[Filter.scala 206:102]
  wire [10:0] _T_248 = _GEN_876 * 7'h46; // @[Filter.scala 206:102]
  wire [10:0] _GEN_877 = {{2'd0}, _T_243}; // @[Filter.scala 206:69]
  wire [10:0] _T_250 = _GEN_877 + _T_248; // @[Filter.scala 206:69]
  wire [3:0] _GEN_270 = 2'h1 == _T_241[1:0] ? 4'hf : 4'h0; // @[Filter.scala 206:142]
  wire [3:0] _GEN_271 = 2'h2 == _T_241[1:0] ? 4'h0 : _GEN_270; // @[Filter.scala 206:142]
  wire [3:0] _GEN_272 = 2'h3 == _T_241[1:0] ? 4'hf : _GEN_271; // @[Filter.scala 206:142]
  wire [7:0] _T_255 = _GEN_272 * 4'ha; // @[Filter.scala 206:142]
  wire [10:0] _GEN_879 = {{3'd0}, _T_255}; // @[Filter.scala 206:109]
  wire [10:0] _T_257 = _T_250 + _GEN_879; // @[Filter.scala 206:109]
  wire [10:0] _T_258 = _T_257 / 11'h64; // @[Filter.scala 206:150]
  wire  _T_260 = _T_231 >= 2'h2; // @[Filter.scala 209:31]
  wire  _T_264 = _T_238 >= 32'h2; // @[Filter.scala 209:63]
  wire  _T_265 = _T_260 | _T_264; // @[Filter.scala 209:58]
  wire [10:0] _GEN_277 = io_SPI_distort ? _T_258 : {{7'd0}, _GEN_264}; // @[Filter.scala 211:35]
  wire [10:0] _GEN_278 = _T_265 ? 11'h0 : _GEN_277; // @[Filter.scala 209:80]
  wire [10:0] _GEN_283 = io_SPI_distort ? _T_258 : {{7'd0}, _GEN_268}; // @[Filter.scala 211:35]
  wire [10:0] _GEN_284 = _T_265 ? 11'h0 : _GEN_283; // @[Filter.scala 209:80]
  wire [10:0] _GEN_289 = io_SPI_distort ? _T_258 : {{7'd0}, _GEN_272}; // @[Filter.scala 211:35]
  wire [10:0] _GEN_290 = _T_265 ? 11'h0 : _GEN_289; // @[Filter.scala 209:80]
  wire [31:0] _T_293 = pixelIndex + 32'h4; // @[Filter.scala 204:31]
  wire [31:0] _GEN_4 = _T_293 % 32'h2; // @[Filter.scala 204:38]
  wire [1:0] _T_294 = _GEN_4[1:0]; // @[Filter.scala 204:38]
  wire [1:0] _T_296 = _T_294 + imageCounterX; // @[Filter.scala 204:53]
  wire [1:0] _T_298 = _T_296 - 2'h1; // @[Filter.scala 204:69]
  wire [31:0] _T_301 = _T_293 / 32'h2; // @[Filter.scala 205:38]
  wire [31:0] _T_303 = _T_301 + _GEN_839; // @[Filter.scala 205:53]
  wire [31:0] _T_305 = _T_303 - 32'h1; // @[Filter.scala 205:69]
  wire [33:0] _T_306 = _T_305 * 32'h2; // @[Filter.scala 206:42]
  wire [33:0] _GEN_884 = {{32'd0}, _T_298}; // @[Filter.scala 206:57]
  wire [33:0] _T_308 = _T_306 + _GEN_884; // @[Filter.scala 206:57]
  wire [3:0] _GEN_292 = 2'h1 == _T_308[1:0] ? 4'h0 : 4'hf; // @[Filter.scala 206:62]
  wire [3:0] _GEN_293 = 2'h2 == _T_308[1:0] ? 4'h0 : _GEN_292; // @[Filter.scala 206:62]
  wire [3:0] _GEN_294 = 2'h3 == _T_308[1:0] ? 4'hf : _GEN_293; // @[Filter.scala 206:62]
  wire [4:0] _GEN_885 = {{1'd0}, _GEN_294}; // @[Filter.scala 206:62]
  wire [8:0] _T_310 = _GEN_885 * 5'h14; // @[Filter.scala 206:62]
  wire [3:0] _GEN_297 = 2'h2 == _T_308[1:0] ? 4'hf : 4'h0; // @[Filter.scala 206:102]
  wire [3:0] _GEN_298 = 2'h3 == _T_308[1:0] ? 4'hf : _GEN_297; // @[Filter.scala 206:102]
  wire [6:0] _GEN_887 = {{3'd0}, _GEN_298}; // @[Filter.scala 206:102]
  wire [10:0] _T_315 = _GEN_887 * 7'h46; // @[Filter.scala 206:102]
  wire [10:0] _GEN_888 = {{2'd0}, _T_310}; // @[Filter.scala 206:69]
  wire [10:0] _T_317 = _GEN_888 + _T_315; // @[Filter.scala 206:69]
  wire [3:0] _GEN_300 = 2'h1 == _T_308[1:0] ? 4'hf : 4'h0; // @[Filter.scala 206:142]
  wire [3:0] _GEN_301 = 2'h2 == _T_308[1:0] ? 4'h0 : _GEN_300; // @[Filter.scala 206:142]
  wire [3:0] _GEN_302 = 2'h3 == _T_308[1:0] ? 4'hf : _GEN_301; // @[Filter.scala 206:142]
  wire [7:0] _T_322 = _GEN_302 * 4'ha; // @[Filter.scala 206:142]
  wire [10:0] _GEN_890 = {{3'd0}, _T_322}; // @[Filter.scala 206:109]
  wire [10:0] _T_324 = _T_317 + _GEN_890; // @[Filter.scala 206:109]
  wire [10:0] _T_325 = _T_324 / 11'h64; // @[Filter.scala 206:150]
  wire  _T_327 = _T_298 >= 2'h2; // @[Filter.scala 209:31]
  wire  _T_331 = _T_305 >= 32'h2; // @[Filter.scala 209:63]
  wire  _T_332 = _T_327 | _T_331; // @[Filter.scala 209:58]
  wire [10:0] _GEN_307 = io_SPI_distort ? _T_325 : {{7'd0}, _GEN_294}; // @[Filter.scala 211:35]
  wire [10:0] _GEN_308 = _T_332 ? 11'h0 : _GEN_307; // @[Filter.scala 209:80]
  wire [10:0] _GEN_313 = io_SPI_distort ? _T_325 : {{7'd0}, _GEN_298}; // @[Filter.scala 211:35]
  wire [10:0] _GEN_314 = _T_332 ? 11'h0 : _GEN_313; // @[Filter.scala 209:80]
  wire [10:0] _GEN_319 = io_SPI_distort ? _T_325 : {{7'd0}, _GEN_302}; // @[Filter.scala 211:35]
  wire [10:0] _GEN_320 = _T_332 ? 11'h0 : _GEN_319; // @[Filter.scala 209:80]
  wire [31:0] _T_360 = pixelIndex + 32'h5; // @[Filter.scala 204:31]
  wire [31:0] _GEN_5 = _T_360 % 32'h2; // @[Filter.scala 204:38]
  wire [1:0] _T_361 = _GEN_5[1:0]; // @[Filter.scala 204:38]
  wire [1:0] _T_363 = _T_361 + imageCounterX; // @[Filter.scala 204:53]
  wire [1:0] _T_365 = _T_363 - 2'h1; // @[Filter.scala 204:69]
  wire [31:0] _T_368 = _T_360 / 32'h2; // @[Filter.scala 205:38]
  wire [31:0] _T_370 = _T_368 + _GEN_839; // @[Filter.scala 205:53]
  wire [31:0] _T_372 = _T_370 - 32'h1; // @[Filter.scala 205:69]
  wire [33:0] _T_373 = _T_372 * 32'h2; // @[Filter.scala 206:42]
  wire [33:0] _GEN_895 = {{32'd0}, _T_365}; // @[Filter.scala 206:57]
  wire [33:0] _T_375 = _T_373 + _GEN_895; // @[Filter.scala 206:57]
  wire [3:0] _GEN_322 = 2'h1 == _T_375[1:0] ? 4'h0 : 4'hf; // @[Filter.scala 206:62]
  wire [3:0] _GEN_323 = 2'h2 == _T_375[1:0] ? 4'h0 : _GEN_322; // @[Filter.scala 206:62]
  wire [3:0] _GEN_324 = 2'h3 == _T_375[1:0] ? 4'hf : _GEN_323; // @[Filter.scala 206:62]
  wire [4:0] _GEN_896 = {{1'd0}, _GEN_324}; // @[Filter.scala 206:62]
  wire [8:0] _T_377 = _GEN_896 * 5'h14; // @[Filter.scala 206:62]
  wire [3:0] _GEN_327 = 2'h2 == _T_375[1:0] ? 4'hf : 4'h0; // @[Filter.scala 206:102]
  wire [3:0] _GEN_328 = 2'h3 == _T_375[1:0] ? 4'hf : _GEN_327; // @[Filter.scala 206:102]
  wire [6:0] _GEN_898 = {{3'd0}, _GEN_328}; // @[Filter.scala 206:102]
  wire [10:0] _T_382 = _GEN_898 * 7'h46; // @[Filter.scala 206:102]
  wire [10:0] _GEN_899 = {{2'd0}, _T_377}; // @[Filter.scala 206:69]
  wire [10:0] _T_384 = _GEN_899 + _T_382; // @[Filter.scala 206:69]
  wire [3:0] _GEN_330 = 2'h1 == _T_375[1:0] ? 4'hf : 4'h0; // @[Filter.scala 206:142]
  wire [3:0] _GEN_331 = 2'h2 == _T_375[1:0] ? 4'h0 : _GEN_330; // @[Filter.scala 206:142]
  wire [3:0] _GEN_332 = 2'h3 == _T_375[1:0] ? 4'hf : _GEN_331; // @[Filter.scala 206:142]
  wire [7:0] _T_389 = _GEN_332 * 4'ha; // @[Filter.scala 206:142]
  wire [10:0] _GEN_901 = {{3'd0}, _T_389}; // @[Filter.scala 206:109]
  wire [10:0] _T_391 = _T_384 + _GEN_901; // @[Filter.scala 206:109]
  wire [10:0] _T_392 = _T_391 / 11'h64; // @[Filter.scala 206:150]
  wire  _T_394 = _T_365 >= 2'h2; // @[Filter.scala 209:31]
  wire  _T_398 = _T_372 >= 32'h2; // @[Filter.scala 209:63]
  wire  _T_399 = _T_394 | _T_398; // @[Filter.scala 209:58]
  wire [10:0] _GEN_337 = io_SPI_distort ? _T_392 : {{7'd0}, _GEN_324}; // @[Filter.scala 211:35]
  wire [10:0] _GEN_338 = _T_399 ? 11'h0 : _GEN_337; // @[Filter.scala 209:80]
  wire [10:0] _GEN_343 = io_SPI_distort ? _T_392 : {{7'd0}, _GEN_328}; // @[Filter.scala 211:35]
  wire [10:0] _GEN_344 = _T_399 ? 11'h0 : _GEN_343; // @[Filter.scala 209:80]
  wire [10:0] _GEN_349 = io_SPI_distort ? _T_392 : {{7'd0}, _GEN_332}; // @[Filter.scala 211:35]
  wire [10:0] _GEN_350 = _T_399 ? 11'h0 : _GEN_349; // @[Filter.scala 209:80]
  wire [31:0] _T_427 = pixelIndex + 32'h6; // @[Filter.scala 204:31]
  wire [31:0] _GEN_6 = _T_427 % 32'h2; // @[Filter.scala 204:38]
  wire [1:0] _T_428 = _GEN_6[1:0]; // @[Filter.scala 204:38]
  wire [1:0] _T_430 = _T_428 + imageCounterX; // @[Filter.scala 204:53]
  wire [1:0] _T_432 = _T_430 - 2'h1; // @[Filter.scala 204:69]
  wire [31:0] _T_435 = _T_427 / 32'h2; // @[Filter.scala 205:38]
  wire [31:0] _T_437 = _T_435 + _GEN_839; // @[Filter.scala 205:53]
  wire [31:0] _T_439 = _T_437 - 32'h1; // @[Filter.scala 205:69]
  wire [33:0] _T_440 = _T_439 * 32'h2; // @[Filter.scala 206:42]
  wire [33:0] _GEN_906 = {{32'd0}, _T_432}; // @[Filter.scala 206:57]
  wire [33:0] _T_442 = _T_440 + _GEN_906; // @[Filter.scala 206:57]
  wire [3:0] _GEN_352 = 2'h1 == _T_442[1:0] ? 4'h0 : 4'hf; // @[Filter.scala 206:62]
  wire [3:0] _GEN_353 = 2'h2 == _T_442[1:0] ? 4'h0 : _GEN_352; // @[Filter.scala 206:62]
  wire [3:0] _GEN_354 = 2'h3 == _T_442[1:0] ? 4'hf : _GEN_353; // @[Filter.scala 206:62]
  wire [4:0] _GEN_907 = {{1'd0}, _GEN_354}; // @[Filter.scala 206:62]
  wire [8:0] _T_444 = _GEN_907 * 5'h14; // @[Filter.scala 206:62]
  wire [3:0] _GEN_357 = 2'h2 == _T_442[1:0] ? 4'hf : 4'h0; // @[Filter.scala 206:102]
  wire [3:0] _GEN_358 = 2'h3 == _T_442[1:0] ? 4'hf : _GEN_357; // @[Filter.scala 206:102]
  wire [6:0] _GEN_909 = {{3'd0}, _GEN_358}; // @[Filter.scala 206:102]
  wire [10:0] _T_449 = _GEN_909 * 7'h46; // @[Filter.scala 206:102]
  wire [10:0] _GEN_910 = {{2'd0}, _T_444}; // @[Filter.scala 206:69]
  wire [10:0] _T_451 = _GEN_910 + _T_449; // @[Filter.scala 206:69]
  wire [3:0] _GEN_360 = 2'h1 == _T_442[1:0] ? 4'hf : 4'h0; // @[Filter.scala 206:142]
  wire [3:0] _GEN_361 = 2'h2 == _T_442[1:0] ? 4'h0 : _GEN_360; // @[Filter.scala 206:142]
  wire [3:0] _GEN_362 = 2'h3 == _T_442[1:0] ? 4'hf : _GEN_361; // @[Filter.scala 206:142]
  wire [7:0] _T_456 = _GEN_362 * 4'ha; // @[Filter.scala 206:142]
  wire [10:0] _GEN_912 = {{3'd0}, _T_456}; // @[Filter.scala 206:109]
  wire [10:0] _T_458 = _T_451 + _GEN_912; // @[Filter.scala 206:109]
  wire [10:0] _T_459 = _T_458 / 11'h64; // @[Filter.scala 206:150]
  wire  _T_461 = _T_432 >= 2'h2; // @[Filter.scala 209:31]
  wire  _T_465 = _T_439 >= 32'h2; // @[Filter.scala 209:63]
  wire  _T_466 = _T_461 | _T_465; // @[Filter.scala 209:58]
  wire [10:0] _GEN_367 = io_SPI_distort ? _T_459 : {{7'd0}, _GEN_354}; // @[Filter.scala 211:35]
  wire [10:0] _GEN_368 = _T_466 ? 11'h0 : _GEN_367; // @[Filter.scala 209:80]
  wire [10:0] _GEN_373 = io_SPI_distort ? _T_459 : {{7'd0}, _GEN_358}; // @[Filter.scala 211:35]
  wire [10:0] _GEN_374 = _T_466 ? 11'h0 : _GEN_373; // @[Filter.scala 209:80]
  wire [10:0] _GEN_379 = io_SPI_distort ? _T_459 : {{7'd0}, _GEN_362}; // @[Filter.scala 211:35]
  wire [10:0] _GEN_380 = _T_466 ? 11'h0 : _GEN_379; // @[Filter.scala 209:80]
  wire [31:0] _T_494 = pixelIndex + 32'h7; // @[Filter.scala 204:31]
  wire [31:0] _GEN_56 = _T_494 % 32'h2; // @[Filter.scala 204:38]
  wire [1:0] _T_495 = _GEN_56[1:0]; // @[Filter.scala 204:38]
  wire [1:0] _T_497 = _T_495 + imageCounterX; // @[Filter.scala 204:53]
  wire [1:0] _T_499 = _T_497 - 2'h1; // @[Filter.scala 204:69]
  wire [31:0] _T_502 = _T_494 / 32'h2; // @[Filter.scala 205:38]
  wire [31:0] _T_504 = _T_502 + _GEN_839; // @[Filter.scala 205:53]
  wire [31:0] _T_506 = _T_504 - 32'h1; // @[Filter.scala 205:69]
  wire [33:0] _T_507 = _T_506 * 32'h2; // @[Filter.scala 206:42]
  wire [33:0] _GEN_917 = {{32'd0}, _T_499}; // @[Filter.scala 206:57]
  wire [33:0] _T_509 = _T_507 + _GEN_917; // @[Filter.scala 206:57]
  wire [3:0] _GEN_382 = 2'h1 == _T_509[1:0] ? 4'h0 : 4'hf; // @[Filter.scala 206:62]
  wire [3:0] _GEN_383 = 2'h2 == _T_509[1:0] ? 4'h0 : _GEN_382; // @[Filter.scala 206:62]
  wire [3:0] _GEN_384 = 2'h3 == _T_509[1:0] ? 4'hf : _GEN_383; // @[Filter.scala 206:62]
  wire [4:0] _GEN_918 = {{1'd0}, _GEN_384}; // @[Filter.scala 206:62]
  wire [8:0] _T_511 = _GEN_918 * 5'h14; // @[Filter.scala 206:62]
  wire [3:0] _GEN_387 = 2'h2 == _T_509[1:0] ? 4'hf : 4'h0; // @[Filter.scala 206:102]
  wire [3:0] _GEN_388 = 2'h3 == _T_509[1:0] ? 4'hf : _GEN_387; // @[Filter.scala 206:102]
  wire [6:0] _GEN_920 = {{3'd0}, _GEN_388}; // @[Filter.scala 206:102]
  wire [10:0] _T_516 = _GEN_920 * 7'h46; // @[Filter.scala 206:102]
  wire [10:0] _GEN_921 = {{2'd0}, _T_511}; // @[Filter.scala 206:69]
  wire [10:0] _T_518 = _GEN_921 + _T_516; // @[Filter.scala 206:69]
  wire [3:0] _GEN_390 = 2'h1 == _T_509[1:0] ? 4'hf : 4'h0; // @[Filter.scala 206:142]
  wire [3:0] _GEN_391 = 2'h2 == _T_509[1:0] ? 4'h0 : _GEN_390; // @[Filter.scala 206:142]
  wire [3:0] _GEN_392 = 2'h3 == _T_509[1:0] ? 4'hf : _GEN_391; // @[Filter.scala 206:142]
  wire [7:0] _T_523 = _GEN_392 * 4'ha; // @[Filter.scala 206:142]
  wire [10:0] _GEN_923 = {{3'd0}, _T_523}; // @[Filter.scala 206:109]
  wire [10:0] _T_525 = _T_518 + _GEN_923; // @[Filter.scala 206:109]
  wire [10:0] _T_526 = _T_525 / 11'h64; // @[Filter.scala 206:150]
  wire  _T_528 = _T_499 >= 2'h2; // @[Filter.scala 209:31]
  wire  _T_532 = _T_506 >= 32'h2; // @[Filter.scala 209:63]
  wire  _T_533 = _T_528 | _T_532; // @[Filter.scala 209:58]
  wire [10:0] _GEN_397 = io_SPI_distort ? _T_526 : {{7'd0}, _GEN_384}; // @[Filter.scala 211:35]
  wire [10:0] _GEN_398 = _T_533 ? 11'h0 : _GEN_397; // @[Filter.scala 209:80]
  wire [10:0] _GEN_403 = io_SPI_distort ? _T_526 : {{7'd0}, _GEN_388}; // @[Filter.scala 211:35]
  wire [10:0] _GEN_404 = _T_533 ? 11'h0 : _GEN_403; // @[Filter.scala 209:80]
  wire [10:0] _GEN_409 = io_SPI_distort ? _T_526 : {{7'd0}, _GEN_392}; // @[Filter.scala 211:35]
  wire [10:0] _GEN_410 = _T_533 ? 11'h0 : _GEN_409; // @[Filter.scala 209:80]
  reg  validOut; // @[Filter.scala 223:29]
  wire [7:0] _GEN_412 = 3'h1 == io_SPI_filterIndex[2:0] ? $signed(8'sh9) : $signed(8'sh1); // @[Filter.scala 227:64]
  wire [7:0] _GEN_413 = 3'h2 == io_SPI_filterIndex[2:0] ? $signed(8'sh10) : $signed(_GEN_412); // @[Filter.scala 227:64]
  wire [7:0] _GEN_414 = 3'h3 == io_SPI_filterIndex[2:0] ? $signed(8'sh1) : $signed(_GEN_413); // @[Filter.scala 227:64]
  wire [7:0] _GEN_415 = 3'h4 == io_SPI_filterIndex[2:0] ? $signed(8'sh1) : $signed(_GEN_414); // @[Filter.scala 227:64]
  wire [7:0] _GEN_416 = 3'h5 == io_SPI_filterIndex[2:0] ? $signed(8'sh1) : $signed(_GEN_415); // @[Filter.scala 227:64]
  wire [8:0] _GEN_927 = {{1{_GEN_416[7]}},_GEN_416}; // @[Filter.scala 227:64]
  wire [9:0] _T_567 = $signed(KernelConvolution_io_pixelVal_out_0) / $signed(_GEN_927); // @[Filter.scala 227:64]
  wire [8:0] pixOut_0_0 = _T_567[8:0]; // @[Filter.scala 222:27 Filter.scala 222:27 Filter.scala 227:24]
  wire  _T_568 = $signed(pixOut_0_0) < 9'sh0; // @[Filter.scala 229:30]
  wire  _T_569 = _T_568 & io_SPI_invert; // @[Filter.scala 229:36]
  wire  _T_571 = $signed(pixOut_0_0) > 9'shf; // @[Filter.scala 234:36]
  wire  _T_572 = _T_571 & io_SPI_invert; // @[Filter.scala 234:43]
  wire [8:0] _T_574 = _T_567[8:0]; // @[Filter.scala 239:58]
  wire [8:0] _T_576 = 9'hf - _T_574; // @[Filter.scala 239:43]
  wire [8:0] _GEN_417 = io_SPI_invert ? _T_576 : _T_574; // @[Filter.scala 238:36]
  wire [8:0] _GEN_418 = _T_571 ? 9'hf : _GEN_417; // @[Filter.scala 236:44]
  wire [8:0] _GEN_419 = _T_572 ? 9'h0 : _GEN_418; // @[Filter.scala 234:59]
  wire [8:0] _GEN_420 = _T_568 ? 9'h0 : _GEN_419; // @[Filter.scala 231:43]
  wire [8:0] _GEN_421 = _T_569 ? 9'hf : _GEN_420; // @[Filter.scala 229:52]
  wire [9:0] _T_578 = $signed(KernelConvolution_io_pixelVal_out_1) / $signed(_GEN_927); // @[Filter.scala 227:64]
  wire [8:0] pixOut_0_1 = _T_578[8:0]; // @[Filter.scala 222:27 Filter.scala 222:27 Filter.scala 227:24]
  wire  _T_579 = $signed(pixOut_0_1) < 9'sh0; // @[Filter.scala 229:30]
  wire  _T_580 = _T_579 & io_SPI_invert; // @[Filter.scala 229:36]
  wire  _T_582 = $signed(pixOut_0_1) > 9'shf; // @[Filter.scala 234:36]
  wire  _T_583 = _T_582 & io_SPI_invert; // @[Filter.scala 234:43]
  wire [8:0] _T_585 = _T_578[8:0]; // @[Filter.scala 239:58]
  wire [8:0] _T_587 = 9'hf - _T_585; // @[Filter.scala 239:43]
  wire [8:0] _GEN_422 = io_SPI_invert ? _T_587 : _T_585; // @[Filter.scala 238:36]
  wire [8:0] _GEN_423 = _T_582 ? 9'hf : _GEN_422; // @[Filter.scala 236:44]
  wire [8:0] _GEN_424 = _T_583 ? 9'h0 : _GEN_423; // @[Filter.scala 234:59]
  wire [8:0] _GEN_425 = _T_579 ? 9'h0 : _GEN_424; // @[Filter.scala 231:43]
  wire [8:0] _GEN_426 = _T_580 ? 9'hf : _GEN_425; // @[Filter.scala 229:52]
  wire [9:0] _T_589 = $signed(KernelConvolution_io_pixelVal_out_2) / $signed(_GEN_927); // @[Filter.scala 227:64]
  wire [8:0] pixOut_0_2 = _T_589[8:0]; // @[Filter.scala 222:27 Filter.scala 222:27 Filter.scala 227:24]
  wire  _T_590 = $signed(pixOut_0_2) < 9'sh0; // @[Filter.scala 229:30]
  wire  _T_591 = _T_590 & io_SPI_invert; // @[Filter.scala 229:36]
  wire  _T_593 = $signed(pixOut_0_2) > 9'shf; // @[Filter.scala 234:36]
  wire  _T_594 = _T_593 & io_SPI_invert; // @[Filter.scala 234:43]
  wire [8:0] _T_596 = _T_589[8:0]; // @[Filter.scala 239:58]
  wire [8:0] _T_598 = 9'hf - _T_596; // @[Filter.scala 239:43]
  wire [8:0] _GEN_427 = io_SPI_invert ? _T_598 : _T_596; // @[Filter.scala 238:36]
  wire [8:0] _GEN_428 = _T_593 ? 9'hf : _GEN_427; // @[Filter.scala 236:44]
  wire [8:0] _GEN_429 = _T_594 ? 9'h0 : _GEN_428; // @[Filter.scala 234:59]
  wire [8:0] _GEN_430 = _T_590 ? 9'h0 : _GEN_429; // @[Filter.scala 231:43]
  wire [8:0] _GEN_431 = _T_591 ? 9'hf : _GEN_430; // @[Filter.scala 229:52]
  wire [9:0] _T_600 = $signed(KernelConvolution_io_pixelVal_out_3) / $signed(_GEN_927); // @[Filter.scala 227:64]
  wire [8:0] pixOut_0_3 = _T_600[8:0]; // @[Filter.scala 222:27 Filter.scala 222:27 Filter.scala 227:24]
  wire  _T_601 = $signed(pixOut_0_3) < 9'sh0; // @[Filter.scala 229:30]
  wire  _T_602 = _T_601 & io_SPI_invert; // @[Filter.scala 229:36]
  wire  _T_604 = $signed(pixOut_0_3) > 9'shf; // @[Filter.scala 234:36]
  wire  _T_605 = _T_604 & io_SPI_invert; // @[Filter.scala 234:43]
  wire [8:0] _T_607 = _T_600[8:0]; // @[Filter.scala 239:58]
  wire [8:0] _T_609 = 9'hf - _T_607; // @[Filter.scala 239:43]
  wire [8:0] _GEN_432 = io_SPI_invert ? _T_609 : _T_607; // @[Filter.scala 238:36]
  wire [8:0] _GEN_433 = _T_604 ? 9'hf : _GEN_432; // @[Filter.scala 236:44]
  wire [8:0] _GEN_434 = _T_605 ? 9'h0 : _GEN_433; // @[Filter.scala 234:59]
  wire [8:0] _GEN_435 = _T_601 ? 9'h0 : _GEN_434; // @[Filter.scala 231:43]
  wire [8:0] _GEN_436 = _T_602 ? 9'hf : _GEN_435; // @[Filter.scala 229:52]
  wire [9:0] _T_611 = $signed(KernelConvolution_io_pixelVal_out_4) / $signed(_GEN_927); // @[Filter.scala 227:64]
  wire [8:0] pixOut_0_4 = _T_611[8:0]; // @[Filter.scala 222:27 Filter.scala 222:27 Filter.scala 227:24]
  wire  _T_612 = $signed(pixOut_0_4) < 9'sh0; // @[Filter.scala 229:30]
  wire  _T_613 = _T_612 & io_SPI_invert; // @[Filter.scala 229:36]
  wire  _T_615 = $signed(pixOut_0_4) > 9'shf; // @[Filter.scala 234:36]
  wire  _T_616 = _T_615 & io_SPI_invert; // @[Filter.scala 234:43]
  wire [8:0] _T_618 = _T_611[8:0]; // @[Filter.scala 239:58]
  wire [8:0] _T_620 = 9'hf - _T_618; // @[Filter.scala 239:43]
  wire [8:0] _GEN_437 = io_SPI_invert ? _T_620 : _T_618; // @[Filter.scala 238:36]
  wire [8:0] _GEN_438 = _T_615 ? 9'hf : _GEN_437; // @[Filter.scala 236:44]
  wire [8:0] _GEN_439 = _T_616 ? 9'h0 : _GEN_438; // @[Filter.scala 234:59]
  wire [8:0] _GEN_440 = _T_612 ? 9'h0 : _GEN_439; // @[Filter.scala 231:43]
  wire [8:0] _GEN_441 = _T_613 ? 9'hf : _GEN_440; // @[Filter.scala 229:52]
  wire [9:0] _T_622 = $signed(KernelConvolution_io_pixelVal_out_5) / $signed(_GEN_927); // @[Filter.scala 227:64]
  wire [8:0] pixOut_0_5 = _T_622[8:0]; // @[Filter.scala 222:27 Filter.scala 222:27 Filter.scala 227:24]
  wire  _T_623 = $signed(pixOut_0_5) < 9'sh0; // @[Filter.scala 229:30]
  wire  _T_624 = _T_623 & io_SPI_invert; // @[Filter.scala 229:36]
  wire  _T_626 = $signed(pixOut_0_5) > 9'shf; // @[Filter.scala 234:36]
  wire  _T_627 = _T_626 & io_SPI_invert; // @[Filter.scala 234:43]
  wire [8:0] _T_629 = _T_622[8:0]; // @[Filter.scala 239:58]
  wire [8:0] _T_631 = 9'hf - _T_629; // @[Filter.scala 239:43]
  wire [8:0] _GEN_442 = io_SPI_invert ? _T_631 : _T_629; // @[Filter.scala 238:36]
  wire [8:0] _GEN_443 = _T_626 ? 9'hf : _GEN_442; // @[Filter.scala 236:44]
  wire [8:0] _GEN_444 = _T_627 ? 9'h0 : _GEN_443; // @[Filter.scala 234:59]
  wire [8:0] _GEN_445 = _T_623 ? 9'h0 : _GEN_444; // @[Filter.scala 231:43]
  wire [8:0] _GEN_446 = _T_624 ? 9'hf : _GEN_445; // @[Filter.scala 229:52]
  wire [9:0] _T_633 = $signed(KernelConvolution_io_pixelVal_out_6) / $signed(_GEN_927); // @[Filter.scala 227:64]
  wire [8:0] pixOut_0_6 = _T_633[8:0]; // @[Filter.scala 222:27 Filter.scala 222:27 Filter.scala 227:24]
  wire  _T_634 = $signed(pixOut_0_6) < 9'sh0; // @[Filter.scala 229:30]
  wire  _T_635 = _T_634 & io_SPI_invert; // @[Filter.scala 229:36]
  wire  _T_637 = $signed(pixOut_0_6) > 9'shf; // @[Filter.scala 234:36]
  wire  _T_638 = _T_637 & io_SPI_invert; // @[Filter.scala 234:43]
  wire [8:0] _T_640 = _T_633[8:0]; // @[Filter.scala 239:58]
  wire [8:0] _T_642 = 9'hf - _T_640; // @[Filter.scala 239:43]
  wire [8:0] _GEN_447 = io_SPI_invert ? _T_642 : _T_640; // @[Filter.scala 238:36]
  wire [8:0] _GEN_448 = _T_637 ? 9'hf : _GEN_447; // @[Filter.scala 236:44]
  wire [8:0] _GEN_449 = _T_638 ? 9'h0 : _GEN_448; // @[Filter.scala 234:59]
  wire [8:0] _GEN_450 = _T_634 ? 9'h0 : _GEN_449; // @[Filter.scala 231:43]
  wire [8:0] _GEN_451 = _T_635 ? 9'hf : _GEN_450; // @[Filter.scala 229:52]
  wire [9:0] _T_644 = $signed(KernelConvolution_io_pixelVal_out_7) / $signed(_GEN_927); // @[Filter.scala 227:64]
  wire [8:0] pixOut_0_7 = _T_644[8:0]; // @[Filter.scala 222:27 Filter.scala 222:27 Filter.scala 227:24]
  wire  _T_645 = $signed(pixOut_0_7) < 9'sh0; // @[Filter.scala 229:30]
  wire  _T_646 = _T_645 & io_SPI_invert; // @[Filter.scala 229:36]
  wire  _T_648 = $signed(pixOut_0_7) > 9'shf; // @[Filter.scala 234:36]
  wire  _T_649 = _T_648 & io_SPI_invert; // @[Filter.scala 234:43]
  wire [8:0] _T_651 = _T_644[8:0]; // @[Filter.scala 239:58]
  wire [8:0] _T_653 = 9'hf - _T_651; // @[Filter.scala 239:43]
  wire [8:0] _GEN_452 = io_SPI_invert ? _T_653 : _T_651; // @[Filter.scala 238:36]
  wire [8:0] _GEN_453 = _T_648 ? 9'hf : _GEN_452; // @[Filter.scala 236:44]
  wire [8:0] _GEN_454 = _T_649 ? 9'h0 : _GEN_453; // @[Filter.scala 234:59]
  wire [8:0] _GEN_455 = _T_645 ? 9'h0 : _GEN_454; // @[Filter.scala 231:43]
  wire [8:0] _GEN_456 = _T_646 ? 9'hf : _GEN_455; // @[Filter.scala 229:52]
  wire [9:0] _T_655 = $signed(KernelConvolution_1_io_pixelVal_out_0) / $signed(_GEN_927); // @[Filter.scala 227:64]
  wire [8:0] pixOut_1_0 = _T_655[8:0]; // @[Filter.scala 222:27 Filter.scala 222:27 Filter.scala 227:24]
  wire  _T_656 = $signed(pixOut_1_0) < 9'sh0; // @[Filter.scala 229:30]
  wire  _T_657 = _T_656 & io_SPI_invert; // @[Filter.scala 229:36]
  wire  _T_659 = $signed(pixOut_1_0) > 9'shf; // @[Filter.scala 234:36]
  wire  _T_660 = _T_659 & io_SPI_invert; // @[Filter.scala 234:43]
  wire [8:0] _T_662 = _T_655[8:0]; // @[Filter.scala 239:58]
  wire [8:0] _T_664 = 9'hf - _T_662; // @[Filter.scala 239:43]
  wire [8:0] _GEN_457 = io_SPI_invert ? _T_664 : _T_662; // @[Filter.scala 238:36]
  wire [8:0] _GEN_458 = _T_659 ? 9'hf : _GEN_457; // @[Filter.scala 236:44]
  wire [8:0] _GEN_459 = _T_660 ? 9'h0 : _GEN_458; // @[Filter.scala 234:59]
  wire [8:0] _GEN_460 = _T_656 ? 9'h0 : _GEN_459; // @[Filter.scala 231:43]
  wire [8:0] _GEN_461 = _T_657 ? 9'hf : _GEN_460; // @[Filter.scala 229:52]
  wire [9:0] _T_666 = $signed(KernelConvolution_1_io_pixelVal_out_1) / $signed(_GEN_927); // @[Filter.scala 227:64]
  wire [8:0] pixOut_1_1 = _T_666[8:0]; // @[Filter.scala 222:27 Filter.scala 222:27 Filter.scala 227:24]
  wire  _T_667 = $signed(pixOut_1_1) < 9'sh0; // @[Filter.scala 229:30]
  wire  _T_668 = _T_667 & io_SPI_invert; // @[Filter.scala 229:36]
  wire  _T_670 = $signed(pixOut_1_1) > 9'shf; // @[Filter.scala 234:36]
  wire  _T_671 = _T_670 & io_SPI_invert; // @[Filter.scala 234:43]
  wire [8:0] _T_673 = _T_666[8:0]; // @[Filter.scala 239:58]
  wire [8:0] _T_675 = 9'hf - _T_673; // @[Filter.scala 239:43]
  wire [8:0] _GEN_462 = io_SPI_invert ? _T_675 : _T_673; // @[Filter.scala 238:36]
  wire [8:0] _GEN_463 = _T_670 ? 9'hf : _GEN_462; // @[Filter.scala 236:44]
  wire [8:0] _GEN_464 = _T_671 ? 9'h0 : _GEN_463; // @[Filter.scala 234:59]
  wire [8:0] _GEN_465 = _T_667 ? 9'h0 : _GEN_464; // @[Filter.scala 231:43]
  wire [8:0] _GEN_466 = _T_668 ? 9'hf : _GEN_465; // @[Filter.scala 229:52]
  wire [9:0] _T_677 = $signed(KernelConvolution_1_io_pixelVal_out_2) / $signed(_GEN_927); // @[Filter.scala 227:64]
  wire [8:0] pixOut_1_2 = _T_677[8:0]; // @[Filter.scala 222:27 Filter.scala 222:27 Filter.scala 227:24]
  wire  _T_678 = $signed(pixOut_1_2) < 9'sh0; // @[Filter.scala 229:30]
  wire  _T_679 = _T_678 & io_SPI_invert; // @[Filter.scala 229:36]
  wire  _T_681 = $signed(pixOut_1_2) > 9'shf; // @[Filter.scala 234:36]
  wire  _T_682 = _T_681 & io_SPI_invert; // @[Filter.scala 234:43]
  wire [8:0] _T_684 = _T_677[8:0]; // @[Filter.scala 239:58]
  wire [8:0] _T_686 = 9'hf - _T_684; // @[Filter.scala 239:43]
  wire [8:0] _GEN_467 = io_SPI_invert ? _T_686 : _T_684; // @[Filter.scala 238:36]
  wire [8:0] _GEN_468 = _T_681 ? 9'hf : _GEN_467; // @[Filter.scala 236:44]
  wire [8:0] _GEN_469 = _T_682 ? 9'h0 : _GEN_468; // @[Filter.scala 234:59]
  wire [8:0] _GEN_470 = _T_678 ? 9'h0 : _GEN_469; // @[Filter.scala 231:43]
  wire [8:0] _GEN_471 = _T_679 ? 9'hf : _GEN_470; // @[Filter.scala 229:52]
  wire [9:0] _T_688 = $signed(KernelConvolution_1_io_pixelVal_out_3) / $signed(_GEN_927); // @[Filter.scala 227:64]
  wire [8:0] pixOut_1_3 = _T_688[8:0]; // @[Filter.scala 222:27 Filter.scala 222:27 Filter.scala 227:24]
  wire  _T_689 = $signed(pixOut_1_3) < 9'sh0; // @[Filter.scala 229:30]
  wire  _T_690 = _T_689 & io_SPI_invert; // @[Filter.scala 229:36]
  wire  _T_692 = $signed(pixOut_1_3) > 9'shf; // @[Filter.scala 234:36]
  wire  _T_693 = _T_692 & io_SPI_invert; // @[Filter.scala 234:43]
  wire [8:0] _T_695 = _T_688[8:0]; // @[Filter.scala 239:58]
  wire [8:0] _T_697 = 9'hf - _T_695; // @[Filter.scala 239:43]
  wire [8:0] _GEN_472 = io_SPI_invert ? _T_697 : _T_695; // @[Filter.scala 238:36]
  wire [8:0] _GEN_473 = _T_692 ? 9'hf : _GEN_472; // @[Filter.scala 236:44]
  wire [8:0] _GEN_474 = _T_693 ? 9'h0 : _GEN_473; // @[Filter.scala 234:59]
  wire [8:0] _GEN_475 = _T_689 ? 9'h0 : _GEN_474; // @[Filter.scala 231:43]
  wire [8:0] _GEN_476 = _T_690 ? 9'hf : _GEN_475; // @[Filter.scala 229:52]
  wire [9:0] _T_699 = $signed(KernelConvolution_1_io_pixelVal_out_4) / $signed(_GEN_927); // @[Filter.scala 227:64]
  wire [8:0] pixOut_1_4 = _T_699[8:0]; // @[Filter.scala 222:27 Filter.scala 222:27 Filter.scala 227:24]
  wire  _T_700 = $signed(pixOut_1_4) < 9'sh0; // @[Filter.scala 229:30]
  wire  _T_701 = _T_700 & io_SPI_invert; // @[Filter.scala 229:36]
  wire  _T_703 = $signed(pixOut_1_4) > 9'shf; // @[Filter.scala 234:36]
  wire  _T_704 = _T_703 & io_SPI_invert; // @[Filter.scala 234:43]
  wire [8:0] _T_706 = _T_699[8:0]; // @[Filter.scala 239:58]
  wire [8:0] _T_708 = 9'hf - _T_706; // @[Filter.scala 239:43]
  wire [8:0] _GEN_477 = io_SPI_invert ? _T_708 : _T_706; // @[Filter.scala 238:36]
  wire [8:0] _GEN_478 = _T_703 ? 9'hf : _GEN_477; // @[Filter.scala 236:44]
  wire [8:0] _GEN_479 = _T_704 ? 9'h0 : _GEN_478; // @[Filter.scala 234:59]
  wire [8:0] _GEN_480 = _T_700 ? 9'h0 : _GEN_479; // @[Filter.scala 231:43]
  wire [8:0] _GEN_481 = _T_701 ? 9'hf : _GEN_480; // @[Filter.scala 229:52]
  wire [9:0] _T_710 = $signed(KernelConvolution_1_io_pixelVal_out_5) / $signed(_GEN_927); // @[Filter.scala 227:64]
  wire [8:0] pixOut_1_5 = _T_710[8:0]; // @[Filter.scala 222:27 Filter.scala 222:27 Filter.scala 227:24]
  wire  _T_711 = $signed(pixOut_1_5) < 9'sh0; // @[Filter.scala 229:30]
  wire  _T_712 = _T_711 & io_SPI_invert; // @[Filter.scala 229:36]
  wire  _T_714 = $signed(pixOut_1_5) > 9'shf; // @[Filter.scala 234:36]
  wire  _T_715 = _T_714 & io_SPI_invert; // @[Filter.scala 234:43]
  wire [8:0] _T_717 = _T_710[8:0]; // @[Filter.scala 239:58]
  wire [8:0] _T_719 = 9'hf - _T_717; // @[Filter.scala 239:43]
  wire [8:0] _GEN_482 = io_SPI_invert ? _T_719 : _T_717; // @[Filter.scala 238:36]
  wire [8:0] _GEN_483 = _T_714 ? 9'hf : _GEN_482; // @[Filter.scala 236:44]
  wire [8:0] _GEN_484 = _T_715 ? 9'h0 : _GEN_483; // @[Filter.scala 234:59]
  wire [8:0] _GEN_485 = _T_711 ? 9'h0 : _GEN_484; // @[Filter.scala 231:43]
  wire [8:0] _GEN_486 = _T_712 ? 9'hf : _GEN_485; // @[Filter.scala 229:52]
  wire [9:0] _T_721 = $signed(KernelConvolution_1_io_pixelVal_out_6) / $signed(_GEN_927); // @[Filter.scala 227:64]
  wire [8:0] pixOut_1_6 = _T_721[8:0]; // @[Filter.scala 222:27 Filter.scala 222:27 Filter.scala 227:24]
  wire  _T_722 = $signed(pixOut_1_6) < 9'sh0; // @[Filter.scala 229:30]
  wire  _T_723 = _T_722 & io_SPI_invert; // @[Filter.scala 229:36]
  wire  _T_725 = $signed(pixOut_1_6) > 9'shf; // @[Filter.scala 234:36]
  wire  _T_726 = _T_725 & io_SPI_invert; // @[Filter.scala 234:43]
  wire [8:0] _T_728 = _T_721[8:0]; // @[Filter.scala 239:58]
  wire [8:0] _T_730 = 9'hf - _T_728; // @[Filter.scala 239:43]
  wire [8:0] _GEN_487 = io_SPI_invert ? _T_730 : _T_728; // @[Filter.scala 238:36]
  wire [8:0] _GEN_488 = _T_725 ? 9'hf : _GEN_487; // @[Filter.scala 236:44]
  wire [8:0] _GEN_489 = _T_726 ? 9'h0 : _GEN_488; // @[Filter.scala 234:59]
  wire [8:0] _GEN_490 = _T_722 ? 9'h0 : _GEN_489; // @[Filter.scala 231:43]
  wire [8:0] _GEN_491 = _T_723 ? 9'hf : _GEN_490; // @[Filter.scala 229:52]
  wire [9:0] _T_732 = $signed(KernelConvolution_1_io_pixelVal_out_7) / $signed(_GEN_927); // @[Filter.scala 227:64]
  wire [8:0] pixOut_1_7 = _T_732[8:0]; // @[Filter.scala 222:27 Filter.scala 222:27 Filter.scala 227:24]
  wire  _T_733 = $signed(pixOut_1_7) < 9'sh0; // @[Filter.scala 229:30]
  wire  _T_734 = _T_733 & io_SPI_invert; // @[Filter.scala 229:36]
  wire  _T_736 = $signed(pixOut_1_7) > 9'shf; // @[Filter.scala 234:36]
  wire  _T_737 = _T_736 & io_SPI_invert; // @[Filter.scala 234:43]
  wire [8:0] _T_739 = _T_732[8:0]; // @[Filter.scala 239:58]
  wire [8:0] _T_741 = 9'hf - _T_739; // @[Filter.scala 239:43]
  wire [8:0] _GEN_492 = io_SPI_invert ? _T_741 : _T_739; // @[Filter.scala 238:36]
  wire [8:0] _GEN_493 = _T_736 ? 9'hf : _GEN_492; // @[Filter.scala 236:44]
  wire [8:0] _GEN_494 = _T_737 ? 9'h0 : _GEN_493; // @[Filter.scala 234:59]
  wire [8:0] _GEN_495 = _T_733 ? 9'h0 : _GEN_494; // @[Filter.scala 231:43]
  wire [8:0] _GEN_496 = _T_734 ? 9'hf : _GEN_495; // @[Filter.scala 229:52]
  wire [9:0] _T_743 = $signed(KernelConvolution_2_io_pixelVal_out_0) / $signed(_GEN_927); // @[Filter.scala 227:64]
  wire [8:0] pixOut_2_0 = _T_743[8:0]; // @[Filter.scala 222:27 Filter.scala 222:27 Filter.scala 227:24]
  wire  _T_744 = $signed(pixOut_2_0) < 9'sh0; // @[Filter.scala 229:30]
  wire  _T_745 = _T_744 & io_SPI_invert; // @[Filter.scala 229:36]
  wire  _T_747 = $signed(pixOut_2_0) > 9'shf; // @[Filter.scala 234:36]
  wire  _T_748 = _T_747 & io_SPI_invert; // @[Filter.scala 234:43]
  wire [8:0] _T_750 = _T_743[8:0]; // @[Filter.scala 239:58]
  wire [8:0] _T_752 = 9'hf - _T_750; // @[Filter.scala 239:43]
  wire [8:0] _GEN_497 = io_SPI_invert ? _T_752 : _T_750; // @[Filter.scala 238:36]
  wire [8:0] _GEN_498 = _T_747 ? 9'hf : _GEN_497; // @[Filter.scala 236:44]
  wire [8:0] _GEN_499 = _T_748 ? 9'h0 : _GEN_498; // @[Filter.scala 234:59]
  wire [8:0] _GEN_500 = _T_744 ? 9'h0 : _GEN_499; // @[Filter.scala 231:43]
  wire [8:0] _GEN_501 = _T_745 ? 9'hf : _GEN_500; // @[Filter.scala 229:52]
  wire [9:0] _T_754 = $signed(KernelConvolution_2_io_pixelVal_out_1) / $signed(_GEN_927); // @[Filter.scala 227:64]
  wire [8:0] pixOut_2_1 = _T_754[8:0]; // @[Filter.scala 222:27 Filter.scala 222:27 Filter.scala 227:24]
  wire  _T_755 = $signed(pixOut_2_1) < 9'sh0; // @[Filter.scala 229:30]
  wire  _T_756 = _T_755 & io_SPI_invert; // @[Filter.scala 229:36]
  wire  _T_758 = $signed(pixOut_2_1) > 9'shf; // @[Filter.scala 234:36]
  wire  _T_759 = _T_758 & io_SPI_invert; // @[Filter.scala 234:43]
  wire [8:0] _T_761 = _T_754[8:0]; // @[Filter.scala 239:58]
  wire [8:0] _T_763 = 9'hf - _T_761; // @[Filter.scala 239:43]
  wire [8:0] _GEN_502 = io_SPI_invert ? _T_763 : _T_761; // @[Filter.scala 238:36]
  wire [8:0] _GEN_503 = _T_758 ? 9'hf : _GEN_502; // @[Filter.scala 236:44]
  wire [8:0] _GEN_504 = _T_759 ? 9'h0 : _GEN_503; // @[Filter.scala 234:59]
  wire [8:0] _GEN_505 = _T_755 ? 9'h0 : _GEN_504; // @[Filter.scala 231:43]
  wire [8:0] _GEN_506 = _T_756 ? 9'hf : _GEN_505; // @[Filter.scala 229:52]
  wire [9:0] _T_765 = $signed(KernelConvolution_2_io_pixelVal_out_2) / $signed(_GEN_927); // @[Filter.scala 227:64]
  wire [8:0] pixOut_2_2 = _T_765[8:0]; // @[Filter.scala 222:27 Filter.scala 222:27 Filter.scala 227:24]
  wire  _T_766 = $signed(pixOut_2_2) < 9'sh0; // @[Filter.scala 229:30]
  wire  _T_767 = _T_766 & io_SPI_invert; // @[Filter.scala 229:36]
  wire  _T_769 = $signed(pixOut_2_2) > 9'shf; // @[Filter.scala 234:36]
  wire  _T_770 = _T_769 & io_SPI_invert; // @[Filter.scala 234:43]
  wire [8:0] _T_772 = _T_765[8:0]; // @[Filter.scala 239:58]
  wire [8:0] _T_774 = 9'hf - _T_772; // @[Filter.scala 239:43]
  wire [8:0] _GEN_507 = io_SPI_invert ? _T_774 : _T_772; // @[Filter.scala 238:36]
  wire [8:0] _GEN_508 = _T_769 ? 9'hf : _GEN_507; // @[Filter.scala 236:44]
  wire [8:0] _GEN_509 = _T_770 ? 9'h0 : _GEN_508; // @[Filter.scala 234:59]
  wire [8:0] _GEN_510 = _T_766 ? 9'h0 : _GEN_509; // @[Filter.scala 231:43]
  wire [8:0] _GEN_511 = _T_767 ? 9'hf : _GEN_510; // @[Filter.scala 229:52]
  wire [9:0] _T_776 = $signed(KernelConvolution_2_io_pixelVal_out_3) / $signed(_GEN_927); // @[Filter.scala 227:64]
  wire [8:0] pixOut_2_3 = _T_776[8:0]; // @[Filter.scala 222:27 Filter.scala 222:27 Filter.scala 227:24]
  wire  _T_777 = $signed(pixOut_2_3) < 9'sh0; // @[Filter.scala 229:30]
  wire  _T_778 = _T_777 & io_SPI_invert; // @[Filter.scala 229:36]
  wire  _T_780 = $signed(pixOut_2_3) > 9'shf; // @[Filter.scala 234:36]
  wire  _T_781 = _T_780 & io_SPI_invert; // @[Filter.scala 234:43]
  wire [8:0] _T_783 = _T_776[8:0]; // @[Filter.scala 239:58]
  wire [8:0] _T_785 = 9'hf - _T_783; // @[Filter.scala 239:43]
  wire [8:0] _GEN_512 = io_SPI_invert ? _T_785 : _T_783; // @[Filter.scala 238:36]
  wire [8:0] _GEN_513 = _T_780 ? 9'hf : _GEN_512; // @[Filter.scala 236:44]
  wire [8:0] _GEN_514 = _T_781 ? 9'h0 : _GEN_513; // @[Filter.scala 234:59]
  wire [8:0] _GEN_515 = _T_777 ? 9'h0 : _GEN_514; // @[Filter.scala 231:43]
  wire [8:0] _GEN_516 = _T_778 ? 9'hf : _GEN_515; // @[Filter.scala 229:52]
  wire [9:0] _T_787 = $signed(KernelConvolution_2_io_pixelVal_out_4) / $signed(_GEN_927); // @[Filter.scala 227:64]
  wire [8:0] pixOut_2_4 = _T_787[8:0]; // @[Filter.scala 222:27 Filter.scala 222:27 Filter.scala 227:24]
  wire  _T_788 = $signed(pixOut_2_4) < 9'sh0; // @[Filter.scala 229:30]
  wire  _T_789 = _T_788 & io_SPI_invert; // @[Filter.scala 229:36]
  wire  _T_791 = $signed(pixOut_2_4) > 9'shf; // @[Filter.scala 234:36]
  wire  _T_792 = _T_791 & io_SPI_invert; // @[Filter.scala 234:43]
  wire [8:0] _T_794 = _T_787[8:0]; // @[Filter.scala 239:58]
  wire [8:0] _T_796 = 9'hf - _T_794; // @[Filter.scala 239:43]
  wire [8:0] _GEN_517 = io_SPI_invert ? _T_796 : _T_794; // @[Filter.scala 238:36]
  wire [8:0] _GEN_518 = _T_791 ? 9'hf : _GEN_517; // @[Filter.scala 236:44]
  wire [8:0] _GEN_519 = _T_792 ? 9'h0 : _GEN_518; // @[Filter.scala 234:59]
  wire [8:0] _GEN_520 = _T_788 ? 9'h0 : _GEN_519; // @[Filter.scala 231:43]
  wire [8:0] _GEN_521 = _T_789 ? 9'hf : _GEN_520; // @[Filter.scala 229:52]
  wire [9:0] _T_798 = $signed(KernelConvolution_2_io_pixelVal_out_5) / $signed(_GEN_927); // @[Filter.scala 227:64]
  wire [8:0] pixOut_2_5 = _T_798[8:0]; // @[Filter.scala 222:27 Filter.scala 222:27 Filter.scala 227:24]
  wire  _T_799 = $signed(pixOut_2_5) < 9'sh0; // @[Filter.scala 229:30]
  wire  _T_800 = _T_799 & io_SPI_invert; // @[Filter.scala 229:36]
  wire  _T_802 = $signed(pixOut_2_5) > 9'shf; // @[Filter.scala 234:36]
  wire  _T_803 = _T_802 & io_SPI_invert; // @[Filter.scala 234:43]
  wire [8:0] _T_805 = _T_798[8:0]; // @[Filter.scala 239:58]
  wire [8:0] _T_807 = 9'hf - _T_805; // @[Filter.scala 239:43]
  wire [8:0] _GEN_522 = io_SPI_invert ? _T_807 : _T_805; // @[Filter.scala 238:36]
  wire [8:0] _GEN_523 = _T_802 ? 9'hf : _GEN_522; // @[Filter.scala 236:44]
  wire [8:0] _GEN_524 = _T_803 ? 9'h0 : _GEN_523; // @[Filter.scala 234:59]
  wire [8:0] _GEN_525 = _T_799 ? 9'h0 : _GEN_524; // @[Filter.scala 231:43]
  wire [8:0] _GEN_526 = _T_800 ? 9'hf : _GEN_525; // @[Filter.scala 229:52]
  wire [9:0] _T_809 = $signed(KernelConvolution_2_io_pixelVal_out_6) / $signed(_GEN_927); // @[Filter.scala 227:64]
  wire [8:0] pixOut_2_6 = _T_809[8:0]; // @[Filter.scala 222:27 Filter.scala 222:27 Filter.scala 227:24]
  wire  _T_810 = $signed(pixOut_2_6) < 9'sh0; // @[Filter.scala 229:30]
  wire  _T_811 = _T_810 & io_SPI_invert; // @[Filter.scala 229:36]
  wire  _T_813 = $signed(pixOut_2_6) > 9'shf; // @[Filter.scala 234:36]
  wire  _T_814 = _T_813 & io_SPI_invert; // @[Filter.scala 234:43]
  wire [8:0] _T_816 = _T_809[8:0]; // @[Filter.scala 239:58]
  wire [8:0] _T_818 = 9'hf - _T_816; // @[Filter.scala 239:43]
  wire [8:0] _GEN_527 = io_SPI_invert ? _T_818 : _T_816; // @[Filter.scala 238:36]
  wire [8:0] _GEN_528 = _T_813 ? 9'hf : _GEN_527; // @[Filter.scala 236:44]
  wire [8:0] _GEN_529 = _T_814 ? 9'h0 : _GEN_528; // @[Filter.scala 234:59]
  wire [8:0] _GEN_530 = _T_810 ? 9'h0 : _GEN_529; // @[Filter.scala 231:43]
  wire [8:0] _GEN_531 = _T_811 ? 9'hf : _GEN_530; // @[Filter.scala 229:52]
  wire [9:0] _T_820 = $signed(KernelConvolution_2_io_pixelVal_out_7) / $signed(_GEN_927); // @[Filter.scala 227:64]
  wire [8:0] pixOut_2_7 = _T_820[8:0]; // @[Filter.scala 222:27 Filter.scala 222:27 Filter.scala 227:24]
  wire  _T_821 = $signed(pixOut_2_7) < 9'sh0; // @[Filter.scala 229:30]
  wire  _T_822 = _T_821 & io_SPI_invert; // @[Filter.scala 229:36]
  wire  _T_824 = $signed(pixOut_2_7) > 9'shf; // @[Filter.scala 234:36]
  wire  _T_825 = _T_824 & io_SPI_invert; // @[Filter.scala 234:43]
  wire [8:0] _T_827 = _T_820[8:0]; // @[Filter.scala 239:58]
  wire [8:0] _T_829 = 9'hf - _T_827; // @[Filter.scala 239:43]
  wire [8:0] _GEN_532 = io_SPI_invert ? _T_829 : _T_827; // @[Filter.scala 238:36]
  wire [8:0] _GEN_533 = _T_824 ? 9'hf : _GEN_532; // @[Filter.scala 236:44]
  wire [8:0] _GEN_534 = _T_825 ? 9'h0 : _GEN_533; // @[Filter.scala 234:59]
  wire [8:0] _GEN_535 = _T_821 ? 9'h0 : _GEN_534; // @[Filter.scala 231:43]
  wire [8:0] _GEN_536 = _T_822 ? 9'hf : _GEN_535; // @[Filter.scala 229:52]
  wire [31:0] _T_832 = pixelIndex + 32'h8; // @[Filter.scala 251:34]
  wire [3:0] _T_833 = 2'h2 * 2'h2; // @[Filter.scala 252:42]
  wire [31:0] _GEN_975 = {{28'd0}, _T_833}; // @[Filter.scala 252:25]
  wire  _T_834 = pixelIndex == _GEN_975; // @[Filter.scala 252:25]
  KernelConvolution KernelConvolution ( // @[Filter.scala 188:36]
    .clock(KernelConvolution_clock),
    .reset(KernelConvolution_reset),
    .io_kernelVal_in(KernelConvolution_io_kernelVal_in),
    .io_pixelVal_in_0(KernelConvolution_io_pixelVal_in_0),
    .io_pixelVal_in_1(KernelConvolution_io_pixelVal_in_1),
    .io_pixelVal_in_2(KernelConvolution_io_pixelVal_in_2),
    .io_pixelVal_in_3(KernelConvolution_io_pixelVal_in_3),
    .io_pixelVal_in_4(KernelConvolution_io_pixelVal_in_4),
    .io_pixelVal_in_5(KernelConvolution_io_pixelVal_in_5),
    .io_pixelVal_in_6(KernelConvolution_io_pixelVal_in_6),
    .io_pixelVal_in_7(KernelConvolution_io_pixelVal_in_7),
    .io_pixelVal_out_0(KernelConvolution_io_pixelVal_out_0),
    .io_pixelVal_out_1(KernelConvolution_io_pixelVal_out_1),
    .io_pixelVal_out_2(KernelConvolution_io_pixelVal_out_2),
    .io_pixelVal_out_3(KernelConvolution_io_pixelVal_out_3),
    .io_pixelVal_out_4(KernelConvolution_io_pixelVal_out_4),
    .io_pixelVal_out_5(KernelConvolution_io_pixelVal_out_5),
    .io_pixelVal_out_6(KernelConvolution_io_pixelVal_out_6),
    .io_pixelVal_out_7(KernelConvolution_io_pixelVal_out_7),
    .io_valid_out(KernelConvolution_io_valid_out)
  );
  KernelConvolution KernelConvolution_1 ( // @[Filter.scala 189:36]
    .clock(KernelConvolution_1_clock),
    .reset(KernelConvolution_1_reset),
    .io_kernelVal_in(KernelConvolution_1_io_kernelVal_in),
    .io_pixelVal_in_0(KernelConvolution_1_io_pixelVal_in_0),
    .io_pixelVal_in_1(KernelConvolution_1_io_pixelVal_in_1),
    .io_pixelVal_in_2(KernelConvolution_1_io_pixelVal_in_2),
    .io_pixelVal_in_3(KernelConvolution_1_io_pixelVal_in_3),
    .io_pixelVal_in_4(KernelConvolution_1_io_pixelVal_in_4),
    .io_pixelVal_in_5(KernelConvolution_1_io_pixelVal_in_5),
    .io_pixelVal_in_6(KernelConvolution_1_io_pixelVal_in_6),
    .io_pixelVal_in_7(KernelConvolution_1_io_pixelVal_in_7),
    .io_pixelVal_out_0(KernelConvolution_1_io_pixelVal_out_0),
    .io_pixelVal_out_1(KernelConvolution_1_io_pixelVal_out_1),
    .io_pixelVal_out_2(KernelConvolution_1_io_pixelVal_out_2),
    .io_pixelVal_out_3(KernelConvolution_1_io_pixelVal_out_3),
    .io_pixelVal_out_4(KernelConvolution_1_io_pixelVal_out_4),
    .io_pixelVal_out_5(KernelConvolution_1_io_pixelVal_out_5),
    .io_pixelVal_out_6(KernelConvolution_1_io_pixelVal_out_6),
    .io_pixelVal_out_7(KernelConvolution_1_io_pixelVal_out_7),
    .io_valid_out(KernelConvolution_1_io_valid_out)
  );
  KernelConvolution KernelConvolution_2 ( // @[Filter.scala 190:36]
    .clock(KernelConvolution_2_clock),
    .reset(KernelConvolution_2_reset),
    .io_kernelVal_in(KernelConvolution_2_io_kernelVal_in),
    .io_pixelVal_in_0(KernelConvolution_2_io_pixelVal_in_0),
    .io_pixelVal_in_1(KernelConvolution_2_io_pixelVal_in_1),
    .io_pixelVal_in_2(KernelConvolution_2_io_pixelVal_in_2),
    .io_pixelVal_in_3(KernelConvolution_2_io_pixelVal_in_3),
    .io_pixelVal_in_4(KernelConvolution_2_io_pixelVal_in_4),
    .io_pixelVal_in_5(KernelConvolution_2_io_pixelVal_in_5),
    .io_pixelVal_in_6(KernelConvolution_2_io_pixelVal_in_6),
    .io_pixelVal_in_7(KernelConvolution_2_io_pixelVal_in_7),
    .io_pixelVal_out_0(KernelConvolution_2_io_pixelVal_out_0),
    .io_pixelVal_out_1(KernelConvolution_2_io_pixelVal_out_1),
    .io_pixelVal_out_2(KernelConvolution_2_io_pixelVal_out_2),
    .io_pixelVal_out_3(KernelConvolution_2_io_pixelVal_out_3),
    .io_pixelVal_out_4(KernelConvolution_2_io_pixelVal_out_4),
    .io_pixelVal_out_5(KernelConvolution_2_io_pixelVal_out_5),
    .io_pixelVal_out_6(KernelConvolution_2_io_pixelVal_out_6),
    .io_pixelVal_out_7(KernelConvolution_2_io_pixelVal_out_7),
    .io_valid_out(KernelConvolution_2_io_valid_out)
  );
  assign io_pixelVal_out_0_0 = _GEN_421[3:0]; // @[Filter.scala 230:35 Filter.scala 232:37 Filter.scala 235:35 Filter.scala 237:35 Filter.scala 239:35 Filter.scala 241:35]
  assign io_pixelVal_out_0_1 = _GEN_426[3:0]; // @[Filter.scala 230:35 Filter.scala 232:37 Filter.scala 235:35 Filter.scala 237:35 Filter.scala 239:35 Filter.scala 241:35]
  assign io_pixelVal_out_0_2 = _GEN_431[3:0]; // @[Filter.scala 230:35 Filter.scala 232:37 Filter.scala 235:35 Filter.scala 237:35 Filter.scala 239:35 Filter.scala 241:35]
  assign io_pixelVal_out_0_3 = _GEN_436[3:0]; // @[Filter.scala 230:35 Filter.scala 232:37 Filter.scala 235:35 Filter.scala 237:35 Filter.scala 239:35 Filter.scala 241:35]
  assign io_pixelVal_out_0_4 = _GEN_441[3:0]; // @[Filter.scala 230:35 Filter.scala 232:37 Filter.scala 235:35 Filter.scala 237:35 Filter.scala 239:35 Filter.scala 241:35]
  assign io_pixelVal_out_0_5 = _GEN_446[3:0]; // @[Filter.scala 230:35 Filter.scala 232:37 Filter.scala 235:35 Filter.scala 237:35 Filter.scala 239:35 Filter.scala 241:35]
  assign io_pixelVal_out_0_6 = _GEN_451[3:0]; // @[Filter.scala 230:35 Filter.scala 232:37 Filter.scala 235:35 Filter.scala 237:35 Filter.scala 239:35 Filter.scala 241:35]
  assign io_pixelVal_out_0_7 = _GEN_456[3:0]; // @[Filter.scala 230:35 Filter.scala 232:37 Filter.scala 235:35 Filter.scala 237:35 Filter.scala 239:35 Filter.scala 241:35]
  assign io_pixelVal_out_1_0 = _GEN_461[3:0]; // @[Filter.scala 230:35 Filter.scala 232:37 Filter.scala 235:35 Filter.scala 237:35 Filter.scala 239:35 Filter.scala 241:35]
  assign io_pixelVal_out_1_1 = _GEN_466[3:0]; // @[Filter.scala 230:35 Filter.scala 232:37 Filter.scala 235:35 Filter.scala 237:35 Filter.scala 239:35 Filter.scala 241:35]
  assign io_pixelVal_out_1_2 = _GEN_471[3:0]; // @[Filter.scala 230:35 Filter.scala 232:37 Filter.scala 235:35 Filter.scala 237:35 Filter.scala 239:35 Filter.scala 241:35]
  assign io_pixelVal_out_1_3 = _GEN_476[3:0]; // @[Filter.scala 230:35 Filter.scala 232:37 Filter.scala 235:35 Filter.scala 237:35 Filter.scala 239:35 Filter.scala 241:35]
  assign io_pixelVal_out_1_4 = _GEN_481[3:0]; // @[Filter.scala 230:35 Filter.scala 232:37 Filter.scala 235:35 Filter.scala 237:35 Filter.scala 239:35 Filter.scala 241:35]
  assign io_pixelVal_out_1_5 = _GEN_486[3:0]; // @[Filter.scala 230:35 Filter.scala 232:37 Filter.scala 235:35 Filter.scala 237:35 Filter.scala 239:35 Filter.scala 241:35]
  assign io_pixelVal_out_1_6 = _GEN_491[3:0]; // @[Filter.scala 230:35 Filter.scala 232:37 Filter.scala 235:35 Filter.scala 237:35 Filter.scala 239:35 Filter.scala 241:35]
  assign io_pixelVal_out_1_7 = _GEN_496[3:0]; // @[Filter.scala 230:35 Filter.scala 232:37 Filter.scala 235:35 Filter.scala 237:35 Filter.scala 239:35 Filter.scala 241:35]
  assign io_pixelVal_out_2_0 = _GEN_501[3:0]; // @[Filter.scala 230:35 Filter.scala 232:37 Filter.scala 235:35 Filter.scala 237:35 Filter.scala 239:35 Filter.scala 241:35]
  assign io_pixelVal_out_2_1 = _GEN_506[3:0]; // @[Filter.scala 230:35 Filter.scala 232:37 Filter.scala 235:35 Filter.scala 237:35 Filter.scala 239:35 Filter.scala 241:35]
  assign io_pixelVal_out_2_2 = _GEN_511[3:0]; // @[Filter.scala 230:35 Filter.scala 232:37 Filter.scala 235:35 Filter.scala 237:35 Filter.scala 239:35 Filter.scala 241:35]
  assign io_pixelVal_out_2_3 = _GEN_516[3:0]; // @[Filter.scala 230:35 Filter.scala 232:37 Filter.scala 235:35 Filter.scala 237:35 Filter.scala 239:35 Filter.scala 241:35]
  assign io_pixelVal_out_2_4 = _GEN_521[3:0]; // @[Filter.scala 230:35 Filter.scala 232:37 Filter.scala 235:35 Filter.scala 237:35 Filter.scala 239:35 Filter.scala 241:35]
  assign io_pixelVal_out_2_5 = _GEN_526[3:0]; // @[Filter.scala 230:35 Filter.scala 232:37 Filter.scala 235:35 Filter.scala 237:35 Filter.scala 239:35 Filter.scala 241:35]
  assign io_pixelVal_out_2_6 = _GEN_531[3:0]; // @[Filter.scala 230:35 Filter.scala 232:37 Filter.scala 235:35 Filter.scala 237:35 Filter.scala 239:35 Filter.scala 241:35]
  assign io_pixelVal_out_2_7 = _GEN_536[3:0]; // @[Filter.scala 230:35 Filter.scala 232:37 Filter.scala 235:35 Filter.scala 237:35 Filter.scala 239:35 Filter.scala 241:35]
  assign io_valid_out = validOut; // @[Filter.scala 248:18]
  assign KernelConvolution_clock = clock;
  assign KernelConvolution_reset = reset;
  assign KernelConvolution_io_kernelVal_in = _GEN_621 & _GEN_548 ? $signed(5'sh0) : $signed(_GEN_55); // @[Filter.scala 196:41]
  assign KernelConvolution_io_pixelVal_in_0 = _GEN_188[3:0]; // @[Filter.scala 210:53 Filter.scala 212:51 Filter.scala 214:51]
  assign KernelConvolution_io_pixelVal_in_1 = _GEN_218[3:0]; // @[Filter.scala 210:53 Filter.scala 212:51 Filter.scala 214:51]
  assign KernelConvolution_io_pixelVal_in_2 = _GEN_248[3:0]; // @[Filter.scala 210:53 Filter.scala 212:51 Filter.scala 214:51]
  assign KernelConvolution_io_pixelVal_in_3 = _GEN_278[3:0]; // @[Filter.scala 210:53 Filter.scala 212:51 Filter.scala 214:51]
  assign KernelConvolution_io_pixelVal_in_4 = _GEN_308[3:0]; // @[Filter.scala 210:53 Filter.scala 212:51 Filter.scala 214:51]
  assign KernelConvolution_io_pixelVal_in_5 = _GEN_338[3:0]; // @[Filter.scala 210:53 Filter.scala 212:51 Filter.scala 214:51]
  assign KernelConvolution_io_pixelVal_in_6 = _GEN_368[3:0]; // @[Filter.scala 210:53 Filter.scala 212:51 Filter.scala 214:51]
  assign KernelConvolution_io_pixelVal_in_7 = _GEN_398[3:0]; // @[Filter.scala 210:53 Filter.scala 212:51 Filter.scala 214:51]
  assign KernelConvolution_1_clock = clock;
  assign KernelConvolution_1_reset = reset;
  assign KernelConvolution_1_io_kernelVal_in = _GEN_621 & _GEN_548 ? $signed(5'sh0) : $signed(_GEN_55); // @[Filter.scala 196:41]
  assign KernelConvolution_1_io_pixelVal_in_0 = _GEN_194[3:0]; // @[Filter.scala 210:53 Filter.scala 212:51 Filter.scala 214:51]
  assign KernelConvolution_1_io_pixelVal_in_1 = _GEN_224[3:0]; // @[Filter.scala 210:53 Filter.scala 212:51 Filter.scala 214:51]
  assign KernelConvolution_1_io_pixelVal_in_2 = _GEN_254[3:0]; // @[Filter.scala 210:53 Filter.scala 212:51 Filter.scala 214:51]
  assign KernelConvolution_1_io_pixelVal_in_3 = _GEN_284[3:0]; // @[Filter.scala 210:53 Filter.scala 212:51 Filter.scala 214:51]
  assign KernelConvolution_1_io_pixelVal_in_4 = _GEN_314[3:0]; // @[Filter.scala 210:53 Filter.scala 212:51 Filter.scala 214:51]
  assign KernelConvolution_1_io_pixelVal_in_5 = _GEN_344[3:0]; // @[Filter.scala 210:53 Filter.scala 212:51 Filter.scala 214:51]
  assign KernelConvolution_1_io_pixelVal_in_6 = _GEN_374[3:0]; // @[Filter.scala 210:53 Filter.scala 212:51 Filter.scala 214:51]
  assign KernelConvolution_1_io_pixelVal_in_7 = _GEN_404[3:0]; // @[Filter.scala 210:53 Filter.scala 212:51 Filter.scala 214:51]
  assign KernelConvolution_2_clock = clock;
  assign KernelConvolution_2_reset = reset;
  assign KernelConvolution_2_io_kernelVal_in = _GEN_621 & _GEN_548 ? $signed(5'sh0) : $signed(_GEN_55); // @[Filter.scala 196:41]
  assign KernelConvolution_2_io_pixelVal_in_0 = _GEN_200[3:0]; // @[Filter.scala 210:53 Filter.scala 212:51 Filter.scala 214:51]
  assign KernelConvolution_2_io_pixelVal_in_1 = _GEN_230[3:0]; // @[Filter.scala 210:53 Filter.scala 212:51 Filter.scala 214:51]
  assign KernelConvolution_2_io_pixelVal_in_2 = _GEN_260[3:0]; // @[Filter.scala 210:53 Filter.scala 212:51 Filter.scala 214:51]
  assign KernelConvolution_2_io_pixelVal_in_3 = _GEN_290[3:0]; // @[Filter.scala 210:53 Filter.scala 212:51 Filter.scala 214:51]
  assign KernelConvolution_2_io_pixelVal_in_4 = _GEN_320[3:0]; // @[Filter.scala 210:53 Filter.scala 212:51 Filter.scala 214:51]
  assign KernelConvolution_2_io_pixelVal_in_5 = _GEN_350[3:0]; // @[Filter.scala 210:53 Filter.scala 212:51 Filter.scala 214:51]
  assign KernelConvolution_2_io_pixelVal_in_6 = _GEN_380[3:0]; // @[Filter.scala 210:53 Filter.scala 212:51 Filter.scala 214:51]
  assign KernelConvolution_2_io_pixelVal_in_7 = _GEN_410[3:0]; // @[Filter.scala 210:53 Filter.scala 212:51 Filter.scala 214:51]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  kernelCounter = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  imageCounterX = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  imageCounterY = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  pixelIndex = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  validOut = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      kernelCounter <= 4'h0;
    end else if (kernelCountReset) begin
      kernelCounter <= 4'h0;
    end else begin
      kernelCounter <= _T_14;
    end
    if (reset) begin
      imageCounterX <= 2'h0;
    end else if (imageCounterXReset) begin
      imageCounterX <= 2'h0;
    end else begin
      imageCounterX <= _T_20;
    end
    if (reset) begin
      imageCounterY <= 2'h0;
    end else if (imageCounterXReset) begin
      if (_T_21) begin
        imageCounterY <= 2'h0;
      end else begin
        imageCounterY <= _T_23;
      end
    end
    if (reset) begin
      pixelIndex <= 32'h0;
    end else if (kernelCountReset) begin
      if (_T_834) begin
        pixelIndex <= 32'h0;
      end else begin
        pixelIndex <= _T_832;
      end
    end
    if (reset) begin
      validOut <= 1'h0;
    end else begin
      validOut <= KernelConvolution_io_valid_out;
    end
  end
endmodule
module VideoBuffer(
  input         clock,
  input         reset,
  input  [3:0]  io_pixelVal_in_0_0,
  input  [3:0]  io_pixelVal_in_0_1,
  input  [3:0]  io_pixelVal_in_0_2,
  input  [3:0]  io_pixelVal_in_0_3,
  input  [3:0]  io_pixelVal_in_0_4,
  input  [3:0]  io_pixelVal_in_0_5,
  input  [3:0]  io_pixelVal_in_0_6,
  input  [3:0]  io_pixelVal_in_0_7,
  input  [3:0]  io_pixelVal_in_1_0,
  input  [3:0]  io_pixelVal_in_1_1,
  input  [3:0]  io_pixelVal_in_1_2,
  input  [3:0]  io_pixelVal_in_1_3,
  input  [3:0]  io_pixelVal_in_1_4,
  input  [3:0]  io_pixelVal_in_1_5,
  input  [3:0]  io_pixelVal_in_1_6,
  input  [3:0]  io_pixelVal_in_1_7,
  input  [3:0]  io_pixelVal_in_2_0,
  input  [3:0]  io_pixelVal_in_2_1,
  input  [3:0]  io_pixelVal_in_2_2,
  input  [3:0]  io_pixelVal_in_2_3,
  input  [3:0]  io_pixelVal_in_2_4,
  input  [3:0]  io_pixelVal_in_2_5,
  input  [3:0]  io_pixelVal_in_2_6,
  input  [3:0]  io_pixelVal_in_2_7,
  input         io_valid_in,
  input  [10:0] io_rowIndex,
  input  [10:0] io_colIndex,
  output [3:0]  io_pixelVal_out_0,
  output [3:0]  io_pixelVal_out_1,
  output [3:0]  io_pixelVal_out_2
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] image_0_0; // @[VideoBuffer.scala 19:25]
  reg [3:0] image_0_1; // @[VideoBuffer.scala 19:25]
  reg [3:0] image_0_2; // @[VideoBuffer.scala 19:25]
  reg [3:0] image_0_3; // @[VideoBuffer.scala 19:25]
  reg [3:0] image_1_0; // @[VideoBuffer.scala 20:25]
  reg [3:0] image_1_1; // @[VideoBuffer.scala 20:25]
  reg [3:0] image_1_2; // @[VideoBuffer.scala 20:25]
  reg [3:0] image_1_3; // @[VideoBuffer.scala 20:25]
  reg [3:0] image_2_0; // @[VideoBuffer.scala 21:25]
  reg [3:0] image_2_1; // @[VideoBuffer.scala 21:25]
  reg [3:0] image_2_2; // @[VideoBuffer.scala 21:25]
  reg [3:0] image_2_3; // @[VideoBuffer.scala 21:25]
  reg [31:0] pixelIndex; // @[VideoBuffer.scala 24:33]
  reg [3:0] pixOut_0; // @[VideoBuffer.scala 25:29]
  reg [3:0] pixOut_1; // @[VideoBuffer.scala 25:29]
  reg [3:0] pixOut_2; // @[VideoBuffer.scala 25:29]
  reg  valid; // @[VideoBuffer.scala 26:24]
  wire [12:0] _T_4 = io_rowIndex * 11'h2; // @[VideoBuffer.scala 30:41]
  wire [12:0] _GEN_122 = {{2'd0}, io_colIndex}; // @[VideoBuffer.scala 30:56]
  wire [12:0] _T_6 = _T_4 + _GEN_122; // @[VideoBuffer.scala 30:56]
  wire [32:0] _T_16 = {{1'd0}, pixelIndex}; // @[VideoBuffer.scala 37:35]
  wire [31:0] _T_20 = pixelIndex + 32'h1; // @[VideoBuffer.scala 37:35]
  wire [31:0] _T_23 = pixelIndex + 32'h2; // @[VideoBuffer.scala 37:35]
  wire [31:0] _T_26 = pixelIndex + 32'h3; // @[VideoBuffer.scala 37:35]
  wire [31:0] _T_29 = pixelIndex + 32'h4; // @[VideoBuffer.scala 37:35]
  wire [31:0] _T_32 = pixelIndex + 32'h5; // @[VideoBuffer.scala 37:35]
  wire [31:0] _T_35 = pixelIndex + 32'h6; // @[VideoBuffer.scala 37:35]
  wire [31:0] _T_38 = pixelIndex + 32'h7; // @[VideoBuffer.scala 37:35]
  wire [31:0] _T_89 = pixelIndex + 32'h8; // @[VideoBuffer.scala 40:34]
  wire [3:0] _T_90 = 2'h2 * 2'h2; // @[VideoBuffer.scala 41:42]
  wire [31:0] _GEN_125 = {{28'd0}, _T_90}; // @[VideoBuffer.scala 41:25]
  wire  _T_91 = pixelIndex == _GEN_125; // @[VideoBuffer.scala 41:25]
  assign io_pixelVal_out_0 = pixOut_0; // @[VideoBuffer.scala 31:30]
  assign io_pixelVal_out_1 = pixOut_1; // @[VideoBuffer.scala 31:30]
  assign io_pixelVal_out_2 = pixOut_2; // @[VideoBuffer.scala 31:30]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  image_0_0 = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  image_0_1 = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  image_0_2 = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  image_0_3 = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  image_1_0 = _RAND_4[3:0];
  _RAND_5 = {1{`RANDOM}};
  image_1_1 = _RAND_5[3:0];
  _RAND_6 = {1{`RANDOM}};
  image_1_2 = _RAND_6[3:0];
  _RAND_7 = {1{`RANDOM}};
  image_1_3 = _RAND_7[3:0];
  _RAND_8 = {1{`RANDOM}};
  image_2_0 = _RAND_8[3:0];
  _RAND_9 = {1{`RANDOM}};
  image_2_1 = _RAND_9[3:0];
  _RAND_10 = {1{`RANDOM}};
  image_2_2 = _RAND_10[3:0];
  _RAND_11 = {1{`RANDOM}};
  image_2_3 = _RAND_11[3:0];
  _RAND_12 = {1{`RANDOM}};
  pixelIndex = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  pixOut_0 = _RAND_13[3:0];
  _RAND_14 = {1{`RANDOM}};
  pixOut_1 = _RAND_14[3:0];
  _RAND_15 = {1{`RANDOM}};
  pixOut_2 = _RAND_15[3:0];
  _RAND_16 = {1{`RANDOM}};
  valid = _RAND_16[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      image_0_0 <= 4'hf;
    end else if (valid) begin
      if (2'h0 == _T_38[1:0]) begin
        image_0_0 <= io_pixelVal_in_0_7;
      end else if (2'h0 == _T_35[1:0]) begin
        image_0_0 <= io_pixelVal_in_0_6;
      end else if (2'h0 == _T_32[1:0]) begin
        image_0_0 <= io_pixelVal_in_0_5;
      end else if (2'h0 == _T_29[1:0]) begin
        image_0_0 <= io_pixelVal_in_0_4;
      end else if (2'h0 == _T_26[1:0]) begin
        image_0_0 <= io_pixelVal_in_0_3;
      end else if (2'h0 == _T_23[1:0]) begin
        image_0_0 <= io_pixelVal_in_0_2;
      end else if (2'h0 == _T_20[1:0]) begin
        image_0_0 <= io_pixelVal_in_0_1;
      end else if (2'h0 == _T_16[1:0]) begin
        image_0_0 <= io_pixelVal_in_0_0;
      end
    end
    if (reset) begin
      image_0_1 <= 4'hf;
    end else if (valid) begin
      if (2'h1 == _T_38[1:0]) begin
        image_0_1 <= io_pixelVal_in_0_7;
      end else if (2'h1 == _T_35[1:0]) begin
        image_0_1 <= io_pixelVal_in_0_6;
      end else if (2'h1 == _T_32[1:0]) begin
        image_0_1 <= io_pixelVal_in_0_5;
      end else if (2'h1 == _T_29[1:0]) begin
        image_0_1 <= io_pixelVal_in_0_4;
      end else if (2'h1 == _T_26[1:0]) begin
        image_0_1 <= io_pixelVal_in_0_3;
      end else if (2'h1 == _T_23[1:0]) begin
        image_0_1 <= io_pixelVal_in_0_2;
      end else if (2'h1 == _T_20[1:0]) begin
        image_0_1 <= io_pixelVal_in_0_1;
      end else if (2'h1 == _T_16[1:0]) begin
        image_0_1 <= io_pixelVal_in_0_0;
      end
    end
    if (reset) begin
      image_0_2 <= 4'hf;
    end else if (valid) begin
      if (2'h2 == _T_38[1:0]) begin
        image_0_2 <= io_pixelVal_in_0_7;
      end else if (2'h2 == _T_35[1:0]) begin
        image_0_2 <= io_pixelVal_in_0_6;
      end else if (2'h2 == _T_32[1:0]) begin
        image_0_2 <= io_pixelVal_in_0_5;
      end else if (2'h2 == _T_29[1:0]) begin
        image_0_2 <= io_pixelVal_in_0_4;
      end else if (2'h2 == _T_26[1:0]) begin
        image_0_2 <= io_pixelVal_in_0_3;
      end else if (2'h2 == _T_23[1:0]) begin
        image_0_2 <= io_pixelVal_in_0_2;
      end else if (2'h2 == _T_20[1:0]) begin
        image_0_2 <= io_pixelVal_in_0_1;
      end else if (2'h2 == _T_16[1:0]) begin
        image_0_2 <= io_pixelVal_in_0_0;
      end
    end
    if (reset) begin
      image_0_3 <= 4'hf;
    end else if (valid) begin
      if (2'h3 == _T_38[1:0]) begin
        image_0_3 <= io_pixelVal_in_0_7;
      end else if (2'h3 == _T_35[1:0]) begin
        image_0_3 <= io_pixelVal_in_0_6;
      end else if (2'h3 == _T_32[1:0]) begin
        image_0_3 <= io_pixelVal_in_0_5;
      end else if (2'h3 == _T_29[1:0]) begin
        image_0_3 <= io_pixelVal_in_0_4;
      end else if (2'h3 == _T_26[1:0]) begin
        image_0_3 <= io_pixelVal_in_0_3;
      end else if (2'h3 == _T_23[1:0]) begin
        image_0_3 <= io_pixelVal_in_0_2;
      end else if (2'h3 == _T_20[1:0]) begin
        image_0_3 <= io_pixelVal_in_0_1;
      end else if (2'h3 == _T_16[1:0]) begin
        image_0_3 <= io_pixelVal_in_0_0;
      end
    end
    if (reset) begin
      image_1_0 <= 4'h0;
    end else if (valid) begin
      if (2'h0 == _T_38[1:0]) begin
        image_1_0 <= io_pixelVal_in_1_7;
      end else if (2'h0 == _T_35[1:0]) begin
        image_1_0 <= io_pixelVal_in_1_6;
      end else if (2'h0 == _T_32[1:0]) begin
        image_1_0 <= io_pixelVal_in_1_5;
      end else if (2'h0 == _T_29[1:0]) begin
        image_1_0 <= io_pixelVal_in_1_4;
      end else if (2'h0 == _T_26[1:0]) begin
        image_1_0 <= io_pixelVal_in_1_3;
      end else if (2'h0 == _T_23[1:0]) begin
        image_1_0 <= io_pixelVal_in_1_2;
      end else if (2'h0 == _T_20[1:0]) begin
        image_1_0 <= io_pixelVal_in_1_1;
      end else if (2'h0 == _T_16[1:0]) begin
        image_1_0 <= io_pixelVal_in_1_0;
      end
    end
    if (reset) begin
      image_1_1 <= 4'h0;
    end else if (valid) begin
      if (2'h1 == _T_38[1:0]) begin
        image_1_1 <= io_pixelVal_in_1_7;
      end else if (2'h1 == _T_35[1:0]) begin
        image_1_1 <= io_pixelVal_in_1_6;
      end else if (2'h1 == _T_32[1:0]) begin
        image_1_1 <= io_pixelVal_in_1_5;
      end else if (2'h1 == _T_29[1:0]) begin
        image_1_1 <= io_pixelVal_in_1_4;
      end else if (2'h1 == _T_26[1:0]) begin
        image_1_1 <= io_pixelVal_in_1_3;
      end else if (2'h1 == _T_23[1:0]) begin
        image_1_1 <= io_pixelVal_in_1_2;
      end else if (2'h1 == _T_20[1:0]) begin
        image_1_1 <= io_pixelVal_in_1_1;
      end else if (2'h1 == _T_16[1:0]) begin
        image_1_1 <= io_pixelVal_in_1_0;
      end
    end
    if (reset) begin
      image_1_2 <= 4'h0;
    end else if (valid) begin
      if (2'h2 == _T_38[1:0]) begin
        image_1_2 <= io_pixelVal_in_1_7;
      end else if (2'h2 == _T_35[1:0]) begin
        image_1_2 <= io_pixelVal_in_1_6;
      end else if (2'h2 == _T_32[1:0]) begin
        image_1_2 <= io_pixelVal_in_1_5;
      end else if (2'h2 == _T_29[1:0]) begin
        image_1_2 <= io_pixelVal_in_1_4;
      end else if (2'h2 == _T_26[1:0]) begin
        image_1_2 <= io_pixelVal_in_1_3;
      end else if (2'h2 == _T_23[1:0]) begin
        image_1_2 <= io_pixelVal_in_1_2;
      end else if (2'h2 == _T_20[1:0]) begin
        image_1_2 <= io_pixelVal_in_1_1;
      end else if (2'h2 == _T_16[1:0]) begin
        image_1_2 <= io_pixelVal_in_1_0;
      end
    end
    if (reset) begin
      image_1_3 <= 4'h0;
    end else if (valid) begin
      if (2'h3 == _T_38[1:0]) begin
        image_1_3 <= io_pixelVal_in_1_7;
      end else if (2'h3 == _T_35[1:0]) begin
        image_1_3 <= io_pixelVal_in_1_6;
      end else if (2'h3 == _T_32[1:0]) begin
        image_1_3 <= io_pixelVal_in_1_5;
      end else if (2'h3 == _T_29[1:0]) begin
        image_1_3 <= io_pixelVal_in_1_4;
      end else if (2'h3 == _T_26[1:0]) begin
        image_1_3 <= io_pixelVal_in_1_3;
      end else if (2'h3 == _T_23[1:0]) begin
        image_1_3 <= io_pixelVal_in_1_2;
      end else if (2'h3 == _T_20[1:0]) begin
        image_1_3 <= io_pixelVal_in_1_1;
      end else if (2'h3 == _T_16[1:0]) begin
        image_1_3 <= io_pixelVal_in_1_0;
      end
    end
    if (reset) begin
      image_2_0 <= 4'h0;
    end else if (valid) begin
      if (2'h0 == _T_38[1:0]) begin
        image_2_0 <= io_pixelVal_in_2_7;
      end else if (2'h0 == _T_35[1:0]) begin
        image_2_0 <= io_pixelVal_in_2_6;
      end else if (2'h0 == _T_32[1:0]) begin
        image_2_0 <= io_pixelVal_in_2_5;
      end else if (2'h0 == _T_29[1:0]) begin
        image_2_0 <= io_pixelVal_in_2_4;
      end else if (2'h0 == _T_26[1:0]) begin
        image_2_0 <= io_pixelVal_in_2_3;
      end else if (2'h0 == _T_23[1:0]) begin
        image_2_0 <= io_pixelVal_in_2_2;
      end else if (2'h0 == _T_20[1:0]) begin
        image_2_0 <= io_pixelVal_in_2_1;
      end else if (2'h0 == _T_16[1:0]) begin
        image_2_0 <= io_pixelVal_in_2_0;
      end
    end
    if (reset) begin
      image_2_1 <= 4'h0;
    end else if (valid) begin
      if (2'h1 == _T_38[1:0]) begin
        image_2_1 <= io_pixelVal_in_2_7;
      end else if (2'h1 == _T_35[1:0]) begin
        image_2_1 <= io_pixelVal_in_2_6;
      end else if (2'h1 == _T_32[1:0]) begin
        image_2_1 <= io_pixelVal_in_2_5;
      end else if (2'h1 == _T_29[1:0]) begin
        image_2_1 <= io_pixelVal_in_2_4;
      end else if (2'h1 == _T_26[1:0]) begin
        image_2_1 <= io_pixelVal_in_2_3;
      end else if (2'h1 == _T_23[1:0]) begin
        image_2_1 <= io_pixelVal_in_2_2;
      end else if (2'h1 == _T_20[1:0]) begin
        image_2_1 <= io_pixelVal_in_2_1;
      end else if (2'h1 == _T_16[1:0]) begin
        image_2_1 <= io_pixelVal_in_2_0;
      end
    end
    if (reset) begin
      image_2_2 <= 4'h0;
    end else if (valid) begin
      if (2'h2 == _T_38[1:0]) begin
        image_2_2 <= io_pixelVal_in_2_7;
      end else if (2'h2 == _T_35[1:0]) begin
        image_2_2 <= io_pixelVal_in_2_6;
      end else if (2'h2 == _T_32[1:0]) begin
        image_2_2 <= io_pixelVal_in_2_5;
      end else if (2'h2 == _T_29[1:0]) begin
        image_2_2 <= io_pixelVal_in_2_4;
      end else if (2'h2 == _T_26[1:0]) begin
        image_2_2 <= io_pixelVal_in_2_3;
      end else if (2'h2 == _T_23[1:0]) begin
        image_2_2 <= io_pixelVal_in_2_2;
      end else if (2'h2 == _T_20[1:0]) begin
        image_2_2 <= io_pixelVal_in_2_1;
      end else if (2'h2 == _T_16[1:0]) begin
        image_2_2 <= io_pixelVal_in_2_0;
      end
    end
    if (reset) begin
      image_2_3 <= 4'h0;
    end else if (valid) begin
      if (2'h3 == _T_38[1:0]) begin
        image_2_3 <= io_pixelVal_in_2_7;
      end else if (2'h3 == _T_35[1:0]) begin
        image_2_3 <= io_pixelVal_in_2_6;
      end else if (2'h3 == _T_32[1:0]) begin
        image_2_3 <= io_pixelVal_in_2_5;
      end else if (2'h3 == _T_29[1:0]) begin
        image_2_3 <= io_pixelVal_in_2_4;
      end else if (2'h3 == _T_26[1:0]) begin
        image_2_3 <= io_pixelVal_in_2_3;
      end else if (2'h3 == _T_23[1:0]) begin
        image_2_3 <= io_pixelVal_in_2_2;
      end else if (2'h3 == _T_20[1:0]) begin
        image_2_3 <= io_pixelVal_in_2_1;
      end else if (2'h3 == _T_16[1:0]) begin
        image_2_3 <= io_pixelVal_in_2_0;
      end
    end
    if (reset) begin
      pixelIndex <= 32'h0;
    end else if (valid) begin
      if (_T_91) begin
        pixelIndex <= 32'h0;
      end else begin
        pixelIndex <= _T_89;
      end
    end
    if (reset) begin
      pixOut_0 <= 4'h0;
    end else if (2'h3 == _T_6[1:0]) begin
      pixOut_0 <= image_0_3;
    end else if (2'h2 == _T_6[1:0]) begin
      pixOut_0 <= image_0_2;
    end else if (2'h1 == _T_6[1:0]) begin
      pixOut_0 <= image_0_1;
    end else begin
      pixOut_0 <= image_0_0;
    end
    if (reset) begin
      pixOut_1 <= 4'h0;
    end else if (2'h3 == _T_6[1:0]) begin
      pixOut_1 <= image_1_3;
    end else if (2'h2 == _T_6[1:0]) begin
      pixOut_1 <= image_1_2;
    end else if (2'h1 == _T_6[1:0]) begin
      pixOut_1 <= image_1_1;
    end else begin
      pixOut_1 <= image_1_0;
    end
    if (reset) begin
      pixOut_2 <= 4'h0;
    end else if (2'h3 == _T_6[1:0]) begin
      pixOut_2 <= image_2_3;
    end else if (2'h2 == _T_6[1:0]) begin
      pixOut_2 <= image_2_2;
    end else if (2'h1 == _T_6[1:0]) begin
      pixOut_2 <= image_2_1;
    end else begin
      pixOut_2 <= image_2_0;
    end
    if (reset) begin
      valid <= 1'h0;
    end else begin
      valid <= io_valid_in;
    end
  end
endmodule
module ImageProcessing(
  input         clock,
  input         reset,
  input  [5:0]  io_SPI_filterIndex,
  input         io_SPI_invert,
  input         io_SPI_distort,
  input  [10:0] io_rowIndex,
  input  [10:0] io_colIndex,
  output [3:0]  io_pixelVal_out_0,
  output [3:0]  io_pixelVal_out_1,
  output [3:0]  io_pixelVal_out_2
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  filter_clock; // @[ImageProcessing.scala 23:22]
  wire  filter_reset; // @[ImageProcessing.scala 23:22]
  wire [5:0] filter_io_SPI_filterIndex; // @[ImageProcessing.scala 23:22]
  wire  filter_io_SPI_invert; // @[ImageProcessing.scala 23:22]
  wire  filter_io_SPI_distort; // @[ImageProcessing.scala 23:22]
  wire [3:0] filter_io_pixelVal_out_0_0; // @[ImageProcessing.scala 23:22]
  wire [3:0] filter_io_pixelVal_out_0_1; // @[ImageProcessing.scala 23:22]
  wire [3:0] filter_io_pixelVal_out_0_2; // @[ImageProcessing.scala 23:22]
  wire [3:0] filter_io_pixelVal_out_0_3; // @[ImageProcessing.scala 23:22]
  wire [3:0] filter_io_pixelVal_out_0_4; // @[ImageProcessing.scala 23:22]
  wire [3:0] filter_io_pixelVal_out_0_5; // @[ImageProcessing.scala 23:22]
  wire [3:0] filter_io_pixelVal_out_0_6; // @[ImageProcessing.scala 23:22]
  wire [3:0] filter_io_pixelVal_out_0_7; // @[ImageProcessing.scala 23:22]
  wire [3:0] filter_io_pixelVal_out_1_0; // @[ImageProcessing.scala 23:22]
  wire [3:0] filter_io_pixelVal_out_1_1; // @[ImageProcessing.scala 23:22]
  wire [3:0] filter_io_pixelVal_out_1_2; // @[ImageProcessing.scala 23:22]
  wire [3:0] filter_io_pixelVal_out_1_3; // @[ImageProcessing.scala 23:22]
  wire [3:0] filter_io_pixelVal_out_1_4; // @[ImageProcessing.scala 23:22]
  wire [3:0] filter_io_pixelVal_out_1_5; // @[ImageProcessing.scala 23:22]
  wire [3:0] filter_io_pixelVal_out_1_6; // @[ImageProcessing.scala 23:22]
  wire [3:0] filter_io_pixelVal_out_1_7; // @[ImageProcessing.scala 23:22]
  wire [3:0] filter_io_pixelVal_out_2_0; // @[ImageProcessing.scala 23:22]
  wire [3:0] filter_io_pixelVal_out_2_1; // @[ImageProcessing.scala 23:22]
  wire [3:0] filter_io_pixelVal_out_2_2; // @[ImageProcessing.scala 23:22]
  wire [3:0] filter_io_pixelVal_out_2_3; // @[ImageProcessing.scala 23:22]
  wire [3:0] filter_io_pixelVal_out_2_4; // @[ImageProcessing.scala 23:22]
  wire [3:0] filter_io_pixelVal_out_2_5; // @[ImageProcessing.scala 23:22]
  wire [3:0] filter_io_pixelVal_out_2_6; // @[ImageProcessing.scala 23:22]
  wire [3:0] filter_io_pixelVal_out_2_7; // @[ImageProcessing.scala 23:22]
  wire  filter_io_valid_out; // @[ImageProcessing.scala 23:22]
  wire  videoBuffer_clock; // @[ImageProcessing.scala 24:27]
  wire  videoBuffer_reset; // @[ImageProcessing.scala 24:27]
  wire [3:0] videoBuffer_io_pixelVal_in_0_0; // @[ImageProcessing.scala 24:27]
  wire [3:0] videoBuffer_io_pixelVal_in_0_1; // @[ImageProcessing.scala 24:27]
  wire [3:0] videoBuffer_io_pixelVal_in_0_2; // @[ImageProcessing.scala 24:27]
  wire [3:0] videoBuffer_io_pixelVal_in_0_3; // @[ImageProcessing.scala 24:27]
  wire [3:0] videoBuffer_io_pixelVal_in_0_4; // @[ImageProcessing.scala 24:27]
  wire [3:0] videoBuffer_io_pixelVal_in_0_5; // @[ImageProcessing.scala 24:27]
  wire [3:0] videoBuffer_io_pixelVal_in_0_6; // @[ImageProcessing.scala 24:27]
  wire [3:0] videoBuffer_io_pixelVal_in_0_7; // @[ImageProcessing.scala 24:27]
  wire [3:0] videoBuffer_io_pixelVal_in_1_0; // @[ImageProcessing.scala 24:27]
  wire [3:0] videoBuffer_io_pixelVal_in_1_1; // @[ImageProcessing.scala 24:27]
  wire [3:0] videoBuffer_io_pixelVal_in_1_2; // @[ImageProcessing.scala 24:27]
  wire [3:0] videoBuffer_io_pixelVal_in_1_3; // @[ImageProcessing.scala 24:27]
  wire [3:0] videoBuffer_io_pixelVal_in_1_4; // @[ImageProcessing.scala 24:27]
  wire [3:0] videoBuffer_io_pixelVal_in_1_5; // @[ImageProcessing.scala 24:27]
  wire [3:0] videoBuffer_io_pixelVal_in_1_6; // @[ImageProcessing.scala 24:27]
  wire [3:0] videoBuffer_io_pixelVal_in_1_7; // @[ImageProcessing.scala 24:27]
  wire [3:0] videoBuffer_io_pixelVal_in_2_0; // @[ImageProcessing.scala 24:27]
  wire [3:0] videoBuffer_io_pixelVal_in_2_1; // @[ImageProcessing.scala 24:27]
  wire [3:0] videoBuffer_io_pixelVal_in_2_2; // @[ImageProcessing.scala 24:27]
  wire [3:0] videoBuffer_io_pixelVal_in_2_3; // @[ImageProcessing.scala 24:27]
  wire [3:0] videoBuffer_io_pixelVal_in_2_4; // @[ImageProcessing.scala 24:27]
  wire [3:0] videoBuffer_io_pixelVal_in_2_5; // @[ImageProcessing.scala 24:27]
  wire [3:0] videoBuffer_io_pixelVal_in_2_6; // @[ImageProcessing.scala 24:27]
  wire [3:0] videoBuffer_io_pixelVal_in_2_7; // @[ImageProcessing.scala 24:27]
  wire  videoBuffer_io_valid_in; // @[ImageProcessing.scala 24:27]
  wire [10:0] videoBuffer_io_rowIndex; // @[ImageProcessing.scala 24:27]
  wire [10:0] videoBuffer_io_colIndex; // @[ImageProcessing.scala 24:27]
  wire [3:0] videoBuffer_io_pixelVal_out_0; // @[ImageProcessing.scala 24:27]
  wire [3:0] videoBuffer_io_pixelVal_out_1; // @[ImageProcessing.scala 24:27]
  wire [3:0] videoBuffer_io_pixelVal_out_2; // @[ImageProcessing.scala 24:27]
  reg [3:0] pixOut_0; // @[ImageProcessing.scala 35:24]
  reg [3:0] pixOut_1; // @[ImageProcessing.scala 35:24]
  reg [3:0] pixOut_2; // @[ImageProcessing.scala 35:24]
  reg  valid; // @[ImageProcessing.scala 36:24]
  Filter filter ( // @[ImageProcessing.scala 23:22]
    .clock(filter_clock),
    .reset(filter_reset),
    .io_SPI_filterIndex(filter_io_SPI_filterIndex),
    .io_SPI_invert(filter_io_SPI_invert),
    .io_SPI_distort(filter_io_SPI_distort),
    .io_pixelVal_out_0_0(filter_io_pixelVal_out_0_0),
    .io_pixelVal_out_0_1(filter_io_pixelVal_out_0_1),
    .io_pixelVal_out_0_2(filter_io_pixelVal_out_0_2),
    .io_pixelVal_out_0_3(filter_io_pixelVal_out_0_3),
    .io_pixelVal_out_0_4(filter_io_pixelVal_out_0_4),
    .io_pixelVal_out_0_5(filter_io_pixelVal_out_0_5),
    .io_pixelVal_out_0_6(filter_io_pixelVal_out_0_6),
    .io_pixelVal_out_0_7(filter_io_pixelVal_out_0_7),
    .io_pixelVal_out_1_0(filter_io_pixelVal_out_1_0),
    .io_pixelVal_out_1_1(filter_io_pixelVal_out_1_1),
    .io_pixelVal_out_1_2(filter_io_pixelVal_out_1_2),
    .io_pixelVal_out_1_3(filter_io_pixelVal_out_1_3),
    .io_pixelVal_out_1_4(filter_io_pixelVal_out_1_4),
    .io_pixelVal_out_1_5(filter_io_pixelVal_out_1_5),
    .io_pixelVal_out_1_6(filter_io_pixelVal_out_1_6),
    .io_pixelVal_out_1_7(filter_io_pixelVal_out_1_7),
    .io_pixelVal_out_2_0(filter_io_pixelVal_out_2_0),
    .io_pixelVal_out_2_1(filter_io_pixelVal_out_2_1),
    .io_pixelVal_out_2_2(filter_io_pixelVal_out_2_2),
    .io_pixelVal_out_2_3(filter_io_pixelVal_out_2_3),
    .io_pixelVal_out_2_4(filter_io_pixelVal_out_2_4),
    .io_pixelVal_out_2_5(filter_io_pixelVal_out_2_5),
    .io_pixelVal_out_2_6(filter_io_pixelVal_out_2_6),
    .io_pixelVal_out_2_7(filter_io_pixelVal_out_2_7),
    .io_valid_out(filter_io_valid_out)
  );
  VideoBuffer videoBuffer ( // @[ImageProcessing.scala 24:27]
    .clock(videoBuffer_clock),
    .reset(videoBuffer_reset),
    .io_pixelVal_in_0_0(videoBuffer_io_pixelVal_in_0_0),
    .io_pixelVal_in_0_1(videoBuffer_io_pixelVal_in_0_1),
    .io_pixelVal_in_0_2(videoBuffer_io_pixelVal_in_0_2),
    .io_pixelVal_in_0_3(videoBuffer_io_pixelVal_in_0_3),
    .io_pixelVal_in_0_4(videoBuffer_io_pixelVal_in_0_4),
    .io_pixelVal_in_0_5(videoBuffer_io_pixelVal_in_0_5),
    .io_pixelVal_in_0_6(videoBuffer_io_pixelVal_in_0_6),
    .io_pixelVal_in_0_7(videoBuffer_io_pixelVal_in_0_7),
    .io_pixelVal_in_1_0(videoBuffer_io_pixelVal_in_1_0),
    .io_pixelVal_in_1_1(videoBuffer_io_pixelVal_in_1_1),
    .io_pixelVal_in_1_2(videoBuffer_io_pixelVal_in_1_2),
    .io_pixelVal_in_1_3(videoBuffer_io_pixelVal_in_1_3),
    .io_pixelVal_in_1_4(videoBuffer_io_pixelVal_in_1_4),
    .io_pixelVal_in_1_5(videoBuffer_io_pixelVal_in_1_5),
    .io_pixelVal_in_1_6(videoBuffer_io_pixelVal_in_1_6),
    .io_pixelVal_in_1_7(videoBuffer_io_pixelVal_in_1_7),
    .io_pixelVal_in_2_0(videoBuffer_io_pixelVal_in_2_0),
    .io_pixelVal_in_2_1(videoBuffer_io_pixelVal_in_2_1),
    .io_pixelVal_in_2_2(videoBuffer_io_pixelVal_in_2_2),
    .io_pixelVal_in_2_3(videoBuffer_io_pixelVal_in_2_3),
    .io_pixelVal_in_2_4(videoBuffer_io_pixelVal_in_2_4),
    .io_pixelVal_in_2_5(videoBuffer_io_pixelVal_in_2_5),
    .io_pixelVal_in_2_6(videoBuffer_io_pixelVal_in_2_6),
    .io_pixelVal_in_2_7(videoBuffer_io_pixelVal_in_2_7),
    .io_valid_in(videoBuffer_io_valid_in),
    .io_rowIndex(videoBuffer_io_rowIndex),
    .io_colIndex(videoBuffer_io_colIndex),
    .io_pixelVal_out_0(videoBuffer_io_pixelVal_out_0),
    .io_pixelVal_out_1(videoBuffer_io_pixelVal_out_1),
    .io_pixelVal_out_2(videoBuffer_io_pixelVal_out_2)
  );
  assign io_pixelVal_out_0 = pixOut_0; // @[ImageProcessing.scala 44:25 ImageProcessing.scala 44:25 ImageProcessing.scala 44:25 ImageProcessing.scala 44:25 ImageProcessing.scala 44:25 ImageProcessing.scala 44:25 ImageProcessing.scala 44:25 ImageProcessing.scala 44:25]
  assign io_pixelVal_out_1 = pixOut_1; // @[ImageProcessing.scala 44:25 ImageProcessing.scala 44:25 ImageProcessing.scala 44:25 ImageProcessing.scala 44:25 ImageProcessing.scala 44:25 ImageProcessing.scala 44:25 ImageProcessing.scala 44:25 ImageProcessing.scala 44:25]
  assign io_pixelVal_out_2 = pixOut_2; // @[ImageProcessing.scala 44:25 ImageProcessing.scala 44:25 ImageProcessing.scala 44:25 ImageProcessing.scala 44:25 ImageProcessing.scala 44:25 ImageProcessing.scala 44:25 ImageProcessing.scala 44:25 ImageProcessing.scala 44:25]
  assign filter_clock = clock;
  assign filter_reset = reset;
  assign filter_io_SPI_filterIndex = io_SPI_filterIndex; // @[ImageProcessing.scala 29:29]
  assign filter_io_SPI_invert = io_SPI_invert; // @[ImageProcessing.scala 30:29]
  assign filter_io_SPI_distort = io_SPI_distort; // @[ImageProcessing.scala 31:29]
  assign videoBuffer_clock = clock;
  assign videoBuffer_reset = reset;
  assign videoBuffer_io_pixelVal_in_0_0 = filter_io_pixelVal_out_0_0; // @[ImageProcessing.scala 41:39]
  assign videoBuffer_io_pixelVal_in_0_1 = filter_io_pixelVal_out_0_1; // @[ImageProcessing.scala 41:39]
  assign videoBuffer_io_pixelVal_in_0_2 = filter_io_pixelVal_out_0_2; // @[ImageProcessing.scala 41:39]
  assign videoBuffer_io_pixelVal_in_0_3 = filter_io_pixelVal_out_0_3; // @[ImageProcessing.scala 41:39]
  assign videoBuffer_io_pixelVal_in_0_4 = filter_io_pixelVal_out_0_4; // @[ImageProcessing.scala 41:39]
  assign videoBuffer_io_pixelVal_in_0_5 = filter_io_pixelVal_out_0_5; // @[ImageProcessing.scala 41:39]
  assign videoBuffer_io_pixelVal_in_0_6 = filter_io_pixelVal_out_0_6; // @[ImageProcessing.scala 41:39]
  assign videoBuffer_io_pixelVal_in_0_7 = filter_io_pixelVal_out_0_7; // @[ImageProcessing.scala 41:39]
  assign videoBuffer_io_pixelVal_in_1_0 = filter_io_pixelVal_out_1_0; // @[ImageProcessing.scala 41:39]
  assign videoBuffer_io_pixelVal_in_1_1 = filter_io_pixelVal_out_1_1; // @[ImageProcessing.scala 41:39]
  assign videoBuffer_io_pixelVal_in_1_2 = filter_io_pixelVal_out_1_2; // @[ImageProcessing.scala 41:39]
  assign videoBuffer_io_pixelVal_in_1_3 = filter_io_pixelVal_out_1_3; // @[ImageProcessing.scala 41:39]
  assign videoBuffer_io_pixelVal_in_1_4 = filter_io_pixelVal_out_1_4; // @[ImageProcessing.scala 41:39]
  assign videoBuffer_io_pixelVal_in_1_5 = filter_io_pixelVal_out_1_5; // @[ImageProcessing.scala 41:39]
  assign videoBuffer_io_pixelVal_in_1_6 = filter_io_pixelVal_out_1_6; // @[ImageProcessing.scala 41:39]
  assign videoBuffer_io_pixelVal_in_1_7 = filter_io_pixelVal_out_1_7; // @[ImageProcessing.scala 41:39]
  assign videoBuffer_io_pixelVal_in_2_0 = filter_io_pixelVal_out_2_0; // @[ImageProcessing.scala 41:39]
  assign videoBuffer_io_pixelVal_in_2_1 = filter_io_pixelVal_out_2_1; // @[ImageProcessing.scala 41:39]
  assign videoBuffer_io_pixelVal_in_2_2 = filter_io_pixelVal_out_2_2; // @[ImageProcessing.scala 41:39]
  assign videoBuffer_io_pixelVal_in_2_3 = filter_io_pixelVal_out_2_3; // @[ImageProcessing.scala 41:39]
  assign videoBuffer_io_pixelVal_in_2_4 = filter_io_pixelVal_out_2_4; // @[ImageProcessing.scala 41:39]
  assign videoBuffer_io_pixelVal_in_2_5 = filter_io_pixelVal_out_2_5; // @[ImageProcessing.scala 41:39]
  assign videoBuffer_io_pixelVal_in_2_6 = filter_io_pixelVal_out_2_6; // @[ImageProcessing.scala 41:39]
  assign videoBuffer_io_pixelVal_in_2_7 = filter_io_pixelVal_out_2_7; // @[ImageProcessing.scala 41:39]
  assign videoBuffer_io_valid_in = valid; // @[ImageProcessing.scala 48:27]
  assign videoBuffer_io_rowIndex = io_rowIndex; // @[ImageProcessing.scala 26:27]
  assign videoBuffer_io_colIndex = io_colIndex; // @[ImageProcessing.scala 27:27]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  pixOut_0 = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  pixOut_1 = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  pixOut_2 = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  valid = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      pixOut_0 <= 4'h0;
    end else begin
      pixOut_0 <= videoBuffer_io_pixelVal_out_0;
    end
    if (reset) begin
      pixOut_1 <= 4'h0;
    end else begin
      pixOut_1 <= videoBuffer_io_pixelVal_out_1;
    end
    if (reset) begin
      pixOut_2 <= 4'h0;
    end else begin
      pixOut_2 <= videoBuffer_io_pixelVal_out_2;
    end
    if (reset) begin
      valid <= 1'h0;
    end else begin
      valid <= filter_io_valid_out;
    end
  end
endmodule
