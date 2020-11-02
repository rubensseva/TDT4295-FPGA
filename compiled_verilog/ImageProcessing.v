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
  wire  _T_11 = ~reset; // @[DotProd.scala 29:11]
  wire [15:0] _GEN_4 = countReset ? $signed(16'sh0) : $signed(_T_6); // @[DotProd.scala 25:20]
  assign io_dataOut = _T_6[8:0]; // @[DotProd.scala 23:14]
  assign io_outputValid = countVal == 4'h8; // @[DotProd.scala 26:20 DotProd.scala 31:20]
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
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (countReset & _T_11) begin
          $fwrite(32'h80000002,"VALOUTidghspdolgnfgkln\n"); // @[DotProd.scala 29:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
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
  assign io_pixelVal_out_0 = DotProd_io_dataOut; // @[KernelConvolution.scala 33:34]
  assign io_pixelVal_out_1 = DotProd_1_io_dataOut; // @[KernelConvolution.scala 33:34]
  assign io_pixelVal_out_2 = DotProd_2_io_dataOut; // @[KernelConvolution.scala 33:34]
  assign io_pixelVal_out_3 = DotProd_3_io_dataOut; // @[KernelConvolution.scala 33:34]
  assign io_pixelVal_out_4 = DotProd_4_io_dataOut; // @[KernelConvolution.scala 33:34]
  assign io_pixelVal_out_5 = DotProd_5_io_dataOut; // @[KernelConvolution.scala 33:34]
  assign io_pixelVal_out_6 = DotProd_6_io_dataOut; // @[KernelConvolution.scala 33:34]
  assign io_pixelVal_out_7 = DotProd_7_io_dataOut; // @[KernelConvolution.scala 33:34]
  assign io_valid_out = DotProd_io_outputValid; // @[KernelConvolution.scala 35:30]
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
endmodule
module Filter(
  input        clock,
  input        reset,
  input  [5:0] io_SPI_filterIndex,
  output [3:0] io_pixelVal_out_0,
  output [3:0] io_pixelVal_out_1,
  output [3:0] io_pixelVal_out_2,
  output [3:0] io_pixelVal_out_3,
  output [3:0] io_pixelVal_out_4,
  output [3:0] io_pixelVal_out_5,
  output [3:0] io_pixelVal_out_6,
  output [3:0] io_pixelVal_out_7,
  output       io_valid_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  KernelConvolution_clock; // @[Filter.scala 86:35]
  wire  KernelConvolution_reset; // @[Filter.scala 86:35]
  wire [4:0] KernelConvolution_io_kernelVal_in; // @[Filter.scala 86:35]
  wire [3:0] KernelConvolution_io_pixelVal_in_0; // @[Filter.scala 86:35]
  wire [3:0] KernelConvolution_io_pixelVal_in_1; // @[Filter.scala 86:35]
  wire [3:0] KernelConvolution_io_pixelVal_in_2; // @[Filter.scala 86:35]
  wire [3:0] KernelConvolution_io_pixelVal_in_3; // @[Filter.scala 86:35]
  wire [3:0] KernelConvolution_io_pixelVal_in_4; // @[Filter.scala 86:35]
  wire [3:0] KernelConvolution_io_pixelVal_in_5; // @[Filter.scala 86:35]
  wire [3:0] KernelConvolution_io_pixelVal_in_6; // @[Filter.scala 86:35]
  wire [3:0] KernelConvolution_io_pixelVal_in_7; // @[Filter.scala 86:35]
  wire [8:0] KernelConvolution_io_pixelVal_out_0; // @[Filter.scala 86:35]
  wire [8:0] KernelConvolution_io_pixelVal_out_1; // @[Filter.scala 86:35]
  wire [8:0] KernelConvolution_io_pixelVal_out_2; // @[Filter.scala 86:35]
  wire [8:0] KernelConvolution_io_pixelVal_out_3; // @[Filter.scala 86:35]
  wire [8:0] KernelConvolution_io_pixelVal_out_4; // @[Filter.scala 86:35]
  wire [8:0] KernelConvolution_io_pixelVal_out_5; // @[Filter.scala 86:35]
  wire [8:0] KernelConvolution_io_pixelVal_out_6; // @[Filter.scala 86:35]
  wire [8:0] KernelConvolution_io_pixelVal_out_7; // @[Filter.scala 86:35]
  wire  KernelConvolution_io_valid_out; // @[Filter.scala 86:35]
  reg [3:0] kernelCounter; // @[Counter.scala 29:33]
  wire  kernelCountReset = kernelCounter == 4'h8; // @[Counter.scala 38:24]
  wire [3:0] _T_14 = kernelCounter + 4'h1; // @[Counter.scala 39:22]
  wire  _GEN_1665 = 3'h0 == io_SPI_filterIndex[2:0]; // @[Filter.scala 89:36]
  wire  _GEN_1666 = 4'h4 == kernelCounter; // @[Filter.scala 89:36]
  wire [4:0] _GEN_7 = _GEN_1665 & _GEN_1666 ? $signed(5'sh1) : $signed(5'sh0); // @[Filter.scala 89:36]
  wire  _GEN_1668 = 4'h5 == kernelCounter; // @[Filter.scala 89:36]
  wire [4:0] _GEN_8 = _GEN_1665 & _GEN_1668 ? $signed(5'sh0) : $signed(_GEN_7); // @[Filter.scala 89:36]
  wire  _GEN_1670 = 4'h6 == kernelCounter; // @[Filter.scala 89:36]
  wire [4:0] _GEN_9 = _GEN_1665 & _GEN_1670 ? $signed(5'sh0) : $signed(_GEN_8); // @[Filter.scala 89:36]
  wire  _GEN_1672 = 4'h7 == kernelCounter; // @[Filter.scala 89:36]
  wire [4:0] _GEN_10 = _GEN_1665 & _GEN_1672 ? $signed(5'sh0) : $signed(_GEN_9); // @[Filter.scala 89:36]
  wire  _GEN_1674 = 4'h8 == kernelCounter; // @[Filter.scala 89:36]
  wire [4:0] _GEN_11 = _GEN_1665 & _GEN_1674 ? $signed(5'sh0) : $signed(_GEN_10); // @[Filter.scala 89:36]
  wire  _GEN_1675 = 3'h1 == io_SPI_filterIndex[2:0]; // @[Filter.scala 89:36]
  wire  _GEN_1676 = 4'h0 == kernelCounter; // @[Filter.scala 89:36]
  wire [4:0] _GEN_12 = _GEN_1675 & _GEN_1676 ? $signed(5'sh1) : $signed(_GEN_11); // @[Filter.scala 89:36]
  wire  _GEN_1678 = 4'h1 == kernelCounter; // @[Filter.scala 89:36]
  wire [4:0] _GEN_13 = _GEN_1675 & _GEN_1678 ? $signed(5'sh1) : $signed(_GEN_12); // @[Filter.scala 89:36]
  wire  _GEN_1680 = 4'h2 == kernelCounter; // @[Filter.scala 89:36]
  wire [4:0] _GEN_14 = _GEN_1675 & _GEN_1680 ? $signed(5'sh1) : $signed(_GEN_13); // @[Filter.scala 89:36]
  wire  _GEN_1682 = 4'h3 == kernelCounter; // @[Filter.scala 89:36]
  wire [4:0] _GEN_15 = _GEN_1675 & _GEN_1682 ? $signed(5'sh1) : $signed(_GEN_14); // @[Filter.scala 89:36]
  wire [4:0] _GEN_16 = _GEN_1675 & _GEN_1666 ? $signed(5'sh1) : $signed(_GEN_15); // @[Filter.scala 89:36]
  wire [4:0] _GEN_17 = _GEN_1675 & _GEN_1668 ? $signed(5'sh1) : $signed(_GEN_16); // @[Filter.scala 89:36]
  wire [4:0] _GEN_18 = _GEN_1675 & _GEN_1670 ? $signed(5'sh1) : $signed(_GEN_17); // @[Filter.scala 89:36]
  wire [4:0] _GEN_19 = _GEN_1675 & _GEN_1672 ? $signed(5'sh1) : $signed(_GEN_18); // @[Filter.scala 89:36]
  wire [4:0] _GEN_20 = _GEN_1675 & _GEN_1674 ? $signed(5'sh1) : $signed(_GEN_19); // @[Filter.scala 89:36]
  wire  _GEN_1693 = 3'h2 == io_SPI_filterIndex[2:0]; // @[Filter.scala 89:36]
  wire [4:0] _GEN_21 = _GEN_1693 & _GEN_1676 ? $signed(5'sh1) : $signed(_GEN_20); // @[Filter.scala 89:36]
  wire [4:0] _GEN_22 = _GEN_1693 & _GEN_1678 ? $signed(5'sh2) : $signed(_GEN_21); // @[Filter.scala 89:36]
  wire [4:0] _GEN_23 = _GEN_1693 & _GEN_1680 ? $signed(5'sh1) : $signed(_GEN_22); // @[Filter.scala 89:36]
  wire [4:0] _GEN_24 = _GEN_1693 & _GEN_1682 ? $signed(5'sh2) : $signed(_GEN_23); // @[Filter.scala 89:36]
  wire [4:0] _GEN_25 = _GEN_1693 & _GEN_1666 ? $signed(5'sh4) : $signed(_GEN_24); // @[Filter.scala 89:36]
  wire [4:0] _GEN_26 = _GEN_1693 & _GEN_1668 ? $signed(5'sh2) : $signed(_GEN_25); // @[Filter.scala 89:36]
  wire [4:0] _GEN_27 = _GEN_1693 & _GEN_1670 ? $signed(5'sh1) : $signed(_GEN_26); // @[Filter.scala 89:36]
  wire [4:0] _GEN_28 = _GEN_1693 & _GEN_1672 ? $signed(5'sh2) : $signed(_GEN_27); // @[Filter.scala 89:36]
  wire [4:0] _GEN_29 = _GEN_1693 & _GEN_1674 ? $signed(5'sh1) : $signed(_GEN_28); // @[Filter.scala 89:36]
  wire  _GEN_1711 = 3'h3 == io_SPI_filterIndex[2:0]; // @[Filter.scala 89:36]
  wire [4:0] _GEN_30 = _GEN_1711 & _GEN_1676 ? $signed(5'sh0) : $signed(_GEN_29); // @[Filter.scala 89:36]
  wire [4:0] _GEN_31 = _GEN_1711 & _GEN_1678 ? $signed(-5'sh1) : $signed(_GEN_30); // @[Filter.scala 89:36]
  wire [4:0] _GEN_32 = _GEN_1711 & _GEN_1680 ? $signed(5'sh0) : $signed(_GEN_31); // @[Filter.scala 89:36]
  wire [4:0] _GEN_33 = _GEN_1711 & _GEN_1682 ? $signed(-5'sh1) : $signed(_GEN_32); // @[Filter.scala 89:36]
  wire [4:0] _GEN_34 = _GEN_1711 & _GEN_1666 ? $signed(5'sh4) : $signed(_GEN_33); // @[Filter.scala 89:36]
  wire [4:0] _GEN_35 = _GEN_1711 & _GEN_1668 ? $signed(-5'sh1) : $signed(_GEN_34); // @[Filter.scala 89:36]
  wire [4:0] _GEN_36 = _GEN_1711 & _GEN_1670 ? $signed(5'sh0) : $signed(_GEN_35); // @[Filter.scala 89:36]
  wire [4:0] _GEN_37 = _GEN_1711 & _GEN_1672 ? $signed(-5'sh1) : $signed(_GEN_36); // @[Filter.scala 89:36]
  wire [4:0] _GEN_38 = _GEN_1711 & _GEN_1674 ? $signed(5'sh0) : $signed(_GEN_37); // @[Filter.scala 89:36]
  wire  _GEN_1729 = 3'h4 == io_SPI_filterIndex[2:0]; // @[Filter.scala 89:36]
  wire [4:0] _GEN_39 = _GEN_1729 & _GEN_1676 ? $signed(-5'sh1) : $signed(_GEN_38); // @[Filter.scala 89:36]
  wire [4:0] _GEN_40 = _GEN_1729 & _GEN_1678 ? $signed(-5'sh1) : $signed(_GEN_39); // @[Filter.scala 89:36]
  wire [4:0] _GEN_41 = _GEN_1729 & _GEN_1680 ? $signed(-5'sh1) : $signed(_GEN_40); // @[Filter.scala 89:36]
  wire [4:0] _GEN_42 = _GEN_1729 & _GEN_1682 ? $signed(-5'sh1) : $signed(_GEN_41); // @[Filter.scala 89:36]
  wire [4:0] _GEN_43 = _GEN_1729 & _GEN_1666 ? $signed(5'sh8) : $signed(_GEN_42); // @[Filter.scala 89:36]
  wire [4:0] _GEN_44 = _GEN_1729 & _GEN_1668 ? $signed(-5'sh1) : $signed(_GEN_43); // @[Filter.scala 89:36]
  wire [4:0] _GEN_45 = _GEN_1729 & _GEN_1670 ? $signed(-5'sh1) : $signed(_GEN_44); // @[Filter.scala 89:36]
  wire [4:0] _GEN_46 = _GEN_1729 & _GEN_1672 ? $signed(-5'sh1) : $signed(_GEN_45); // @[Filter.scala 89:36]
  wire [4:0] _GEN_47 = _GEN_1729 & _GEN_1674 ? $signed(-5'sh1) : $signed(_GEN_46); // @[Filter.scala 89:36]
  wire  _GEN_1747 = 3'h5 == io_SPI_filterIndex[2:0]; // @[Filter.scala 89:36]
  wire [4:0] _GEN_48 = _GEN_1747 & _GEN_1676 ? $signed(5'sh0) : $signed(_GEN_47); // @[Filter.scala 89:36]
  wire [4:0] _GEN_49 = _GEN_1747 & _GEN_1678 ? $signed(-5'sh1) : $signed(_GEN_48); // @[Filter.scala 89:36]
  wire [4:0] _GEN_50 = _GEN_1747 & _GEN_1680 ? $signed(5'sh0) : $signed(_GEN_49); // @[Filter.scala 89:36]
  wire [4:0] _GEN_51 = _GEN_1747 & _GEN_1682 ? $signed(-5'sh1) : $signed(_GEN_50); // @[Filter.scala 89:36]
  wire [4:0] _GEN_52 = _GEN_1747 & _GEN_1666 ? $signed(5'sh5) : $signed(_GEN_51); // @[Filter.scala 89:36]
  wire [4:0] _GEN_53 = _GEN_1747 & _GEN_1668 ? $signed(-5'sh1) : $signed(_GEN_52); // @[Filter.scala 89:36]
  wire [4:0] _GEN_54 = _GEN_1747 & _GEN_1670 ? $signed(5'sh0) : $signed(_GEN_53); // @[Filter.scala 89:36]
  wire [4:0] _GEN_55 = _GEN_1747 & _GEN_1672 ? $signed(-5'sh1) : $signed(_GEN_54); // @[Filter.scala 89:36]
  reg [1:0] imageCounterX; // @[Counter.scala 29:33]
  wire  imageCounterXReset = imageCounterX == 2'h2; // @[Counter.scala 38:24]
  wire [1:0] _T_18 = imageCounterX + 2'h1; // @[Counter.scala 39:22]
  reg [1:0] imageCounterY; // @[Counter.scala 29:33]
  wire  _T_19 = imageCounterY == 2'h2; // @[Counter.scala 38:24]
  wire [1:0] _T_21 = imageCounterY + 2'h1; // @[Counter.scala 39:22]
  reg [31:0] pixelIndex; // @[Filter.scala 94:29]
  wire [32:0] _T_22 = {{1'd0}, pixelIndex}; // @[Filter.scala 97:29]
  wire [31:0] _T_24 = _T_22[31:0] / 32'h10; // @[Filter.scala 97:36]
  wire [31:0] _GEN_1765 = {{30'd0}, imageCounterX}; // @[Filter.scala 97:51]
  wire [31:0] _T_26 = _T_24 + _GEN_1765; // @[Filter.scala 97:51]
  wire [31:0] _T_28 = _T_26 - 32'h1; // @[Filter.scala 97:67]
  wire [31:0] _GEN_0 = _T_22[31:0] % 32'h10; // @[Filter.scala 98:36]
  wire [4:0] _T_31 = _GEN_0[4:0]; // @[Filter.scala 98:36]
  wire [4:0] _GEN_1766 = {{3'd0}, imageCounterY}; // @[Filter.scala 98:51]
  wire [4:0] _T_33 = _T_31 + _GEN_1766; // @[Filter.scala 98:51]
  wire [4:0] _T_35 = _T_33 - 5'h1; // @[Filter.scala 98:67]
  wire  _T_37 = _T_28 >= 32'h10; // @[Filter.scala 99:27]
  wire  _T_41 = _T_35 >= 5'hc; // @[Filter.scala 99:59]
  wire  _T_42 = _T_37 | _T_41; // @[Filter.scala 99:54]
  wire [9:0] _T_43 = _T_35 * 5'h10; // @[Filter.scala 102:57]
  wire [31:0] _GEN_1767 = {{22'd0}, _T_43}; // @[Filter.scala 102:72]
  wire [31:0] _T_45 = _GEN_1767 + _T_28; // @[Filter.scala 102:72]
  wire [3:0] _GEN_71 = 8'h8 == _T_45[7:0] ? 4'h4 : 4'h0; // @[Filter.scala 102:46]
  wire [3:0] _GEN_72 = 8'h9 == _T_45[7:0] ? 4'h4 : _GEN_71; // @[Filter.scala 102:46]
  wire [3:0] _GEN_73 = 8'ha == _T_45[7:0] ? 4'h4 : _GEN_72; // @[Filter.scala 102:46]
  wire [3:0] _GEN_74 = 8'hb == _T_45[7:0] ? 4'h4 : _GEN_73; // @[Filter.scala 102:46]
  wire [3:0] _GEN_75 = 8'hc == _T_45[7:0] ? 4'h4 : _GEN_74; // @[Filter.scala 102:46]
  wire [3:0] _GEN_76 = 8'hd == _T_45[7:0] ? 4'h4 : _GEN_75; // @[Filter.scala 102:46]
  wire [3:0] _GEN_77 = 8'he == _T_45[7:0] ? 4'h4 : _GEN_76; // @[Filter.scala 102:46]
  wire [3:0] _GEN_78 = 8'hf == _T_45[7:0] ? 4'h4 : _GEN_77; // @[Filter.scala 102:46]
  wire [3:0] _GEN_79 = 8'h10 == _T_45[7:0] ? 4'h0 : _GEN_78; // @[Filter.scala 102:46]
  wire [3:0] _GEN_80 = 8'h11 == _T_45[7:0] ? 4'h0 : _GEN_79; // @[Filter.scala 102:46]
  wire [3:0] _GEN_81 = 8'h12 == _T_45[7:0] ? 4'h0 : _GEN_80; // @[Filter.scala 102:46]
  wire [3:0] _GEN_82 = 8'h13 == _T_45[7:0] ? 4'h0 : _GEN_81; // @[Filter.scala 102:46]
  wire [3:0] _GEN_83 = 8'h14 == _T_45[7:0] ? 4'h0 : _GEN_82; // @[Filter.scala 102:46]
  wire [3:0] _GEN_84 = 8'h15 == _T_45[7:0] ? 4'h0 : _GEN_83; // @[Filter.scala 102:46]
  wire [3:0] _GEN_85 = 8'h16 == _T_45[7:0] ? 4'h0 : _GEN_84; // @[Filter.scala 102:46]
  wire [3:0] _GEN_86 = 8'h17 == _T_45[7:0] ? 4'h0 : _GEN_85; // @[Filter.scala 102:46]
  wire [3:0] _GEN_87 = 8'h18 == _T_45[7:0] ? 4'h4 : _GEN_86; // @[Filter.scala 102:46]
  wire [3:0] _GEN_88 = 8'h19 == _T_45[7:0] ? 4'h4 : _GEN_87; // @[Filter.scala 102:46]
  wire [3:0] _GEN_89 = 8'h1a == _T_45[7:0] ? 4'h4 : _GEN_88; // @[Filter.scala 102:46]
  wire [3:0] _GEN_90 = 8'h1b == _T_45[7:0] ? 4'h4 : _GEN_89; // @[Filter.scala 102:46]
  wire [3:0] _GEN_91 = 8'h1c == _T_45[7:0] ? 4'h4 : _GEN_90; // @[Filter.scala 102:46]
  wire [3:0] _GEN_92 = 8'h1d == _T_45[7:0] ? 4'h4 : _GEN_91; // @[Filter.scala 102:46]
  wire [3:0] _GEN_93 = 8'h1e == _T_45[7:0] ? 4'h4 : _GEN_92; // @[Filter.scala 102:46]
  wire [3:0] _GEN_94 = 8'h1f == _T_45[7:0] ? 4'h4 : _GEN_93; // @[Filter.scala 102:46]
  wire [3:0] _GEN_95 = 8'h20 == _T_45[7:0] ? 4'h0 : _GEN_94; // @[Filter.scala 102:46]
  wire [3:0] _GEN_96 = 8'h21 == _T_45[7:0] ? 4'h0 : _GEN_95; // @[Filter.scala 102:46]
  wire [3:0] _GEN_97 = 8'h22 == _T_45[7:0] ? 4'h0 : _GEN_96; // @[Filter.scala 102:46]
  wire [3:0] _GEN_98 = 8'h23 == _T_45[7:0] ? 4'h0 : _GEN_97; // @[Filter.scala 102:46]
  wire [3:0] _GEN_99 = 8'h24 == _T_45[7:0] ? 4'h0 : _GEN_98; // @[Filter.scala 102:46]
  wire [3:0] _GEN_100 = 8'h25 == _T_45[7:0] ? 4'h0 : _GEN_99; // @[Filter.scala 102:46]
  wire [3:0] _GEN_101 = 8'h26 == _T_45[7:0] ? 4'h0 : _GEN_100; // @[Filter.scala 102:46]
  wire [3:0] _GEN_102 = 8'h27 == _T_45[7:0] ? 4'h0 : _GEN_101; // @[Filter.scala 102:46]
  wire [3:0] _GEN_103 = 8'h28 == _T_45[7:0] ? 4'h4 : _GEN_102; // @[Filter.scala 102:46]
  wire [3:0] _GEN_104 = 8'h29 == _T_45[7:0] ? 4'h4 : _GEN_103; // @[Filter.scala 102:46]
  wire [3:0] _GEN_105 = 8'h2a == _T_45[7:0] ? 4'h4 : _GEN_104; // @[Filter.scala 102:46]
  wire [3:0] _GEN_106 = 8'h2b == _T_45[7:0] ? 4'h4 : _GEN_105; // @[Filter.scala 102:46]
  wire [3:0] _GEN_107 = 8'h2c == _T_45[7:0] ? 4'h4 : _GEN_106; // @[Filter.scala 102:46]
  wire [3:0] _GEN_108 = 8'h2d == _T_45[7:0] ? 4'h4 : _GEN_107; // @[Filter.scala 102:46]
  wire [3:0] _GEN_109 = 8'h2e == _T_45[7:0] ? 4'h4 : _GEN_108; // @[Filter.scala 102:46]
  wire [3:0] _GEN_110 = 8'h2f == _T_45[7:0] ? 4'h4 : _GEN_109; // @[Filter.scala 102:46]
  wire [3:0] _GEN_111 = 8'h30 == _T_45[7:0] ? 4'h0 : _GEN_110; // @[Filter.scala 102:46]
  wire [3:0] _GEN_112 = 8'h31 == _T_45[7:0] ? 4'h0 : _GEN_111; // @[Filter.scala 102:46]
  wire [3:0] _GEN_113 = 8'h32 == _T_45[7:0] ? 4'h0 : _GEN_112; // @[Filter.scala 102:46]
  wire [3:0] _GEN_114 = 8'h33 == _T_45[7:0] ? 4'h0 : _GEN_113; // @[Filter.scala 102:46]
  wire [3:0] _GEN_115 = 8'h34 == _T_45[7:0] ? 4'h0 : _GEN_114; // @[Filter.scala 102:46]
  wire [3:0] _GEN_116 = 8'h35 == _T_45[7:0] ? 4'h0 : _GEN_115; // @[Filter.scala 102:46]
  wire [3:0] _GEN_117 = 8'h36 == _T_45[7:0] ? 4'h0 : _GEN_116; // @[Filter.scala 102:46]
  wire [3:0] _GEN_118 = 8'h37 == _T_45[7:0] ? 4'h0 : _GEN_117; // @[Filter.scala 102:46]
  wire [3:0] _GEN_119 = 8'h38 == _T_45[7:0] ? 4'h4 : _GEN_118; // @[Filter.scala 102:46]
  wire [3:0] _GEN_120 = 8'h39 == _T_45[7:0] ? 4'h4 : _GEN_119; // @[Filter.scala 102:46]
  wire [3:0] _GEN_121 = 8'h3a == _T_45[7:0] ? 4'h4 : _GEN_120; // @[Filter.scala 102:46]
  wire [3:0] _GEN_122 = 8'h3b == _T_45[7:0] ? 4'h4 : _GEN_121; // @[Filter.scala 102:46]
  wire [3:0] _GEN_123 = 8'h3c == _T_45[7:0] ? 4'h4 : _GEN_122; // @[Filter.scala 102:46]
  wire [3:0] _GEN_124 = 8'h3d == _T_45[7:0] ? 4'h4 : _GEN_123; // @[Filter.scala 102:46]
  wire [3:0] _GEN_125 = 8'h3e == _T_45[7:0] ? 4'h4 : _GEN_124; // @[Filter.scala 102:46]
  wire [3:0] _GEN_126 = 8'h3f == _T_45[7:0] ? 4'h4 : _GEN_125; // @[Filter.scala 102:46]
  wire [3:0] _GEN_127 = 8'h40 == _T_45[7:0] ? 4'h0 : _GEN_126; // @[Filter.scala 102:46]
  wire [3:0] _GEN_128 = 8'h41 == _T_45[7:0] ? 4'h0 : _GEN_127; // @[Filter.scala 102:46]
  wire [3:0] _GEN_129 = 8'h42 == _T_45[7:0] ? 4'h0 : _GEN_128; // @[Filter.scala 102:46]
  wire [3:0] _GEN_130 = 8'h43 == _T_45[7:0] ? 4'h0 : _GEN_129; // @[Filter.scala 102:46]
  wire [3:0] _GEN_131 = 8'h44 == _T_45[7:0] ? 4'h0 : _GEN_130; // @[Filter.scala 102:46]
  wire [3:0] _GEN_132 = 8'h45 == _T_45[7:0] ? 4'h0 : _GEN_131; // @[Filter.scala 102:46]
  wire [3:0] _GEN_133 = 8'h46 == _T_45[7:0] ? 4'h0 : _GEN_132; // @[Filter.scala 102:46]
  wire [3:0] _GEN_134 = 8'h47 == _T_45[7:0] ? 4'h0 : _GEN_133; // @[Filter.scala 102:46]
  wire [3:0] _GEN_135 = 8'h48 == _T_45[7:0] ? 4'h4 : _GEN_134; // @[Filter.scala 102:46]
  wire [3:0] _GEN_136 = 8'h49 == _T_45[7:0] ? 4'h4 : _GEN_135; // @[Filter.scala 102:46]
  wire [3:0] _GEN_137 = 8'h4a == _T_45[7:0] ? 4'h4 : _GEN_136; // @[Filter.scala 102:46]
  wire [3:0] _GEN_138 = 8'h4b == _T_45[7:0] ? 4'h4 : _GEN_137; // @[Filter.scala 102:46]
  wire [3:0] _GEN_139 = 8'h4c == _T_45[7:0] ? 4'h4 : _GEN_138; // @[Filter.scala 102:46]
  wire [3:0] _GEN_140 = 8'h4d == _T_45[7:0] ? 4'h4 : _GEN_139; // @[Filter.scala 102:46]
  wire [3:0] _GEN_141 = 8'h4e == _T_45[7:0] ? 4'h4 : _GEN_140; // @[Filter.scala 102:46]
  wire [3:0] _GEN_142 = 8'h4f == _T_45[7:0] ? 4'h4 : _GEN_141; // @[Filter.scala 102:46]
  wire [3:0] _GEN_143 = 8'h50 == _T_45[7:0] ? 4'h0 : _GEN_142; // @[Filter.scala 102:46]
  wire [3:0] _GEN_144 = 8'h51 == _T_45[7:0] ? 4'h0 : _GEN_143; // @[Filter.scala 102:46]
  wire [3:0] _GEN_145 = 8'h52 == _T_45[7:0] ? 4'h0 : _GEN_144; // @[Filter.scala 102:46]
  wire [3:0] _GEN_146 = 8'h53 == _T_45[7:0] ? 4'h0 : _GEN_145; // @[Filter.scala 102:46]
  wire [3:0] _GEN_147 = 8'h54 == _T_45[7:0] ? 4'h0 : _GEN_146; // @[Filter.scala 102:46]
  wire [3:0] _GEN_148 = 8'h55 == _T_45[7:0] ? 4'h0 : _GEN_147; // @[Filter.scala 102:46]
  wire [3:0] _GEN_149 = 8'h56 == _T_45[7:0] ? 4'h0 : _GEN_148; // @[Filter.scala 102:46]
  wire [3:0] _GEN_150 = 8'h57 == _T_45[7:0] ? 4'h0 : _GEN_149; // @[Filter.scala 102:46]
  wire [3:0] _GEN_151 = 8'h58 == _T_45[7:0] ? 4'h4 : _GEN_150; // @[Filter.scala 102:46]
  wire [3:0] _GEN_152 = 8'h59 == _T_45[7:0] ? 4'h4 : _GEN_151; // @[Filter.scala 102:46]
  wire [3:0] _GEN_153 = 8'h5a == _T_45[7:0] ? 4'h4 : _GEN_152; // @[Filter.scala 102:46]
  wire [3:0] _GEN_154 = 8'h5b == _T_45[7:0] ? 4'h4 : _GEN_153; // @[Filter.scala 102:46]
  wire [3:0] _GEN_155 = 8'h5c == _T_45[7:0] ? 4'h4 : _GEN_154; // @[Filter.scala 102:46]
  wire [3:0] _GEN_156 = 8'h5d == _T_45[7:0] ? 4'h4 : _GEN_155; // @[Filter.scala 102:46]
  wire [3:0] _GEN_157 = 8'h5e == _T_45[7:0] ? 4'h4 : _GEN_156; // @[Filter.scala 102:46]
  wire [3:0] _GEN_158 = 8'h5f == _T_45[7:0] ? 4'h4 : _GEN_157; // @[Filter.scala 102:46]
  wire [3:0] _GEN_159 = 8'h60 == _T_45[7:0] ? 4'h8 : _GEN_158; // @[Filter.scala 102:46]
  wire [3:0] _GEN_160 = 8'h61 == _T_45[7:0] ? 4'h8 : _GEN_159; // @[Filter.scala 102:46]
  wire [3:0] _GEN_161 = 8'h62 == _T_45[7:0] ? 4'h8 : _GEN_160; // @[Filter.scala 102:46]
  wire [3:0] _GEN_162 = 8'h63 == _T_45[7:0] ? 4'h8 : _GEN_161; // @[Filter.scala 102:46]
  wire [3:0] _GEN_163 = 8'h64 == _T_45[7:0] ? 4'h8 : _GEN_162; // @[Filter.scala 102:46]
  wire [3:0] _GEN_164 = 8'h65 == _T_45[7:0] ? 4'h8 : _GEN_163; // @[Filter.scala 102:46]
  wire [3:0] _GEN_165 = 8'h66 == _T_45[7:0] ? 4'h8 : _GEN_164; // @[Filter.scala 102:46]
  wire [3:0] _GEN_166 = 8'h67 == _T_45[7:0] ? 4'h8 : _GEN_165; // @[Filter.scala 102:46]
  wire [3:0] _GEN_167 = 8'h68 == _T_45[7:0] ? 4'hf : _GEN_166; // @[Filter.scala 102:46]
  wire [3:0] _GEN_168 = 8'h69 == _T_45[7:0] ? 4'hf : _GEN_167; // @[Filter.scala 102:46]
  wire [3:0] _GEN_169 = 8'h6a == _T_45[7:0] ? 4'hf : _GEN_168; // @[Filter.scala 102:46]
  wire [3:0] _GEN_170 = 8'h6b == _T_45[7:0] ? 4'hf : _GEN_169; // @[Filter.scala 102:46]
  wire [3:0] _GEN_171 = 8'h6c == _T_45[7:0] ? 4'hf : _GEN_170; // @[Filter.scala 102:46]
  wire [3:0] _GEN_172 = 8'h6d == _T_45[7:0] ? 4'hf : _GEN_171; // @[Filter.scala 102:46]
  wire [3:0] _GEN_173 = 8'h6e == _T_45[7:0] ? 4'hf : _GEN_172; // @[Filter.scala 102:46]
  wire [3:0] _GEN_174 = 8'h6f == _T_45[7:0] ? 4'hf : _GEN_173; // @[Filter.scala 102:46]
  wire [3:0] _GEN_175 = 8'h70 == _T_45[7:0] ? 4'h8 : _GEN_174; // @[Filter.scala 102:46]
  wire [3:0] _GEN_176 = 8'h71 == _T_45[7:0] ? 4'h8 : _GEN_175; // @[Filter.scala 102:46]
  wire [3:0] _GEN_177 = 8'h72 == _T_45[7:0] ? 4'h8 : _GEN_176; // @[Filter.scala 102:46]
  wire [3:0] _GEN_178 = 8'h73 == _T_45[7:0] ? 4'h8 : _GEN_177; // @[Filter.scala 102:46]
  wire [3:0] _GEN_179 = 8'h74 == _T_45[7:0] ? 4'h8 : _GEN_178; // @[Filter.scala 102:46]
  wire [3:0] _GEN_180 = 8'h75 == _T_45[7:0] ? 4'h8 : _GEN_179; // @[Filter.scala 102:46]
  wire [3:0] _GEN_181 = 8'h76 == _T_45[7:0] ? 4'h8 : _GEN_180; // @[Filter.scala 102:46]
  wire [3:0] _GEN_182 = 8'h77 == _T_45[7:0] ? 4'h8 : _GEN_181; // @[Filter.scala 102:46]
  wire [3:0] _GEN_183 = 8'h78 == _T_45[7:0] ? 4'hf : _GEN_182; // @[Filter.scala 102:46]
  wire [3:0] _GEN_184 = 8'h79 == _T_45[7:0] ? 4'hf : _GEN_183; // @[Filter.scala 102:46]
  wire [3:0] _GEN_185 = 8'h7a == _T_45[7:0] ? 4'hf : _GEN_184; // @[Filter.scala 102:46]
  wire [3:0] _GEN_186 = 8'h7b == _T_45[7:0] ? 4'hf : _GEN_185; // @[Filter.scala 102:46]
  wire [3:0] _GEN_187 = 8'h7c == _T_45[7:0] ? 4'hf : _GEN_186; // @[Filter.scala 102:46]
  wire [3:0] _GEN_188 = 8'h7d == _T_45[7:0] ? 4'hf : _GEN_187; // @[Filter.scala 102:46]
  wire [3:0] _GEN_189 = 8'h7e == _T_45[7:0] ? 4'hf : _GEN_188; // @[Filter.scala 102:46]
  wire [3:0] _GEN_190 = 8'h7f == _T_45[7:0] ? 4'hf : _GEN_189; // @[Filter.scala 102:46]
  wire [3:0] _GEN_191 = 8'h80 == _T_45[7:0] ? 4'h8 : _GEN_190; // @[Filter.scala 102:46]
  wire [3:0] _GEN_192 = 8'h81 == _T_45[7:0] ? 4'h8 : _GEN_191; // @[Filter.scala 102:46]
  wire [3:0] _GEN_193 = 8'h82 == _T_45[7:0] ? 4'h8 : _GEN_192; // @[Filter.scala 102:46]
  wire [3:0] _GEN_194 = 8'h83 == _T_45[7:0] ? 4'h8 : _GEN_193; // @[Filter.scala 102:46]
  wire [3:0] _GEN_195 = 8'h84 == _T_45[7:0] ? 4'h8 : _GEN_194; // @[Filter.scala 102:46]
  wire [3:0] _GEN_196 = 8'h85 == _T_45[7:0] ? 4'h8 : _GEN_195; // @[Filter.scala 102:46]
  wire [3:0] _GEN_197 = 8'h86 == _T_45[7:0] ? 4'h8 : _GEN_196; // @[Filter.scala 102:46]
  wire [3:0] _GEN_198 = 8'h87 == _T_45[7:0] ? 4'h8 : _GEN_197; // @[Filter.scala 102:46]
  wire [3:0] _GEN_199 = 8'h88 == _T_45[7:0] ? 4'hf : _GEN_198; // @[Filter.scala 102:46]
  wire [3:0] _GEN_200 = 8'h89 == _T_45[7:0] ? 4'hf : _GEN_199; // @[Filter.scala 102:46]
  wire [3:0] _GEN_201 = 8'h8a == _T_45[7:0] ? 4'hf : _GEN_200; // @[Filter.scala 102:46]
  wire [3:0] _GEN_202 = 8'h8b == _T_45[7:0] ? 4'hf : _GEN_201; // @[Filter.scala 102:46]
  wire [3:0] _GEN_203 = 8'h8c == _T_45[7:0] ? 4'hf : _GEN_202; // @[Filter.scala 102:46]
  wire [3:0] _GEN_204 = 8'h8d == _T_45[7:0] ? 4'hf : _GEN_203; // @[Filter.scala 102:46]
  wire [3:0] _GEN_205 = 8'h8e == _T_45[7:0] ? 4'hf : _GEN_204; // @[Filter.scala 102:46]
  wire [3:0] _GEN_206 = 8'h8f == _T_45[7:0] ? 4'hf : _GEN_205; // @[Filter.scala 102:46]
  wire [3:0] _GEN_207 = 8'h90 == _T_45[7:0] ? 4'h8 : _GEN_206; // @[Filter.scala 102:46]
  wire [3:0] _GEN_208 = 8'h91 == _T_45[7:0] ? 4'h8 : _GEN_207; // @[Filter.scala 102:46]
  wire [3:0] _GEN_209 = 8'h92 == _T_45[7:0] ? 4'h8 : _GEN_208; // @[Filter.scala 102:46]
  wire [3:0] _GEN_210 = 8'h93 == _T_45[7:0] ? 4'h8 : _GEN_209; // @[Filter.scala 102:46]
  wire [3:0] _GEN_211 = 8'h94 == _T_45[7:0] ? 4'h8 : _GEN_210; // @[Filter.scala 102:46]
  wire [3:0] _GEN_212 = 8'h95 == _T_45[7:0] ? 4'h8 : _GEN_211; // @[Filter.scala 102:46]
  wire [3:0] _GEN_213 = 8'h96 == _T_45[7:0] ? 4'h8 : _GEN_212; // @[Filter.scala 102:46]
  wire [3:0] _GEN_214 = 8'h97 == _T_45[7:0] ? 4'h8 : _GEN_213; // @[Filter.scala 102:46]
  wire [3:0] _GEN_215 = 8'h98 == _T_45[7:0] ? 4'hf : _GEN_214; // @[Filter.scala 102:46]
  wire [3:0] _GEN_216 = 8'h99 == _T_45[7:0] ? 4'hf : _GEN_215; // @[Filter.scala 102:46]
  wire [3:0] _GEN_217 = 8'h9a == _T_45[7:0] ? 4'hf : _GEN_216; // @[Filter.scala 102:46]
  wire [3:0] _GEN_218 = 8'h9b == _T_45[7:0] ? 4'hf : _GEN_217; // @[Filter.scala 102:46]
  wire [3:0] _GEN_219 = 8'h9c == _T_45[7:0] ? 4'hf : _GEN_218; // @[Filter.scala 102:46]
  wire [3:0] _GEN_220 = 8'h9d == _T_45[7:0] ? 4'hf : _GEN_219; // @[Filter.scala 102:46]
  wire [3:0] _GEN_221 = 8'h9e == _T_45[7:0] ? 4'hf : _GEN_220; // @[Filter.scala 102:46]
  wire [3:0] _GEN_222 = 8'h9f == _T_45[7:0] ? 4'hf : _GEN_221; // @[Filter.scala 102:46]
  wire [3:0] _GEN_223 = 8'ha0 == _T_45[7:0] ? 4'h8 : _GEN_222; // @[Filter.scala 102:46]
  wire [3:0] _GEN_224 = 8'ha1 == _T_45[7:0] ? 4'h8 : _GEN_223; // @[Filter.scala 102:46]
  wire [3:0] _GEN_225 = 8'ha2 == _T_45[7:0] ? 4'h8 : _GEN_224; // @[Filter.scala 102:46]
  wire [3:0] _GEN_226 = 8'ha3 == _T_45[7:0] ? 4'h8 : _GEN_225; // @[Filter.scala 102:46]
  wire [3:0] _GEN_227 = 8'ha4 == _T_45[7:0] ? 4'h8 : _GEN_226; // @[Filter.scala 102:46]
  wire [3:0] _GEN_228 = 8'ha5 == _T_45[7:0] ? 4'h8 : _GEN_227; // @[Filter.scala 102:46]
  wire [3:0] _GEN_229 = 8'ha6 == _T_45[7:0] ? 4'h8 : _GEN_228; // @[Filter.scala 102:46]
  wire [3:0] _GEN_230 = 8'ha7 == _T_45[7:0] ? 4'h8 : _GEN_229; // @[Filter.scala 102:46]
  wire [3:0] _GEN_231 = 8'ha8 == _T_45[7:0] ? 4'hf : _GEN_230; // @[Filter.scala 102:46]
  wire [3:0] _GEN_232 = 8'ha9 == _T_45[7:0] ? 4'hf : _GEN_231; // @[Filter.scala 102:46]
  wire [3:0] _GEN_233 = 8'haa == _T_45[7:0] ? 4'hf : _GEN_232; // @[Filter.scala 102:46]
  wire [3:0] _GEN_234 = 8'hab == _T_45[7:0] ? 4'hf : _GEN_233; // @[Filter.scala 102:46]
  wire [3:0] _GEN_235 = 8'hac == _T_45[7:0] ? 4'hf : _GEN_234; // @[Filter.scala 102:46]
  wire [3:0] _GEN_236 = 8'had == _T_45[7:0] ? 4'hf : _GEN_235; // @[Filter.scala 102:46]
  wire [3:0] _GEN_237 = 8'hae == _T_45[7:0] ? 4'hf : _GEN_236; // @[Filter.scala 102:46]
  wire [3:0] _GEN_238 = 8'haf == _T_45[7:0] ? 4'hf : _GEN_237; // @[Filter.scala 102:46]
  wire [3:0] _GEN_239 = 8'hb0 == _T_45[7:0] ? 4'h8 : _GEN_238; // @[Filter.scala 102:46]
  wire [3:0] _GEN_240 = 8'hb1 == _T_45[7:0] ? 4'h8 : _GEN_239; // @[Filter.scala 102:46]
  wire [3:0] _GEN_241 = 8'hb2 == _T_45[7:0] ? 4'h8 : _GEN_240; // @[Filter.scala 102:46]
  wire [3:0] _GEN_242 = 8'hb3 == _T_45[7:0] ? 4'h8 : _GEN_241; // @[Filter.scala 102:46]
  wire [3:0] _GEN_243 = 8'hb4 == _T_45[7:0] ? 4'h8 : _GEN_242; // @[Filter.scala 102:46]
  wire [3:0] _GEN_244 = 8'hb5 == _T_45[7:0] ? 4'h8 : _GEN_243; // @[Filter.scala 102:46]
  wire [3:0] _GEN_245 = 8'hb6 == _T_45[7:0] ? 4'h8 : _GEN_244; // @[Filter.scala 102:46]
  wire [3:0] _GEN_246 = 8'hb7 == _T_45[7:0] ? 4'h8 : _GEN_245; // @[Filter.scala 102:46]
  wire [3:0] _GEN_247 = 8'hb8 == _T_45[7:0] ? 4'hf : _GEN_246; // @[Filter.scala 102:46]
  wire [3:0] _GEN_248 = 8'hb9 == _T_45[7:0] ? 4'hf : _GEN_247; // @[Filter.scala 102:46]
  wire [3:0] _GEN_249 = 8'hba == _T_45[7:0] ? 4'hf : _GEN_248; // @[Filter.scala 102:46]
  wire [3:0] _GEN_250 = 8'hbb == _T_45[7:0] ? 4'hf : _GEN_249; // @[Filter.scala 102:46]
  wire [3:0] _GEN_251 = 8'hbc == _T_45[7:0] ? 4'hf : _GEN_250; // @[Filter.scala 102:46]
  wire [3:0] _GEN_252 = 8'hbd == _T_45[7:0] ? 4'hf : _GEN_251; // @[Filter.scala 102:46]
  wire [3:0] _GEN_253 = 8'hbe == _T_45[7:0] ? 4'hf : _GEN_252; // @[Filter.scala 102:46]
  wire [3:0] _GEN_254 = 8'hbf == _T_45[7:0] ? 4'hf : _GEN_253; // @[Filter.scala 102:46]
  wire [31:0] _T_48 = pixelIndex + 32'h1; // @[Filter.scala 97:29]
  wire [31:0] _T_49 = _T_48 / 32'h10; // @[Filter.scala 97:36]
  wire [31:0] _T_51 = _T_49 + _GEN_1765; // @[Filter.scala 97:51]
  wire [31:0] _T_53 = _T_51 - 32'h1; // @[Filter.scala 97:67]
  wire [31:0] _GEN_1 = _T_48 % 32'h10; // @[Filter.scala 98:36]
  wire [4:0] _T_56 = _GEN_1[4:0]; // @[Filter.scala 98:36]
  wire [4:0] _T_58 = _T_56 + _GEN_1766; // @[Filter.scala 98:51]
  wire [4:0] _T_60 = _T_58 - 5'h1; // @[Filter.scala 98:67]
  wire  _T_62 = _T_53 >= 32'h10; // @[Filter.scala 99:27]
  wire  _T_66 = _T_60 >= 5'hc; // @[Filter.scala 99:59]
  wire  _T_67 = _T_62 | _T_66; // @[Filter.scala 99:54]
  wire [9:0] _T_68 = _T_60 * 5'h10; // @[Filter.scala 102:57]
  wire [31:0] _GEN_1770 = {{22'd0}, _T_68}; // @[Filter.scala 102:72]
  wire [31:0] _T_70 = _GEN_1770 + _T_53; // @[Filter.scala 102:72]
  wire [3:0] _GEN_264 = 8'h8 == _T_70[7:0] ? 4'h4 : 4'h0; // @[Filter.scala 102:46]
  wire [3:0] _GEN_265 = 8'h9 == _T_70[7:0] ? 4'h4 : _GEN_264; // @[Filter.scala 102:46]
  wire [3:0] _GEN_266 = 8'ha == _T_70[7:0] ? 4'h4 : _GEN_265; // @[Filter.scala 102:46]
  wire [3:0] _GEN_267 = 8'hb == _T_70[7:0] ? 4'h4 : _GEN_266; // @[Filter.scala 102:46]
  wire [3:0] _GEN_268 = 8'hc == _T_70[7:0] ? 4'h4 : _GEN_267; // @[Filter.scala 102:46]
  wire [3:0] _GEN_269 = 8'hd == _T_70[7:0] ? 4'h4 : _GEN_268; // @[Filter.scala 102:46]
  wire [3:0] _GEN_270 = 8'he == _T_70[7:0] ? 4'h4 : _GEN_269; // @[Filter.scala 102:46]
  wire [3:0] _GEN_271 = 8'hf == _T_70[7:0] ? 4'h4 : _GEN_270; // @[Filter.scala 102:46]
  wire [3:0] _GEN_272 = 8'h10 == _T_70[7:0] ? 4'h0 : _GEN_271; // @[Filter.scala 102:46]
  wire [3:0] _GEN_273 = 8'h11 == _T_70[7:0] ? 4'h0 : _GEN_272; // @[Filter.scala 102:46]
  wire [3:0] _GEN_274 = 8'h12 == _T_70[7:0] ? 4'h0 : _GEN_273; // @[Filter.scala 102:46]
  wire [3:0] _GEN_275 = 8'h13 == _T_70[7:0] ? 4'h0 : _GEN_274; // @[Filter.scala 102:46]
  wire [3:0] _GEN_276 = 8'h14 == _T_70[7:0] ? 4'h0 : _GEN_275; // @[Filter.scala 102:46]
  wire [3:0] _GEN_277 = 8'h15 == _T_70[7:0] ? 4'h0 : _GEN_276; // @[Filter.scala 102:46]
  wire [3:0] _GEN_278 = 8'h16 == _T_70[7:0] ? 4'h0 : _GEN_277; // @[Filter.scala 102:46]
  wire [3:0] _GEN_279 = 8'h17 == _T_70[7:0] ? 4'h0 : _GEN_278; // @[Filter.scala 102:46]
  wire [3:0] _GEN_280 = 8'h18 == _T_70[7:0] ? 4'h4 : _GEN_279; // @[Filter.scala 102:46]
  wire [3:0] _GEN_281 = 8'h19 == _T_70[7:0] ? 4'h4 : _GEN_280; // @[Filter.scala 102:46]
  wire [3:0] _GEN_282 = 8'h1a == _T_70[7:0] ? 4'h4 : _GEN_281; // @[Filter.scala 102:46]
  wire [3:0] _GEN_283 = 8'h1b == _T_70[7:0] ? 4'h4 : _GEN_282; // @[Filter.scala 102:46]
  wire [3:0] _GEN_284 = 8'h1c == _T_70[7:0] ? 4'h4 : _GEN_283; // @[Filter.scala 102:46]
  wire [3:0] _GEN_285 = 8'h1d == _T_70[7:0] ? 4'h4 : _GEN_284; // @[Filter.scala 102:46]
  wire [3:0] _GEN_286 = 8'h1e == _T_70[7:0] ? 4'h4 : _GEN_285; // @[Filter.scala 102:46]
  wire [3:0] _GEN_287 = 8'h1f == _T_70[7:0] ? 4'h4 : _GEN_286; // @[Filter.scala 102:46]
  wire [3:0] _GEN_288 = 8'h20 == _T_70[7:0] ? 4'h0 : _GEN_287; // @[Filter.scala 102:46]
  wire [3:0] _GEN_289 = 8'h21 == _T_70[7:0] ? 4'h0 : _GEN_288; // @[Filter.scala 102:46]
  wire [3:0] _GEN_290 = 8'h22 == _T_70[7:0] ? 4'h0 : _GEN_289; // @[Filter.scala 102:46]
  wire [3:0] _GEN_291 = 8'h23 == _T_70[7:0] ? 4'h0 : _GEN_290; // @[Filter.scala 102:46]
  wire [3:0] _GEN_292 = 8'h24 == _T_70[7:0] ? 4'h0 : _GEN_291; // @[Filter.scala 102:46]
  wire [3:0] _GEN_293 = 8'h25 == _T_70[7:0] ? 4'h0 : _GEN_292; // @[Filter.scala 102:46]
  wire [3:0] _GEN_294 = 8'h26 == _T_70[7:0] ? 4'h0 : _GEN_293; // @[Filter.scala 102:46]
  wire [3:0] _GEN_295 = 8'h27 == _T_70[7:0] ? 4'h0 : _GEN_294; // @[Filter.scala 102:46]
  wire [3:0] _GEN_296 = 8'h28 == _T_70[7:0] ? 4'h4 : _GEN_295; // @[Filter.scala 102:46]
  wire [3:0] _GEN_297 = 8'h29 == _T_70[7:0] ? 4'h4 : _GEN_296; // @[Filter.scala 102:46]
  wire [3:0] _GEN_298 = 8'h2a == _T_70[7:0] ? 4'h4 : _GEN_297; // @[Filter.scala 102:46]
  wire [3:0] _GEN_299 = 8'h2b == _T_70[7:0] ? 4'h4 : _GEN_298; // @[Filter.scala 102:46]
  wire [3:0] _GEN_300 = 8'h2c == _T_70[7:0] ? 4'h4 : _GEN_299; // @[Filter.scala 102:46]
  wire [3:0] _GEN_301 = 8'h2d == _T_70[7:0] ? 4'h4 : _GEN_300; // @[Filter.scala 102:46]
  wire [3:0] _GEN_302 = 8'h2e == _T_70[7:0] ? 4'h4 : _GEN_301; // @[Filter.scala 102:46]
  wire [3:0] _GEN_303 = 8'h2f == _T_70[7:0] ? 4'h4 : _GEN_302; // @[Filter.scala 102:46]
  wire [3:0] _GEN_304 = 8'h30 == _T_70[7:0] ? 4'h0 : _GEN_303; // @[Filter.scala 102:46]
  wire [3:0] _GEN_305 = 8'h31 == _T_70[7:0] ? 4'h0 : _GEN_304; // @[Filter.scala 102:46]
  wire [3:0] _GEN_306 = 8'h32 == _T_70[7:0] ? 4'h0 : _GEN_305; // @[Filter.scala 102:46]
  wire [3:0] _GEN_307 = 8'h33 == _T_70[7:0] ? 4'h0 : _GEN_306; // @[Filter.scala 102:46]
  wire [3:0] _GEN_308 = 8'h34 == _T_70[7:0] ? 4'h0 : _GEN_307; // @[Filter.scala 102:46]
  wire [3:0] _GEN_309 = 8'h35 == _T_70[7:0] ? 4'h0 : _GEN_308; // @[Filter.scala 102:46]
  wire [3:0] _GEN_310 = 8'h36 == _T_70[7:0] ? 4'h0 : _GEN_309; // @[Filter.scala 102:46]
  wire [3:0] _GEN_311 = 8'h37 == _T_70[7:0] ? 4'h0 : _GEN_310; // @[Filter.scala 102:46]
  wire [3:0] _GEN_312 = 8'h38 == _T_70[7:0] ? 4'h4 : _GEN_311; // @[Filter.scala 102:46]
  wire [3:0] _GEN_313 = 8'h39 == _T_70[7:0] ? 4'h4 : _GEN_312; // @[Filter.scala 102:46]
  wire [3:0] _GEN_314 = 8'h3a == _T_70[7:0] ? 4'h4 : _GEN_313; // @[Filter.scala 102:46]
  wire [3:0] _GEN_315 = 8'h3b == _T_70[7:0] ? 4'h4 : _GEN_314; // @[Filter.scala 102:46]
  wire [3:0] _GEN_316 = 8'h3c == _T_70[7:0] ? 4'h4 : _GEN_315; // @[Filter.scala 102:46]
  wire [3:0] _GEN_317 = 8'h3d == _T_70[7:0] ? 4'h4 : _GEN_316; // @[Filter.scala 102:46]
  wire [3:0] _GEN_318 = 8'h3e == _T_70[7:0] ? 4'h4 : _GEN_317; // @[Filter.scala 102:46]
  wire [3:0] _GEN_319 = 8'h3f == _T_70[7:0] ? 4'h4 : _GEN_318; // @[Filter.scala 102:46]
  wire [3:0] _GEN_320 = 8'h40 == _T_70[7:0] ? 4'h0 : _GEN_319; // @[Filter.scala 102:46]
  wire [3:0] _GEN_321 = 8'h41 == _T_70[7:0] ? 4'h0 : _GEN_320; // @[Filter.scala 102:46]
  wire [3:0] _GEN_322 = 8'h42 == _T_70[7:0] ? 4'h0 : _GEN_321; // @[Filter.scala 102:46]
  wire [3:0] _GEN_323 = 8'h43 == _T_70[7:0] ? 4'h0 : _GEN_322; // @[Filter.scala 102:46]
  wire [3:0] _GEN_324 = 8'h44 == _T_70[7:0] ? 4'h0 : _GEN_323; // @[Filter.scala 102:46]
  wire [3:0] _GEN_325 = 8'h45 == _T_70[7:0] ? 4'h0 : _GEN_324; // @[Filter.scala 102:46]
  wire [3:0] _GEN_326 = 8'h46 == _T_70[7:0] ? 4'h0 : _GEN_325; // @[Filter.scala 102:46]
  wire [3:0] _GEN_327 = 8'h47 == _T_70[7:0] ? 4'h0 : _GEN_326; // @[Filter.scala 102:46]
  wire [3:0] _GEN_328 = 8'h48 == _T_70[7:0] ? 4'h4 : _GEN_327; // @[Filter.scala 102:46]
  wire [3:0] _GEN_329 = 8'h49 == _T_70[7:0] ? 4'h4 : _GEN_328; // @[Filter.scala 102:46]
  wire [3:0] _GEN_330 = 8'h4a == _T_70[7:0] ? 4'h4 : _GEN_329; // @[Filter.scala 102:46]
  wire [3:0] _GEN_331 = 8'h4b == _T_70[7:0] ? 4'h4 : _GEN_330; // @[Filter.scala 102:46]
  wire [3:0] _GEN_332 = 8'h4c == _T_70[7:0] ? 4'h4 : _GEN_331; // @[Filter.scala 102:46]
  wire [3:0] _GEN_333 = 8'h4d == _T_70[7:0] ? 4'h4 : _GEN_332; // @[Filter.scala 102:46]
  wire [3:0] _GEN_334 = 8'h4e == _T_70[7:0] ? 4'h4 : _GEN_333; // @[Filter.scala 102:46]
  wire [3:0] _GEN_335 = 8'h4f == _T_70[7:0] ? 4'h4 : _GEN_334; // @[Filter.scala 102:46]
  wire [3:0] _GEN_336 = 8'h50 == _T_70[7:0] ? 4'h0 : _GEN_335; // @[Filter.scala 102:46]
  wire [3:0] _GEN_337 = 8'h51 == _T_70[7:0] ? 4'h0 : _GEN_336; // @[Filter.scala 102:46]
  wire [3:0] _GEN_338 = 8'h52 == _T_70[7:0] ? 4'h0 : _GEN_337; // @[Filter.scala 102:46]
  wire [3:0] _GEN_339 = 8'h53 == _T_70[7:0] ? 4'h0 : _GEN_338; // @[Filter.scala 102:46]
  wire [3:0] _GEN_340 = 8'h54 == _T_70[7:0] ? 4'h0 : _GEN_339; // @[Filter.scala 102:46]
  wire [3:0] _GEN_341 = 8'h55 == _T_70[7:0] ? 4'h0 : _GEN_340; // @[Filter.scala 102:46]
  wire [3:0] _GEN_342 = 8'h56 == _T_70[7:0] ? 4'h0 : _GEN_341; // @[Filter.scala 102:46]
  wire [3:0] _GEN_343 = 8'h57 == _T_70[7:0] ? 4'h0 : _GEN_342; // @[Filter.scala 102:46]
  wire [3:0] _GEN_344 = 8'h58 == _T_70[7:0] ? 4'h4 : _GEN_343; // @[Filter.scala 102:46]
  wire [3:0] _GEN_345 = 8'h59 == _T_70[7:0] ? 4'h4 : _GEN_344; // @[Filter.scala 102:46]
  wire [3:0] _GEN_346 = 8'h5a == _T_70[7:0] ? 4'h4 : _GEN_345; // @[Filter.scala 102:46]
  wire [3:0] _GEN_347 = 8'h5b == _T_70[7:0] ? 4'h4 : _GEN_346; // @[Filter.scala 102:46]
  wire [3:0] _GEN_348 = 8'h5c == _T_70[7:0] ? 4'h4 : _GEN_347; // @[Filter.scala 102:46]
  wire [3:0] _GEN_349 = 8'h5d == _T_70[7:0] ? 4'h4 : _GEN_348; // @[Filter.scala 102:46]
  wire [3:0] _GEN_350 = 8'h5e == _T_70[7:0] ? 4'h4 : _GEN_349; // @[Filter.scala 102:46]
  wire [3:0] _GEN_351 = 8'h5f == _T_70[7:0] ? 4'h4 : _GEN_350; // @[Filter.scala 102:46]
  wire [3:0] _GEN_352 = 8'h60 == _T_70[7:0] ? 4'h8 : _GEN_351; // @[Filter.scala 102:46]
  wire [3:0] _GEN_353 = 8'h61 == _T_70[7:0] ? 4'h8 : _GEN_352; // @[Filter.scala 102:46]
  wire [3:0] _GEN_354 = 8'h62 == _T_70[7:0] ? 4'h8 : _GEN_353; // @[Filter.scala 102:46]
  wire [3:0] _GEN_355 = 8'h63 == _T_70[7:0] ? 4'h8 : _GEN_354; // @[Filter.scala 102:46]
  wire [3:0] _GEN_356 = 8'h64 == _T_70[7:0] ? 4'h8 : _GEN_355; // @[Filter.scala 102:46]
  wire [3:0] _GEN_357 = 8'h65 == _T_70[7:0] ? 4'h8 : _GEN_356; // @[Filter.scala 102:46]
  wire [3:0] _GEN_358 = 8'h66 == _T_70[7:0] ? 4'h8 : _GEN_357; // @[Filter.scala 102:46]
  wire [3:0] _GEN_359 = 8'h67 == _T_70[7:0] ? 4'h8 : _GEN_358; // @[Filter.scala 102:46]
  wire [3:0] _GEN_360 = 8'h68 == _T_70[7:0] ? 4'hf : _GEN_359; // @[Filter.scala 102:46]
  wire [3:0] _GEN_361 = 8'h69 == _T_70[7:0] ? 4'hf : _GEN_360; // @[Filter.scala 102:46]
  wire [3:0] _GEN_362 = 8'h6a == _T_70[7:0] ? 4'hf : _GEN_361; // @[Filter.scala 102:46]
  wire [3:0] _GEN_363 = 8'h6b == _T_70[7:0] ? 4'hf : _GEN_362; // @[Filter.scala 102:46]
  wire [3:0] _GEN_364 = 8'h6c == _T_70[7:0] ? 4'hf : _GEN_363; // @[Filter.scala 102:46]
  wire [3:0] _GEN_365 = 8'h6d == _T_70[7:0] ? 4'hf : _GEN_364; // @[Filter.scala 102:46]
  wire [3:0] _GEN_366 = 8'h6e == _T_70[7:0] ? 4'hf : _GEN_365; // @[Filter.scala 102:46]
  wire [3:0] _GEN_367 = 8'h6f == _T_70[7:0] ? 4'hf : _GEN_366; // @[Filter.scala 102:46]
  wire [3:0] _GEN_368 = 8'h70 == _T_70[7:0] ? 4'h8 : _GEN_367; // @[Filter.scala 102:46]
  wire [3:0] _GEN_369 = 8'h71 == _T_70[7:0] ? 4'h8 : _GEN_368; // @[Filter.scala 102:46]
  wire [3:0] _GEN_370 = 8'h72 == _T_70[7:0] ? 4'h8 : _GEN_369; // @[Filter.scala 102:46]
  wire [3:0] _GEN_371 = 8'h73 == _T_70[7:0] ? 4'h8 : _GEN_370; // @[Filter.scala 102:46]
  wire [3:0] _GEN_372 = 8'h74 == _T_70[7:0] ? 4'h8 : _GEN_371; // @[Filter.scala 102:46]
  wire [3:0] _GEN_373 = 8'h75 == _T_70[7:0] ? 4'h8 : _GEN_372; // @[Filter.scala 102:46]
  wire [3:0] _GEN_374 = 8'h76 == _T_70[7:0] ? 4'h8 : _GEN_373; // @[Filter.scala 102:46]
  wire [3:0] _GEN_375 = 8'h77 == _T_70[7:0] ? 4'h8 : _GEN_374; // @[Filter.scala 102:46]
  wire [3:0] _GEN_376 = 8'h78 == _T_70[7:0] ? 4'hf : _GEN_375; // @[Filter.scala 102:46]
  wire [3:0] _GEN_377 = 8'h79 == _T_70[7:0] ? 4'hf : _GEN_376; // @[Filter.scala 102:46]
  wire [3:0] _GEN_378 = 8'h7a == _T_70[7:0] ? 4'hf : _GEN_377; // @[Filter.scala 102:46]
  wire [3:0] _GEN_379 = 8'h7b == _T_70[7:0] ? 4'hf : _GEN_378; // @[Filter.scala 102:46]
  wire [3:0] _GEN_380 = 8'h7c == _T_70[7:0] ? 4'hf : _GEN_379; // @[Filter.scala 102:46]
  wire [3:0] _GEN_381 = 8'h7d == _T_70[7:0] ? 4'hf : _GEN_380; // @[Filter.scala 102:46]
  wire [3:0] _GEN_382 = 8'h7e == _T_70[7:0] ? 4'hf : _GEN_381; // @[Filter.scala 102:46]
  wire [3:0] _GEN_383 = 8'h7f == _T_70[7:0] ? 4'hf : _GEN_382; // @[Filter.scala 102:46]
  wire [3:0] _GEN_384 = 8'h80 == _T_70[7:0] ? 4'h8 : _GEN_383; // @[Filter.scala 102:46]
  wire [3:0] _GEN_385 = 8'h81 == _T_70[7:0] ? 4'h8 : _GEN_384; // @[Filter.scala 102:46]
  wire [3:0] _GEN_386 = 8'h82 == _T_70[7:0] ? 4'h8 : _GEN_385; // @[Filter.scala 102:46]
  wire [3:0] _GEN_387 = 8'h83 == _T_70[7:0] ? 4'h8 : _GEN_386; // @[Filter.scala 102:46]
  wire [3:0] _GEN_388 = 8'h84 == _T_70[7:0] ? 4'h8 : _GEN_387; // @[Filter.scala 102:46]
  wire [3:0] _GEN_389 = 8'h85 == _T_70[7:0] ? 4'h8 : _GEN_388; // @[Filter.scala 102:46]
  wire [3:0] _GEN_390 = 8'h86 == _T_70[7:0] ? 4'h8 : _GEN_389; // @[Filter.scala 102:46]
  wire [3:0] _GEN_391 = 8'h87 == _T_70[7:0] ? 4'h8 : _GEN_390; // @[Filter.scala 102:46]
  wire [3:0] _GEN_392 = 8'h88 == _T_70[7:0] ? 4'hf : _GEN_391; // @[Filter.scala 102:46]
  wire [3:0] _GEN_393 = 8'h89 == _T_70[7:0] ? 4'hf : _GEN_392; // @[Filter.scala 102:46]
  wire [3:0] _GEN_394 = 8'h8a == _T_70[7:0] ? 4'hf : _GEN_393; // @[Filter.scala 102:46]
  wire [3:0] _GEN_395 = 8'h8b == _T_70[7:0] ? 4'hf : _GEN_394; // @[Filter.scala 102:46]
  wire [3:0] _GEN_396 = 8'h8c == _T_70[7:0] ? 4'hf : _GEN_395; // @[Filter.scala 102:46]
  wire [3:0] _GEN_397 = 8'h8d == _T_70[7:0] ? 4'hf : _GEN_396; // @[Filter.scala 102:46]
  wire [3:0] _GEN_398 = 8'h8e == _T_70[7:0] ? 4'hf : _GEN_397; // @[Filter.scala 102:46]
  wire [3:0] _GEN_399 = 8'h8f == _T_70[7:0] ? 4'hf : _GEN_398; // @[Filter.scala 102:46]
  wire [3:0] _GEN_400 = 8'h90 == _T_70[7:0] ? 4'h8 : _GEN_399; // @[Filter.scala 102:46]
  wire [3:0] _GEN_401 = 8'h91 == _T_70[7:0] ? 4'h8 : _GEN_400; // @[Filter.scala 102:46]
  wire [3:0] _GEN_402 = 8'h92 == _T_70[7:0] ? 4'h8 : _GEN_401; // @[Filter.scala 102:46]
  wire [3:0] _GEN_403 = 8'h93 == _T_70[7:0] ? 4'h8 : _GEN_402; // @[Filter.scala 102:46]
  wire [3:0] _GEN_404 = 8'h94 == _T_70[7:0] ? 4'h8 : _GEN_403; // @[Filter.scala 102:46]
  wire [3:0] _GEN_405 = 8'h95 == _T_70[7:0] ? 4'h8 : _GEN_404; // @[Filter.scala 102:46]
  wire [3:0] _GEN_406 = 8'h96 == _T_70[7:0] ? 4'h8 : _GEN_405; // @[Filter.scala 102:46]
  wire [3:0] _GEN_407 = 8'h97 == _T_70[7:0] ? 4'h8 : _GEN_406; // @[Filter.scala 102:46]
  wire [3:0] _GEN_408 = 8'h98 == _T_70[7:0] ? 4'hf : _GEN_407; // @[Filter.scala 102:46]
  wire [3:0] _GEN_409 = 8'h99 == _T_70[7:0] ? 4'hf : _GEN_408; // @[Filter.scala 102:46]
  wire [3:0] _GEN_410 = 8'h9a == _T_70[7:0] ? 4'hf : _GEN_409; // @[Filter.scala 102:46]
  wire [3:0] _GEN_411 = 8'h9b == _T_70[7:0] ? 4'hf : _GEN_410; // @[Filter.scala 102:46]
  wire [3:0] _GEN_412 = 8'h9c == _T_70[7:0] ? 4'hf : _GEN_411; // @[Filter.scala 102:46]
  wire [3:0] _GEN_413 = 8'h9d == _T_70[7:0] ? 4'hf : _GEN_412; // @[Filter.scala 102:46]
  wire [3:0] _GEN_414 = 8'h9e == _T_70[7:0] ? 4'hf : _GEN_413; // @[Filter.scala 102:46]
  wire [3:0] _GEN_415 = 8'h9f == _T_70[7:0] ? 4'hf : _GEN_414; // @[Filter.scala 102:46]
  wire [3:0] _GEN_416 = 8'ha0 == _T_70[7:0] ? 4'h8 : _GEN_415; // @[Filter.scala 102:46]
  wire [3:0] _GEN_417 = 8'ha1 == _T_70[7:0] ? 4'h8 : _GEN_416; // @[Filter.scala 102:46]
  wire [3:0] _GEN_418 = 8'ha2 == _T_70[7:0] ? 4'h8 : _GEN_417; // @[Filter.scala 102:46]
  wire [3:0] _GEN_419 = 8'ha3 == _T_70[7:0] ? 4'h8 : _GEN_418; // @[Filter.scala 102:46]
  wire [3:0] _GEN_420 = 8'ha4 == _T_70[7:0] ? 4'h8 : _GEN_419; // @[Filter.scala 102:46]
  wire [3:0] _GEN_421 = 8'ha5 == _T_70[7:0] ? 4'h8 : _GEN_420; // @[Filter.scala 102:46]
  wire [3:0] _GEN_422 = 8'ha6 == _T_70[7:0] ? 4'h8 : _GEN_421; // @[Filter.scala 102:46]
  wire [3:0] _GEN_423 = 8'ha7 == _T_70[7:0] ? 4'h8 : _GEN_422; // @[Filter.scala 102:46]
  wire [3:0] _GEN_424 = 8'ha8 == _T_70[7:0] ? 4'hf : _GEN_423; // @[Filter.scala 102:46]
  wire [3:0] _GEN_425 = 8'ha9 == _T_70[7:0] ? 4'hf : _GEN_424; // @[Filter.scala 102:46]
  wire [3:0] _GEN_426 = 8'haa == _T_70[7:0] ? 4'hf : _GEN_425; // @[Filter.scala 102:46]
  wire [3:0] _GEN_427 = 8'hab == _T_70[7:0] ? 4'hf : _GEN_426; // @[Filter.scala 102:46]
  wire [3:0] _GEN_428 = 8'hac == _T_70[7:0] ? 4'hf : _GEN_427; // @[Filter.scala 102:46]
  wire [3:0] _GEN_429 = 8'had == _T_70[7:0] ? 4'hf : _GEN_428; // @[Filter.scala 102:46]
  wire [3:0] _GEN_430 = 8'hae == _T_70[7:0] ? 4'hf : _GEN_429; // @[Filter.scala 102:46]
  wire [3:0] _GEN_431 = 8'haf == _T_70[7:0] ? 4'hf : _GEN_430; // @[Filter.scala 102:46]
  wire [3:0] _GEN_432 = 8'hb0 == _T_70[7:0] ? 4'h8 : _GEN_431; // @[Filter.scala 102:46]
  wire [3:0] _GEN_433 = 8'hb1 == _T_70[7:0] ? 4'h8 : _GEN_432; // @[Filter.scala 102:46]
  wire [3:0] _GEN_434 = 8'hb2 == _T_70[7:0] ? 4'h8 : _GEN_433; // @[Filter.scala 102:46]
  wire [3:0] _GEN_435 = 8'hb3 == _T_70[7:0] ? 4'h8 : _GEN_434; // @[Filter.scala 102:46]
  wire [3:0] _GEN_436 = 8'hb4 == _T_70[7:0] ? 4'h8 : _GEN_435; // @[Filter.scala 102:46]
  wire [3:0] _GEN_437 = 8'hb5 == _T_70[7:0] ? 4'h8 : _GEN_436; // @[Filter.scala 102:46]
  wire [3:0] _GEN_438 = 8'hb6 == _T_70[7:0] ? 4'h8 : _GEN_437; // @[Filter.scala 102:46]
  wire [3:0] _GEN_439 = 8'hb7 == _T_70[7:0] ? 4'h8 : _GEN_438; // @[Filter.scala 102:46]
  wire [3:0] _GEN_440 = 8'hb8 == _T_70[7:0] ? 4'hf : _GEN_439; // @[Filter.scala 102:46]
  wire [3:0] _GEN_441 = 8'hb9 == _T_70[7:0] ? 4'hf : _GEN_440; // @[Filter.scala 102:46]
  wire [3:0] _GEN_442 = 8'hba == _T_70[7:0] ? 4'hf : _GEN_441; // @[Filter.scala 102:46]
  wire [3:0] _GEN_443 = 8'hbb == _T_70[7:0] ? 4'hf : _GEN_442; // @[Filter.scala 102:46]
  wire [3:0] _GEN_444 = 8'hbc == _T_70[7:0] ? 4'hf : _GEN_443; // @[Filter.scala 102:46]
  wire [3:0] _GEN_445 = 8'hbd == _T_70[7:0] ? 4'hf : _GEN_444; // @[Filter.scala 102:46]
  wire [3:0] _GEN_446 = 8'hbe == _T_70[7:0] ? 4'hf : _GEN_445; // @[Filter.scala 102:46]
  wire [3:0] _GEN_447 = 8'hbf == _T_70[7:0] ? 4'hf : _GEN_446; // @[Filter.scala 102:46]
  wire [31:0] _T_73 = pixelIndex + 32'h2; // @[Filter.scala 97:29]
  wire [31:0] _T_74 = _T_73 / 32'h10; // @[Filter.scala 97:36]
  wire [31:0] _T_76 = _T_74 + _GEN_1765; // @[Filter.scala 97:51]
  wire [31:0] _T_78 = _T_76 - 32'h1; // @[Filter.scala 97:67]
  wire [31:0] _GEN_2 = _T_73 % 32'h10; // @[Filter.scala 98:36]
  wire [4:0] _T_81 = _GEN_2[4:0]; // @[Filter.scala 98:36]
  wire [4:0] _T_83 = _T_81 + _GEN_1766; // @[Filter.scala 98:51]
  wire [4:0] _T_85 = _T_83 - 5'h1; // @[Filter.scala 98:67]
  wire  _T_87 = _T_78 >= 32'h10; // @[Filter.scala 99:27]
  wire  _T_91 = _T_85 >= 5'hc; // @[Filter.scala 99:59]
  wire  _T_92 = _T_87 | _T_91; // @[Filter.scala 99:54]
  wire [9:0] _T_93 = _T_85 * 5'h10; // @[Filter.scala 102:57]
  wire [31:0] _GEN_1773 = {{22'd0}, _T_93}; // @[Filter.scala 102:72]
  wire [31:0] _T_95 = _GEN_1773 + _T_78; // @[Filter.scala 102:72]
  wire [3:0] _GEN_457 = 8'h8 == _T_95[7:0] ? 4'h4 : 4'h0; // @[Filter.scala 102:46]
  wire [3:0] _GEN_458 = 8'h9 == _T_95[7:0] ? 4'h4 : _GEN_457; // @[Filter.scala 102:46]
  wire [3:0] _GEN_459 = 8'ha == _T_95[7:0] ? 4'h4 : _GEN_458; // @[Filter.scala 102:46]
  wire [3:0] _GEN_460 = 8'hb == _T_95[7:0] ? 4'h4 : _GEN_459; // @[Filter.scala 102:46]
  wire [3:0] _GEN_461 = 8'hc == _T_95[7:0] ? 4'h4 : _GEN_460; // @[Filter.scala 102:46]
  wire [3:0] _GEN_462 = 8'hd == _T_95[7:0] ? 4'h4 : _GEN_461; // @[Filter.scala 102:46]
  wire [3:0] _GEN_463 = 8'he == _T_95[7:0] ? 4'h4 : _GEN_462; // @[Filter.scala 102:46]
  wire [3:0] _GEN_464 = 8'hf == _T_95[7:0] ? 4'h4 : _GEN_463; // @[Filter.scala 102:46]
  wire [3:0] _GEN_465 = 8'h10 == _T_95[7:0] ? 4'h0 : _GEN_464; // @[Filter.scala 102:46]
  wire [3:0] _GEN_466 = 8'h11 == _T_95[7:0] ? 4'h0 : _GEN_465; // @[Filter.scala 102:46]
  wire [3:0] _GEN_467 = 8'h12 == _T_95[7:0] ? 4'h0 : _GEN_466; // @[Filter.scala 102:46]
  wire [3:0] _GEN_468 = 8'h13 == _T_95[7:0] ? 4'h0 : _GEN_467; // @[Filter.scala 102:46]
  wire [3:0] _GEN_469 = 8'h14 == _T_95[7:0] ? 4'h0 : _GEN_468; // @[Filter.scala 102:46]
  wire [3:0] _GEN_470 = 8'h15 == _T_95[7:0] ? 4'h0 : _GEN_469; // @[Filter.scala 102:46]
  wire [3:0] _GEN_471 = 8'h16 == _T_95[7:0] ? 4'h0 : _GEN_470; // @[Filter.scala 102:46]
  wire [3:0] _GEN_472 = 8'h17 == _T_95[7:0] ? 4'h0 : _GEN_471; // @[Filter.scala 102:46]
  wire [3:0] _GEN_473 = 8'h18 == _T_95[7:0] ? 4'h4 : _GEN_472; // @[Filter.scala 102:46]
  wire [3:0] _GEN_474 = 8'h19 == _T_95[7:0] ? 4'h4 : _GEN_473; // @[Filter.scala 102:46]
  wire [3:0] _GEN_475 = 8'h1a == _T_95[7:0] ? 4'h4 : _GEN_474; // @[Filter.scala 102:46]
  wire [3:0] _GEN_476 = 8'h1b == _T_95[7:0] ? 4'h4 : _GEN_475; // @[Filter.scala 102:46]
  wire [3:0] _GEN_477 = 8'h1c == _T_95[7:0] ? 4'h4 : _GEN_476; // @[Filter.scala 102:46]
  wire [3:0] _GEN_478 = 8'h1d == _T_95[7:0] ? 4'h4 : _GEN_477; // @[Filter.scala 102:46]
  wire [3:0] _GEN_479 = 8'h1e == _T_95[7:0] ? 4'h4 : _GEN_478; // @[Filter.scala 102:46]
  wire [3:0] _GEN_480 = 8'h1f == _T_95[7:0] ? 4'h4 : _GEN_479; // @[Filter.scala 102:46]
  wire [3:0] _GEN_481 = 8'h20 == _T_95[7:0] ? 4'h0 : _GEN_480; // @[Filter.scala 102:46]
  wire [3:0] _GEN_482 = 8'h21 == _T_95[7:0] ? 4'h0 : _GEN_481; // @[Filter.scala 102:46]
  wire [3:0] _GEN_483 = 8'h22 == _T_95[7:0] ? 4'h0 : _GEN_482; // @[Filter.scala 102:46]
  wire [3:0] _GEN_484 = 8'h23 == _T_95[7:0] ? 4'h0 : _GEN_483; // @[Filter.scala 102:46]
  wire [3:0] _GEN_485 = 8'h24 == _T_95[7:0] ? 4'h0 : _GEN_484; // @[Filter.scala 102:46]
  wire [3:0] _GEN_486 = 8'h25 == _T_95[7:0] ? 4'h0 : _GEN_485; // @[Filter.scala 102:46]
  wire [3:0] _GEN_487 = 8'h26 == _T_95[7:0] ? 4'h0 : _GEN_486; // @[Filter.scala 102:46]
  wire [3:0] _GEN_488 = 8'h27 == _T_95[7:0] ? 4'h0 : _GEN_487; // @[Filter.scala 102:46]
  wire [3:0] _GEN_489 = 8'h28 == _T_95[7:0] ? 4'h4 : _GEN_488; // @[Filter.scala 102:46]
  wire [3:0] _GEN_490 = 8'h29 == _T_95[7:0] ? 4'h4 : _GEN_489; // @[Filter.scala 102:46]
  wire [3:0] _GEN_491 = 8'h2a == _T_95[7:0] ? 4'h4 : _GEN_490; // @[Filter.scala 102:46]
  wire [3:0] _GEN_492 = 8'h2b == _T_95[7:0] ? 4'h4 : _GEN_491; // @[Filter.scala 102:46]
  wire [3:0] _GEN_493 = 8'h2c == _T_95[7:0] ? 4'h4 : _GEN_492; // @[Filter.scala 102:46]
  wire [3:0] _GEN_494 = 8'h2d == _T_95[7:0] ? 4'h4 : _GEN_493; // @[Filter.scala 102:46]
  wire [3:0] _GEN_495 = 8'h2e == _T_95[7:0] ? 4'h4 : _GEN_494; // @[Filter.scala 102:46]
  wire [3:0] _GEN_496 = 8'h2f == _T_95[7:0] ? 4'h4 : _GEN_495; // @[Filter.scala 102:46]
  wire [3:0] _GEN_497 = 8'h30 == _T_95[7:0] ? 4'h0 : _GEN_496; // @[Filter.scala 102:46]
  wire [3:0] _GEN_498 = 8'h31 == _T_95[7:0] ? 4'h0 : _GEN_497; // @[Filter.scala 102:46]
  wire [3:0] _GEN_499 = 8'h32 == _T_95[7:0] ? 4'h0 : _GEN_498; // @[Filter.scala 102:46]
  wire [3:0] _GEN_500 = 8'h33 == _T_95[7:0] ? 4'h0 : _GEN_499; // @[Filter.scala 102:46]
  wire [3:0] _GEN_501 = 8'h34 == _T_95[7:0] ? 4'h0 : _GEN_500; // @[Filter.scala 102:46]
  wire [3:0] _GEN_502 = 8'h35 == _T_95[7:0] ? 4'h0 : _GEN_501; // @[Filter.scala 102:46]
  wire [3:0] _GEN_503 = 8'h36 == _T_95[7:0] ? 4'h0 : _GEN_502; // @[Filter.scala 102:46]
  wire [3:0] _GEN_504 = 8'h37 == _T_95[7:0] ? 4'h0 : _GEN_503; // @[Filter.scala 102:46]
  wire [3:0] _GEN_505 = 8'h38 == _T_95[7:0] ? 4'h4 : _GEN_504; // @[Filter.scala 102:46]
  wire [3:0] _GEN_506 = 8'h39 == _T_95[7:0] ? 4'h4 : _GEN_505; // @[Filter.scala 102:46]
  wire [3:0] _GEN_507 = 8'h3a == _T_95[7:0] ? 4'h4 : _GEN_506; // @[Filter.scala 102:46]
  wire [3:0] _GEN_508 = 8'h3b == _T_95[7:0] ? 4'h4 : _GEN_507; // @[Filter.scala 102:46]
  wire [3:0] _GEN_509 = 8'h3c == _T_95[7:0] ? 4'h4 : _GEN_508; // @[Filter.scala 102:46]
  wire [3:0] _GEN_510 = 8'h3d == _T_95[7:0] ? 4'h4 : _GEN_509; // @[Filter.scala 102:46]
  wire [3:0] _GEN_511 = 8'h3e == _T_95[7:0] ? 4'h4 : _GEN_510; // @[Filter.scala 102:46]
  wire [3:0] _GEN_512 = 8'h3f == _T_95[7:0] ? 4'h4 : _GEN_511; // @[Filter.scala 102:46]
  wire [3:0] _GEN_513 = 8'h40 == _T_95[7:0] ? 4'h0 : _GEN_512; // @[Filter.scala 102:46]
  wire [3:0] _GEN_514 = 8'h41 == _T_95[7:0] ? 4'h0 : _GEN_513; // @[Filter.scala 102:46]
  wire [3:0] _GEN_515 = 8'h42 == _T_95[7:0] ? 4'h0 : _GEN_514; // @[Filter.scala 102:46]
  wire [3:0] _GEN_516 = 8'h43 == _T_95[7:0] ? 4'h0 : _GEN_515; // @[Filter.scala 102:46]
  wire [3:0] _GEN_517 = 8'h44 == _T_95[7:0] ? 4'h0 : _GEN_516; // @[Filter.scala 102:46]
  wire [3:0] _GEN_518 = 8'h45 == _T_95[7:0] ? 4'h0 : _GEN_517; // @[Filter.scala 102:46]
  wire [3:0] _GEN_519 = 8'h46 == _T_95[7:0] ? 4'h0 : _GEN_518; // @[Filter.scala 102:46]
  wire [3:0] _GEN_520 = 8'h47 == _T_95[7:0] ? 4'h0 : _GEN_519; // @[Filter.scala 102:46]
  wire [3:0] _GEN_521 = 8'h48 == _T_95[7:0] ? 4'h4 : _GEN_520; // @[Filter.scala 102:46]
  wire [3:0] _GEN_522 = 8'h49 == _T_95[7:0] ? 4'h4 : _GEN_521; // @[Filter.scala 102:46]
  wire [3:0] _GEN_523 = 8'h4a == _T_95[7:0] ? 4'h4 : _GEN_522; // @[Filter.scala 102:46]
  wire [3:0] _GEN_524 = 8'h4b == _T_95[7:0] ? 4'h4 : _GEN_523; // @[Filter.scala 102:46]
  wire [3:0] _GEN_525 = 8'h4c == _T_95[7:0] ? 4'h4 : _GEN_524; // @[Filter.scala 102:46]
  wire [3:0] _GEN_526 = 8'h4d == _T_95[7:0] ? 4'h4 : _GEN_525; // @[Filter.scala 102:46]
  wire [3:0] _GEN_527 = 8'h4e == _T_95[7:0] ? 4'h4 : _GEN_526; // @[Filter.scala 102:46]
  wire [3:0] _GEN_528 = 8'h4f == _T_95[7:0] ? 4'h4 : _GEN_527; // @[Filter.scala 102:46]
  wire [3:0] _GEN_529 = 8'h50 == _T_95[7:0] ? 4'h0 : _GEN_528; // @[Filter.scala 102:46]
  wire [3:0] _GEN_530 = 8'h51 == _T_95[7:0] ? 4'h0 : _GEN_529; // @[Filter.scala 102:46]
  wire [3:0] _GEN_531 = 8'h52 == _T_95[7:0] ? 4'h0 : _GEN_530; // @[Filter.scala 102:46]
  wire [3:0] _GEN_532 = 8'h53 == _T_95[7:0] ? 4'h0 : _GEN_531; // @[Filter.scala 102:46]
  wire [3:0] _GEN_533 = 8'h54 == _T_95[7:0] ? 4'h0 : _GEN_532; // @[Filter.scala 102:46]
  wire [3:0] _GEN_534 = 8'h55 == _T_95[7:0] ? 4'h0 : _GEN_533; // @[Filter.scala 102:46]
  wire [3:0] _GEN_535 = 8'h56 == _T_95[7:0] ? 4'h0 : _GEN_534; // @[Filter.scala 102:46]
  wire [3:0] _GEN_536 = 8'h57 == _T_95[7:0] ? 4'h0 : _GEN_535; // @[Filter.scala 102:46]
  wire [3:0] _GEN_537 = 8'h58 == _T_95[7:0] ? 4'h4 : _GEN_536; // @[Filter.scala 102:46]
  wire [3:0] _GEN_538 = 8'h59 == _T_95[7:0] ? 4'h4 : _GEN_537; // @[Filter.scala 102:46]
  wire [3:0] _GEN_539 = 8'h5a == _T_95[7:0] ? 4'h4 : _GEN_538; // @[Filter.scala 102:46]
  wire [3:0] _GEN_540 = 8'h5b == _T_95[7:0] ? 4'h4 : _GEN_539; // @[Filter.scala 102:46]
  wire [3:0] _GEN_541 = 8'h5c == _T_95[7:0] ? 4'h4 : _GEN_540; // @[Filter.scala 102:46]
  wire [3:0] _GEN_542 = 8'h5d == _T_95[7:0] ? 4'h4 : _GEN_541; // @[Filter.scala 102:46]
  wire [3:0] _GEN_543 = 8'h5e == _T_95[7:0] ? 4'h4 : _GEN_542; // @[Filter.scala 102:46]
  wire [3:0] _GEN_544 = 8'h5f == _T_95[7:0] ? 4'h4 : _GEN_543; // @[Filter.scala 102:46]
  wire [3:0] _GEN_545 = 8'h60 == _T_95[7:0] ? 4'h8 : _GEN_544; // @[Filter.scala 102:46]
  wire [3:0] _GEN_546 = 8'h61 == _T_95[7:0] ? 4'h8 : _GEN_545; // @[Filter.scala 102:46]
  wire [3:0] _GEN_547 = 8'h62 == _T_95[7:0] ? 4'h8 : _GEN_546; // @[Filter.scala 102:46]
  wire [3:0] _GEN_548 = 8'h63 == _T_95[7:0] ? 4'h8 : _GEN_547; // @[Filter.scala 102:46]
  wire [3:0] _GEN_549 = 8'h64 == _T_95[7:0] ? 4'h8 : _GEN_548; // @[Filter.scala 102:46]
  wire [3:0] _GEN_550 = 8'h65 == _T_95[7:0] ? 4'h8 : _GEN_549; // @[Filter.scala 102:46]
  wire [3:0] _GEN_551 = 8'h66 == _T_95[7:0] ? 4'h8 : _GEN_550; // @[Filter.scala 102:46]
  wire [3:0] _GEN_552 = 8'h67 == _T_95[7:0] ? 4'h8 : _GEN_551; // @[Filter.scala 102:46]
  wire [3:0] _GEN_553 = 8'h68 == _T_95[7:0] ? 4'hf : _GEN_552; // @[Filter.scala 102:46]
  wire [3:0] _GEN_554 = 8'h69 == _T_95[7:0] ? 4'hf : _GEN_553; // @[Filter.scala 102:46]
  wire [3:0] _GEN_555 = 8'h6a == _T_95[7:0] ? 4'hf : _GEN_554; // @[Filter.scala 102:46]
  wire [3:0] _GEN_556 = 8'h6b == _T_95[7:0] ? 4'hf : _GEN_555; // @[Filter.scala 102:46]
  wire [3:0] _GEN_557 = 8'h6c == _T_95[7:0] ? 4'hf : _GEN_556; // @[Filter.scala 102:46]
  wire [3:0] _GEN_558 = 8'h6d == _T_95[7:0] ? 4'hf : _GEN_557; // @[Filter.scala 102:46]
  wire [3:0] _GEN_559 = 8'h6e == _T_95[7:0] ? 4'hf : _GEN_558; // @[Filter.scala 102:46]
  wire [3:0] _GEN_560 = 8'h6f == _T_95[7:0] ? 4'hf : _GEN_559; // @[Filter.scala 102:46]
  wire [3:0] _GEN_561 = 8'h70 == _T_95[7:0] ? 4'h8 : _GEN_560; // @[Filter.scala 102:46]
  wire [3:0] _GEN_562 = 8'h71 == _T_95[7:0] ? 4'h8 : _GEN_561; // @[Filter.scala 102:46]
  wire [3:0] _GEN_563 = 8'h72 == _T_95[7:0] ? 4'h8 : _GEN_562; // @[Filter.scala 102:46]
  wire [3:0] _GEN_564 = 8'h73 == _T_95[7:0] ? 4'h8 : _GEN_563; // @[Filter.scala 102:46]
  wire [3:0] _GEN_565 = 8'h74 == _T_95[7:0] ? 4'h8 : _GEN_564; // @[Filter.scala 102:46]
  wire [3:0] _GEN_566 = 8'h75 == _T_95[7:0] ? 4'h8 : _GEN_565; // @[Filter.scala 102:46]
  wire [3:0] _GEN_567 = 8'h76 == _T_95[7:0] ? 4'h8 : _GEN_566; // @[Filter.scala 102:46]
  wire [3:0] _GEN_568 = 8'h77 == _T_95[7:0] ? 4'h8 : _GEN_567; // @[Filter.scala 102:46]
  wire [3:0] _GEN_569 = 8'h78 == _T_95[7:0] ? 4'hf : _GEN_568; // @[Filter.scala 102:46]
  wire [3:0] _GEN_570 = 8'h79 == _T_95[7:0] ? 4'hf : _GEN_569; // @[Filter.scala 102:46]
  wire [3:0] _GEN_571 = 8'h7a == _T_95[7:0] ? 4'hf : _GEN_570; // @[Filter.scala 102:46]
  wire [3:0] _GEN_572 = 8'h7b == _T_95[7:0] ? 4'hf : _GEN_571; // @[Filter.scala 102:46]
  wire [3:0] _GEN_573 = 8'h7c == _T_95[7:0] ? 4'hf : _GEN_572; // @[Filter.scala 102:46]
  wire [3:0] _GEN_574 = 8'h7d == _T_95[7:0] ? 4'hf : _GEN_573; // @[Filter.scala 102:46]
  wire [3:0] _GEN_575 = 8'h7e == _T_95[7:0] ? 4'hf : _GEN_574; // @[Filter.scala 102:46]
  wire [3:0] _GEN_576 = 8'h7f == _T_95[7:0] ? 4'hf : _GEN_575; // @[Filter.scala 102:46]
  wire [3:0] _GEN_577 = 8'h80 == _T_95[7:0] ? 4'h8 : _GEN_576; // @[Filter.scala 102:46]
  wire [3:0] _GEN_578 = 8'h81 == _T_95[7:0] ? 4'h8 : _GEN_577; // @[Filter.scala 102:46]
  wire [3:0] _GEN_579 = 8'h82 == _T_95[7:0] ? 4'h8 : _GEN_578; // @[Filter.scala 102:46]
  wire [3:0] _GEN_580 = 8'h83 == _T_95[7:0] ? 4'h8 : _GEN_579; // @[Filter.scala 102:46]
  wire [3:0] _GEN_581 = 8'h84 == _T_95[7:0] ? 4'h8 : _GEN_580; // @[Filter.scala 102:46]
  wire [3:0] _GEN_582 = 8'h85 == _T_95[7:0] ? 4'h8 : _GEN_581; // @[Filter.scala 102:46]
  wire [3:0] _GEN_583 = 8'h86 == _T_95[7:0] ? 4'h8 : _GEN_582; // @[Filter.scala 102:46]
  wire [3:0] _GEN_584 = 8'h87 == _T_95[7:0] ? 4'h8 : _GEN_583; // @[Filter.scala 102:46]
  wire [3:0] _GEN_585 = 8'h88 == _T_95[7:0] ? 4'hf : _GEN_584; // @[Filter.scala 102:46]
  wire [3:0] _GEN_586 = 8'h89 == _T_95[7:0] ? 4'hf : _GEN_585; // @[Filter.scala 102:46]
  wire [3:0] _GEN_587 = 8'h8a == _T_95[7:0] ? 4'hf : _GEN_586; // @[Filter.scala 102:46]
  wire [3:0] _GEN_588 = 8'h8b == _T_95[7:0] ? 4'hf : _GEN_587; // @[Filter.scala 102:46]
  wire [3:0] _GEN_589 = 8'h8c == _T_95[7:0] ? 4'hf : _GEN_588; // @[Filter.scala 102:46]
  wire [3:0] _GEN_590 = 8'h8d == _T_95[7:0] ? 4'hf : _GEN_589; // @[Filter.scala 102:46]
  wire [3:0] _GEN_591 = 8'h8e == _T_95[7:0] ? 4'hf : _GEN_590; // @[Filter.scala 102:46]
  wire [3:0] _GEN_592 = 8'h8f == _T_95[7:0] ? 4'hf : _GEN_591; // @[Filter.scala 102:46]
  wire [3:0] _GEN_593 = 8'h90 == _T_95[7:0] ? 4'h8 : _GEN_592; // @[Filter.scala 102:46]
  wire [3:0] _GEN_594 = 8'h91 == _T_95[7:0] ? 4'h8 : _GEN_593; // @[Filter.scala 102:46]
  wire [3:0] _GEN_595 = 8'h92 == _T_95[7:0] ? 4'h8 : _GEN_594; // @[Filter.scala 102:46]
  wire [3:0] _GEN_596 = 8'h93 == _T_95[7:0] ? 4'h8 : _GEN_595; // @[Filter.scala 102:46]
  wire [3:0] _GEN_597 = 8'h94 == _T_95[7:0] ? 4'h8 : _GEN_596; // @[Filter.scala 102:46]
  wire [3:0] _GEN_598 = 8'h95 == _T_95[7:0] ? 4'h8 : _GEN_597; // @[Filter.scala 102:46]
  wire [3:0] _GEN_599 = 8'h96 == _T_95[7:0] ? 4'h8 : _GEN_598; // @[Filter.scala 102:46]
  wire [3:0] _GEN_600 = 8'h97 == _T_95[7:0] ? 4'h8 : _GEN_599; // @[Filter.scala 102:46]
  wire [3:0] _GEN_601 = 8'h98 == _T_95[7:0] ? 4'hf : _GEN_600; // @[Filter.scala 102:46]
  wire [3:0] _GEN_602 = 8'h99 == _T_95[7:0] ? 4'hf : _GEN_601; // @[Filter.scala 102:46]
  wire [3:0] _GEN_603 = 8'h9a == _T_95[7:0] ? 4'hf : _GEN_602; // @[Filter.scala 102:46]
  wire [3:0] _GEN_604 = 8'h9b == _T_95[7:0] ? 4'hf : _GEN_603; // @[Filter.scala 102:46]
  wire [3:0] _GEN_605 = 8'h9c == _T_95[7:0] ? 4'hf : _GEN_604; // @[Filter.scala 102:46]
  wire [3:0] _GEN_606 = 8'h9d == _T_95[7:0] ? 4'hf : _GEN_605; // @[Filter.scala 102:46]
  wire [3:0] _GEN_607 = 8'h9e == _T_95[7:0] ? 4'hf : _GEN_606; // @[Filter.scala 102:46]
  wire [3:0] _GEN_608 = 8'h9f == _T_95[7:0] ? 4'hf : _GEN_607; // @[Filter.scala 102:46]
  wire [3:0] _GEN_609 = 8'ha0 == _T_95[7:0] ? 4'h8 : _GEN_608; // @[Filter.scala 102:46]
  wire [3:0] _GEN_610 = 8'ha1 == _T_95[7:0] ? 4'h8 : _GEN_609; // @[Filter.scala 102:46]
  wire [3:0] _GEN_611 = 8'ha2 == _T_95[7:0] ? 4'h8 : _GEN_610; // @[Filter.scala 102:46]
  wire [3:0] _GEN_612 = 8'ha3 == _T_95[7:0] ? 4'h8 : _GEN_611; // @[Filter.scala 102:46]
  wire [3:0] _GEN_613 = 8'ha4 == _T_95[7:0] ? 4'h8 : _GEN_612; // @[Filter.scala 102:46]
  wire [3:0] _GEN_614 = 8'ha5 == _T_95[7:0] ? 4'h8 : _GEN_613; // @[Filter.scala 102:46]
  wire [3:0] _GEN_615 = 8'ha6 == _T_95[7:0] ? 4'h8 : _GEN_614; // @[Filter.scala 102:46]
  wire [3:0] _GEN_616 = 8'ha7 == _T_95[7:0] ? 4'h8 : _GEN_615; // @[Filter.scala 102:46]
  wire [3:0] _GEN_617 = 8'ha8 == _T_95[7:0] ? 4'hf : _GEN_616; // @[Filter.scala 102:46]
  wire [3:0] _GEN_618 = 8'ha9 == _T_95[7:0] ? 4'hf : _GEN_617; // @[Filter.scala 102:46]
  wire [3:0] _GEN_619 = 8'haa == _T_95[7:0] ? 4'hf : _GEN_618; // @[Filter.scala 102:46]
  wire [3:0] _GEN_620 = 8'hab == _T_95[7:0] ? 4'hf : _GEN_619; // @[Filter.scala 102:46]
  wire [3:0] _GEN_621 = 8'hac == _T_95[7:0] ? 4'hf : _GEN_620; // @[Filter.scala 102:46]
  wire [3:0] _GEN_622 = 8'had == _T_95[7:0] ? 4'hf : _GEN_621; // @[Filter.scala 102:46]
  wire [3:0] _GEN_623 = 8'hae == _T_95[7:0] ? 4'hf : _GEN_622; // @[Filter.scala 102:46]
  wire [3:0] _GEN_624 = 8'haf == _T_95[7:0] ? 4'hf : _GEN_623; // @[Filter.scala 102:46]
  wire [3:0] _GEN_625 = 8'hb0 == _T_95[7:0] ? 4'h8 : _GEN_624; // @[Filter.scala 102:46]
  wire [3:0] _GEN_626 = 8'hb1 == _T_95[7:0] ? 4'h8 : _GEN_625; // @[Filter.scala 102:46]
  wire [3:0] _GEN_627 = 8'hb2 == _T_95[7:0] ? 4'h8 : _GEN_626; // @[Filter.scala 102:46]
  wire [3:0] _GEN_628 = 8'hb3 == _T_95[7:0] ? 4'h8 : _GEN_627; // @[Filter.scala 102:46]
  wire [3:0] _GEN_629 = 8'hb4 == _T_95[7:0] ? 4'h8 : _GEN_628; // @[Filter.scala 102:46]
  wire [3:0] _GEN_630 = 8'hb5 == _T_95[7:0] ? 4'h8 : _GEN_629; // @[Filter.scala 102:46]
  wire [3:0] _GEN_631 = 8'hb6 == _T_95[7:0] ? 4'h8 : _GEN_630; // @[Filter.scala 102:46]
  wire [3:0] _GEN_632 = 8'hb7 == _T_95[7:0] ? 4'h8 : _GEN_631; // @[Filter.scala 102:46]
  wire [3:0] _GEN_633 = 8'hb8 == _T_95[7:0] ? 4'hf : _GEN_632; // @[Filter.scala 102:46]
  wire [3:0] _GEN_634 = 8'hb9 == _T_95[7:0] ? 4'hf : _GEN_633; // @[Filter.scala 102:46]
  wire [3:0] _GEN_635 = 8'hba == _T_95[7:0] ? 4'hf : _GEN_634; // @[Filter.scala 102:46]
  wire [3:0] _GEN_636 = 8'hbb == _T_95[7:0] ? 4'hf : _GEN_635; // @[Filter.scala 102:46]
  wire [3:0] _GEN_637 = 8'hbc == _T_95[7:0] ? 4'hf : _GEN_636; // @[Filter.scala 102:46]
  wire [3:0] _GEN_638 = 8'hbd == _T_95[7:0] ? 4'hf : _GEN_637; // @[Filter.scala 102:46]
  wire [3:0] _GEN_639 = 8'hbe == _T_95[7:0] ? 4'hf : _GEN_638; // @[Filter.scala 102:46]
  wire [3:0] _GEN_640 = 8'hbf == _T_95[7:0] ? 4'hf : _GEN_639; // @[Filter.scala 102:46]
  wire [31:0] _T_98 = pixelIndex + 32'h3; // @[Filter.scala 97:29]
  wire [31:0] _T_99 = _T_98 / 32'h10; // @[Filter.scala 97:36]
  wire [31:0] _T_101 = _T_99 + _GEN_1765; // @[Filter.scala 97:51]
  wire [31:0] _T_103 = _T_101 - 32'h1; // @[Filter.scala 97:67]
  wire [31:0] _GEN_3 = _T_98 % 32'h10; // @[Filter.scala 98:36]
  wire [4:0] _T_106 = _GEN_3[4:0]; // @[Filter.scala 98:36]
  wire [4:0] _T_108 = _T_106 + _GEN_1766; // @[Filter.scala 98:51]
  wire [4:0] _T_110 = _T_108 - 5'h1; // @[Filter.scala 98:67]
  wire  _T_112 = _T_103 >= 32'h10; // @[Filter.scala 99:27]
  wire  _T_116 = _T_110 >= 5'hc; // @[Filter.scala 99:59]
  wire  _T_117 = _T_112 | _T_116; // @[Filter.scala 99:54]
  wire [9:0] _T_118 = _T_110 * 5'h10; // @[Filter.scala 102:57]
  wire [31:0] _GEN_1776 = {{22'd0}, _T_118}; // @[Filter.scala 102:72]
  wire [31:0] _T_120 = _GEN_1776 + _T_103; // @[Filter.scala 102:72]
  wire [3:0] _GEN_650 = 8'h8 == _T_120[7:0] ? 4'h4 : 4'h0; // @[Filter.scala 102:46]
  wire [3:0] _GEN_651 = 8'h9 == _T_120[7:0] ? 4'h4 : _GEN_650; // @[Filter.scala 102:46]
  wire [3:0] _GEN_652 = 8'ha == _T_120[7:0] ? 4'h4 : _GEN_651; // @[Filter.scala 102:46]
  wire [3:0] _GEN_653 = 8'hb == _T_120[7:0] ? 4'h4 : _GEN_652; // @[Filter.scala 102:46]
  wire [3:0] _GEN_654 = 8'hc == _T_120[7:0] ? 4'h4 : _GEN_653; // @[Filter.scala 102:46]
  wire [3:0] _GEN_655 = 8'hd == _T_120[7:0] ? 4'h4 : _GEN_654; // @[Filter.scala 102:46]
  wire [3:0] _GEN_656 = 8'he == _T_120[7:0] ? 4'h4 : _GEN_655; // @[Filter.scala 102:46]
  wire [3:0] _GEN_657 = 8'hf == _T_120[7:0] ? 4'h4 : _GEN_656; // @[Filter.scala 102:46]
  wire [3:0] _GEN_658 = 8'h10 == _T_120[7:0] ? 4'h0 : _GEN_657; // @[Filter.scala 102:46]
  wire [3:0] _GEN_659 = 8'h11 == _T_120[7:0] ? 4'h0 : _GEN_658; // @[Filter.scala 102:46]
  wire [3:0] _GEN_660 = 8'h12 == _T_120[7:0] ? 4'h0 : _GEN_659; // @[Filter.scala 102:46]
  wire [3:0] _GEN_661 = 8'h13 == _T_120[7:0] ? 4'h0 : _GEN_660; // @[Filter.scala 102:46]
  wire [3:0] _GEN_662 = 8'h14 == _T_120[7:0] ? 4'h0 : _GEN_661; // @[Filter.scala 102:46]
  wire [3:0] _GEN_663 = 8'h15 == _T_120[7:0] ? 4'h0 : _GEN_662; // @[Filter.scala 102:46]
  wire [3:0] _GEN_664 = 8'h16 == _T_120[7:0] ? 4'h0 : _GEN_663; // @[Filter.scala 102:46]
  wire [3:0] _GEN_665 = 8'h17 == _T_120[7:0] ? 4'h0 : _GEN_664; // @[Filter.scala 102:46]
  wire [3:0] _GEN_666 = 8'h18 == _T_120[7:0] ? 4'h4 : _GEN_665; // @[Filter.scala 102:46]
  wire [3:0] _GEN_667 = 8'h19 == _T_120[7:0] ? 4'h4 : _GEN_666; // @[Filter.scala 102:46]
  wire [3:0] _GEN_668 = 8'h1a == _T_120[7:0] ? 4'h4 : _GEN_667; // @[Filter.scala 102:46]
  wire [3:0] _GEN_669 = 8'h1b == _T_120[7:0] ? 4'h4 : _GEN_668; // @[Filter.scala 102:46]
  wire [3:0] _GEN_670 = 8'h1c == _T_120[7:0] ? 4'h4 : _GEN_669; // @[Filter.scala 102:46]
  wire [3:0] _GEN_671 = 8'h1d == _T_120[7:0] ? 4'h4 : _GEN_670; // @[Filter.scala 102:46]
  wire [3:0] _GEN_672 = 8'h1e == _T_120[7:0] ? 4'h4 : _GEN_671; // @[Filter.scala 102:46]
  wire [3:0] _GEN_673 = 8'h1f == _T_120[7:0] ? 4'h4 : _GEN_672; // @[Filter.scala 102:46]
  wire [3:0] _GEN_674 = 8'h20 == _T_120[7:0] ? 4'h0 : _GEN_673; // @[Filter.scala 102:46]
  wire [3:0] _GEN_675 = 8'h21 == _T_120[7:0] ? 4'h0 : _GEN_674; // @[Filter.scala 102:46]
  wire [3:0] _GEN_676 = 8'h22 == _T_120[7:0] ? 4'h0 : _GEN_675; // @[Filter.scala 102:46]
  wire [3:0] _GEN_677 = 8'h23 == _T_120[7:0] ? 4'h0 : _GEN_676; // @[Filter.scala 102:46]
  wire [3:0] _GEN_678 = 8'h24 == _T_120[7:0] ? 4'h0 : _GEN_677; // @[Filter.scala 102:46]
  wire [3:0] _GEN_679 = 8'h25 == _T_120[7:0] ? 4'h0 : _GEN_678; // @[Filter.scala 102:46]
  wire [3:0] _GEN_680 = 8'h26 == _T_120[7:0] ? 4'h0 : _GEN_679; // @[Filter.scala 102:46]
  wire [3:0] _GEN_681 = 8'h27 == _T_120[7:0] ? 4'h0 : _GEN_680; // @[Filter.scala 102:46]
  wire [3:0] _GEN_682 = 8'h28 == _T_120[7:0] ? 4'h4 : _GEN_681; // @[Filter.scala 102:46]
  wire [3:0] _GEN_683 = 8'h29 == _T_120[7:0] ? 4'h4 : _GEN_682; // @[Filter.scala 102:46]
  wire [3:0] _GEN_684 = 8'h2a == _T_120[7:0] ? 4'h4 : _GEN_683; // @[Filter.scala 102:46]
  wire [3:0] _GEN_685 = 8'h2b == _T_120[7:0] ? 4'h4 : _GEN_684; // @[Filter.scala 102:46]
  wire [3:0] _GEN_686 = 8'h2c == _T_120[7:0] ? 4'h4 : _GEN_685; // @[Filter.scala 102:46]
  wire [3:0] _GEN_687 = 8'h2d == _T_120[7:0] ? 4'h4 : _GEN_686; // @[Filter.scala 102:46]
  wire [3:0] _GEN_688 = 8'h2e == _T_120[7:0] ? 4'h4 : _GEN_687; // @[Filter.scala 102:46]
  wire [3:0] _GEN_689 = 8'h2f == _T_120[7:0] ? 4'h4 : _GEN_688; // @[Filter.scala 102:46]
  wire [3:0] _GEN_690 = 8'h30 == _T_120[7:0] ? 4'h0 : _GEN_689; // @[Filter.scala 102:46]
  wire [3:0] _GEN_691 = 8'h31 == _T_120[7:0] ? 4'h0 : _GEN_690; // @[Filter.scala 102:46]
  wire [3:0] _GEN_692 = 8'h32 == _T_120[7:0] ? 4'h0 : _GEN_691; // @[Filter.scala 102:46]
  wire [3:0] _GEN_693 = 8'h33 == _T_120[7:0] ? 4'h0 : _GEN_692; // @[Filter.scala 102:46]
  wire [3:0] _GEN_694 = 8'h34 == _T_120[7:0] ? 4'h0 : _GEN_693; // @[Filter.scala 102:46]
  wire [3:0] _GEN_695 = 8'h35 == _T_120[7:0] ? 4'h0 : _GEN_694; // @[Filter.scala 102:46]
  wire [3:0] _GEN_696 = 8'h36 == _T_120[7:0] ? 4'h0 : _GEN_695; // @[Filter.scala 102:46]
  wire [3:0] _GEN_697 = 8'h37 == _T_120[7:0] ? 4'h0 : _GEN_696; // @[Filter.scala 102:46]
  wire [3:0] _GEN_698 = 8'h38 == _T_120[7:0] ? 4'h4 : _GEN_697; // @[Filter.scala 102:46]
  wire [3:0] _GEN_699 = 8'h39 == _T_120[7:0] ? 4'h4 : _GEN_698; // @[Filter.scala 102:46]
  wire [3:0] _GEN_700 = 8'h3a == _T_120[7:0] ? 4'h4 : _GEN_699; // @[Filter.scala 102:46]
  wire [3:0] _GEN_701 = 8'h3b == _T_120[7:0] ? 4'h4 : _GEN_700; // @[Filter.scala 102:46]
  wire [3:0] _GEN_702 = 8'h3c == _T_120[7:0] ? 4'h4 : _GEN_701; // @[Filter.scala 102:46]
  wire [3:0] _GEN_703 = 8'h3d == _T_120[7:0] ? 4'h4 : _GEN_702; // @[Filter.scala 102:46]
  wire [3:0] _GEN_704 = 8'h3e == _T_120[7:0] ? 4'h4 : _GEN_703; // @[Filter.scala 102:46]
  wire [3:0] _GEN_705 = 8'h3f == _T_120[7:0] ? 4'h4 : _GEN_704; // @[Filter.scala 102:46]
  wire [3:0] _GEN_706 = 8'h40 == _T_120[7:0] ? 4'h0 : _GEN_705; // @[Filter.scala 102:46]
  wire [3:0] _GEN_707 = 8'h41 == _T_120[7:0] ? 4'h0 : _GEN_706; // @[Filter.scala 102:46]
  wire [3:0] _GEN_708 = 8'h42 == _T_120[7:0] ? 4'h0 : _GEN_707; // @[Filter.scala 102:46]
  wire [3:0] _GEN_709 = 8'h43 == _T_120[7:0] ? 4'h0 : _GEN_708; // @[Filter.scala 102:46]
  wire [3:0] _GEN_710 = 8'h44 == _T_120[7:0] ? 4'h0 : _GEN_709; // @[Filter.scala 102:46]
  wire [3:0] _GEN_711 = 8'h45 == _T_120[7:0] ? 4'h0 : _GEN_710; // @[Filter.scala 102:46]
  wire [3:0] _GEN_712 = 8'h46 == _T_120[7:0] ? 4'h0 : _GEN_711; // @[Filter.scala 102:46]
  wire [3:0] _GEN_713 = 8'h47 == _T_120[7:0] ? 4'h0 : _GEN_712; // @[Filter.scala 102:46]
  wire [3:0] _GEN_714 = 8'h48 == _T_120[7:0] ? 4'h4 : _GEN_713; // @[Filter.scala 102:46]
  wire [3:0] _GEN_715 = 8'h49 == _T_120[7:0] ? 4'h4 : _GEN_714; // @[Filter.scala 102:46]
  wire [3:0] _GEN_716 = 8'h4a == _T_120[7:0] ? 4'h4 : _GEN_715; // @[Filter.scala 102:46]
  wire [3:0] _GEN_717 = 8'h4b == _T_120[7:0] ? 4'h4 : _GEN_716; // @[Filter.scala 102:46]
  wire [3:0] _GEN_718 = 8'h4c == _T_120[7:0] ? 4'h4 : _GEN_717; // @[Filter.scala 102:46]
  wire [3:0] _GEN_719 = 8'h4d == _T_120[7:0] ? 4'h4 : _GEN_718; // @[Filter.scala 102:46]
  wire [3:0] _GEN_720 = 8'h4e == _T_120[7:0] ? 4'h4 : _GEN_719; // @[Filter.scala 102:46]
  wire [3:0] _GEN_721 = 8'h4f == _T_120[7:0] ? 4'h4 : _GEN_720; // @[Filter.scala 102:46]
  wire [3:0] _GEN_722 = 8'h50 == _T_120[7:0] ? 4'h0 : _GEN_721; // @[Filter.scala 102:46]
  wire [3:0] _GEN_723 = 8'h51 == _T_120[7:0] ? 4'h0 : _GEN_722; // @[Filter.scala 102:46]
  wire [3:0] _GEN_724 = 8'h52 == _T_120[7:0] ? 4'h0 : _GEN_723; // @[Filter.scala 102:46]
  wire [3:0] _GEN_725 = 8'h53 == _T_120[7:0] ? 4'h0 : _GEN_724; // @[Filter.scala 102:46]
  wire [3:0] _GEN_726 = 8'h54 == _T_120[7:0] ? 4'h0 : _GEN_725; // @[Filter.scala 102:46]
  wire [3:0] _GEN_727 = 8'h55 == _T_120[7:0] ? 4'h0 : _GEN_726; // @[Filter.scala 102:46]
  wire [3:0] _GEN_728 = 8'h56 == _T_120[7:0] ? 4'h0 : _GEN_727; // @[Filter.scala 102:46]
  wire [3:0] _GEN_729 = 8'h57 == _T_120[7:0] ? 4'h0 : _GEN_728; // @[Filter.scala 102:46]
  wire [3:0] _GEN_730 = 8'h58 == _T_120[7:0] ? 4'h4 : _GEN_729; // @[Filter.scala 102:46]
  wire [3:0] _GEN_731 = 8'h59 == _T_120[7:0] ? 4'h4 : _GEN_730; // @[Filter.scala 102:46]
  wire [3:0] _GEN_732 = 8'h5a == _T_120[7:0] ? 4'h4 : _GEN_731; // @[Filter.scala 102:46]
  wire [3:0] _GEN_733 = 8'h5b == _T_120[7:0] ? 4'h4 : _GEN_732; // @[Filter.scala 102:46]
  wire [3:0] _GEN_734 = 8'h5c == _T_120[7:0] ? 4'h4 : _GEN_733; // @[Filter.scala 102:46]
  wire [3:0] _GEN_735 = 8'h5d == _T_120[7:0] ? 4'h4 : _GEN_734; // @[Filter.scala 102:46]
  wire [3:0] _GEN_736 = 8'h5e == _T_120[7:0] ? 4'h4 : _GEN_735; // @[Filter.scala 102:46]
  wire [3:0] _GEN_737 = 8'h5f == _T_120[7:0] ? 4'h4 : _GEN_736; // @[Filter.scala 102:46]
  wire [3:0] _GEN_738 = 8'h60 == _T_120[7:0] ? 4'h8 : _GEN_737; // @[Filter.scala 102:46]
  wire [3:0] _GEN_739 = 8'h61 == _T_120[7:0] ? 4'h8 : _GEN_738; // @[Filter.scala 102:46]
  wire [3:0] _GEN_740 = 8'h62 == _T_120[7:0] ? 4'h8 : _GEN_739; // @[Filter.scala 102:46]
  wire [3:0] _GEN_741 = 8'h63 == _T_120[7:0] ? 4'h8 : _GEN_740; // @[Filter.scala 102:46]
  wire [3:0] _GEN_742 = 8'h64 == _T_120[7:0] ? 4'h8 : _GEN_741; // @[Filter.scala 102:46]
  wire [3:0] _GEN_743 = 8'h65 == _T_120[7:0] ? 4'h8 : _GEN_742; // @[Filter.scala 102:46]
  wire [3:0] _GEN_744 = 8'h66 == _T_120[7:0] ? 4'h8 : _GEN_743; // @[Filter.scala 102:46]
  wire [3:0] _GEN_745 = 8'h67 == _T_120[7:0] ? 4'h8 : _GEN_744; // @[Filter.scala 102:46]
  wire [3:0] _GEN_746 = 8'h68 == _T_120[7:0] ? 4'hf : _GEN_745; // @[Filter.scala 102:46]
  wire [3:0] _GEN_747 = 8'h69 == _T_120[7:0] ? 4'hf : _GEN_746; // @[Filter.scala 102:46]
  wire [3:0] _GEN_748 = 8'h6a == _T_120[7:0] ? 4'hf : _GEN_747; // @[Filter.scala 102:46]
  wire [3:0] _GEN_749 = 8'h6b == _T_120[7:0] ? 4'hf : _GEN_748; // @[Filter.scala 102:46]
  wire [3:0] _GEN_750 = 8'h6c == _T_120[7:0] ? 4'hf : _GEN_749; // @[Filter.scala 102:46]
  wire [3:0] _GEN_751 = 8'h6d == _T_120[7:0] ? 4'hf : _GEN_750; // @[Filter.scala 102:46]
  wire [3:0] _GEN_752 = 8'h6e == _T_120[7:0] ? 4'hf : _GEN_751; // @[Filter.scala 102:46]
  wire [3:0] _GEN_753 = 8'h6f == _T_120[7:0] ? 4'hf : _GEN_752; // @[Filter.scala 102:46]
  wire [3:0] _GEN_754 = 8'h70 == _T_120[7:0] ? 4'h8 : _GEN_753; // @[Filter.scala 102:46]
  wire [3:0] _GEN_755 = 8'h71 == _T_120[7:0] ? 4'h8 : _GEN_754; // @[Filter.scala 102:46]
  wire [3:0] _GEN_756 = 8'h72 == _T_120[7:0] ? 4'h8 : _GEN_755; // @[Filter.scala 102:46]
  wire [3:0] _GEN_757 = 8'h73 == _T_120[7:0] ? 4'h8 : _GEN_756; // @[Filter.scala 102:46]
  wire [3:0] _GEN_758 = 8'h74 == _T_120[7:0] ? 4'h8 : _GEN_757; // @[Filter.scala 102:46]
  wire [3:0] _GEN_759 = 8'h75 == _T_120[7:0] ? 4'h8 : _GEN_758; // @[Filter.scala 102:46]
  wire [3:0] _GEN_760 = 8'h76 == _T_120[7:0] ? 4'h8 : _GEN_759; // @[Filter.scala 102:46]
  wire [3:0] _GEN_761 = 8'h77 == _T_120[7:0] ? 4'h8 : _GEN_760; // @[Filter.scala 102:46]
  wire [3:0] _GEN_762 = 8'h78 == _T_120[7:0] ? 4'hf : _GEN_761; // @[Filter.scala 102:46]
  wire [3:0] _GEN_763 = 8'h79 == _T_120[7:0] ? 4'hf : _GEN_762; // @[Filter.scala 102:46]
  wire [3:0] _GEN_764 = 8'h7a == _T_120[7:0] ? 4'hf : _GEN_763; // @[Filter.scala 102:46]
  wire [3:0] _GEN_765 = 8'h7b == _T_120[7:0] ? 4'hf : _GEN_764; // @[Filter.scala 102:46]
  wire [3:0] _GEN_766 = 8'h7c == _T_120[7:0] ? 4'hf : _GEN_765; // @[Filter.scala 102:46]
  wire [3:0] _GEN_767 = 8'h7d == _T_120[7:0] ? 4'hf : _GEN_766; // @[Filter.scala 102:46]
  wire [3:0] _GEN_768 = 8'h7e == _T_120[7:0] ? 4'hf : _GEN_767; // @[Filter.scala 102:46]
  wire [3:0] _GEN_769 = 8'h7f == _T_120[7:0] ? 4'hf : _GEN_768; // @[Filter.scala 102:46]
  wire [3:0] _GEN_770 = 8'h80 == _T_120[7:0] ? 4'h8 : _GEN_769; // @[Filter.scala 102:46]
  wire [3:0] _GEN_771 = 8'h81 == _T_120[7:0] ? 4'h8 : _GEN_770; // @[Filter.scala 102:46]
  wire [3:0] _GEN_772 = 8'h82 == _T_120[7:0] ? 4'h8 : _GEN_771; // @[Filter.scala 102:46]
  wire [3:0] _GEN_773 = 8'h83 == _T_120[7:0] ? 4'h8 : _GEN_772; // @[Filter.scala 102:46]
  wire [3:0] _GEN_774 = 8'h84 == _T_120[7:0] ? 4'h8 : _GEN_773; // @[Filter.scala 102:46]
  wire [3:0] _GEN_775 = 8'h85 == _T_120[7:0] ? 4'h8 : _GEN_774; // @[Filter.scala 102:46]
  wire [3:0] _GEN_776 = 8'h86 == _T_120[7:0] ? 4'h8 : _GEN_775; // @[Filter.scala 102:46]
  wire [3:0] _GEN_777 = 8'h87 == _T_120[7:0] ? 4'h8 : _GEN_776; // @[Filter.scala 102:46]
  wire [3:0] _GEN_778 = 8'h88 == _T_120[7:0] ? 4'hf : _GEN_777; // @[Filter.scala 102:46]
  wire [3:0] _GEN_779 = 8'h89 == _T_120[7:0] ? 4'hf : _GEN_778; // @[Filter.scala 102:46]
  wire [3:0] _GEN_780 = 8'h8a == _T_120[7:0] ? 4'hf : _GEN_779; // @[Filter.scala 102:46]
  wire [3:0] _GEN_781 = 8'h8b == _T_120[7:0] ? 4'hf : _GEN_780; // @[Filter.scala 102:46]
  wire [3:0] _GEN_782 = 8'h8c == _T_120[7:0] ? 4'hf : _GEN_781; // @[Filter.scala 102:46]
  wire [3:0] _GEN_783 = 8'h8d == _T_120[7:0] ? 4'hf : _GEN_782; // @[Filter.scala 102:46]
  wire [3:0] _GEN_784 = 8'h8e == _T_120[7:0] ? 4'hf : _GEN_783; // @[Filter.scala 102:46]
  wire [3:0] _GEN_785 = 8'h8f == _T_120[7:0] ? 4'hf : _GEN_784; // @[Filter.scala 102:46]
  wire [3:0] _GEN_786 = 8'h90 == _T_120[7:0] ? 4'h8 : _GEN_785; // @[Filter.scala 102:46]
  wire [3:0] _GEN_787 = 8'h91 == _T_120[7:0] ? 4'h8 : _GEN_786; // @[Filter.scala 102:46]
  wire [3:0] _GEN_788 = 8'h92 == _T_120[7:0] ? 4'h8 : _GEN_787; // @[Filter.scala 102:46]
  wire [3:0] _GEN_789 = 8'h93 == _T_120[7:0] ? 4'h8 : _GEN_788; // @[Filter.scala 102:46]
  wire [3:0] _GEN_790 = 8'h94 == _T_120[7:0] ? 4'h8 : _GEN_789; // @[Filter.scala 102:46]
  wire [3:0] _GEN_791 = 8'h95 == _T_120[7:0] ? 4'h8 : _GEN_790; // @[Filter.scala 102:46]
  wire [3:0] _GEN_792 = 8'h96 == _T_120[7:0] ? 4'h8 : _GEN_791; // @[Filter.scala 102:46]
  wire [3:0] _GEN_793 = 8'h97 == _T_120[7:0] ? 4'h8 : _GEN_792; // @[Filter.scala 102:46]
  wire [3:0] _GEN_794 = 8'h98 == _T_120[7:0] ? 4'hf : _GEN_793; // @[Filter.scala 102:46]
  wire [3:0] _GEN_795 = 8'h99 == _T_120[7:0] ? 4'hf : _GEN_794; // @[Filter.scala 102:46]
  wire [3:0] _GEN_796 = 8'h9a == _T_120[7:0] ? 4'hf : _GEN_795; // @[Filter.scala 102:46]
  wire [3:0] _GEN_797 = 8'h9b == _T_120[7:0] ? 4'hf : _GEN_796; // @[Filter.scala 102:46]
  wire [3:0] _GEN_798 = 8'h9c == _T_120[7:0] ? 4'hf : _GEN_797; // @[Filter.scala 102:46]
  wire [3:0] _GEN_799 = 8'h9d == _T_120[7:0] ? 4'hf : _GEN_798; // @[Filter.scala 102:46]
  wire [3:0] _GEN_800 = 8'h9e == _T_120[7:0] ? 4'hf : _GEN_799; // @[Filter.scala 102:46]
  wire [3:0] _GEN_801 = 8'h9f == _T_120[7:0] ? 4'hf : _GEN_800; // @[Filter.scala 102:46]
  wire [3:0] _GEN_802 = 8'ha0 == _T_120[7:0] ? 4'h8 : _GEN_801; // @[Filter.scala 102:46]
  wire [3:0] _GEN_803 = 8'ha1 == _T_120[7:0] ? 4'h8 : _GEN_802; // @[Filter.scala 102:46]
  wire [3:0] _GEN_804 = 8'ha2 == _T_120[7:0] ? 4'h8 : _GEN_803; // @[Filter.scala 102:46]
  wire [3:0] _GEN_805 = 8'ha3 == _T_120[7:0] ? 4'h8 : _GEN_804; // @[Filter.scala 102:46]
  wire [3:0] _GEN_806 = 8'ha4 == _T_120[7:0] ? 4'h8 : _GEN_805; // @[Filter.scala 102:46]
  wire [3:0] _GEN_807 = 8'ha5 == _T_120[7:0] ? 4'h8 : _GEN_806; // @[Filter.scala 102:46]
  wire [3:0] _GEN_808 = 8'ha6 == _T_120[7:0] ? 4'h8 : _GEN_807; // @[Filter.scala 102:46]
  wire [3:0] _GEN_809 = 8'ha7 == _T_120[7:0] ? 4'h8 : _GEN_808; // @[Filter.scala 102:46]
  wire [3:0] _GEN_810 = 8'ha8 == _T_120[7:0] ? 4'hf : _GEN_809; // @[Filter.scala 102:46]
  wire [3:0] _GEN_811 = 8'ha9 == _T_120[7:0] ? 4'hf : _GEN_810; // @[Filter.scala 102:46]
  wire [3:0] _GEN_812 = 8'haa == _T_120[7:0] ? 4'hf : _GEN_811; // @[Filter.scala 102:46]
  wire [3:0] _GEN_813 = 8'hab == _T_120[7:0] ? 4'hf : _GEN_812; // @[Filter.scala 102:46]
  wire [3:0] _GEN_814 = 8'hac == _T_120[7:0] ? 4'hf : _GEN_813; // @[Filter.scala 102:46]
  wire [3:0] _GEN_815 = 8'had == _T_120[7:0] ? 4'hf : _GEN_814; // @[Filter.scala 102:46]
  wire [3:0] _GEN_816 = 8'hae == _T_120[7:0] ? 4'hf : _GEN_815; // @[Filter.scala 102:46]
  wire [3:0] _GEN_817 = 8'haf == _T_120[7:0] ? 4'hf : _GEN_816; // @[Filter.scala 102:46]
  wire [3:0] _GEN_818 = 8'hb0 == _T_120[7:0] ? 4'h8 : _GEN_817; // @[Filter.scala 102:46]
  wire [3:0] _GEN_819 = 8'hb1 == _T_120[7:0] ? 4'h8 : _GEN_818; // @[Filter.scala 102:46]
  wire [3:0] _GEN_820 = 8'hb2 == _T_120[7:0] ? 4'h8 : _GEN_819; // @[Filter.scala 102:46]
  wire [3:0] _GEN_821 = 8'hb3 == _T_120[7:0] ? 4'h8 : _GEN_820; // @[Filter.scala 102:46]
  wire [3:0] _GEN_822 = 8'hb4 == _T_120[7:0] ? 4'h8 : _GEN_821; // @[Filter.scala 102:46]
  wire [3:0] _GEN_823 = 8'hb5 == _T_120[7:0] ? 4'h8 : _GEN_822; // @[Filter.scala 102:46]
  wire [3:0] _GEN_824 = 8'hb6 == _T_120[7:0] ? 4'h8 : _GEN_823; // @[Filter.scala 102:46]
  wire [3:0] _GEN_825 = 8'hb7 == _T_120[7:0] ? 4'h8 : _GEN_824; // @[Filter.scala 102:46]
  wire [3:0] _GEN_826 = 8'hb8 == _T_120[7:0] ? 4'hf : _GEN_825; // @[Filter.scala 102:46]
  wire [3:0] _GEN_827 = 8'hb9 == _T_120[7:0] ? 4'hf : _GEN_826; // @[Filter.scala 102:46]
  wire [3:0] _GEN_828 = 8'hba == _T_120[7:0] ? 4'hf : _GEN_827; // @[Filter.scala 102:46]
  wire [3:0] _GEN_829 = 8'hbb == _T_120[7:0] ? 4'hf : _GEN_828; // @[Filter.scala 102:46]
  wire [3:0] _GEN_830 = 8'hbc == _T_120[7:0] ? 4'hf : _GEN_829; // @[Filter.scala 102:46]
  wire [3:0] _GEN_831 = 8'hbd == _T_120[7:0] ? 4'hf : _GEN_830; // @[Filter.scala 102:46]
  wire [3:0] _GEN_832 = 8'hbe == _T_120[7:0] ? 4'hf : _GEN_831; // @[Filter.scala 102:46]
  wire [3:0] _GEN_833 = 8'hbf == _T_120[7:0] ? 4'hf : _GEN_832; // @[Filter.scala 102:46]
  wire [31:0] _T_123 = pixelIndex + 32'h4; // @[Filter.scala 97:29]
  wire [31:0] _T_124 = _T_123 / 32'h10; // @[Filter.scala 97:36]
  wire [31:0] _T_126 = _T_124 + _GEN_1765; // @[Filter.scala 97:51]
  wire [31:0] _T_128 = _T_126 - 32'h1; // @[Filter.scala 97:67]
  wire [31:0] _GEN_4 = _T_123 % 32'h10; // @[Filter.scala 98:36]
  wire [4:0] _T_131 = _GEN_4[4:0]; // @[Filter.scala 98:36]
  wire [4:0] _T_133 = _T_131 + _GEN_1766; // @[Filter.scala 98:51]
  wire [4:0] _T_135 = _T_133 - 5'h1; // @[Filter.scala 98:67]
  wire  _T_137 = _T_128 >= 32'h10; // @[Filter.scala 99:27]
  wire  _T_141 = _T_135 >= 5'hc; // @[Filter.scala 99:59]
  wire  _T_142 = _T_137 | _T_141; // @[Filter.scala 99:54]
  wire [9:0] _T_143 = _T_135 * 5'h10; // @[Filter.scala 102:57]
  wire [31:0] _GEN_1779 = {{22'd0}, _T_143}; // @[Filter.scala 102:72]
  wire [31:0] _T_145 = _GEN_1779 + _T_128; // @[Filter.scala 102:72]
  wire [3:0] _GEN_843 = 8'h8 == _T_145[7:0] ? 4'h4 : 4'h0; // @[Filter.scala 102:46]
  wire [3:0] _GEN_844 = 8'h9 == _T_145[7:0] ? 4'h4 : _GEN_843; // @[Filter.scala 102:46]
  wire [3:0] _GEN_845 = 8'ha == _T_145[7:0] ? 4'h4 : _GEN_844; // @[Filter.scala 102:46]
  wire [3:0] _GEN_846 = 8'hb == _T_145[7:0] ? 4'h4 : _GEN_845; // @[Filter.scala 102:46]
  wire [3:0] _GEN_847 = 8'hc == _T_145[7:0] ? 4'h4 : _GEN_846; // @[Filter.scala 102:46]
  wire [3:0] _GEN_848 = 8'hd == _T_145[7:0] ? 4'h4 : _GEN_847; // @[Filter.scala 102:46]
  wire [3:0] _GEN_849 = 8'he == _T_145[7:0] ? 4'h4 : _GEN_848; // @[Filter.scala 102:46]
  wire [3:0] _GEN_850 = 8'hf == _T_145[7:0] ? 4'h4 : _GEN_849; // @[Filter.scala 102:46]
  wire [3:0] _GEN_851 = 8'h10 == _T_145[7:0] ? 4'h0 : _GEN_850; // @[Filter.scala 102:46]
  wire [3:0] _GEN_852 = 8'h11 == _T_145[7:0] ? 4'h0 : _GEN_851; // @[Filter.scala 102:46]
  wire [3:0] _GEN_853 = 8'h12 == _T_145[7:0] ? 4'h0 : _GEN_852; // @[Filter.scala 102:46]
  wire [3:0] _GEN_854 = 8'h13 == _T_145[7:0] ? 4'h0 : _GEN_853; // @[Filter.scala 102:46]
  wire [3:0] _GEN_855 = 8'h14 == _T_145[7:0] ? 4'h0 : _GEN_854; // @[Filter.scala 102:46]
  wire [3:0] _GEN_856 = 8'h15 == _T_145[7:0] ? 4'h0 : _GEN_855; // @[Filter.scala 102:46]
  wire [3:0] _GEN_857 = 8'h16 == _T_145[7:0] ? 4'h0 : _GEN_856; // @[Filter.scala 102:46]
  wire [3:0] _GEN_858 = 8'h17 == _T_145[7:0] ? 4'h0 : _GEN_857; // @[Filter.scala 102:46]
  wire [3:0] _GEN_859 = 8'h18 == _T_145[7:0] ? 4'h4 : _GEN_858; // @[Filter.scala 102:46]
  wire [3:0] _GEN_860 = 8'h19 == _T_145[7:0] ? 4'h4 : _GEN_859; // @[Filter.scala 102:46]
  wire [3:0] _GEN_861 = 8'h1a == _T_145[7:0] ? 4'h4 : _GEN_860; // @[Filter.scala 102:46]
  wire [3:0] _GEN_862 = 8'h1b == _T_145[7:0] ? 4'h4 : _GEN_861; // @[Filter.scala 102:46]
  wire [3:0] _GEN_863 = 8'h1c == _T_145[7:0] ? 4'h4 : _GEN_862; // @[Filter.scala 102:46]
  wire [3:0] _GEN_864 = 8'h1d == _T_145[7:0] ? 4'h4 : _GEN_863; // @[Filter.scala 102:46]
  wire [3:0] _GEN_865 = 8'h1e == _T_145[7:0] ? 4'h4 : _GEN_864; // @[Filter.scala 102:46]
  wire [3:0] _GEN_866 = 8'h1f == _T_145[7:0] ? 4'h4 : _GEN_865; // @[Filter.scala 102:46]
  wire [3:0] _GEN_867 = 8'h20 == _T_145[7:0] ? 4'h0 : _GEN_866; // @[Filter.scala 102:46]
  wire [3:0] _GEN_868 = 8'h21 == _T_145[7:0] ? 4'h0 : _GEN_867; // @[Filter.scala 102:46]
  wire [3:0] _GEN_869 = 8'h22 == _T_145[7:0] ? 4'h0 : _GEN_868; // @[Filter.scala 102:46]
  wire [3:0] _GEN_870 = 8'h23 == _T_145[7:0] ? 4'h0 : _GEN_869; // @[Filter.scala 102:46]
  wire [3:0] _GEN_871 = 8'h24 == _T_145[7:0] ? 4'h0 : _GEN_870; // @[Filter.scala 102:46]
  wire [3:0] _GEN_872 = 8'h25 == _T_145[7:0] ? 4'h0 : _GEN_871; // @[Filter.scala 102:46]
  wire [3:0] _GEN_873 = 8'h26 == _T_145[7:0] ? 4'h0 : _GEN_872; // @[Filter.scala 102:46]
  wire [3:0] _GEN_874 = 8'h27 == _T_145[7:0] ? 4'h0 : _GEN_873; // @[Filter.scala 102:46]
  wire [3:0] _GEN_875 = 8'h28 == _T_145[7:0] ? 4'h4 : _GEN_874; // @[Filter.scala 102:46]
  wire [3:0] _GEN_876 = 8'h29 == _T_145[7:0] ? 4'h4 : _GEN_875; // @[Filter.scala 102:46]
  wire [3:0] _GEN_877 = 8'h2a == _T_145[7:0] ? 4'h4 : _GEN_876; // @[Filter.scala 102:46]
  wire [3:0] _GEN_878 = 8'h2b == _T_145[7:0] ? 4'h4 : _GEN_877; // @[Filter.scala 102:46]
  wire [3:0] _GEN_879 = 8'h2c == _T_145[7:0] ? 4'h4 : _GEN_878; // @[Filter.scala 102:46]
  wire [3:0] _GEN_880 = 8'h2d == _T_145[7:0] ? 4'h4 : _GEN_879; // @[Filter.scala 102:46]
  wire [3:0] _GEN_881 = 8'h2e == _T_145[7:0] ? 4'h4 : _GEN_880; // @[Filter.scala 102:46]
  wire [3:0] _GEN_882 = 8'h2f == _T_145[7:0] ? 4'h4 : _GEN_881; // @[Filter.scala 102:46]
  wire [3:0] _GEN_883 = 8'h30 == _T_145[7:0] ? 4'h0 : _GEN_882; // @[Filter.scala 102:46]
  wire [3:0] _GEN_884 = 8'h31 == _T_145[7:0] ? 4'h0 : _GEN_883; // @[Filter.scala 102:46]
  wire [3:0] _GEN_885 = 8'h32 == _T_145[7:0] ? 4'h0 : _GEN_884; // @[Filter.scala 102:46]
  wire [3:0] _GEN_886 = 8'h33 == _T_145[7:0] ? 4'h0 : _GEN_885; // @[Filter.scala 102:46]
  wire [3:0] _GEN_887 = 8'h34 == _T_145[7:0] ? 4'h0 : _GEN_886; // @[Filter.scala 102:46]
  wire [3:0] _GEN_888 = 8'h35 == _T_145[7:0] ? 4'h0 : _GEN_887; // @[Filter.scala 102:46]
  wire [3:0] _GEN_889 = 8'h36 == _T_145[7:0] ? 4'h0 : _GEN_888; // @[Filter.scala 102:46]
  wire [3:0] _GEN_890 = 8'h37 == _T_145[7:0] ? 4'h0 : _GEN_889; // @[Filter.scala 102:46]
  wire [3:0] _GEN_891 = 8'h38 == _T_145[7:0] ? 4'h4 : _GEN_890; // @[Filter.scala 102:46]
  wire [3:0] _GEN_892 = 8'h39 == _T_145[7:0] ? 4'h4 : _GEN_891; // @[Filter.scala 102:46]
  wire [3:0] _GEN_893 = 8'h3a == _T_145[7:0] ? 4'h4 : _GEN_892; // @[Filter.scala 102:46]
  wire [3:0] _GEN_894 = 8'h3b == _T_145[7:0] ? 4'h4 : _GEN_893; // @[Filter.scala 102:46]
  wire [3:0] _GEN_895 = 8'h3c == _T_145[7:0] ? 4'h4 : _GEN_894; // @[Filter.scala 102:46]
  wire [3:0] _GEN_896 = 8'h3d == _T_145[7:0] ? 4'h4 : _GEN_895; // @[Filter.scala 102:46]
  wire [3:0] _GEN_897 = 8'h3e == _T_145[7:0] ? 4'h4 : _GEN_896; // @[Filter.scala 102:46]
  wire [3:0] _GEN_898 = 8'h3f == _T_145[7:0] ? 4'h4 : _GEN_897; // @[Filter.scala 102:46]
  wire [3:0] _GEN_899 = 8'h40 == _T_145[7:0] ? 4'h0 : _GEN_898; // @[Filter.scala 102:46]
  wire [3:0] _GEN_900 = 8'h41 == _T_145[7:0] ? 4'h0 : _GEN_899; // @[Filter.scala 102:46]
  wire [3:0] _GEN_901 = 8'h42 == _T_145[7:0] ? 4'h0 : _GEN_900; // @[Filter.scala 102:46]
  wire [3:0] _GEN_902 = 8'h43 == _T_145[7:0] ? 4'h0 : _GEN_901; // @[Filter.scala 102:46]
  wire [3:0] _GEN_903 = 8'h44 == _T_145[7:0] ? 4'h0 : _GEN_902; // @[Filter.scala 102:46]
  wire [3:0] _GEN_904 = 8'h45 == _T_145[7:0] ? 4'h0 : _GEN_903; // @[Filter.scala 102:46]
  wire [3:0] _GEN_905 = 8'h46 == _T_145[7:0] ? 4'h0 : _GEN_904; // @[Filter.scala 102:46]
  wire [3:0] _GEN_906 = 8'h47 == _T_145[7:0] ? 4'h0 : _GEN_905; // @[Filter.scala 102:46]
  wire [3:0] _GEN_907 = 8'h48 == _T_145[7:0] ? 4'h4 : _GEN_906; // @[Filter.scala 102:46]
  wire [3:0] _GEN_908 = 8'h49 == _T_145[7:0] ? 4'h4 : _GEN_907; // @[Filter.scala 102:46]
  wire [3:0] _GEN_909 = 8'h4a == _T_145[7:0] ? 4'h4 : _GEN_908; // @[Filter.scala 102:46]
  wire [3:0] _GEN_910 = 8'h4b == _T_145[7:0] ? 4'h4 : _GEN_909; // @[Filter.scala 102:46]
  wire [3:0] _GEN_911 = 8'h4c == _T_145[7:0] ? 4'h4 : _GEN_910; // @[Filter.scala 102:46]
  wire [3:0] _GEN_912 = 8'h4d == _T_145[7:0] ? 4'h4 : _GEN_911; // @[Filter.scala 102:46]
  wire [3:0] _GEN_913 = 8'h4e == _T_145[7:0] ? 4'h4 : _GEN_912; // @[Filter.scala 102:46]
  wire [3:0] _GEN_914 = 8'h4f == _T_145[7:0] ? 4'h4 : _GEN_913; // @[Filter.scala 102:46]
  wire [3:0] _GEN_915 = 8'h50 == _T_145[7:0] ? 4'h0 : _GEN_914; // @[Filter.scala 102:46]
  wire [3:0] _GEN_916 = 8'h51 == _T_145[7:0] ? 4'h0 : _GEN_915; // @[Filter.scala 102:46]
  wire [3:0] _GEN_917 = 8'h52 == _T_145[7:0] ? 4'h0 : _GEN_916; // @[Filter.scala 102:46]
  wire [3:0] _GEN_918 = 8'h53 == _T_145[7:0] ? 4'h0 : _GEN_917; // @[Filter.scala 102:46]
  wire [3:0] _GEN_919 = 8'h54 == _T_145[7:0] ? 4'h0 : _GEN_918; // @[Filter.scala 102:46]
  wire [3:0] _GEN_920 = 8'h55 == _T_145[7:0] ? 4'h0 : _GEN_919; // @[Filter.scala 102:46]
  wire [3:0] _GEN_921 = 8'h56 == _T_145[7:0] ? 4'h0 : _GEN_920; // @[Filter.scala 102:46]
  wire [3:0] _GEN_922 = 8'h57 == _T_145[7:0] ? 4'h0 : _GEN_921; // @[Filter.scala 102:46]
  wire [3:0] _GEN_923 = 8'h58 == _T_145[7:0] ? 4'h4 : _GEN_922; // @[Filter.scala 102:46]
  wire [3:0] _GEN_924 = 8'h59 == _T_145[7:0] ? 4'h4 : _GEN_923; // @[Filter.scala 102:46]
  wire [3:0] _GEN_925 = 8'h5a == _T_145[7:0] ? 4'h4 : _GEN_924; // @[Filter.scala 102:46]
  wire [3:0] _GEN_926 = 8'h5b == _T_145[7:0] ? 4'h4 : _GEN_925; // @[Filter.scala 102:46]
  wire [3:0] _GEN_927 = 8'h5c == _T_145[7:0] ? 4'h4 : _GEN_926; // @[Filter.scala 102:46]
  wire [3:0] _GEN_928 = 8'h5d == _T_145[7:0] ? 4'h4 : _GEN_927; // @[Filter.scala 102:46]
  wire [3:0] _GEN_929 = 8'h5e == _T_145[7:0] ? 4'h4 : _GEN_928; // @[Filter.scala 102:46]
  wire [3:0] _GEN_930 = 8'h5f == _T_145[7:0] ? 4'h4 : _GEN_929; // @[Filter.scala 102:46]
  wire [3:0] _GEN_931 = 8'h60 == _T_145[7:0] ? 4'h8 : _GEN_930; // @[Filter.scala 102:46]
  wire [3:0] _GEN_932 = 8'h61 == _T_145[7:0] ? 4'h8 : _GEN_931; // @[Filter.scala 102:46]
  wire [3:0] _GEN_933 = 8'h62 == _T_145[7:0] ? 4'h8 : _GEN_932; // @[Filter.scala 102:46]
  wire [3:0] _GEN_934 = 8'h63 == _T_145[7:0] ? 4'h8 : _GEN_933; // @[Filter.scala 102:46]
  wire [3:0] _GEN_935 = 8'h64 == _T_145[7:0] ? 4'h8 : _GEN_934; // @[Filter.scala 102:46]
  wire [3:0] _GEN_936 = 8'h65 == _T_145[7:0] ? 4'h8 : _GEN_935; // @[Filter.scala 102:46]
  wire [3:0] _GEN_937 = 8'h66 == _T_145[7:0] ? 4'h8 : _GEN_936; // @[Filter.scala 102:46]
  wire [3:0] _GEN_938 = 8'h67 == _T_145[7:0] ? 4'h8 : _GEN_937; // @[Filter.scala 102:46]
  wire [3:0] _GEN_939 = 8'h68 == _T_145[7:0] ? 4'hf : _GEN_938; // @[Filter.scala 102:46]
  wire [3:0] _GEN_940 = 8'h69 == _T_145[7:0] ? 4'hf : _GEN_939; // @[Filter.scala 102:46]
  wire [3:0] _GEN_941 = 8'h6a == _T_145[7:0] ? 4'hf : _GEN_940; // @[Filter.scala 102:46]
  wire [3:0] _GEN_942 = 8'h6b == _T_145[7:0] ? 4'hf : _GEN_941; // @[Filter.scala 102:46]
  wire [3:0] _GEN_943 = 8'h6c == _T_145[7:0] ? 4'hf : _GEN_942; // @[Filter.scala 102:46]
  wire [3:0] _GEN_944 = 8'h6d == _T_145[7:0] ? 4'hf : _GEN_943; // @[Filter.scala 102:46]
  wire [3:0] _GEN_945 = 8'h6e == _T_145[7:0] ? 4'hf : _GEN_944; // @[Filter.scala 102:46]
  wire [3:0] _GEN_946 = 8'h6f == _T_145[7:0] ? 4'hf : _GEN_945; // @[Filter.scala 102:46]
  wire [3:0] _GEN_947 = 8'h70 == _T_145[7:0] ? 4'h8 : _GEN_946; // @[Filter.scala 102:46]
  wire [3:0] _GEN_948 = 8'h71 == _T_145[7:0] ? 4'h8 : _GEN_947; // @[Filter.scala 102:46]
  wire [3:0] _GEN_949 = 8'h72 == _T_145[7:0] ? 4'h8 : _GEN_948; // @[Filter.scala 102:46]
  wire [3:0] _GEN_950 = 8'h73 == _T_145[7:0] ? 4'h8 : _GEN_949; // @[Filter.scala 102:46]
  wire [3:0] _GEN_951 = 8'h74 == _T_145[7:0] ? 4'h8 : _GEN_950; // @[Filter.scala 102:46]
  wire [3:0] _GEN_952 = 8'h75 == _T_145[7:0] ? 4'h8 : _GEN_951; // @[Filter.scala 102:46]
  wire [3:0] _GEN_953 = 8'h76 == _T_145[7:0] ? 4'h8 : _GEN_952; // @[Filter.scala 102:46]
  wire [3:0] _GEN_954 = 8'h77 == _T_145[7:0] ? 4'h8 : _GEN_953; // @[Filter.scala 102:46]
  wire [3:0] _GEN_955 = 8'h78 == _T_145[7:0] ? 4'hf : _GEN_954; // @[Filter.scala 102:46]
  wire [3:0] _GEN_956 = 8'h79 == _T_145[7:0] ? 4'hf : _GEN_955; // @[Filter.scala 102:46]
  wire [3:0] _GEN_957 = 8'h7a == _T_145[7:0] ? 4'hf : _GEN_956; // @[Filter.scala 102:46]
  wire [3:0] _GEN_958 = 8'h7b == _T_145[7:0] ? 4'hf : _GEN_957; // @[Filter.scala 102:46]
  wire [3:0] _GEN_959 = 8'h7c == _T_145[7:0] ? 4'hf : _GEN_958; // @[Filter.scala 102:46]
  wire [3:0] _GEN_960 = 8'h7d == _T_145[7:0] ? 4'hf : _GEN_959; // @[Filter.scala 102:46]
  wire [3:0] _GEN_961 = 8'h7e == _T_145[7:0] ? 4'hf : _GEN_960; // @[Filter.scala 102:46]
  wire [3:0] _GEN_962 = 8'h7f == _T_145[7:0] ? 4'hf : _GEN_961; // @[Filter.scala 102:46]
  wire [3:0] _GEN_963 = 8'h80 == _T_145[7:0] ? 4'h8 : _GEN_962; // @[Filter.scala 102:46]
  wire [3:0] _GEN_964 = 8'h81 == _T_145[7:0] ? 4'h8 : _GEN_963; // @[Filter.scala 102:46]
  wire [3:0] _GEN_965 = 8'h82 == _T_145[7:0] ? 4'h8 : _GEN_964; // @[Filter.scala 102:46]
  wire [3:0] _GEN_966 = 8'h83 == _T_145[7:0] ? 4'h8 : _GEN_965; // @[Filter.scala 102:46]
  wire [3:0] _GEN_967 = 8'h84 == _T_145[7:0] ? 4'h8 : _GEN_966; // @[Filter.scala 102:46]
  wire [3:0] _GEN_968 = 8'h85 == _T_145[7:0] ? 4'h8 : _GEN_967; // @[Filter.scala 102:46]
  wire [3:0] _GEN_969 = 8'h86 == _T_145[7:0] ? 4'h8 : _GEN_968; // @[Filter.scala 102:46]
  wire [3:0] _GEN_970 = 8'h87 == _T_145[7:0] ? 4'h8 : _GEN_969; // @[Filter.scala 102:46]
  wire [3:0] _GEN_971 = 8'h88 == _T_145[7:0] ? 4'hf : _GEN_970; // @[Filter.scala 102:46]
  wire [3:0] _GEN_972 = 8'h89 == _T_145[7:0] ? 4'hf : _GEN_971; // @[Filter.scala 102:46]
  wire [3:0] _GEN_973 = 8'h8a == _T_145[7:0] ? 4'hf : _GEN_972; // @[Filter.scala 102:46]
  wire [3:0] _GEN_974 = 8'h8b == _T_145[7:0] ? 4'hf : _GEN_973; // @[Filter.scala 102:46]
  wire [3:0] _GEN_975 = 8'h8c == _T_145[7:0] ? 4'hf : _GEN_974; // @[Filter.scala 102:46]
  wire [3:0] _GEN_976 = 8'h8d == _T_145[7:0] ? 4'hf : _GEN_975; // @[Filter.scala 102:46]
  wire [3:0] _GEN_977 = 8'h8e == _T_145[7:0] ? 4'hf : _GEN_976; // @[Filter.scala 102:46]
  wire [3:0] _GEN_978 = 8'h8f == _T_145[7:0] ? 4'hf : _GEN_977; // @[Filter.scala 102:46]
  wire [3:0] _GEN_979 = 8'h90 == _T_145[7:0] ? 4'h8 : _GEN_978; // @[Filter.scala 102:46]
  wire [3:0] _GEN_980 = 8'h91 == _T_145[7:0] ? 4'h8 : _GEN_979; // @[Filter.scala 102:46]
  wire [3:0] _GEN_981 = 8'h92 == _T_145[7:0] ? 4'h8 : _GEN_980; // @[Filter.scala 102:46]
  wire [3:0] _GEN_982 = 8'h93 == _T_145[7:0] ? 4'h8 : _GEN_981; // @[Filter.scala 102:46]
  wire [3:0] _GEN_983 = 8'h94 == _T_145[7:0] ? 4'h8 : _GEN_982; // @[Filter.scala 102:46]
  wire [3:0] _GEN_984 = 8'h95 == _T_145[7:0] ? 4'h8 : _GEN_983; // @[Filter.scala 102:46]
  wire [3:0] _GEN_985 = 8'h96 == _T_145[7:0] ? 4'h8 : _GEN_984; // @[Filter.scala 102:46]
  wire [3:0] _GEN_986 = 8'h97 == _T_145[7:0] ? 4'h8 : _GEN_985; // @[Filter.scala 102:46]
  wire [3:0] _GEN_987 = 8'h98 == _T_145[7:0] ? 4'hf : _GEN_986; // @[Filter.scala 102:46]
  wire [3:0] _GEN_988 = 8'h99 == _T_145[7:0] ? 4'hf : _GEN_987; // @[Filter.scala 102:46]
  wire [3:0] _GEN_989 = 8'h9a == _T_145[7:0] ? 4'hf : _GEN_988; // @[Filter.scala 102:46]
  wire [3:0] _GEN_990 = 8'h9b == _T_145[7:0] ? 4'hf : _GEN_989; // @[Filter.scala 102:46]
  wire [3:0] _GEN_991 = 8'h9c == _T_145[7:0] ? 4'hf : _GEN_990; // @[Filter.scala 102:46]
  wire [3:0] _GEN_992 = 8'h9d == _T_145[7:0] ? 4'hf : _GEN_991; // @[Filter.scala 102:46]
  wire [3:0] _GEN_993 = 8'h9e == _T_145[7:0] ? 4'hf : _GEN_992; // @[Filter.scala 102:46]
  wire [3:0] _GEN_994 = 8'h9f == _T_145[7:0] ? 4'hf : _GEN_993; // @[Filter.scala 102:46]
  wire [3:0] _GEN_995 = 8'ha0 == _T_145[7:0] ? 4'h8 : _GEN_994; // @[Filter.scala 102:46]
  wire [3:0] _GEN_996 = 8'ha1 == _T_145[7:0] ? 4'h8 : _GEN_995; // @[Filter.scala 102:46]
  wire [3:0] _GEN_997 = 8'ha2 == _T_145[7:0] ? 4'h8 : _GEN_996; // @[Filter.scala 102:46]
  wire [3:0] _GEN_998 = 8'ha3 == _T_145[7:0] ? 4'h8 : _GEN_997; // @[Filter.scala 102:46]
  wire [3:0] _GEN_999 = 8'ha4 == _T_145[7:0] ? 4'h8 : _GEN_998; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1000 = 8'ha5 == _T_145[7:0] ? 4'h8 : _GEN_999; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1001 = 8'ha6 == _T_145[7:0] ? 4'h8 : _GEN_1000; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1002 = 8'ha7 == _T_145[7:0] ? 4'h8 : _GEN_1001; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1003 = 8'ha8 == _T_145[7:0] ? 4'hf : _GEN_1002; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1004 = 8'ha9 == _T_145[7:0] ? 4'hf : _GEN_1003; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1005 = 8'haa == _T_145[7:0] ? 4'hf : _GEN_1004; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1006 = 8'hab == _T_145[7:0] ? 4'hf : _GEN_1005; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1007 = 8'hac == _T_145[7:0] ? 4'hf : _GEN_1006; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1008 = 8'had == _T_145[7:0] ? 4'hf : _GEN_1007; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1009 = 8'hae == _T_145[7:0] ? 4'hf : _GEN_1008; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1010 = 8'haf == _T_145[7:0] ? 4'hf : _GEN_1009; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1011 = 8'hb0 == _T_145[7:0] ? 4'h8 : _GEN_1010; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1012 = 8'hb1 == _T_145[7:0] ? 4'h8 : _GEN_1011; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1013 = 8'hb2 == _T_145[7:0] ? 4'h8 : _GEN_1012; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1014 = 8'hb3 == _T_145[7:0] ? 4'h8 : _GEN_1013; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1015 = 8'hb4 == _T_145[7:0] ? 4'h8 : _GEN_1014; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1016 = 8'hb5 == _T_145[7:0] ? 4'h8 : _GEN_1015; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1017 = 8'hb6 == _T_145[7:0] ? 4'h8 : _GEN_1016; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1018 = 8'hb7 == _T_145[7:0] ? 4'h8 : _GEN_1017; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1019 = 8'hb8 == _T_145[7:0] ? 4'hf : _GEN_1018; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1020 = 8'hb9 == _T_145[7:0] ? 4'hf : _GEN_1019; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1021 = 8'hba == _T_145[7:0] ? 4'hf : _GEN_1020; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1022 = 8'hbb == _T_145[7:0] ? 4'hf : _GEN_1021; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1023 = 8'hbc == _T_145[7:0] ? 4'hf : _GEN_1022; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1024 = 8'hbd == _T_145[7:0] ? 4'hf : _GEN_1023; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1025 = 8'hbe == _T_145[7:0] ? 4'hf : _GEN_1024; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1026 = 8'hbf == _T_145[7:0] ? 4'hf : _GEN_1025; // @[Filter.scala 102:46]
  wire [31:0] _T_148 = pixelIndex + 32'h5; // @[Filter.scala 97:29]
  wire [31:0] _T_149 = _T_148 / 32'h10; // @[Filter.scala 97:36]
  wire [31:0] _T_151 = _T_149 + _GEN_1765; // @[Filter.scala 97:51]
  wire [31:0] _T_153 = _T_151 - 32'h1; // @[Filter.scala 97:67]
  wire [31:0] _GEN_5 = _T_148 % 32'h10; // @[Filter.scala 98:36]
  wire [4:0] _T_156 = _GEN_5[4:0]; // @[Filter.scala 98:36]
  wire [4:0] _T_158 = _T_156 + _GEN_1766; // @[Filter.scala 98:51]
  wire [4:0] _T_160 = _T_158 - 5'h1; // @[Filter.scala 98:67]
  wire  _T_162 = _T_153 >= 32'h10; // @[Filter.scala 99:27]
  wire  _T_166 = _T_160 >= 5'hc; // @[Filter.scala 99:59]
  wire  _T_167 = _T_162 | _T_166; // @[Filter.scala 99:54]
  wire [9:0] _T_168 = _T_160 * 5'h10; // @[Filter.scala 102:57]
  wire [31:0] _GEN_1782 = {{22'd0}, _T_168}; // @[Filter.scala 102:72]
  wire [31:0] _T_170 = _GEN_1782 + _T_153; // @[Filter.scala 102:72]
  wire [3:0] _GEN_1036 = 8'h8 == _T_170[7:0] ? 4'h4 : 4'h0; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1037 = 8'h9 == _T_170[7:0] ? 4'h4 : _GEN_1036; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1038 = 8'ha == _T_170[7:0] ? 4'h4 : _GEN_1037; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1039 = 8'hb == _T_170[7:0] ? 4'h4 : _GEN_1038; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1040 = 8'hc == _T_170[7:0] ? 4'h4 : _GEN_1039; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1041 = 8'hd == _T_170[7:0] ? 4'h4 : _GEN_1040; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1042 = 8'he == _T_170[7:0] ? 4'h4 : _GEN_1041; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1043 = 8'hf == _T_170[7:0] ? 4'h4 : _GEN_1042; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1044 = 8'h10 == _T_170[7:0] ? 4'h0 : _GEN_1043; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1045 = 8'h11 == _T_170[7:0] ? 4'h0 : _GEN_1044; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1046 = 8'h12 == _T_170[7:0] ? 4'h0 : _GEN_1045; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1047 = 8'h13 == _T_170[7:0] ? 4'h0 : _GEN_1046; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1048 = 8'h14 == _T_170[7:0] ? 4'h0 : _GEN_1047; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1049 = 8'h15 == _T_170[7:0] ? 4'h0 : _GEN_1048; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1050 = 8'h16 == _T_170[7:0] ? 4'h0 : _GEN_1049; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1051 = 8'h17 == _T_170[7:0] ? 4'h0 : _GEN_1050; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1052 = 8'h18 == _T_170[7:0] ? 4'h4 : _GEN_1051; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1053 = 8'h19 == _T_170[7:0] ? 4'h4 : _GEN_1052; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1054 = 8'h1a == _T_170[7:0] ? 4'h4 : _GEN_1053; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1055 = 8'h1b == _T_170[7:0] ? 4'h4 : _GEN_1054; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1056 = 8'h1c == _T_170[7:0] ? 4'h4 : _GEN_1055; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1057 = 8'h1d == _T_170[7:0] ? 4'h4 : _GEN_1056; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1058 = 8'h1e == _T_170[7:0] ? 4'h4 : _GEN_1057; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1059 = 8'h1f == _T_170[7:0] ? 4'h4 : _GEN_1058; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1060 = 8'h20 == _T_170[7:0] ? 4'h0 : _GEN_1059; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1061 = 8'h21 == _T_170[7:0] ? 4'h0 : _GEN_1060; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1062 = 8'h22 == _T_170[7:0] ? 4'h0 : _GEN_1061; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1063 = 8'h23 == _T_170[7:0] ? 4'h0 : _GEN_1062; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1064 = 8'h24 == _T_170[7:0] ? 4'h0 : _GEN_1063; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1065 = 8'h25 == _T_170[7:0] ? 4'h0 : _GEN_1064; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1066 = 8'h26 == _T_170[7:0] ? 4'h0 : _GEN_1065; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1067 = 8'h27 == _T_170[7:0] ? 4'h0 : _GEN_1066; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1068 = 8'h28 == _T_170[7:0] ? 4'h4 : _GEN_1067; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1069 = 8'h29 == _T_170[7:0] ? 4'h4 : _GEN_1068; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1070 = 8'h2a == _T_170[7:0] ? 4'h4 : _GEN_1069; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1071 = 8'h2b == _T_170[7:0] ? 4'h4 : _GEN_1070; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1072 = 8'h2c == _T_170[7:0] ? 4'h4 : _GEN_1071; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1073 = 8'h2d == _T_170[7:0] ? 4'h4 : _GEN_1072; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1074 = 8'h2e == _T_170[7:0] ? 4'h4 : _GEN_1073; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1075 = 8'h2f == _T_170[7:0] ? 4'h4 : _GEN_1074; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1076 = 8'h30 == _T_170[7:0] ? 4'h0 : _GEN_1075; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1077 = 8'h31 == _T_170[7:0] ? 4'h0 : _GEN_1076; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1078 = 8'h32 == _T_170[7:0] ? 4'h0 : _GEN_1077; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1079 = 8'h33 == _T_170[7:0] ? 4'h0 : _GEN_1078; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1080 = 8'h34 == _T_170[7:0] ? 4'h0 : _GEN_1079; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1081 = 8'h35 == _T_170[7:0] ? 4'h0 : _GEN_1080; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1082 = 8'h36 == _T_170[7:0] ? 4'h0 : _GEN_1081; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1083 = 8'h37 == _T_170[7:0] ? 4'h0 : _GEN_1082; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1084 = 8'h38 == _T_170[7:0] ? 4'h4 : _GEN_1083; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1085 = 8'h39 == _T_170[7:0] ? 4'h4 : _GEN_1084; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1086 = 8'h3a == _T_170[7:0] ? 4'h4 : _GEN_1085; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1087 = 8'h3b == _T_170[7:0] ? 4'h4 : _GEN_1086; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1088 = 8'h3c == _T_170[7:0] ? 4'h4 : _GEN_1087; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1089 = 8'h3d == _T_170[7:0] ? 4'h4 : _GEN_1088; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1090 = 8'h3e == _T_170[7:0] ? 4'h4 : _GEN_1089; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1091 = 8'h3f == _T_170[7:0] ? 4'h4 : _GEN_1090; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1092 = 8'h40 == _T_170[7:0] ? 4'h0 : _GEN_1091; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1093 = 8'h41 == _T_170[7:0] ? 4'h0 : _GEN_1092; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1094 = 8'h42 == _T_170[7:0] ? 4'h0 : _GEN_1093; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1095 = 8'h43 == _T_170[7:0] ? 4'h0 : _GEN_1094; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1096 = 8'h44 == _T_170[7:0] ? 4'h0 : _GEN_1095; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1097 = 8'h45 == _T_170[7:0] ? 4'h0 : _GEN_1096; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1098 = 8'h46 == _T_170[7:0] ? 4'h0 : _GEN_1097; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1099 = 8'h47 == _T_170[7:0] ? 4'h0 : _GEN_1098; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1100 = 8'h48 == _T_170[7:0] ? 4'h4 : _GEN_1099; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1101 = 8'h49 == _T_170[7:0] ? 4'h4 : _GEN_1100; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1102 = 8'h4a == _T_170[7:0] ? 4'h4 : _GEN_1101; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1103 = 8'h4b == _T_170[7:0] ? 4'h4 : _GEN_1102; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1104 = 8'h4c == _T_170[7:0] ? 4'h4 : _GEN_1103; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1105 = 8'h4d == _T_170[7:0] ? 4'h4 : _GEN_1104; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1106 = 8'h4e == _T_170[7:0] ? 4'h4 : _GEN_1105; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1107 = 8'h4f == _T_170[7:0] ? 4'h4 : _GEN_1106; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1108 = 8'h50 == _T_170[7:0] ? 4'h0 : _GEN_1107; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1109 = 8'h51 == _T_170[7:0] ? 4'h0 : _GEN_1108; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1110 = 8'h52 == _T_170[7:0] ? 4'h0 : _GEN_1109; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1111 = 8'h53 == _T_170[7:0] ? 4'h0 : _GEN_1110; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1112 = 8'h54 == _T_170[7:0] ? 4'h0 : _GEN_1111; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1113 = 8'h55 == _T_170[7:0] ? 4'h0 : _GEN_1112; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1114 = 8'h56 == _T_170[7:0] ? 4'h0 : _GEN_1113; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1115 = 8'h57 == _T_170[7:0] ? 4'h0 : _GEN_1114; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1116 = 8'h58 == _T_170[7:0] ? 4'h4 : _GEN_1115; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1117 = 8'h59 == _T_170[7:0] ? 4'h4 : _GEN_1116; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1118 = 8'h5a == _T_170[7:0] ? 4'h4 : _GEN_1117; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1119 = 8'h5b == _T_170[7:0] ? 4'h4 : _GEN_1118; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1120 = 8'h5c == _T_170[7:0] ? 4'h4 : _GEN_1119; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1121 = 8'h5d == _T_170[7:0] ? 4'h4 : _GEN_1120; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1122 = 8'h5e == _T_170[7:0] ? 4'h4 : _GEN_1121; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1123 = 8'h5f == _T_170[7:0] ? 4'h4 : _GEN_1122; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1124 = 8'h60 == _T_170[7:0] ? 4'h8 : _GEN_1123; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1125 = 8'h61 == _T_170[7:0] ? 4'h8 : _GEN_1124; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1126 = 8'h62 == _T_170[7:0] ? 4'h8 : _GEN_1125; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1127 = 8'h63 == _T_170[7:0] ? 4'h8 : _GEN_1126; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1128 = 8'h64 == _T_170[7:0] ? 4'h8 : _GEN_1127; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1129 = 8'h65 == _T_170[7:0] ? 4'h8 : _GEN_1128; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1130 = 8'h66 == _T_170[7:0] ? 4'h8 : _GEN_1129; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1131 = 8'h67 == _T_170[7:0] ? 4'h8 : _GEN_1130; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1132 = 8'h68 == _T_170[7:0] ? 4'hf : _GEN_1131; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1133 = 8'h69 == _T_170[7:0] ? 4'hf : _GEN_1132; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1134 = 8'h6a == _T_170[7:0] ? 4'hf : _GEN_1133; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1135 = 8'h6b == _T_170[7:0] ? 4'hf : _GEN_1134; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1136 = 8'h6c == _T_170[7:0] ? 4'hf : _GEN_1135; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1137 = 8'h6d == _T_170[7:0] ? 4'hf : _GEN_1136; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1138 = 8'h6e == _T_170[7:0] ? 4'hf : _GEN_1137; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1139 = 8'h6f == _T_170[7:0] ? 4'hf : _GEN_1138; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1140 = 8'h70 == _T_170[7:0] ? 4'h8 : _GEN_1139; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1141 = 8'h71 == _T_170[7:0] ? 4'h8 : _GEN_1140; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1142 = 8'h72 == _T_170[7:0] ? 4'h8 : _GEN_1141; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1143 = 8'h73 == _T_170[7:0] ? 4'h8 : _GEN_1142; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1144 = 8'h74 == _T_170[7:0] ? 4'h8 : _GEN_1143; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1145 = 8'h75 == _T_170[7:0] ? 4'h8 : _GEN_1144; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1146 = 8'h76 == _T_170[7:0] ? 4'h8 : _GEN_1145; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1147 = 8'h77 == _T_170[7:0] ? 4'h8 : _GEN_1146; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1148 = 8'h78 == _T_170[7:0] ? 4'hf : _GEN_1147; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1149 = 8'h79 == _T_170[7:0] ? 4'hf : _GEN_1148; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1150 = 8'h7a == _T_170[7:0] ? 4'hf : _GEN_1149; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1151 = 8'h7b == _T_170[7:0] ? 4'hf : _GEN_1150; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1152 = 8'h7c == _T_170[7:0] ? 4'hf : _GEN_1151; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1153 = 8'h7d == _T_170[7:0] ? 4'hf : _GEN_1152; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1154 = 8'h7e == _T_170[7:0] ? 4'hf : _GEN_1153; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1155 = 8'h7f == _T_170[7:0] ? 4'hf : _GEN_1154; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1156 = 8'h80 == _T_170[7:0] ? 4'h8 : _GEN_1155; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1157 = 8'h81 == _T_170[7:0] ? 4'h8 : _GEN_1156; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1158 = 8'h82 == _T_170[7:0] ? 4'h8 : _GEN_1157; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1159 = 8'h83 == _T_170[7:0] ? 4'h8 : _GEN_1158; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1160 = 8'h84 == _T_170[7:0] ? 4'h8 : _GEN_1159; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1161 = 8'h85 == _T_170[7:0] ? 4'h8 : _GEN_1160; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1162 = 8'h86 == _T_170[7:0] ? 4'h8 : _GEN_1161; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1163 = 8'h87 == _T_170[7:0] ? 4'h8 : _GEN_1162; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1164 = 8'h88 == _T_170[7:0] ? 4'hf : _GEN_1163; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1165 = 8'h89 == _T_170[7:0] ? 4'hf : _GEN_1164; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1166 = 8'h8a == _T_170[7:0] ? 4'hf : _GEN_1165; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1167 = 8'h8b == _T_170[7:0] ? 4'hf : _GEN_1166; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1168 = 8'h8c == _T_170[7:0] ? 4'hf : _GEN_1167; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1169 = 8'h8d == _T_170[7:0] ? 4'hf : _GEN_1168; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1170 = 8'h8e == _T_170[7:0] ? 4'hf : _GEN_1169; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1171 = 8'h8f == _T_170[7:0] ? 4'hf : _GEN_1170; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1172 = 8'h90 == _T_170[7:0] ? 4'h8 : _GEN_1171; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1173 = 8'h91 == _T_170[7:0] ? 4'h8 : _GEN_1172; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1174 = 8'h92 == _T_170[7:0] ? 4'h8 : _GEN_1173; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1175 = 8'h93 == _T_170[7:0] ? 4'h8 : _GEN_1174; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1176 = 8'h94 == _T_170[7:0] ? 4'h8 : _GEN_1175; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1177 = 8'h95 == _T_170[7:0] ? 4'h8 : _GEN_1176; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1178 = 8'h96 == _T_170[7:0] ? 4'h8 : _GEN_1177; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1179 = 8'h97 == _T_170[7:0] ? 4'h8 : _GEN_1178; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1180 = 8'h98 == _T_170[7:0] ? 4'hf : _GEN_1179; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1181 = 8'h99 == _T_170[7:0] ? 4'hf : _GEN_1180; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1182 = 8'h9a == _T_170[7:0] ? 4'hf : _GEN_1181; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1183 = 8'h9b == _T_170[7:0] ? 4'hf : _GEN_1182; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1184 = 8'h9c == _T_170[7:0] ? 4'hf : _GEN_1183; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1185 = 8'h9d == _T_170[7:0] ? 4'hf : _GEN_1184; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1186 = 8'h9e == _T_170[7:0] ? 4'hf : _GEN_1185; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1187 = 8'h9f == _T_170[7:0] ? 4'hf : _GEN_1186; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1188 = 8'ha0 == _T_170[7:0] ? 4'h8 : _GEN_1187; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1189 = 8'ha1 == _T_170[7:0] ? 4'h8 : _GEN_1188; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1190 = 8'ha2 == _T_170[7:0] ? 4'h8 : _GEN_1189; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1191 = 8'ha3 == _T_170[7:0] ? 4'h8 : _GEN_1190; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1192 = 8'ha4 == _T_170[7:0] ? 4'h8 : _GEN_1191; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1193 = 8'ha5 == _T_170[7:0] ? 4'h8 : _GEN_1192; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1194 = 8'ha6 == _T_170[7:0] ? 4'h8 : _GEN_1193; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1195 = 8'ha7 == _T_170[7:0] ? 4'h8 : _GEN_1194; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1196 = 8'ha8 == _T_170[7:0] ? 4'hf : _GEN_1195; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1197 = 8'ha9 == _T_170[7:0] ? 4'hf : _GEN_1196; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1198 = 8'haa == _T_170[7:0] ? 4'hf : _GEN_1197; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1199 = 8'hab == _T_170[7:0] ? 4'hf : _GEN_1198; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1200 = 8'hac == _T_170[7:0] ? 4'hf : _GEN_1199; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1201 = 8'had == _T_170[7:0] ? 4'hf : _GEN_1200; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1202 = 8'hae == _T_170[7:0] ? 4'hf : _GEN_1201; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1203 = 8'haf == _T_170[7:0] ? 4'hf : _GEN_1202; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1204 = 8'hb0 == _T_170[7:0] ? 4'h8 : _GEN_1203; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1205 = 8'hb1 == _T_170[7:0] ? 4'h8 : _GEN_1204; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1206 = 8'hb2 == _T_170[7:0] ? 4'h8 : _GEN_1205; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1207 = 8'hb3 == _T_170[7:0] ? 4'h8 : _GEN_1206; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1208 = 8'hb4 == _T_170[7:0] ? 4'h8 : _GEN_1207; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1209 = 8'hb5 == _T_170[7:0] ? 4'h8 : _GEN_1208; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1210 = 8'hb6 == _T_170[7:0] ? 4'h8 : _GEN_1209; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1211 = 8'hb7 == _T_170[7:0] ? 4'h8 : _GEN_1210; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1212 = 8'hb8 == _T_170[7:0] ? 4'hf : _GEN_1211; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1213 = 8'hb9 == _T_170[7:0] ? 4'hf : _GEN_1212; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1214 = 8'hba == _T_170[7:0] ? 4'hf : _GEN_1213; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1215 = 8'hbb == _T_170[7:0] ? 4'hf : _GEN_1214; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1216 = 8'hbc == _T_170[7:0] ? 4'hf : _GEN_1215; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1217 = 8'hbd == _T_170[7:0] ? 4'hf : _GEN_1216; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1218 = 8'hbe == _T_170[7:0] ? 4'hf : _GEN_1217; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1219 = 8'hbf == _T_170[7:0] ? 4'hf : _GEN_1218; // @[Filter.scala 102:46]
  wire [31:0] _T_173 = pixelIndex + 32'h6; // @[Filter.scala 97:29]
  wire [31:0] _T_174 = _T_173 / 32'h10; // @[Filter.scala 97:36]
  wire [31:0] _T_176 = _T_174 + _GEN_1765; // @[Filter.scala 97:51]
  wire [31:0] _T_178 = _T_176 - 32'h1; // @[Filter.scala 97:67]
  wire [31:0] _GEN_6 = _T_173 % 32'h10; // @[Filter.scala 98:36]
  wire [4:0] _T_181 = _GEN_6[4:0]; // @[Filter.scala 98:36]
  wire [4:0] _T_183 = _T_181 + _GEN_1766; // @[Filter.scala 98:51]
  wire [4:0] _T_185 = _T_183 - 5'h1; // @[Filter.scala 98:67]
  wire  _T_187 = _T_178 >= 32'h10; // @[Filter.scala 99:27]
  wire  _T_191 = _T_185 >= 5'hc; // @[Filter.scala 99:59]
  wire  _T_192 = _T_187 | _T_191; // @[Filter.scala 99:54]
  wire [9:0] _T_193 = _T_185 * 5'h10; // @[Filter.scala 102:57]
  wire [31:0] _GEN_1785 = {{22'd0}, _T_193}; // @[Filter.scala 102:72]
  wire [31:0] _T_195 = _GEN_1785 + _T_178; // @[Filter.scala 102:72]
  wire [3:0] _GEN_1229 = 8'h8 == _T_195[7:0] ? 4'h4 : 4'h0; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1230 = 8'h9 == _T_195[7:0] ? 4'h4 : _GEN_1229; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1231 = 8'ha == _T_195[7:0] ? 4'h4 : _GEN_1230; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1232 = 8'hb == _T_195[7:0] ? 4'h4 : _GEN_1231; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1233 = 8'hc == _T_195[7:0] ? 4'h4 : _GEN_1232; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1234 = 8'hd == _T_195[7:0] ? 4'h4 : _GEN_1233; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1235 = 8'he == _T_195[7:0] ? 4'h4 : _GEN_1234; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1236 = 8'hf == _T_195[7:0] ? 4'h4 : _GEN_1235; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1237 = 8'h10 == _T_195[7:0] ? 4'h0 : _GEN_1236; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1238 = 8'h11 == _T_195[7:0] ? 4'h0 : _GEN_1237; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1239 = 8'h12 == _T_195[7:0] ? 4'h0 : _GEN_1238; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1240 = 8'h13 == _T_195[7:0] ? 4'h0 : _GEN_1239; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1241 = 8'h14 == _T_195[7:0] ? 4'h0 : _GEN_1240; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1242 = 8'h15 == _T_195[7:0] ? 4'h0 : _GEN_1241; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1243 = 8'h16 == _T_195[7:0] ? 4'h0 : _GEN_1242; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1244 = 8'h17 == _T_195[7:0] ? 4'h0 : _GEN_1243; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1245 = 8'h18 == _T_195[7:0] ? 4'h4 : _GEN_1244; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1246 = 8'h19 == _T_195[7:0] ? 4'h4 : _GEN_1245; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1247 = 8'h1a == _T_195[7:0] ? 4'h4 : _GEN_1246; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1248 = 8'h1b == _T_195[7:0] ? 4'h4 : _GEN_1247; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1249 = 8'h1c == _T_195[7:0] ? 4'h4 : _GEN_1248; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1250 = 8'h1d == _T_195[7:0] ? 4'h4 : _GEN_1249; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1251 = 8'h1e == _T_195[7:0] ? 4'h4 : _GEN_1250; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1252 = 8'h1f == _T_195[7:0] ? 4'h4 : _GEN_1251; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1253 = 8'h20 == _T_195[7:0] ? 4'h0 : _GEN_1252; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1254 = 8'h21 == _T_195[7:0] ? 4'h0 : _GEN_1253; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1255 = 8'h22 == _T_195[7:0] ? 4'h0 : _GEN_1254; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1256 = 8'h23 == _T_195[7:0] ? 4'h0 : _GEN_1255; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1257 = 8'h24 == _T_195[7:0] ? 4'h0 : _GEN_1256; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1258 = 8'h25 == _T_195[7:0] ? 4'h0 : _GEN_1257; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1259 = 8'h26 == _T_195[7:0] ? 4'h0 : _GEN_1258; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1260 = 8'h27 == _T_195[7:0] ? 4'h0 : _GEN_1259; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1261 = 8'h28 == _T_195[7:0] ? 4'h4 : _GEN_1260; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1262 = 8'h29 == _T_195[7:0] ? 4'h4 : _GEN_1261; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1263 = 8'h2a == _T_195[7:0] ? 4'h4 : _GEN_1262; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1264 = 8'h2b == _T_195[7:0] ? 4'h4 : _GEN_1263; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1265 = 8'h2c == _T_195[7:0] ? 4'h4 : _GEN_1264; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1266 = 8'h2d == _T_195[7:0] ? 4'h4 : _GEN_1265; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1267 = 8'h2e == _T_195[7:0] ? 4'h4 : _GEN_1266; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1268 = 8'h2f == _T_195[7:0] ? 4'h4 : _GEN_1267; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1269 = 8'h30 == _T_195[7:0] ? 4'h0 : _GEN_1268; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1270 = 8'h31 == _T_195[7:0] ? 4'h0 : _GEN_1269; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1271 = 8'h32 == _T_195[7:0] ? 4'h0 : _GEN_1270; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1272 = 8'h33 == _T_195[7:0] ? 4'h0 : _GEN_1271; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1273 = 8'h34 == _T_195[7:0] ? 4'h0 : _GEN_1272; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1274 = 8'h35 == _T_195[7:0] ? 4'h0 : _GEN_1273; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1275 = 8'h36 == _T_195[7:0] ? 4'h0 : _GEN_1274; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1276 = 8'h37 == _T_195[7:0] ? 4'h0 : _GEN_1275; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1277 = 8'h38 == _T_195[7:0] ? 4'h4 : _GEN_1276; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1278 = 8'h39 == _T_195[7:0] ? 4'h4 : _GEN_1277; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1279 = 8'h3a == _T_195[7:0] ? 4'h4 : _GEN_1278; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1280 = 8'h3b == _T_195[7:0] ? 4'h4 : _GEN_1279; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1281 = 8'h3c == _T_195[7:0] ? 4'h4 : _GEN_1280; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1282 = 8'h3d == _T_195[7:0] ? 4'h4 : _GEN_1281; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1283 = 8'h3e == _T_195[7:0] ? 4'h4 : _GEN_1282; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1284 = 8'h3f == _T_195[7:0] ? 4'h4 : _GEN_1283; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1285 = 8'h40 == _T_195[7:0] ? 4'h0 : _GEN_1284; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1286 = 8'h41 == _T_195[7:0] ? 4'h0 : _GEN_1285; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1287 = 8'h42 == _T_195[7:0] ? 4'h0 : _GEN_1286; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1288 = 8'h43 == _T_195[7:0] ? 4'h0 : _GEN_1287; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1289 = 8'h44 == _T_195[7:0] ? 4'h0 : _GEN_1288; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1290 = 8'h45 == _T_195[7:0] ? 4'h0 : _GEN_1289; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1291 = 8'h46 == _T_195[7:0] ? 4'h0 : _GEN_1290; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1292 = 8'h47 == _T_195[7:0] ? 4'h0 : _GEN_1291; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1293 = 8'h48 == _T_195[7:0] ? 4'h4 : _GEN_1292; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1294 = 8'h49 == _T_195[7:0] ? 4'h4 : _GEN_1293; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1295 = 8'h4a == _T_195[7:0] ? 4'h4 : _GEN_1294; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1296 = 8'h4b == _T_195[7:0] ? 4'h4 : _GEN_1295; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1297 = 8'h4c == _T_195[7:0] ? 4'h4 : _GEN_1296; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1298 = 8'h4d == _T_195[7:0] ? 4'h4 : _GEN_1297; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1299 = 8'h4e == _T_195[7:0] ? 4'h4 : _GEN_1298; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1300 = 8'h4f == _T_195[7:0] ? 4'h4 : _GEN_1299; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1301 = 8'h50 == _T_195[7:0] ? 4'h0 : _GEN_1300; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1302 = 8'h51 == _T_195[7:0] ? 4'h0 : _GEN_1301; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1303 = 8'h52 == _T_195[7:0] ? 4'h0 : _GEN_1302; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1304 = 8'h53 == _T_195[7:0] ? 4'h0 : _GEN_1303; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1305 = 8'h54 == _T_195[7:0] ? 4'h0 : _GEN_1304; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1306 = 8'h55 == _T_195[7:0] ? 4'h0 : _GEN_1305; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1307 = 8'h56 == _T_195[7:0] ? 4'h0 : _GEN_1306; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1308 = 8'h57 == _T_195[7:0] ? 4'h0 : _GEN_1307; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1309 = 8'h58 == _T_195[7:0] ? 4'h4 : _GEN_1308; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1310 = 8'h59 == _T_195[7:0] ? 4'h4 : _GEN_1309; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1311 = 8'h5a == _T_195[7:0] ? 4'h4 : _GEN_1310; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1312 = 8'h5b == _T_195[7:0] ? 4'h4 : _GEN_1311; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1313 = 8'h5c == _T_195[7:0] ? 4'h4 : _GEN_1312; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1314 = 8'h5d == _T_195[7:0] ? 4'h4 : _GEN_1313; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1315 = 8'h5e == _T_195[7:0] ? 4'h4 : _GEN_1314; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1316 = 8'h5f == _T_195[7:0] ? 4'h4 : _GEN_1315; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1317 = 8'h60 == _T_195[7:0] ? 4'h8 : _GEN_1316; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1318 = 8'h61 == _T_195[7:0] ? 4'h8 : _GEN_1317; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1319 = 8'h62 == _T_195[7:0] ? 4'h8 : _GEN_1318; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1320 = 8'h63 == _T_195[7:0] ? 4'h8 : _GEN_1319; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1321 = 8'h64 == _T_195[7:0] ? 4'h8 : _GEN_1320; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1322 = 8'h65 == _T_195[7:0] ? 4'h8 : _GEN_1321; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1323 = 8'h66 == _T_195[7:0] ? 4'h8 : _GEN_1322; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1324 = 8'h67 == _T_195[7:0] ? 4'h8 : _GEN_1323; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1325 = 8'h68 == _T_195[7:0] ? 4'hf : _GEN_1324; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1326 = 8'h69 == _T_195[7:0] ? 4'hf : _GEN_1325; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1327 = 8'h6a == _T_195[7:0] ? 4'hf : _GEN_1326; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1328 = 8'h6b == _T_195[7:0] ? 4'hf : _GEN_1327; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1329 = 8'h6c == _T_195[7:0] ? 4'hf : _GEN_1328; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1330 = 8'h6d == _T_195[7:0] ? 4'hf : _GEN_1329; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1331 = 8'h6e == _T_195[7:0] ? 4'hf : _GEN_1330; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1332 = 8'h6f == _T_195[7:0] ? 4'hf : _GEN_1331; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1333 = 8'h70 == _T_195[7:0] ? 4'h8 : _GEN_1332; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1334 = 8'h71 == _T_195[7:0] ? 4'h8 : _GEN_1333; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1335 = 8'h72 == _T_195[7:0] ? 4'h8 : _GEN_1334; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1336 = 8'h73 == _T_195[7:0] ? 4'h8 : _GEN_1335; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1337 = 8'h74 == _T_195[7:0] ? 4'h8 : _GEN_1336; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1338 = 8'h75 == _T_195[7:0] ? 4'h8 : _GEN_1337; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1339 = 8'h76 == _T_195[7:0] ? 4'h8 : _GEN_1338; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1340 = 8'h77 == _T_195[7:0] ? 4'h8 : _GEN_1339; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1341 = 8'h78 == _T_195[7:0] ? 4'hf : _GEN_1340; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1342 = 8'h79 == _T_195[7:0] ? 4'hf : _GEN_1341; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1343 = 8'h7a == _T_195[7:0] ? 4'hf : _GEN_1342; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1344 = 8'h7b == _T_195[7:0] ? 4'hf : _GEN_1343; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1345 = 8'h7c == _T_195[7:0] ? 4'hf : _GEN_1344; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1346 = 8'h7d == _T_195[7:0] ? 4'hf : _GEN_1345; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1347 = 8'h7e == _T_195[7:0] ? 4'hf : _GEN_1346; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1348 = 8'h7f == _T_195[7:0] ? 4'hf : _GEN_1347; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1349 = 8'h80 == _T_195[7:0] ? 4'h8 : _GEN_1348; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1350 = 8'h81 == _T_195[7:0] ? 4'h8 : _GEN_1349; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1351 = 8'h82 == _T_195[7:0] ? 4'h8 : _GEN_1350; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1352 = 8'h83 == _T_195[7:0] ? 4'h8 : _GEN_1351; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1353 = 8'h84 == _T_195[7:0] ? 4'h8 : _GEN_1352; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1354 = 8'h85 == _T_195[7:0] ? 4'h8 : _GEN_1353; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1355 = 8'h86 == _T_195[7:0] ? 4'h8 : _GEN_1354; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1356 = 8'h87 == _T_195[7:0] ? 4'h8 : _GEN_1355; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1357 = 8'h88 == _T_195[7:0] ? 4'hf : _GEN_1356; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1358 = 8'h89 == _T_195[7:0] ? 4'hf : _GEN_1357; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1359 = 8'h8a == _T_195[7:0] ? 4'hf : _GEN_1358; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1360 = 8'h8b == _T_195[7:0] ? 4'hf : _GEN_1359; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1361 = 8'h8c == _T_195[7:0] ? 4'hf : _GEN_1360; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1362 = 8'h8d == _T_195[7:0] ? 4'hf : _GEN_1361; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1363 = 8'h8e == _T_195[7:0] ? 4'hf : _GEN_1362; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1364 = 8'h8f == _T_195[7:0] ? 4'hf : _GEN_1363; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1365 = 8'h90 == _T_195[7:0] ? 4'h8 : _GEN_1364; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1366 = 8'h91 == _T_195[7:0] ? 4'h8 : _GEN_1365; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1367 = 8'h92 == _T_195[7:0] ? 4'h8 : _GEN_1366; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1368 = 8'h93 == _T_195[7:0] ? 4'h8 : _GEN_1367; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1369 = 8'h94 == _T_195[7:0] ? 4'h8 : _GEN_1368; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1370 = 8'h95 == _T_195[7:0] ? 4'h8 : _GEN_1369; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1371 = 8'h96 == _T_195[7:0] ? 4'h8 : _GEN_1370; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1372 = 8'h97 == _T_195[7:0] ? 4'h8 : _GEN_1371; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1373 = 8'h98 == _T_195[7:0] ? 4'hf : _GEN_1372; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1374 = 8'h99 == _T_195[7:0] ? 4'hf : _GEN_1373; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1375 = 8'h9a == _T_195[7:0] ? 4'hf : _GEN_1374; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1376 = 8'h9b == _T_195[7:0] ? 4'hf : _GEN_1375; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1377 = 8'h9c == _T_195[7:0] ? 4'hf : _GEN_1376; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1378 = 8'h9d == _T_195[7:0] ? 4'hf : _GEN_1377; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1379 = 8'h9e == _T_195[7:0] ? 4'hf : _GEN_1378; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1380 = 8'h9f == _T_195[7:0] ? 4'hf : _GEN_1379; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1381 = 8'ha0 == _T_195[7:0] ? 4'h8 : _GEN_1380; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1382 = 8'ha1 == _T_195[7:0] ? 4'h8 : _GEN_1381; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1383 = 8'ha2 == _T_195[7:0] ? 4'h8 : _GEN_1382; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1384 = 8'ha3 == _T_195[7:0] ? 4'h8 : _GEN_1383; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1385 = 8'ha4 == _T_195[7:0] ? 4'h8 : _GEN_1384; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1386 = 8'ha5 == _T_195[7:0] ? 4'h8 : _GEN_1385; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1387 = 8'ha6 == _T_195[7:0] ? 4'h8 : _GEN_1386; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1388 = 8'ha7 == _T_195[7:0] ? 4'h8 : _GEN_1387; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1389 = 8'ha8 == _T_195[7:0] ? 4'hf : _GEN_1388; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1390 = 8'ha9 == _T_195[7:0] ? 4'hf : _GEN_1389; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1391 = 8'haa == _T_195[7:0] ? 4'hf : _GEN_1390; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1392 = 8'hab == _T_195[7:0] ? 4'hf : _GEN_1391; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1393 = 8'hac == _T_195[7:0] ? 4'hf : _GEN_1392; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1394 = 8'had == _T_195[7:0] ? 4'hf : _GEN_1393; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1395 = 8'hae == _T_195[7:0] ? 4'hf : _GEN_1394; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1396 = 8'haf == _T_195[7:0] ? 4'hf : _GEN_1395; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1397 = 8'hb0 == _T_195[7:0] ? 4'h8 : _GEN_1396; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1398 = 8'hb1 == _T_195[7:0] ? 4'h8 : _GEN_1397; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1399 = 8'hb2 == _T_195[7:0] ? 4'h8 : _GEN_1398; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1400 = 8'hb3 == _T_195[7:0] ? 4'h8 : _GEN_1399; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1401 = 8'hb4 == _T_195[7:0] ? 4'h8 : _GEN_1400; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1402 = 8'hb5 == _T_195[7:0] ? 4'h8 : _GEN_1401; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1403 = 8'hb6 == _T_195[7:0] ? 4'h8 : _GEN_1402; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1404 = 8'hb7 == _T_195[7:0] ? 4'h8 : _GEN_1403; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1405 = 8'hb8 == _T_195[7:0] ? 4'hf : _GEN_1404; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1406 = 8'hb9 == _T_195[7:0] ? 4'hf : _GEN_1405; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1407 = 8'hba == _T_195[7:0] ? 4'hf : _GEN_1406; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1408 = 8'hbb == _T_195[7:0] ? 4'hf : _GEN_1407; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1409 = 8'hbc == _T_195[7:0] ? 4'hf : _GEN_1408; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1410 = 8'hbd == _T_195[7:0] ? 4'hf : _GEN_1409; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1411 = 8'hbe == _T_195[7:0] ? 4'hf : _GEN_1410; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1412 = 8'hbf == _T_195[7:0] ? 4'hf : _GEN_1411; // @[Filter.scala 102:46]
  wire [31:0] _T_198 = pixelIndex + 32'h7; // @[Filter.scala 97:29]
  wire [31:0] _T_199 = _T_198 / 32'h10; // @[Filter.scala 97:36]
  wire [31:0] _T_201 = _T_199 + _GEN_1765; // @[Filter.scala 97:51]
  wire [31:0] _T_203 = _T_201 - 32'h1; // @[Filter.scala 97:67]
  wire [31:0] _GEN_56 = _T_198 % 32'h10; // @[Filter.scala 98:36]
  wire [4:0] _T_206 = _GEN_56[4:0]; // @[Filter.scala 98:36]
  wire [4:0] _T_208 = _T_206 + _GEN_1766; // @[Filter.scala 98:51]
  wire [4:0] _T_210 = _T_208 - 5'h1; // @[Filter.scala 98:67]
  wire  _T_212 = _T_203 >= 32'h10; // @[Filter.scala 99:27]
  wire  _T_216 = _T_210 >= 5'hc; // @[Filter.scala 99:59]
  wire  _T_217 = _T_212 | _T_216; // @[Filter.scala 99:54]
  wire [9:0] _T_218 = _T_210 * 5'h10; // @[Filter.scala 102:57]
  wire [31:0] _GEN_1788 = {{22'd0}, _T_218}; // @[Filter.scala 102:72]
  wire [31:0] _T_220 = _GEN_1788 + _T_203; // @[Filter.scala 102:72]
  wire [3:0] _GEN_1422 = 8'h8 == _T_220[7:0] ? 4'h4 : 4'h0; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1423 = 8'h9 == _T_220[7:0] ? 4'h4 : _GEN_1422; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1424 = 8'ha == _T_220[7:0] ? 4'h4 : _GEN_1423; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1425 = 8'hb == _T_220[7:0] ? 4'h4 : _GEN_1424; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1426 = 8'hc == _T_220[7:0] ? 4'h4 : _GEN_1425; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1427 = 8'hd == _T_220[7:0] ? 4'h4 : _GEN_1426; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1428 = 8'he == _T_220[7:0] ? 4'h4 : _GEN_1427; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1429 = 8'hf == _T_220[7:0] ? 4'h4 : _GEN_1428; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1430 = 8'h10 == _T_220[7:0] ? 4'h0 : _GEN_1429; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1431 = 8'h11 == _T_220[7:0] ? 4'h0 : _GEN_1430; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1432 = 8'h12 == _T_220[7:0] ? 4'h0 : _GEN_1431; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1433 = 8'h13 == _T_220[7:0] ? 4'h0 : _GEN_1432; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1434 = 8'h14 == _T_220[7:0] ? 4'h0 : _GEN_1433; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1435 = 8'h15 == _T_220[7:0] ? 4'h0 : _GEN_1434; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1436 = 8'h16 == _T_220[7:0] ? 4'h0 : _GEN_1435; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1437 = 8'h17 == _T_220[7:0] ? 4'h0 : _GEN_1436; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1438 = 8'h18 == _T_220[7:0] ? 4'h4 : _GEN_1437; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1439 = 8'h19 == _T_220[7:0] ? 4'h4 : _GEN_1438; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1440 = 8'h1a == _T_220[7:0] ? 4'h4 : _GEN_1439; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1441 = 8'h1b == _T_220[7:0] ? 4'h4 : _GEN_1440; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1442 = 8'h1c == _T_220[7:0] ? 4'h4 : _GEN_1441; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1443 = 8'h1d == _T_220[7:0] ? 4'h4 : _GEN_1442; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1444 = 8'h1e == _T_220[7:0] ? 4'h4 : _GEN_1443; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1445 = 8'h1f == _T_220[7:0] ? 4'h4 : _GEN_1444; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1446 = 8'h20 == _T_220[7:0] ? 4'h0 : _GEN_1445; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1447 = 8'h21 == _T_220[7:0] ? 4'h0 : _GEN_1446; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1448 = 8'h22 == _T_220[7:0] ? 4'h0 : _GEN_1447; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1449 = 8'h23 == _T_220[7:0] ? 4'h0 : _GEN_1448; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1450 = 8'h24 == _T_220[7:0] ? 4'h0 : _GEN_1449; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1451 = 8'h25 == _T_220[7:0] ? 4'h0 : _GEN_1450; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1452 = 8'h26 == _T_220[7:0] ? 4'h0 : _GEN_1451; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1453 = 8'h27 == _T_220[7:0] ? 4'h0 : _GEN_1452; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1454 = 8'h28 == _T_220[7:0] ? 4'h4 : _GEN_1453; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1455 = 8'h29 == _T_220[7:0] ? 4'h4 : _GEN_1454; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1456 = 8'h2a == _T_220[7:0] ? 4'h4 : _GEN_1455; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1457 = 8'h2b == _T_220[7:0] ? 4'h4 : _GEN_1456; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1458 = 8'h2c == _T_220[7:0] ? 4'h4 : _GEN_1457; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1459 = 8'h2d == _T_220[7:0] ? 4'h4 : _GEN_1458; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1460 = 8'h2e == _T_220[7:0] ? 4'h4 : _GEN_1459; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1461 = 8'h2f == _T_220[7:0] ? 4'h4 : _GEN_1460; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1462 = 8'h30 == _T_220[7:0] ? 4'h0 : _GEN_1461; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1463 = 8'h31 == _T_220[7:0] ? 4'h0 : _GEN_1462; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1464 = 8'h32 == _T_220[7:0] ? 4'h0 : _GEN_1463; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1465 = 8'h33 == _T_220[7:0] ? 4'h0 : _GEN_1464; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1466 = 8'h34 == _T_220[7:0] ? 4'h0 : _GEN_1465; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1467 = 8'h35 == _T_220[7:0] ? 4'h0 : _GEN_1466; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1468 = 8'h36 == _T_220[7:0] ? 4'h0 : _GEN_1467; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1469 = 8'h37 == _T_220[7:0] ? 4'h0 : _GEN_1468; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1470 = 8'h38 == _T_220[7:0] ? 4'h4 : _GEN_1469; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1471 = 8'h39 == _T_220[7:0] ? 4'h4 : _GEN_1470; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1472 = 8'h3a == _T_220[7:0] ? 4'h4 : _GEN_1471; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1473 = 8'h3b == _T_220[7:0] ? 4'h4 : _GEN_1472; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1474 = 8'h3c == _T_220[7:0] ? 4'h4 : _GEN_1473; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1475 = 8'h3d == _T_220[7:0] ? 4'h4 : _GEN_1474; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1476 = 8'h3e == _T_220[7:0] ? 4'h4 : _GEN_1475; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1477 = 8'h3f == _T_220[7:0] ? 4'h4 : _GEN_1476; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1478 = 8'h40 == _T_220[7:0] ? 4'h0 : _GEN_1477; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1479 = 8'h41 == _T_220[7:0] ? 4'h0 : _GEN_1478; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1480 = 8'h42 == _T_220[7:0] ? 4'h0 : _GEN_1479; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1481 = 8'h43 == _T_220[7:0] ? 4'h0 : _GEN_1480; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1482 = 8'h44 == _T_220[7:0] ? 4'h0 : _GEN_1481; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1483 = 8'h45 == _T_220[7:0] ? 4'h0 : _GEN_1482; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1484 = 8'h46 == _T_220[7:0] ? 4'h0 : _GEN_1483; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1485 = 8'h47 == _T_220[7:0] ? 4'h0 : _GEN_1484; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1486 = 8'h48 == _T_220[7:0] ? 4'h4 : _GEN_1485; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1487 = 8'h49 == _T_220[7:0] ? 4'h4 : _GEN_1486; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1488 = 8'h4a == _T_220[7:0] ? 4'h4 : _GEN_1487; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1489 = 8'h4b == _T_220[7:0] ? 4'h4 : _GEN_1488; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1490 = 8'h4c == _T_220[7:0] ? 4'h4 : _GEN_1489; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1491 = 8'h4d == _T_220[7:0] ? 4'h4 : _GEN_1490; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1492 = 8'h4e == _T_220[7:0] ? 4'h4 : _GEN_1491; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1493 = 8'h4f == _T_220[7:0] ? 4'h4 : _GEN_1492; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1494 = 8'h50 == _T_220[7:0] ? 4'h0 : _GEN_1493; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1495 = 8'h51 == _T_220[7:0] ? 4'h0 : _GEN_1494; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1496 = 8'h52 == _T_220[7:0] ? 4'h0 : _GEN_1495; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1497 = 8'h53 == _T_220[7:0] ? 4'h0 : _GEN_1496; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1498 = 8'h54 == _T_220[7:0] ? 4'h0 : _GEN_1497; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1499 = 8'h55 == _T_220[7:0] ? 4'h0 : _GEN_1498; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1500 = 8'h56 == _T_220[7:0] ? 4'h0 : _GEN_1499; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1501 = 8'h57 == _T_220[7:0] ? 4'h0 : _GEN_1500; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1502 = 8'h58 == _T_220[7:0] ? 4'h4 : _GEN_1501; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1503 = 8'h59 == _T_220[7:0] ? 4'h4 : _GEN_1502; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1504 = 8'h5a == _T_220[7:0] ? 4'h4 : _GEN_1503; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1505 = 8'h5b == _T_220[7:0] ? 4'h4 : _GEN_1504; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1506 = 8'h5c == _T_220[7:0] ? 4'h4 : _GEN_1505; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1507 = 8'h5d == _T_220[7:0] ? 4'h4 : _GEN_1506; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1508 = 8'h5e == _T_220[7:0] ? 4'h4 : _GEN_1507; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1509 = 8'h5f == _T_220[7:0] ? 4'h4 : _GEN_1508; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1510 = 8'h60 == _T_220[7:0] ? 4'h8 : _GEN_1509; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1511 = 8'h61 == _T_220[7:0] ? 4'h8 : _GEN_1510; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1512 = 8'h62 == _T_220[7:0] ? 4'h8 : _GEN_1511; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1513 = 8'h63 == _T_220[7:0] ? 4'h8 : _GEN_1512; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1514 = 8'h64 == _T_220[7:0] ? 4'h8 : _GEN_1513; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1515 = 8'h65 == _T_220[7:0] ? 4'h8 : _GEN_1514; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1516 = 8'h66 == _T_220[7:0] ? 4'h8 : _GEN_1515; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1517 = 8'h67 == _T_220[7:0] ? 4'h8 : _GEN_1516; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1518 = 8'h68 == _T_220[7:0] ? 4'hf : _GEN_1517; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1519 = 8'h69 == _T_220[7:0] ? 4'hf : _GEN_1518; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1520 = 8'h6a == _T_220[7:0] ? 4'hf : _GEN_1519; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1521 = 8'h6b == _T_220[7:0] ? 4'hf : _GEN_1520; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1522 = 8'h6c == _T_220[7:0] ? 4'hf : _GEN_1521; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1523 = 8'h6d == _T_220[7:0] ? 4'hf : _GEN_1522; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1524 = 8'h6e == _T_220[7:0] ? 4'hf : _GEN_1523; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1525 = 8'h6f == _T_220[7:0] ? 4'hf : _GEN_1524; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1526 = 8'h70 == _T_220[7:0] ? 4'h8 : _GEN_1525; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1527 = 8'h71 == _T_220[7:0] ? 4'h8 : _GEN_1526; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1528 = 8'h72 == _T_220[7:0] ? 4'h8 : _GEN_1527; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1529 = 8'h73 == _T_220[7:0] ? 4'h8 : _GEN_1528; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1530 = 8'h74 == _T_220[7:0] ? 4'h8 : _GEN_1529; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1531 = 8'h75 == _T_220[7:0] ? 4'h8 : _GEN_1530; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1532 = 8'h76 == _T_220[7:0] ? 4'h8 : _GEN_1531; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1533 = 8'h77 == _T_220[7:0] ? 4'h8 : _GEN_1532; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1534 = 8'h78 == _T_220[7:0] ? 4'hf : _GEN_1533; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1535 = 8'h79 == _T_220[7:0] ? 4'hf : _GEN_1534; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1536 = 8'h7a == _T_220[7:0] ? 4'hf : _GEN_1535; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1537 = 8'h7b == _T_220[7:0] ? 4'hf : _GEN_1536; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1538 = 8'h7c == _T_220[7:0] ? 4'hf : _GEN_1537; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1539 = 8'h7d == _T_220[7:0] ? 4'hf : _GEN_1538; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1540 = 8'h7e == _T_220[7:0] ? 4'hf : _GEN_1539; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1541 = 8'h7f == _T_220[7:0] ? 4'hf : _GEN_1540; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1542 = 8'h80 == _T_220[7:0] ? 4'h8 : _GEN_1541; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1543 = 8'h81 == _T_220[7:0] ? 4'h8 : _GEN_1542; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1544 = 8'h82 == _T_220[7:0] ? 4'h8 : _GEN_1543; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1545 = 8'h83 == _T_220[7:0] ? 4'h8 : _GEN_1544; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1546 = 8'h84 == _T_220[7:0] ? 4'h8 : _GEN_1545; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1547 = 8'h85 == _T_220[7:0] ? 4'h8 : _GEN_1546; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1548 = 8'h86 == _T_220[7:0] ? 4'h8 : _GEN_1547; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1549 = 8'h87 == _T_220[7:0] ? 4'h8 : _GEN_1548; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1550 = 8'h88 == _T_220[7:0] ? 4'hf : _GEN_1549; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1551 = 8'h89 == _T_220[7:0] ? 4'hf : _GEN_1550; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1552 = 8'h8a == _T_220[7:0] ? 4'hf : _GEN_1551; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1553 = 8'h8b == _T_220[7:0] ? 4'hf : _GEN_1552; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1554 = 8'h8c == _T_220[7:0] ? 4'hf : _GEN_1553; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1555 = 8'h8d == _T_220[7:0] ? 4'hf : _GEN_1554; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1556 = 8'h8e == _T_220[7:0] ? 4'hf : _GEN_1555; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1557 = 8'h8f == _T_220[7:0] ? 4'hf : _GEN_1556; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1558 = 8'h90 == _T_220[7:0] ? 4'h8 : _GEN_1557; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1559 = 8'h91 == _T_220[7:0] ? 4'h8 : _GEN_1558; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1560 = 8'h92 == _T_220[7:0] ? 4'h8 : _GEN_1559; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1561 = 8'h93 == _T_220[7:0] ? 4'h8 : _GEN_1560; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1562 = 8'h94 == _T_220[7:0] ? 4'h8 : _GEN_1561; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1563 = 8'h95 == _T_220[7:0] ? 4'h8 : _GEN_1562; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1564 = 8'h96 == _T_220[7:0] ? 4'h8 : _GEN_1563; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1565 = 8'h97 == _T_220[7:0] ? 4'h8 : _GEN_1564; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1566 = 8'h98 == _T_220[7:0] ? 4'hf : _GEN_1565; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1567 = 8'h99 == _T_220[7:0] ? 4'hf : _GEN_1566; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1568 = 8'h9a == _T_220[7:0] ? 4'hf : _GEN_1567; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1569 = 8'h9b == _T_220[7:0] ? 4'hf : _GEN_1568; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1570 = 8'h9c == _T_220[7:0] ? 4'hf : _GEN_1569; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1571 = 8'h9d == _T_220[7:0] ? 4'hf : _GEN_1570; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1572 = 8'h9e == _T_220[7:0] ? 4'hf : _GEN_1571; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1573 = 8'h9f == _T_220[7:0] ? 4'hf : _GEN_1572; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1574 = 8'ha0 == _T_220[7:0] ? 4'h8 : _GEN_1573; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1575 = 8'ha1 == _T_220[7:0] ? 4'h8 : _GEN_1574; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1576 = 8'ha2 == _T_220[7:0] ? 4'h8 : _GEN_1575; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1577 = 8'ha3 == _T_220[7:0] ? 4'h8 : _GEN_1576; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1578 = 8'ha4 == _T_220[7:0] ? 4'h8 : _GEN_1577; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1579 = 8'ha5 == _T_220[7:0] ? 4'h8 : _GEN_1578; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1580 = 8'ha6 == _T_220[7:0] ? 4'h8 : _GEN_1579; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1581 = 8'ha7 == _T_220[7:0] ? 4'h8 : _GEN_1580; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1582 = 8'ha8 == _T_220[7:0] ? 4'hf : _GEN_1581; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1583 = 8'ha9 == _T_220[7:0] ? 4'hf : _GEN_1582; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1584 = 8'haa == _T_220[7:0] ? 4'hf : _GEN_1583; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1585 = 8'hab == _T_220[7:0] ? 4'hf : _GEN_1584; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1586 = 8'hac == _T_220[7:0] ? 4'hf : _GEN_1585; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1587 = 8'had == _T_220[7:0] ? 4'hf : _GEN_1586; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1588 = 8'hae == _T_220[7:0] ? 4'hf : _GEN_1587; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1589 = 8'haf == _T_220[7:0] ? 4'hf : _GEN_1588; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1590 = 8'hb0 == _T_220[7:0] ? 4'h8 : _GEN_1589; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1591 = 8'hb1 == _T_220[7:0] ? 4'h8 : _GEN_1590; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1592 = 8'hb2 == _T_220[7:0] ? 4'h8 : _GEN_1591; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1593 = 8'hb3 == _T_220[7:0] ? 4'h8 : _GEN_1592; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1594 = 8'hb4 == _T_220[7:0] ? 4'h8 : _GEN_1593; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1595 = 8'hb5 == _T_220[7:0] ? 4'h8 : _GEN_1594; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1596 = 8'hb6 == _T_220[7:0] ? 4'h8 : _GEN_1595; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1597 = 8'hb7 == _T_220[7:0] ? 4'h8 : _GEN_1596; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1598 = 8'hb8 == _T_220[7:0] ? 4'hf : _GEN_1597; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1599 = 8'hb9 == _T_220[7:0] ? 4'hf : _GEN_1598; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1600 = 8'hba == _T_220[7:0] ? 4'hf : _GEN_1599; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1601 = 8'hbb == _T_220[7:0] ? 4'hf : _GEN_1600; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1602 = 8'hbc == _T_220[7:0] ? 4'hf : _GEN_1601; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1603 = 8'hbd == _T_220[7:0] ? 4'hf : _GEN_1602; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1604 = 8'hbe == _T_220[7:0] ? 4'hf : _GEN_1603; // @[Filter.scala 102:46]
  wire [3:0] _GEN_1605 = 8'hbf == _T_220[7:0] ? 4'hf : _GEN_1604; // @[Filter.scala 102:46]
  wire [7:0] _GEN_1608 = 3'h1 == io_SPI_filterIndex[2:0] ? $signed(8'sh9) : $signed(8'sh1); // @[Filter.scala 117:29]
  wire [7:0] _GEN_1609 = 3'h2 == io_SPI_filterIndex[2:0] ? $signed(8'sh10) : $signed(_GEN_1608); // @[Filter.scala 117:29]
  wire [7:0] _GEN_1610 = 3'h3 == io_SPI_filterIndex[2:0] ? $signed(8'sh1) : $signed(_GEN_1609); // @[Filter.scala 117:29]
  wire [7:0] _GEN_1611 = 3'h4 == io_SPI_filterIndex[2:0] ? $signed(8'sh1) : $signed(_GEN_1610); // @[Filter.scala 117:29]
  wire [7:0] _GEN_1612 = 3'h5 == io_SPI_filterIndex[2:0] ? $signed(8'sh1) : $signed(_GEN_1611); // @[Filter.scala 117:29]
  wire [8:0] _GEN_1789 = {{1{_GEN_1612[7]}},_GEN_1612}; // @[Filter.scala 117:29]
  wire [9:0] _T_226 = $signed(KernelConvolution_io_pixelVal_out_0) / $signed(_GEN_1789); // @[Filter.scala 117:40]
  wire [9:0] _T_233 = $signed(KernelConvolution_io_pixelVal_out_1) / $signed(_GEN_1789); // @[Filter.scala 117:40]
  wire [9:0] _T_240 = $signed(KernelConvolution_io_pixelVal_out_2) / $signed(_GEN_1789); // @[Filter.scala 117:40]
  wire [9:0] _T_247 = $signed(KernelConvolution_io_pixelVal_out_3) / $signed(_GEN_1789); // @[Filter.scala 117:40]
  wire [9:0] _T_254 = $signed(KernelConvolution_io_pixelVal_out_4) / $signed(_GEN_1789); // @[Filter.scala 117:40]
  wire [9:0] _T_261 = $signed(KernelConvolution_io_pixelVal_out_5) / $signed(_GEN_1789); // @[Filter.scala 117:40]
  wire [9:0] _T_268 = $signed(KernelConvolution_io_pixelVal_out_6) / $signed(_GEN_1789); // @[Filter.scala 117:40]
  wire [9:0] _T_275 = $signed(KernelConvolution_io_pixelVal_out_7) / $signed(_GEN_1789); // @[Filter.scala 117:40]
  wire [31:0] _T_279 = pixelIndex + 32'h8; // @[Filter.scala 130:34]
  wire [8:0] _T_280 = 5'h10 * 5'hc; // @[Filter.scala 131:42]
  wire [31:0] _GEN_1797 = {{23'd0}, _T_280}; // @[Filter.scala 131:25]
  wire  _T_281 = pixelIndex == _GEN_1797; // @[Filter.scala 131:25]
  KernelConvolution KernelConvolution ( // @[Filter.scala 86:35]
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
  assign io_pixelVal_out_0 = _T_226[3:0]; // @[Filter.scala 121:28 Filter.scala 123:28]
  assign io_pixelVal_out_1 = _T_233[3:0]; // @[Filter.scala 121:28 Filter.scala 123:28]
  assign io_pixelVal_out_2 = _T_240[3:0]; // @[Filter.scala 121:28 Filter.scala 123:28]
  assign io_pixelVal_out_3 = _T_247[3:0]; // @[Filter.scala 121:28 Filter.scala 123:28]
  assign io_pixelVal_out_4 = _T_254[3:0]; // @[Filter.scala 121:28 Filter.scala 123:28]
  assign io_pixelVal_out_5 = _T_261[3:0]; // @[Filter.scala 121:28 Filter.scala 123:28]
  assign io_pixelVal_out_6 = _T_268[3:0]; // @[Filter.scala 121:28 Filter.scala 123:28]
  assign io_pixelVal_out_7 = _T_275[3:0]; // @[Filter.scala 121:28 Filter.scala 123:28]
  assign io_valid_out = KernelConvolution_io_valid_out; // @[Filter.scala 127:18]
  assign KernelConvolution_clock = clock;
  assign KernelConvolution_reset = reset;
  assign KernelConvolution_io_kernelVal_in = _GEN_1747 & _GEN_1674 ? $signed(5'sh0) : $signed(_GEN_55); // @[Filter.scala 89:36]
  assign KernelConvolution_io_pixelVal_in_0 = _T_42 ? 4'h0 : _GEN_254; // @[Filter.scala 100:46 Filter.scala 102:46]
  assign KernelConvolution_io_pixelVal_in_1 = _T_67 ? 4'h0 : _GEN_447; // @[Filter.scala 100:46 Filter.scala 102:46]
  assign KernelConvolution_io_pixelVal_in_2 = _T_92 ? 4'h0 : _GEN_640; // @[Filter.scala 100:46 Filter.scala 102:46]
  assign KernelConvolution_io_pixelVal_in_3 = _T_117 ? 4'h0 : _GEN_833; // @[Filter.scala 100:46 Filter.scala 102:46]
  assign KernelConvolution_io_pixelVal_in_4 = _T_142 ? 4'h0 : _GEN_1026; // @[Filter.scala 100:46 Filter.scala 102:46]
  assign KernelConvolution_io_pixelVal_in_5 = _T_167 ? 4'h0 : _GEN_1219; // @[Filter.scala 100:46 Filter.scala 102:46]
  assign KernelConvolution_io_pixelVal_in_6 = _T_192 ? 4'h0 : _GEN_1412; // @[Filter.scala 100:46 Filter.scala 102:46]
  assign KernelConvolution_io_pixelVal_in_7 = _T_217 ? 4'h0 : _GEN_1605; // @[Filter.scala 100:46 Filter.scala 102:46]
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
      imageCounterX <= _T_18;
    end
    if (reset) begin
      imageCounterY <= 2'h0;
    end else if (imageCounterXReset) begin
      if (_T_19) begin
        imageCounterY <= 2'h0;
      end else begin
        imageCounterY <= _T_21;
      end
    end
    if (reset) begin
      pixelIndex <= 32'h0;
    end else if (kernelCountReset) begin
      if (_T_281) begin
        pixelIndex <= 32'h0;
      end else begin
        pixelIndex <= _T_279;
      end
    end
  end
endmodule
module VideoBuffer(
  input         clock,
  input         reset,
  input  [3:0]  io_pixelVal_in_0,
  input  [3:0]  io_pixelVal_in_1,
  input  [3:0]  io_pixelVal_in_2,
  input  [3:0]  io_pixelVal_in_3,
  input  [3:0]  io_pixelVal_in_4,
  input  [3:0]  io_pixelVal_in_5,
  input  [3:0]  io_pixelVal_in_6,
  input  [3:0]  io_pixelVal_in_7,
  input         io_valid_in,
  input  [10:0] io_rowIndex,
  input  [10:0] io_colIndex,
  output [3:0]  io_pixelVal_out
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
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_90;
  reg [31:0] _RAND_91;
  reg [31:0] _RAND_92;
  reg [31:0] _RAND_93;
  reg [31:0] _RAND_94;
  reg [31:0] _RAND_95;
  reg [31:0] _RAND_96;
  reg [31:0] _RAND_97;
  reg [31:0] _RAND_98;
  reg [31:0] _RAND_99;
  reg [31:0] _RAND_100;
  reg [31:0] _RAND_101;
  reg [31:0] _RAND_102;
  reg [31:0] _RAND_103;
  reg [31:0] _RAND_104;
  reg [31:0] _RAND_105;
  reg [31:0] _RAND_106;
  reg [31:0] _RAND_107;
  reg [31:0] _RAND_108;
  reg [31:0] _RAND_109;
  reg [31:0] _RAND_110;
  reg [31:0] _RAND_111;
  reg [31:0] _RAND_112;
  reg [31:0] _RAND_113;
  reg [31:0] _RAND_114;
  reg [31:0] _RAND_115;
  reg [31:0] _RAND_116;
  reg [31:0] _RAND_117;
  reg [31:0] _RAND_118;
  reg [31:0] _RAND_119;
  reg [31:0] _RAND_120;
  reg [31:0] _RAND_121;
  reg [31:0] _RAND_122;
  reg [31:0] _RAND_123;
  reg [31:0] _RAND_124;
  reg [31:0] _RAND_125;
  reg [31:0] _RAND_126;
  reg [31:0] _RAND_127;
  reg [31:0] _RAND_128;
  reg [31:0] _RAND_129;
  reg [31:0] _RAND_130;
  reg [31:0] _RAND_131;
  reg [31:0] _RAND_132;
  reg [31:0] _RAND_133;
  reg [31:0] _RAND_134;
  reg [31:0] _RAND_135;
  reg [31:0] _RAND_136;
  reg [31:0] _RAND_137;
  reg [31:0] _RAND_138;
  reg [31:0] _RAND_139;
  reg [31:0] _RAND_140;
  reg [31:0] _RAND_141;
  reg [31:0] _RAND_142;
  reg [31:0] _RAND_143;
  reg [31:0] _RAND_144;
  reg [31:0] _RAND_145;
  reg [31:0] _RAND_146;
  reg [31:0] _RAND_147;
  reg [31:0] _RAND_148;
  reg [31:0] _RAND_149;
  reg [31:0] _RAND_150;
  reg [31:0] _RAND_151;
  reg [31:0] _RAND_152;
  reg [31:0] _RAND_153;
  reg [31:0] _RAND_154;
  reg [31:0] _RAND_155;
  reg [31:0] _RAND_156;
  reg [31:0] _RAND_157;
  reg [31:0] _RAND_158;
  reg [31:0] _RAND_159;
  reg [31:0] _RAND_160;
  reg [31:0] _RAND_161;
  reg [31:0] _RAND_162;
  reg [31:0] _RAND_163;
  reg [31:0] _RAND_164;
  reg [31:0] _RAND_165;
  reg [31:0] _RAND_166;
  reg [31:0] _RAND_167;
  reg [31:0] _RAND_168;
  reg [31:0] _RAND_169;
  reg [31:0] _RAND_170;
  reg [31:0] _RAND_171;
  reg [31:0] _RAND_172;
  reg [31:0] _RAND_173;
  reg [31:0] _RAND_174;
  reg [31:0] _RAND_175;
  reg [31:0] _RAND_176;
  reg [31:0] _RAND_177;
  reg [31:0] _RAND_178;
  reg [31:0] _RAND_179;
  reg [31:0] _RAND_180;
  reg [31:0] _RAND_181;
  reg [31:0] _RAND_182;
  reg [31:0] _RAND_183;
  reg [31:0] _RAND_184;
  reg [31:0] _RAND_185;
  reg [31:0] _RAND_186;
  reg [31:0] _RAND_187;
  reg [31:0] _RAND_188;
  reg [31:0] _RAND_189;
  reg [31:0] _RAND_190;
  reg [31:0] _RAND_191;
  reg [31:0] _RAND_192;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] image_0; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_1; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_2; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_3; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_4; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_5; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_6; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_7; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_8; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_9; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_10; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_11; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_12; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_13; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_14; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_15; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_16; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_17; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_18; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_19; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_20; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_21; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_22; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_23; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_24; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_25; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_26; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_27; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_28; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_29; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_30; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_31; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_32; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_33; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_34; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_35; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_36; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_37; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_38; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_39; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_40; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_41; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_42; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_43; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_44; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_45; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_46; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_47; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_48; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_49; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_50; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_51; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_52; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_53; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_54; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_55; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_56; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_57; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_58; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_59; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_60; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_61; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_62; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_63; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_64; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_65; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_66; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_67; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_68; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_69; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_70; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_71; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_72; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_73; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_74; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_75; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_76; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_77; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_78; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_79; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_80; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_81; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_82; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_83; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_84; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_85; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_86; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_87; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_88; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_89; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_90; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_91; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_92; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_93; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_94; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_95; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_96; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_97; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_98; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_99; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_100; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_101; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_102; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_103; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_104; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_105; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_106; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_107; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_108; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_109; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_110; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_111; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_112; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_113; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_114; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_115; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_116; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_117; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_118; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_119; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_120; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_121; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_122; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_123; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_124; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_125; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_126; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_127; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_128; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_129; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_130; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_131; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_132; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_133; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_134; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_135; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_136; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_137; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_138; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_139; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_140; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_141; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_142; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_143; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_144; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_145; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_146; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_147; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_148; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_149; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_150; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_151; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_152; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_153; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_154; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_155; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_156; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_157; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_158; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_159; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_160; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_161; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_162; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_163; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_164; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_165; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_166; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_167; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_168; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_169; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_170; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_171; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_172; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_173; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_174; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_175; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_176; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_177; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_178; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_179; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_180; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_181; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_182; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_183; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_184; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_185; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_186; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_187; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_188; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_189; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_190; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_191; // @[VideoBuffer.scala 19:24]
  wire [15:0] _T_1 = io_rowIndex * 11'h10; // @[VideoBuffer.scala 30:46]
  wire [15:0] _GEN_1922 = {{5'd0}, io_colIndex}; // @[VideoBuffer.scala 30:61]
  wire [15:0] _T_3 = _T_1 + _GEN_1922; // @[VideoBuffer.scala 30:61]
  wire [3:0] _GEN_1 = 8'h1 == _T_3[7:0] ? image_1 : image_0; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_2 = 8'h2 == _T_3[7:0] ? image_2 : _GEN_1; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_3 = 8'h3 == _T_3[7:0] ? image_3 : _GEN_2; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_4 = 8'h4 == _T_3[7:0] ? image_4 : _GEN_3; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_5 = 8'h5 == _T_3[7:0] ? image_5 : _GEN_4; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_6 = 8'h6 == _T_3[7:0] ? image_6 : _GEN_5; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_7 = 8'h7 == _T_3[7:0] ? image_7 : _GEN_6; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_8 = 8'h8 == _T_3[7:0] ? image_8 : _GEN_7; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_9 = 8'h9 == _T_3[7:0] ? image_9 : _GEN_8; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_10 = 8'ha == _T_3[7:0] ? image_10 : _GEN_9; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_11 = 8'hb == _T_3[7:0] ? image_11 : _GEN_10; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_12 = 8'hc == _T_3[7:0] ? image_12 : _GEN_11; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_13 = 8'hd == _T_3[7:0] ? image_13 : _GEN_12; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_14 = 8'he == _T_3[7:0] ? image_14 : _GEN_13; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_15 = 8'hf == _T_3[7:0] ? image_15 : _GEN_14; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_16 = 8'h10 == _T_3[7:0] ? image_16 : _GEN_15; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_17 = 8'h11 == _T_3[7:0] ? image_17 : _GEN_16; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_18 = 8'h12 == _T_3[7:0] ? image_18 : _GEN_17; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_19 = 8'h13 == _T_3[7:0] ? image_19 : _GEN_18; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_20 = 8'h14 == _T_3[7:0] ? image_20 : _GEN_19; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_21 = 8'h15 == _T_3[7:0] ? image_21 : _GEN_20; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_22 = 8'h16 == _T_3[7:0] ? image_22 : _GEN_21; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_23 = 8'h17 == _T_3[7:0] ? image_23 : _GEN_22; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_24 = 8'h18 == _T_3[7:0] ? image_24 : _GEN_23; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_25 = 8'h19 == _T_3[7:0] ? image_25 : _GEN_24; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_26 = 8'h1a == _T_3[7:0] ? image_26 : _GEN_25; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_27 = 8'h1b == _T_3[7:0] ? image_27 : _GEN_26; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_28 = 8'h1c == _T_3[7:0] ? image_28 : _GEN_27; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_29 = 8'h1d == _T_3[7:0] ? image_29 : _GEN_28; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_30 = 8'h1e == _T_3[7:0] ? image_30 : _GEN_29; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_31 = 8'h1f == _T_3[7:0] ? image_31 : _GEN_30; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_32 = 8'h20 == _T_3[7:0] ? image_32 : _GEN_31; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_33 = 8'h21 == _T_3[7:0] ? image_33 : _GEN_32; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_34 = 8'h22 == _T_3[7:0] ? image_34 : _GEN_33; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_35 = 8'h23 == _T_3[7:0] ? image_35 : _GEN_34; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_36 = 8'h24 == _T_3[7:0] ? image_36 : _GEN_35; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_37 = 8'h25 == _T_3[7:0] ? image_37 : _GEN_36; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_38 = 8'h26 == _T_3[7:0] ? image_38 : _GEN_37; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_39 = 8'h27 == _T_3[7:0] ? image_39 : _GEN_38; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_40 = 8'h28 == _T_3[7:0] ? image_40 : _GEN_39; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_41 = 8'h29 == _T_3[7:0] ? image_41 : _GEN_40; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_42 = 8'h2a == _T_3[7:0] ? image_42 : _GEN_41; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_43 = 8'h2b == _T_3[7:0] ? image_43 : _GEN_42; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_44 = 8'h2c == _T_3[7:0] ? image_44 : _GEN_43; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_45 = 8'h2d == _T_3[7:0] ? image_45 : _GEN_44; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_46 = 8'h2e == _T_3[7:0] ? image_46 : _GEN_45; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_47 = 8'h2f == _T_3[7:0] ? image_47 : _GEN_46; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_48 = 8'h30 == _T_3[7:0] ? image_48 : _GEN_47; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_49 = 8'h31 == _T_3[7:0] ? image_49 : _GEN_48; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_50 = 8'h32 == _T_3[7:0] ? image_50 : _GEN_49; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_51 = 8'h33 == _T_3[7:0] ? image_51 : _GEN_50; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_52 = 8'h34 == _T_3[7:0] ? image_52 : _GEN_51; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_53 = 8'h35 == _T_3[7:0] ? image_53 : _GEN_52; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_54 = 8'h36 == _T_3[7:0] ? image_54 : _GEN_53; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_55 = 8'h37 == _T_3[7:0] ? image_55 : _GEN_54; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_56 = 8'h38 == _T_3[7:0] ? image_56 : _GEN_55; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_57 = 8'h39 == _T_3[7:0] ? image_57 : _GEN_56; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_58 = 8'h3a == _T_3[7:0] ? image_58 : _GEN_57; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_59 = 8'h3b == _T_3[7:0] ? image_59 : _GEN_58; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_60 = 8'h3c == _T_3[7:0] ? image_60 : _GEN_59; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_61 = 8'h3d == _T_3[7:0] ? image_61 : _GEN_60; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_62 = 8'h3e == _T_3[7:0] ? image_62 : _GEN_61; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_63 = 8'h3f == _T_3[7:0] ? image_63 : _GEN_62; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_64 = 8'h40 == _T_3[7:0] ? image_64 : _GEN_63; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_65 = 8'h41 == _T_3[7:0] ? image_65 : _GEN_64; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_66 = 8'h42 == _T_3[7:0] ? image_66 : _GEN_65; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_67 = 8'h43 == _T_3[7:0] ? image_67 : _GEN_66; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_68 = 8'h44 == _T_3[7:0] ? image_68 : _GEN_67; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_69 = 8'h45 == _T_3[7:0] ? image_69 : _GEN_68; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_70 = 8'h46 == _T_3[7:0] ? image_70 : _GEN_69; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_71 = 8'h47 == _T_3[7:0] ? image_71 : _GEN_70; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_72 = 8'h48 == _T_3[7:0] ? image_72 : _GEN_71; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_73 = 8'h49 == _T_3[7:0] ? image_73 : _GEN_72; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_74 = 8'h4a == _T_3[7:0] ? image_74 : _GEN_73; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_75 = 8'h4b == _T_3[7:0] ? image_75 : _GEN_74; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_76 = 8'h4c == _T_3[7:0] ? image_76 : _GEN_75; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_77 = 8'h4d == _T_3[7:0] ? image_77 : _GEN_76; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_78 = 8'h4e == _T_3[7:0] ? image_78 : _GEN_77; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_79 = 8'h4f == _T_3[7:0] ? image_79 : _GEN_78; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_80 = 8'h50 == _T_3[7:0] ? image_80 : _GEN_79; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_81 = 8'h51 == _T_3[7:0] ? image_81 : _GEN_80; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_82 = 8'h52 == _T_3[7:0] ? image_82 : _GEN_81; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_83 = 8'h53 == _T_3[7:0] ? image_83 : _GEN_82; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_84 = 8'h54 == _T_3[7:0] ? image_84 : _GEN_83; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_85 = 8'h55 == _T_3[7:0] ? image_85 : _GEN_84; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_86 = 8'h56 == _T_3[7:0] ? image_86 : _GEN_85; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_87 = 8'h57 == _T_3[7:0] ? image_87 : _GEN_86; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_88 = 8'h58 == _T_3[7:0] ? image_88 : _GEN_87; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_89 = 8'h59 == _T_3[7:0] ? image_89 : _GEN_88; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_90 = 8'h5a == _T_3[7:0] ? image_90 : _GEN_89; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_91 = 8'h5b == _T_3[7:0] ? image_91 : _GEN_90; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_92 = 8'h5c == _T_3[7:0] ? image_92 : _GEN_91; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_93 = 8'h5d == _T_3[7:0] ? image_93 : _GEN_92; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_94 = 8'h5e == _T_3[7:0] ? image_94 : _GEN_93; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_95 = 8'h5f == _T_3[7:0] ? image_95 : _GEN_94; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_96 = 8'h60 == _T_3[7:0] ? image_96 : _GEN_95; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_97 = 8'h61 == _T_3[7:0] ? image_97 : _GEN_96; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_98 = 8'h62 == _T_3[7:0] ? image_98 : _GEN_97; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_99 = 8'h63 == _T_3[7:0] ? image_99 : _GEN_98; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_100 = 8'h64 == _T_3[7:0] ? image_100 : _GEN_99; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_101 = 8'h65 == _T_3[7:0] ? image_101 : _GEN_100; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_102 = 8'h66 == _T_3[7:0] ? image_102 : _GEN_101; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_103 = 8'h67 == _T_3[7:0] ? image_103 : _GEN_102; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_104 = 8'h68 == _T_3[7:0] ? image_104 : _GEN_103; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_105 = 8'h69 == _T_3[7:0] ? image_105 : _GEN_104; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_106 = 8'h6a == _T_3[7:0] ? image_106 : _GEN_105; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_107 = 8'h6b == _T_3[7:0] ? image_107 : _GEN_106; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_108 = 8'h6c == _T_3[7:0] ? image_108 : _GEN_107; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_109 = 8'h6d == _T_3[7:0] ? image_109 : _GEN_108; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_110 = 8'h6e == _T_3[7:0] ? image_110 : _GEN_109; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_111 = 8'h6f == _T_3[7:0] ? image_111 : _GEN_110; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_112 = 8'h70 == _T_3[7:0] ? image_112 : _GEN_111; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_113 = 8'h71 == _T_3[7:0] ? image_113 : _GEN_112; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_114 = 8'h72 == _T_3[7:0] ? image_114 : _GEN_113; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_115 = 8'h73 == _T_3[7:0] ? image_115 : _GEN_114; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_116 = 8'h74 == _T_3[7:0] ? image_116 : _GEN_115; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_117 = 8'h75 == _T_3[7:0] ? image_117 : _GEN_116; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_118 = 8'h76 == _T_3[7:0] ? image_118 : _GEN_117; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_119 = 8'h77 == _T_3[7:0] ? image_119 : _GEN_118; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_120 = 8'h78 == _T_3[7:0] ? image_120 : _GEN_119; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_121 = 8'h79 == _T_3[7:0] ? image_121 : _GEN_120; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_122 = 8'h7a == _T_3[7:0] ? image_122 : _GEN_121; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_123 = 8'h7b == _T_3[7:0] ? image_123 : _GEN_122; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_124 = 8'h7c == _T_3[7:0] ? image_124 : _GEN_123; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_125 = 8'h7d == _T_3[7:0] ? image_125 : _GEN_124; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_126 = 8'h7e == _T_3[7:0] ? image_126 : _GEN_125; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_127 = 8'h7f == _T_3[7:0] ? image_127 : _GEN_126; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_128 = 8'h80 == _T_3[7:0] ? image_128 : _GEN_127; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_129 = 8'h81 == _T_3[7:0] ? image_129 : _GEN_128; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_130 = 8'h82 == _T_3[7:0] ? image_130 : _GEN_129; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_131 = 8'h83 == _T_3[7:0] ? image_131 : _GEN_130; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_132 = 8'h84 == _T_3[7:0] ? image_132 : _GEN_131; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_133 = 8'h85 == _T_3[7:0] ? image_133 : _GEN_132; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_134 = 8'h86 == _T_3[7:0] ? image_134 : _GEN_133; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_135 = 8'h87 == _T_3[7:0] ? image_135 : _GEN_134; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_136 = 8'h88 == _T_3[7:0] ? image_136 : _GEN_135; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_137 = 8'h89 == _T_3[7:0] ? image_137 : _GEN_136; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_138 = 8'h8a == _T_3[7:0] ? image_138 : _GEN_137; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_139 = 8'h8b == _T_3[7:0] ? image_139 : _GEN_138; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_140 = 8'h8c == _T_3[7:0] ? image_140 : _GEN_139; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_141 = 8'h8d == _T_3[7:0] ? image_141 : _GEN_140; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_142 = 8'h8e == _T_3[7:0] ? image_142 : _GEN_141; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_143 = 8'h8f == _T_3[7:0] ? image_143 : _GEN_142; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_144 = 8'h90 == _T_3[7:0] ? image_144 : _GEN_143; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_145 = 8'h91 == _T_3[7:0] ? image_145 : _GEN_144; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_146 = 8'h92 == _T_3[7:0] ? image_146 : _GEN_145; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_147 = 8'h93 == _T_3[7:0] ? image_147 : _GEN_146; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_148 = 8'h94 == _T_3[7:0] ? image_148 : _GEN_147; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_149 = 8'h95 == _T_3[7:0] ? image_149 : _GEN_148; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_150 = 8'h96 == _T_3[7:0] ? image_150 : _GEN_149; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_151 = 8'h97 == _T_3[7:0] ? image_151 : _GEN_150; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_152 = 8'h98 == _T_3[7:0] ? image_152 : _GEN_151; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_153 = 8'h99 == _T_3[7:0] ? image_153 : _GEN_152; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_154 = 8'h9a == _T_3[7:0] ? image_154 : _GEN_153; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_155 = 8'h9b == _T_3[7:0] ? image_155 : _GEN_154; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_156 = 8'h9c == _T_3[7:0] ? image_156 : _GEN_155; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_157 = 8'h9d == _T_3[7:0] ? image_157 : _GEN_156; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_158 = 8'h9e == _T_3[7:0] ? image_158 : _GEN_157; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_159 = 8'h9f == _T_3[7:0] ? image_159 : _GEN_158; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_160 = 8'ha0 == _T_3[7:0] ? image_160 : _GEN_159; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_161 = 8'ha1 == _T_3[7:0] ? image_161 : _GEN_160; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_162 = 8'ha2 == _T_3[7:0] ? image_162 : _GEN_161; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_163 = 8'ha3 == _T_3[7:0] ? image_163 : _GEN_162; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_164 = 8'ha4 == _T_3[7:0] ? image_164 : _GEN_163; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_165 = 8'ha5 == _T_3[7:0] ? image_165 : _GEN_164; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_166 = 8'ha6 == _T_3[7:0] ? image_166 : _GEN_165; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_167 = 8'ha7 == _T_3[7:0] ? image_167 : _GEN_166; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_168 = 8'ha8 == _T_3[7:0] ? image_168 : _GEN_167; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_169 = 8'ha9 == _T_3[7:0] ? image_169 : _GEN_168; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_170 = 8'haa == _T_3[7:0] ? image_170 : _GEN_169; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_171 = 8'hab == _T_3[7:0] ? image_171 : _GEN_170; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_172 = 8'hac == _T_3[7:0] ? image_172 : _GEN_171; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_173 = 8'had == _T_3[7:0] ? image_173 : _GEN_172; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_174 = 8'hae == _T_3[7:0] ? image_174 : _GEN_173; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_175 = 8'haf == _T_3[7:0] ? image_175 : _GEN_174; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_176 = 8'hb0 == _T_3[7:0] ? image_176 : _GEN_175; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_177 = 8'hb1 == _T_3[7:0] ? image_177 : _GEN_176; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_178 = 8'hb2 == _T_3[7:0] ? image_178 : _GEN_177; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_179 = 8'hb3 == _T_3[7:0] ? image_179 : _GEN_178; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_180 = 8'hb4 == _T_3[7:0] ? image_180 : _GEN_179; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_181 = 8'hb5 == _T_3[7:0] ? image_181 : _GEN_180; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_182 = 8'hb6 == _T_3[7:0] ? image_182 : _GEN_181; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_183 = 8'hb7 == _T_3[7:0] ? image_183 : _GEN_182; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_184 = 8'hb8 == _T_3[7:0] ? image_184 : _GEN_183; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_185 = 8'hb9 == _T_3[7:0] ? image_185 : _GEN_184; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_186 = 8'hba == _T_3[7:0] ? image_186 : _GEN_185; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_187 = 8'hbb == _T_3[7:0] ? image_187 : _GEN_186; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_188 = 8'hbc == _T_3[7:0] ? image_188 : _GEN_187; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_189 = 8'hbd == _T_3[7:0] ? image_189 : _GEN_188; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_190 = 8'hbe == _T_3[7:0] ? image_190 : _GEN_189; // @[VideoBuffer.scala 30:25]
  reg [31:0] pixelIndex; // @[VideoBuffer.scala 32:33]
  wire [32:0] _T_5 = {{1'd0}, pixelIndex}; // @[VideoBuffer.scala 36:42]
  wire [31:0] _T_9 = pixelIndex + 32'h1; // @[VideoBuffer.scala 36:42]
  wire [31:0] _T_12 = pixelIndex + 32'h2; // @[VideoBuffer.scala 36:42]
  wire [31:0] _T_15 = pixelIndex + 32'h3; // @[VideoBuffer.scala 36:42]
  wire [31:0] _T_18 = pixelIndex + 32'h4; // @[VideoBuffer.scala 36:42]
  wire [31:0] _T_21 = pixelIndex + 32'h5; // @[VideoBuffer.scala 36:42]
  wire [31:0] _T_24 = pixelIndex + 32'h6; // @[VideoBuffer.scala 36:42]
  wire [31:0] _T_27 = pixelIndex + 32'h7; // @[VideoBuffer.scala 36:42]
  wire [31:0] _T_30 = pixelIndex + 32'h8; // @[VideoBuffer.scala 38:42]
  wire [8:0] _T_31 = 5'h10 * 5'hc; // @[VideoBuffer.scala 39:42]
  wire [31:0] _GEN_1923 = {{23'd0}, _T_31}; // @[VideoBuffer.scala 39:25]
  wire  _T_32 = pixelIndex == _GEN_1923; // @[VideoBuffer.scala 39:25]
  assign io_pixelVal_out = 8'hbf == _T_3[7:0] ? image_191 : _GEN_190; // @[VideoBuffer.scala 30:25]
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
  image_0 = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  image_1 = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  image_2 = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  image_3 = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  image_4 = _RAND_4[3:0];
  _RAND_5 = {1{`RANDOM}};
  image_5 = _RAND_5[3:0];
  _RAND_6 = {1{`RANDOM}};
  image_6 = _RAND_6[3:0];
  _RAND_7 = {1{`RANDOM}};
  image_7 = _RAND_7[3:0];
  _RAND_8 = {1{`RANDOM}};
  image_8 = _RAND_8[3:0];
  _RAND_9 = {1{`RANDOM}};
  image_9 = _RAND_9[3:0];
  _RAND_10 = {1{`RANDOM}};
  image_10 = _RAND_10[3:0];
  _RAND_11 = {1{`RANDOM}};
  image_11 = _RAND_11[3:0];
  _RAND_12 = {1{`RANDOM}};
  image_12 = _RAND_12[3:0];
  _RAND_13 = {1{`RANDOM}};
  image_13 = _RAND_13[3:0];
  _RAND_14 = {1{`RANDOM}};
  image_14 = _RAND_14[3:0];
  _RAND_15 = {1{`RANDOM}};
  image_15 = _RAND_15[3:0];
  _RAND_16 = {1{`RANDOM}};
  image_16 = _RAND_16[3:0];
  _RAND_17 = {1{`RANDOM}};
  image_17 = _RAND_17[3:0];
  _RAND_18 = {1{`RANDOM}};
  image_18 = _RAND_18[3:0];
  _RAND_19 = {1{`RANDOM}};
  image_19 = _RAND_19[3:0];
  _RAND_20 = {1{`RANDOM}};
  image_20 = _RAND_20[3:0];
  _RAND_21 = {1{`RANDOM}};
  image_21 = _RAND_21[3:0];
  _RAND_22 = {1{`RANDOM}};
  image_22 = _RAND_22[3:0];
  _RAND_23 = {1{`RANDOM}};
  image_23 = _RAND_23[3:0];
  _RAND_24 = {1{`RANDOM}};
  image_24 = _RAND_24[3:0];
  _RAND_25 = {1{`RANDOM}};
  image_25 = _RAND_25[3:0];
  _RAND_26 = {1{`RANDOM}};
  image_26 = _RAND_26[3:0];
  _RAND_27 = {1{`RANDOM}};
  image_27 = _RAND_27[3:0];
  _RAND_28 = {1{`RANDOM}};
  image_28 = _RAND_28[3:0];
  _RAND_29 = {1{`RANDOM}};
  image_29 = _RAND_29[3:0];
  _RAND_30 = {1{`RANDOM}};
  image_30 = _RAND_30[3:0];
  _RAND_31 = {1{`RANDOM}};
  image_31 = _RAND_31[3:0];
  _RAND_32 = {1{`RANDOM}};
  image_32 = _RAND_32[3:0];
  _RAND_33 = {1{`RANDOM}};
  image_33 = _RAND_33[3:0];
  _RAND_34 = {1{`RANDOM}};
  image_34 = _RAND_34[3:0];
  _RAND_35 = {1{`RANDOM}};
  image_35 = _RAND_35[3:0];
  _RAND_36 = {1{`RANDOM}};
  image_36 = _RAND_36[3:0];
  _RAND_37 = {1{`RANDOM}};
  image_37 = _RAND_37[3:0];
  _RAND_38 = {1{`RANDOM}};
  image_38 = _RAND_38[3:0];
  _RAND_39 = {1{`RANDOM}};
  image_39 = _RAND_39[3:0];
  _RAND_40 = {1{`RANDOM}};
  image_40 = _RAND_40[3:0];
  _RAND_41 = {1{`RANDOM}};
  image_41 = _RAND_41[3:0];
  _RAND_42 = {1{`RANDOM}};
  image_42 = _RAND_42[3:0];
  _RAND_43 = {1{`RANDOM}};
  image_43 = _RAND_43[3:0];
  _RAND_44 = {1{`RANDOM}};
  image_44 = _RAND_44[3:0];
  _RAND_45 = {1{`RANDOM}};
  image_45 = _RAND_45[3:0];
  _RAND_46 = {1{`RANDOM}};
  image_46 = _RAND_46[3:0];
  _RAND_47 = {1{`RANDOM}};
  image_47 = _RAND_47[3:0];
  _RAND_48 = {1{`RANDOM}};
  image_48 = _RAND_48[3:0];
  _RAND_49 = {1{`RANDOM}};
  image_49 = _RAND_49[3:0];
  _RAND_50 = {1{`RANDOM}};
  image_50 = _RAND_50[3:0];
  _RAND_51 = {1{`RANDOM}};
  image_51 = _RAND_51[3:0];
  _RAND_52 = {1{`RANDOM}};
  image_52 = _RAND_52[3:0];
  _RAND_53 = {1{`RANDOM}};
  image_53 = _RAND_53[3:0];
  _RAND_54 = {1{`RANDOM}};
  image_54 = _RAND_54[3:0];
  _RAND_55 = {1{`RANDOM}};
  image_55 = _RAND_55[3:0];
  _RAND_56 = {1{`RANDOM}};
  image_56 = _RAND_56[3:0];
  _RAND_57 = {1{`RANDOM}};
  image_57 = _RAND_57[3:0];
  _RAND_58 = {1{`RANDOM}};
  image_58 = _RAND_58[3:0];
  _RAND_59 = {1{`RANDOM}};
  image_59 = _RAND_59[3:0];
  _RAND_60 = {1{`RANDOM}};
  image_60 = _RAND_60[3:0];
  _RAND_61 = {1{`RANDOM}};
  image_61 = _RAND_61[3:0];
  _RAND_62 = {1{`RANDOM}};
  image_62 = _RAND_62[3:0];
  _RAND_63 = {1{`RANDOM}};
  image_63 = _RAND_63[3:0];
  _RAND_64 = {1{`RANDOM}};
  image_64 = _RAND_64[3:0];
  _RAND_65 = {1{`RANDOM}};
  image_65 = _RAND_65[3:0];
  _RAND_66 = {1{`RANDOM}};
  image_66 = _RAND_66[3:0];
  _RAND_67 = {1{`RANDOM}};
  image_67 = _RAND_67[3:0];
  _RAND_68 = {1{`RANDOM}};
  image_68 = _RAND_68[3:0];
  _RAND_69 = {1{`RANDOM}};
  image_69 = _RAND_69[3:0];
  _RAND_70 = {1{`RANDOM}};
  image_70 = _RAND_70[3:0];
  _RAND_71 = {1{`RANDOM}};
  image_71 = _RAND_71[3:0];
  _RAND_72 = {1{`RANDOM}};
  image_72 = _RAND_72[3:0];
  _RAND_73 = {1{`RANDOM}};
  image_73 = _RAND_73[3:0];
  _RAND_74 = {1{`RANDOM}};
  image_74 = _RAND_74[3:0];
  _RAND_75 = {1{`RANDOM}};
  image_75 = _RAND_75[3:0];
  _RAND_76 = {1{`RANDOM}};
  image_76 = _RAND_76[3:0];
  _RAND_77 = {1{`RANDOM}};
  image_77 = _RAND_77[3:0];
  _RAND_78 = {1{`RANDOM}};
  image_78 = _RAND_78[3:0];
  _RAND_79 = {1{`RANDOM}};
  image_79 = _RAND_79[3:0];
  _RAND_80 = {1{`RANDOM}};
  image_80 = _RAND_80[3:0];
  _RAND_81 = {1{`RANDOM}};
  image_81 = _RAND_81[3:0];
  _RAND_82 = {1{`RANDOM}};
  image_82 = _RAND_82[3:0];
  _RAND_83 = {1{`RANDOM}};
  image_83 = _RAND_83[3:0];
  _RAND_84 = {1{`RANDOM}};
  image_84 = _RAND_84[3:0];
  _RAND_85 = {1{`RANDOM}};
  image_85 = _RAND_85[3:0];
  _RAND_86 = {1{`RANDOM}};
  image_86 = _RAND_86[3:0];
  _RAND_87 = {1{`RANDOM}};
  image_87 = _RAND_87[3:0];
  _RAND_88 = {1{`RANDOM}};
  image_88 = _RAND_88[3:0];
  _RAND_89 = {1{`RANDOM}};
  image_89 = _RAND_89[3:0];
  _RAND_90 = {1{`RANDOM}};
  image_90 = _RAND_90[3:0];
  _RAND_91 = {1{`RANDOM}};
  image_91 = _RAND_91[3:0];
  _RAND_92 = {1{`RANDOM}};
  image_92 = _RAND_92[3:0];
  _RAND_93 = {1{`RANDOM}};
  image_93 = _RAND_93[3:0];
  _RAND_94 = {1{`RANDOM}};
  image_94 = _RAND_94[3:0];
  _RAND_95 = {1{`RANDOM}};
  image_95 = _RAND_95[3:0];
  _RAND_96 = {1{`RANDOM}};
  image_96 = _RAND_96[3:0];
  _RAND_97 = {1{`RANDOM}};
  image_97 = _RAND_97[3:0];
  _RAND_98 = {1{`RANDOM}};
  image_98 = _RAND_98[3:0];
  _RAND_99 = {1{`RANDOM}};
  image_99 = _RAND_99[3:0];
  _RAND_100 = {1{`RANDOM}};
  image_100 = _RAND_100[3:0];
  _RAND_101 = {1{`RANDOM}};
  image_101 = _RAND_101[3:0];
  _RAND_102 = {1{`RANDOM}};
  image_102 = _RAND_102[3:0];
  _RAND_103 = {1{`RANDOM}};
  image_103 = _RAND_103[3:0];
  _RAND_104 = {1{`RANDOM}};
  image_104 = _RAND_104[3:0];
  _RAND_105 = {1{`RANDOM}};
  image_105 = _RAND_105[3:0];
  _RAND_106 = {1{`RANDOM}};
  image_106 = _RAND_106[3:0];
  _RAND_107 = {1{`RANDOM}};
  image_107 = _RAND_107[3:0];
  _RAND_108 = {1{`RANDOM}};
  image_108 = _RAND_108[3:0];
  _RAND_109 = {1{`RANDOM}};
  image_109 = _RAND_109[3:0];
  _RAND_110 = {1{`RANDOM}};
  image_110 = _RAND_110[3:0];
  _RAND_111 = {1{`RANDOM}};
  image_111 = _RAND_111[3:0];
  _RAND_112 = {1{`RANDOM}};
  image_112 = _RAND_112[3:0];
  _RAND_113 = {1{`RANDOM}};
  image_113 = _RAND_113[3:0];
  _RAND_114 = {1{`RANDOM}};
  image_114 = _RAND_114[3:0];
  _RAND_115 = {1{`RANDOM}};
  image_115 = _RAND_115[3:0];
  _RAND_116 = {1{`RANDOM}};
  image_116 = _RAND_116[3:0];
  _RAND_117 = {1{`RANDOM}};
  image_117 = _RAND_117[3:0];
  _RAND_118 = {1{`RANDOM}};
  image_118 = _RAND_118[3:0];
  _RAND_119 = {1{`RANDOM}};
  image_119 = _RAND_119[3:0];
  _RAND_120 = {1{`RANDOM}};
  image_120 = _RAND_120[3:0];
  _RAND_121 = {1{`RANDOM}};
  image_121 = _RAND_121[3:0];
  _RAND_122 = {1{`RANDOM}};
  image_122 = _RAND_122[3:0];
  _RAND_123 = {1{`RANDOM}};
  image_123 = _RAND_123[3:0];
  _RAND_124 = {1{`RANDOM}};
  image_124 = _RAND_124[3:0];
  _RAND_125 = {1{`RANDOM}};
  image_125 = _RAND_125[3:0];
  _RAND_126 = {1{`RANDOM}};
  image_126 = _RAND_126[3:0];
  _RAND_127 = {1{`RANDOM}};
  image_127 = _RAND_127[3:0];
  _RAND_128 = {1{`RANDOM}};
  image_128 = _RAND_128[3:0];
  _RAND_129 = {1{`RANDOM}};
  image_129 = _RAND_129[3:0];
  _RAND_130 = {1{`RANDOM}};
  image_130 = _RAND_130[3:0];
  _RAND_131 = {1{`RANDOM}};
  image_131 = _RAND_131[3:0];
  _RAND_132 = {1{`RANDOM}};
  image_132 = _RAND_132[3:0];
  _RAND_133 = {1{`RANDOM}};
  image_133 = _RAND_133[3:0];
  _RAND_134 = {1{`RANDOM}};
  image_134 = _RAND_134[3:0];
  _RAND_135 = {1{`RANDOM}};
  image_135 = _RAND_135[3:0];
  _RAND_136 = {1{`RANDOM}};
  image_136 = _RAND_136[3:0];
  _RAND_137 = {1{`RANDOM}};
  image_137 = _RAND_137[3:0];
  _RAND_138 = {1{`RANDOM}};
  image_138 = _RAND_138[3:0];
  _RAND_139 = {1{`RANDOM}};
  image_139 = _RAND_139[3:0];
  _RAND_140 = {1{`RANDOM}};
  image_140 = _RAND_140[3:0];
  _RAND_141 = {1{`RANDOM}};
  image_141 = _RAND_141[3:0];
  _RAND_142 = {1{`RANDOM}};
  image_142 = _RAND_142[3:0];
  _RAND_143 = {1{`RANDOM}};
  image_143 = _RAND_143[3:0];
  _RAND_144 = {1{`RANDOM}};
  image_144 = _RAND_144[3:0];
  _RAND_145 = {1{`RANDOM}};
  image_145 = _RAND_145[3:0];
  _RAND_146 = {1{`RANDOM}};
  image_146 = _RAND_146[3:0];
  _RAND_147 = {1{`RANDOM}};
  image_147 = _RAND_147[3:0];
  _RAND_148 = {1{`RANDOM}};
  image_148 = _RAND_148[3:0];
  _RAND_149 = {1{`RANDOM}};
  image_149 = _RAND_149[3:0];
  _RAND_150 = {1{`RANDOM}};
  image_150 = _RAND_150[3:0];
  _RAND_151 = {1{`RANDOM}};
  image_151 = _RAND_151[3:0];
  _RAND_152 = {1{`RANDOM}};
  image_152 = _RAND_152[3:0];
  _RAND_153 = {1{`RANDOM}};
  image_153 = _RAND_153[3:0];
  _RAND_154 = {1{`RANDOM}};
  image_154 = _RAND_154[3:0];
  _RAND_155 = {1{`RANDOM}};
  image_155 = _RAND_155[3:0];
  _RAND_156 = {1{`RANDOM}};
  image_156 = _RAND_156[3:0];
  _RAND_157 = {1{`RANDOM}};
  image_157 = _RAND_157[3:0];
  _RAND_158 = {1{`RANDOM}};
  image_158 = _RAND_158[3:0];
  _RAND_159 = {1{`RANDOM}};
  image_159 = _RAND_159[3:0];
  _RAND_160 = {1{`RANDOM}};
  image_160 = _RAND_160[3:0];
  _RAND_161 = {1{`RANDOM}};
  image_161 = _RAND_161[3:0];
  _RAND_162 = {1{`RANDOM}};
  image_162 = _RAND_162[3:0];
  _RAND_163 = {1{`RANDOM}};
  image_163 = _RAND_163[3:0];
  _RAND_164 = {1{`RANDOM}};
  image_164 = _RAND_164[3:0];
  _RAND_165 = {1{`RANDOM}};
  image_165 = _RAND_165[3:0];
  _RAND_166 = {1{`RANDOM}};
  image_166 = _RAND_166[3:0];
  _RAND_167 = {1{`RANDOM}};
  image_167 = _RAND_167[3:0];
  _RAND_168 = {1{`RANDOM}};
  image_168 = _RAND_168[3:0];
  _RAND_169 = {1{`RANDOM}};
  image_169 = _RAND_169[3:0];
  _RAND_170 = {1{`RANDOM}};
  image_170 = _RAND_170[3:0];
  _RAND_171 = {1{`RANDOM}};
  image_171 = _RAND_171[3:0];
  _RAND_172 = {1{`RANDOM}};
  image_172 = _RAND_172[3:0];
  _RAND_173 = {1{`RANDOM}};
  image_173 = _RAND_173[3:0];
  _RAND_174 = {1{`RANDOM}};
  image_174 = _RAND_174[3:0];
  _RAND_175 = {1{`RANDOM}};
  image_175 = _RAND_175[3:0];
  _RAND_176 = {1{`RANDOM}};
  image_176 = _RAND_176[3:0];
  _RAND_177 = {1{`RANDOM}};
  image_177 = _RAND_177[3:0];
  _RAND_178 = {1{`RANDOM}};
  image_178 = _RAND_178[3:0];
  _RAND_179 = {1{`RANDOM}};
  image_179 = _RAND_179[3:0];
  _RAND_180 = {1{`RANDOM}};
  image_180 = _RAND_180[3:0];
  _RAND_181 = {1{`RANDOM}};
  image_181 = _RAND_181[3:0];
  _RAND_182 = {1{`RANDOM}};
  image_182 = _RAND_182[3:0];
  _RAND_183 = {1{`RANDOM}};
  image_183 = _RAND_183[3:0];
  _RAND_184 = {1{`RANDOM}};
  image_184 = _RAND_184[3:0];
  _RAND_185 = {1{`RANDOM}};
  image_185 = _RAND_185[3:0];
  _RAND_186 = {1{`RANDOM}};
  image_186 = _RAND_186[3:0];
  _RAND_187 = {1{`RANDOM}};
  image_187 = _RAND_187[3:0];
  _RAND_188 = {1{`RANDOM}};
  image_188 = _RAND_188[3:0];
  _RAND_189 = {1{`RANDOM}};
  image_189 = _RAND_189[3:0];
  _RAND_190 = {1{`RANDOM}};
  image_190 = _RAND_190[3:0];
  _RAND_191 = {1{`RANDOM}};
  image_191 = _RAND_191[3:0];
  _RAND_192 = {1{`RANDOM}};
  pixelIndex = _RAND_192[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      image_0 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h0 == _T_27[7:0]) begin
        image_0 <= io_pixelVal_in_7;
      end else if (8'h0 == _T_24[7:0]) begin
        image_0 <= io_pixelVal_in_6;
      end else if (8'h0 == _T_21[7:0]) begin
        image_0 <= io_pixelVal_in_5;
      end else if (8'h0 == _T_18[7:0]) begin
        image_0 <= io_pixelVal_in_4;
      end else if (8'h0 == _T_15[7:0]) begin
        image_0 <= io_pixelVal_in_3;
      end else if (8'h0 == _T_12[7:0]) begin
        image_0 <= io_pixelVal_in_2;
      end else if (8'h0 == _T_9[7:0]) begin
        image_0 <= io_pixelVal_in_1;
      end else if (8'h0 == _T_5[7:0]) begin
        image_0 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_1 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h1 == _T_27[7:0]) begin
        image_1 <= io_pixelVal_in_7;
      end else if (8'h1 == _T_24[7:0]) begin
        image_1 <= io_pixelVal_in_6;
      end else if (8'h1 == _T_21[7:0]) begin
        image_1 <= io_pixelVal_in_5;
      end else if (8'h1 == _T_18[7:0]) begin
        image_1 <= io_pixelVal_in_4;
      end else if (8'h1 == _T_15[7:0]) begin
        image_1 <= io_pixelVal_in_3;
      end else if (8'h1 == _T_12[7:0]) begin
        image_1 <= io_pixelVal_in_2;
      end else if (8'h1 == _T_9[7:0]) begin
        image_1 <= io_pixelVal_in_1;
      end else if (8'h1 == _T_5[7:0]) begin
        image_1 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_2 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h2 == _T_27[7:0]) begin
        image_2 <= io_pixelVal_in_7;
      end else if (8'h2 == _T_24[7:0]) begin
        image_2 <= io_pixelVal_in_6;
      end else if (8'h2 == _T_21[7:0]) begin
        image_2 <= io_pixelVal_in_5;
      end else if (8'h2 == _T_18[7:0]) begin
        image_2 <= io_pixelVal_in_4;
      end else if (8'h2 == _T_15[7:0]) begin
        image_2 <= io_pixelVal_in_3;
      end else if (8'h2 == _T_12[7:0]) begin
        image_2 <= io_pixelVal_in_2;
      end else if (8'h2 == _T_9[7:0]) begin
        image_2 <= io_pixelVal_in_1;
      end else if (8'h2 == _T_5[7:0]) begin
        image_2 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_3 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h3 == _T_27[7:0]) begin
        image_3 <= io_pixelVal_in_7;
      end else if (8'h3 == _T_24[7:0]) begin
        image_3 <= io_pixelVal_in_6;
      end else if (8'h3 == _T_21[7:0]) begin
        image_3 <= io_pixelVal_in_5;
      end else if (8'h3 == _T_18[7:0]) begin
        image_3 <= io_pixelVal_in_4;
      end else if (8'h3 == _T_15[7:0]) begin
        image_3 <= io_pixelVal_in_3;
      end else if (8'h3 == _T_12[7:0]) begin
        image_3 <= io_pixelVal_in_2;
      end else if (8'h3 == _T_9[7:0]) begin
        image_3 <= io_pixelVal_in_1;
      end else if (8'h3 == _T_5[7:0]) begin
        image_3 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_4 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h4 == _T_27[7:0]) begin
        image_4 <= io_pixelVal_in_7;
      end else if (8'h4 == _T_24[7:0]) begin
        image_4 <= io_pixelVal_in_6;
      end else if (8'h4 == _T_21[7:0]) begin
        image_4 <= io_pixelVal_in_5;
      end else if (8'h4 == _T_18[7:0]) begin
        image_4 <= io_pixelVal_in_4;
      end else if (8'h4 == _T_15[7:0]) begin
        image_4 <= io_pixelVal_in_3;
      end else if (8'h4 == _T_12[7:0]) begin
        image_4 <= io_pixelVal_in_2;
      end else if (8'h4 == _T_9[7:0]) begin
        image_4 <= io_pixelVal_in_1;
      end else if (8'h4 == _T_5[7:0]) begin
        image_4 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_5 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h5 == _T_27[7:0]) begin
        image_5 <= io_pixelVal_in_7;
      end else if (8'h5 == _T_24[7:0]) begin
        image_5 <= io_pixelVal_in_6;
      end else if (8'h5 == _T_21[7:0]) begin
        image_5 <= io_pixelVal_in_5;
      end else if (8'h5 == _T_18[7:0]) begin
        image_5 <= io_pixelVal_in_4;
      end else if (8'h5 == _T_15[7:0]) begin
        image_5 <= io_pixelVal_in_3;
      end else if (8'h5 == _T_12[7:0]) begin
        image_5 <= io_pixelVal_in_2;
      end else if (8'h5 == _T_9[7:0]) begin
        image_5 <= io_pixelVal_in_1;
      end else if (8'h5 == _T_5[7:0]) begin
        image_5 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_6 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h6 == _T_27[7:0]) begin
        image_6 <= io_pixelVal_in_7;
      end else if (8'h6 == _T_24[7:0]) begin
        image_6 <= io_pixelVal_in_6;
      end else if (8'h6 == _T_21[7:0]) begin
        image_6 <= io_pixelVal_in_5;
      end else if (8'h6 == _T_18[7:0]) begin
        image_6 <= io_pixelVal_in_4;
      end else if (8'h6 == _T_15[7:0]) begin
        image_6 <= io_pixelVal_in_3;
      end else if (8'h6 == _T_12[7:0]) begin
        image_6 <= io_pixelVal_in_2;
      end else if (8'h6 == _T_9[7:0]) begin
        image_6 <= io_pixelVal_in_1;
      end else if (8'h6 == _T_5[7:0]) begin
        image_6 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_7 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h7 == _T_27[7:0]) begin
        image_7 <= io_pixelVal_in_7;
      end else if (8'h7 == _T_24[7:0]) begin
        image_7 <= io_pixelVal_in_6;
      end else if (8'h7 == _T_21[7:0]) begin
        image_7 <= io_pixelVal_in_5;
      end else if (8'h7 == _T_18[7:0]) begin
        image_7 <= io_pixelVal_in_4;
      end else if (8'h7 == _T_15[7:0]) begin
        image_7 <= io_pixelVal_in_3;
      end else if (8'h7 == _T_12[7:0]) begin
        image_7 <= io_pixelVal_in_2;
      end else if (8'h7 == _T_9[7:0]) begin
        image_7 <= io_pixelVal_in_1;
      end else if (8'h7 == _T_5[7:0]) begin
        image_7 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_8 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h8 == _T_27[7:0]) begin
        image_8 <= io_pixelVal_in_7;
      end else if (8'h8 == _T_24[7:0]) begin
        image_8 <= io_pixelVal_in_6;
      end else if (8'h8 == _T_21[7:0]) begin
        image_8 <= io_pixelVal_in_5;
      end else if (8'h8 == _T_18[7:0]) begin
        image_8 <= io_pixelVal_in_4;
      end else if (8'h8 == _T_15[7:0]) begin
        image_8 <= io_pixelVal_in_3;
      end else if (8'h8 == _T_12[7:0]) begin
        image_8 <= io_pixelVal_in_2;
      end else if (8'h8 == _T_9[7:0]) begin
        image_8 <= io_pixelVal_in_1;
      end else if (8'h8 == _T_5[7:0]) begin
        image_8 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_9 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h9 == _T_27[7:0]) begin
        image_9 <= io_pixelVal_in_7;
      end else if (8'h9 == _T_24[7:0]) begin
        image_9 <= io_pixelVal_in_6;
      end else if (8'h9 == _T_21[7:0]) begin
        image_9 <= io_pixelVal_in_5;
      end else if (8'h9 == _T_18[7:0]) begin
        image_9 <= io_pixelVal_in_4;
      end else if (8'h9 == _T_15[7:0]) begin
        image_9 <= io_pixelVal_in_3;
      end else if (8'h9 == _T_12[7:0]) begin
        image_9 <= io_pixelVal_in_2;
      end else if (8'h9 == _T_9[7:0]) begin
        image_9 <= io_pixelVal_in_1;
      end else if (8'h9 == _T_5[7:0]) begin
        image_9 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_10 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'ha == _T_27[7:0]) begin
        image_10 <= io_pixelVal_in_7;
      end else if (8'ha == _T_24[7:0]) begin
        image_10 <= io_pixelVal_in_6;
      end else if (8'ha == _T_21[7:0]) begin
        image_10 <= io_pixelVal_in_5;
      end else if (8'ha == _T_18[7:0]) begin
        image_10 <= io_pixelVal_in_4;
      end else if (8'ha == _T_15[7:0]) begin
        image_10 <= io_pixelVal_in_3;
      end else if (8'ha == _T_12[7:0]) begin
        image_10 <= io_pixelVal_in_2;
      end else if (8'ha == _T_9[7:0]) begin
        image_10 <= io_pixelVal_in_1;
      end else if (8'ha == _T_5[7:0]) begin
        image_10 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_11 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'hb == _T_27[7:0]) begin
        image_11 <= io_pixelVal_in_7;
      end else if (8'hb == _T_24[7:0]) begin
        image_11 <= io_pixelVal_in_6;
      end else if (8'hb == _T_21[7:0]) begin
        image_11 <= io_pixelVal_in_5;
      end else if (8'hb == _T_18[7:0]) begin
        image_11 <= io_pixelVal_in_4;
      end else if (8'hb == _T_15[7:0]) begin
        image_11 <= io_pixelVal_in_3;
      end else if (8'hb == _T_12[7:0]) begin
        image_11 <= io_pixelVal_in_2;
      end else if (8'hb == _T_9[7:0]) begin
        image_11 <= io_pixelVal_in_1;
      end else if (8'hb == _T_5[7:0]) begin
        image_11 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_12 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'hc == _T_27[7:0]) begin
        image_12 <= io_pixelVal_in_7;
      end else if (8'hc == _T_24[7:0]) begin
        image_12 <= io_pixelVal_in_6;
      end else if (8'hc == _T_21[7:0]) begin
        image_12 <= io_pixelVal_in_5;
      end else if (8'hc == _T_18[7:0]) begin
        image_12 <= io_pixelVal_in_4;
      end else if (8'hc == _T_15[7:0]) begin
        image_12 <= io_pixelVal_in_3;
      end else if (8'hc == _T_12[7:0]) begin
        image_12 <= io_pixelVal_in_2;
      end else if (8'hc == _T_9[7:0]) begin
        image_12 <= io_pixelVal_in_1;
      end else if (8'hc == _T_5[7:0]) begin
        image_12 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_13 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'hd == _T_27[7:0]) begin
        image_13 <= io_pixelVal_in_7;
      end else if (8'hd == _T_24[7:0]) begin
        image_13 <= io_pixelVal_in_6;
      end else if (8'hd == _T_21[7:0]) begin
        image_13 <= io_pixelVal_in_5;
      end else if (8'hd == _T_18[7:0]) begin
        image_13 <= io_pixelVal_in_4;
      end else if (8'hd == _T_15[7:0]) begin
        image_13 <= io_pixelVal_in_3;
      end else if (8'hd == _T_12[7:0]) begin
        image_13 <= io_pixelVal_in_2;
      end else if (8'hd == _T_9[7:0]) begin
        image_13 <= io_pixelVal_in_1;
      end else if (8'hd == _T_5[7:0]) begin
        image_13 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_14 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'he == _T_27[7:0]) begin
        image_14 <= io_pixelVal_in_7;
      end else if (8'he == _T_24[7:0]) begin
        image_14 <= io_pixelVal_in_6;
      end else if (8'he == _T_21[7:0]) begin
        image_14 <= io_pixelVal_in_5;
      end else if (8'he == _T_18[7:0]) begin
        image_14 <= io_pixelVal_in_4;
      end else if (8'he == _T_15[7:0]) begin
        image_14 <= io_pixelVal_in_3;
      end else if (8'he == _T_12[7:0]) begin
        image_14 <= io_pixelVal_in_2;
      end else if (8'he == _T_9[7:0]) begin
        image_14 <= io_pixelVal_in_1;
      end else if (8'he == _T_5[7:0]) begin
        image_14 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_15 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'hf == _T_27[7:0]) begin
        image_15 <= io_pixelVal_in_7;
      end else if (8'hf == _T_24[7:0]) begin
        image_15 <= io_pixelVal_in_6;
      end else if (8'hf == _T_21[7:0]) begin
        image_15 <= io_pixelVal_in_5;
      end else if (8'hf == _T_18[7:0]) begin
        image_15 <= io_pixelVal_in_4;
      end else if (8'hf == _T_15[7:0]) begin
        image_15 <= io_pixelVal_in_3;
      end else if (8'hf == _T_12[7:0]) begin
        image_15 <= io_pixelVal_in_2;
      end else if (8'hf == _T_9[7:0]) begin
        image_15 <= io_pixelVal_in_1;
      end else if (8'hf == _T_5[7:0]) begin
        image_15 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_16 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h10 == _T_27[7:0]) begin
        image_16 <= io_pixelVal_in_7;
      end else if (8'h10 == _T_24[7:0]) begin
        image_16 <= io_pixelVal_in_6;
      end else if (8'h10 == _T_21[7:0]) begin
        image_16 <= io_pixelVal_in_5;
      end else if (8'h10 == _T_18[7:0]) begin
        image_16 <= io_pixelVal_in_4;
      end else if (8'h10 == _T_15[7:0]) begin
        image_16 <= io_pixelVal_in_3;
      end else if (8'h10 == _T_12[7:0]) begin
        image_16 <= io_pixelVal_in_2;
      end else if (8'h10 == _T_9[7:0]) begin
        image_16 <= io_pixelVal_in_1;
      end else if (8'h10 == _T_5[7:0]) begin
        image_16 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_17 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h11 == _T_27[7:0]) begin
        image_17 <= io_pixelVal_in_7;
      end else if (8'h11 == _T_24[7:0]) begin
        image_17 <= io_pixelVal_in_6;
      end else if (8'h11 == _T_21[7:0]) begin
        image_17 <= io_pixelVal_in_5;
      end else if (8'h11 == _T_18[7:0]) begin
        image_17 <= io_pixelVal_in_4;
      end else if (8'h11 == _T_15[7:0]) begin
        image_17 <= io_pixelVal_in_3;
      end else if (8'h11 == _T_12[7:0]) begin
        image_17 <= io_pixelVal_in_2;
      end else if (8'h11 == _T_9[7:0]) begin
        image_17 <= io_pixelVal_in_1;
      end else if (8'h11 == _T_5[7:0]) begin
        image_17 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_18 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h12 == _T_27[7:0]) begin
        image_18 <= io_pixelVal_in_7;
      end else if (8'h12 == _T_24[7:0]) begin
        image_18 <= io_pixelVal_in_6;
      end else if (8'h12 == _T_21[7:0]) begin
        image_18 <= io_pixelVal_in_5;
      end else if (8'h12 == _T_18[7:0]) begin
        image_18 <= io_pixelVal_in_4;
      end else if (8'h12 == _T_15[7:0]) begin
        image_18 <= io_pixelVal_in_3;
      end else if (8'h12 == _T_12[7:0]) begin
        image_18 <= io_pixelVal_in_2;
      end else if (8'h12 == _T_9[7:0]) begin
        image_18 <= io_pixelVal_in_1;
      end else if (8'h12 == _T_5[7:0]) begin
        image_18 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_19 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h13 == _T_27[7:0]) begin
        image_19 <= io_pixelVal_in_7;
      end else if (8'h13 == _T_24[7:0]) begin
        image_19 <= io_pixelVal_in_6;
      end else if (8'h13 == _T_21[7:0]) begin
        image_19 <= io_pixelVal_in_5;
      end else if (8'h13 == _T_18[7:0]) begin
        image_19 <= io_pixelVal_in_4;
      end else if (8'h13 == _T_15[7:0]) begin
        image_19 <= io_pixelVal_in_3;
      end else if (8'h13 == _T_12[7:0]) begin
        image_19 <= io_pixelVal_in_2;
      end else if (8'h13 == _T_9[7:0]) begin
        image_19 <= io_pixelVal_in_1;
      end else if (8'h13 == _T_5[7:0]) begin
        image_19 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_20 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h14 == _T_27[7:0]) begin
        image_20 <= io_pixelVal_in_7;
      end else if (8'h14 == _T_24[7:0]) begin
        image_20 <= io_pixelVal_in_6;
      end else if (8'h14 == _T_21[7:0]) begin
        image_20 <= io_pixelVal_in_5;
      end else if (8'h14 == _T_18[7:0]) begin
        image_20 <= io_pixelVal_in_4;
      end else if (8'h14 == _T_15[7:0]) begin
        image_20 <= io_pixelVal_in_3;
      end else if (8'h14 == _T_12[7:0]) begin
        image_20 <= io_pixelVal_in_2;
      end else if (8'h14 == _T_9[7:0]) begin
        image_20 <= io_pixelVal_in_1;
      end else if (8'h14 == _T_5[7:0]) begin
        image_20 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_21 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h15 == _T_27[7:0]) begin
        image_21 <= io_pixelVal_in_7;
      end else if (8'h15 == _T_24[7:0]) begin
        image_21 <= io_pixelVal_in_6;
      end else if (8'h15 == _T_21[7:0]) begin
        image_21 <= io_pixelVal_in_5;
      end else if (8'h15 == _T_18[7:0]) begin
        image_21 <= io_pixelVal_in_4;
      end else if (8'h15 == _T_15[7:0]) begin
        image_21 <= io_pixelVal_in_3;
      end else if (8'h15 == _T_12[7:0]) begin
        image_21 <= io_pixelVal_in_2;
      end else if (8'h15 == _T_9[7:0]) begin
        image_21 <= io_pixelVal_in_1;
      end else if (8'h15 == _T_5[7:0]) begin
        image_21 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_22 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h16 == _T_27[7:0]) begin
        image_22 <= io_pixelVal_in_7;
      end else if (8'h16 == _T_24[7:0]) begin
        image_22 <= io_pixelVal_in_6;
      end else if (8'h16 == _T_21[7:0]) begin
        image_22 <= io_pixelVal_in_5;
      end else if (8'h16 == _T_18[7:0]) begin
        image_22 <= io_pixelVal_in_4;
      end else if (8'h16 == _T_15[7:0]) begin
        image_22 <= io_pixelVal_in_3;
      end else if (8'h16 == _T_12[7:0]) begin
        image_22 <= io_pixelVal_in_2;
      end else if (8'h16 == _T_9[7:0]) begin
        image_22 <= io_pixelVal_in_1;
      end else if (8'h16 == _T_5[7:0]) begin
        image_22 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_23 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h17 == _T_27[7:0]) begin
        image_23 <= io_pixelVal_in_7;
      end else if (8'h17 == _T_24[7:0]) begin
        image_23 <= io_pixelVal_in_6;
      end else if (8'h17 == _T_21[7:0]) begin
        image_23 <= io_pixelVal_in_5;
      end else if (8'h17 == _T_18[7:0]) begin
        image_23 <= io_pixelVal_in_4;
      end else if (8'h17 == _T_15[7:0]) begin
        image_23 <= io_pixelVal_in_3;
      end else if (8'h17 == _T_12[7:0]) begin
        image_23 <= io_pixelVal_in_2;
      end else if (8'h17 == _T_9[7:0]) begin
        image_23 <= io_pixelVal_in_1;
      end else if (8'h17 == _T_5[7:0]) begin
        image_23 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_24 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h18 == _T_27[7:0]) begin
        image_24 <= io_pixelVal_in_7;
      end else if (8'h18 == _T_24[7:0]) begin
        image_24 <= io_pixelVal_in_6;
      end else if (8'h18 == _T_21[7:0]) begin
        image_24 <= io_pixelVal_in_5;
      end else if (8'h18 == _T_18[7:0]) begin
        image_24 <= io_pixelVal_in_4;
      end else if (8'h18 == _T_15[7:0]) begin
        image_24 <= io_pixelVal_in_3;
      end else if (8'h18 == _T_12[7:0]) begin
        image_24 <= io_pixelVal_in_2;
      end else if (8'h18 == _T_9[7:0]) begin
        image_24 <= io_pixelVal_in_1;
      end else if (8'h18 == _T_5[7:0]) begin
        image_24 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_25 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h19 == _T_27[7:0]) begin
        image_25 <= io_pixelVal_in_7;
      end else if (8'h19 == _T_24[7:0]) begin
        image_25 <= io_pixelVal_in_6;
      end else if (8'h19 == _T_21[7:0]) begin
        image_25 <= io_pixelVal_in_5;
      end else if (8'h19 == _T_18[7:0]) begin
        image_25 <= io_pixelVal_in_4;
      end else if (8'h19 == _T_15[7:0]) begin
        image_25 <= io_pixelVal_in_3;
      end else if (8'h19 == _T_12[7:0]) begin
        image_25 <= io_pixelVal_in_2;
      end else if (8'h19 == _T_9[7:0]) begin
        image_25 <= io_pixelVal_in_1;
      end else if (8'h19 == _T_5[7:0]) begin
        image_25 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_26 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h1a == _T_27[7:0]) begin
        image_26 <= io_pixelVal_in_7;
      end else if (8'h1a == _T_24[7:0]) begin
        image_26 <= io_pixelVal_in_6;
      end else if (8'h1a == _T_21[7:0]) begin
        image_26 <= io_pixelVal_in_5;
      end else if (8'h1a == _T_18[7:0]) begin
        image_26 <= io_pixelVal_in_4;
      end else if (8'h1a == _T_15[7:0]) begin
        image_26 <= io_pixelVal_in_3;
      end else if (8'h1a == _T_12[7:0]) begin
        image_26 <= io_pixelVal_in_2;
      end else if (8'h1a == _T_9[7:0]) begin
        image_26 <= io_pixelVal_in_1;
      end else if (8'h1a == _T_5[7:0]) begin
        image_26 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_27 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h1b == _T_27[7:0]) begin
        image_27 <= io_pixelVal_in_7;
      end else if (8'h1b == _T_24[7:0]) begin
        image_27 <= io_pixelVal_in_6;
      end else if (8'h1b == _T_21[7:0]) begin
        image_27 <= io_pixelVal_in_5;
      end else if (8'h1b == _T_18[7:0]) begin
        image_27 <= io_pixelVal_in_4;
      end else if (8'h1b == _T_15[7:0]) begin
        image_27 <= io_pixelVal_in_3;
      end else if (8'h1b == _T_12[7:0]) begin
        image_27 <= io_pixelVal_in_2;
      end else if (8'h1b == _T_9[7:0]) begin
        image_27 <= io_pixelVal_in_1;
      end else if (8'h1b == _T_5[7:0]) begin
        image_27 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_28 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h1c == _T_27[7:0]) begin
        image_28 <= io_pixelVal_in_7;
      end else if (8'h1c == _T_24[7:0]) begin
        image_28 <= io_pixelVal_in_6;
      end else if (8'h1c == _T_21[7:0]) begin
        image_28 <= io_pixelVal_in_5;
      end else if (8'h1c == _T_18[7:0]) begin
        image_28 <= io_pixelVal_in_4;
      end else if (8'h1c == _T_15[7:0]) begin
        image_28 <= io_pixelVal_in_3;
      end else if (8'h1c == _T_12[7:0]) begin
        image_28 <= io_pixelVal_in_2;
      end else if (8'h1c == _T_9[7:0]) begin
        image_28 <= io_pixelVal_in_1;
      end else if (8'h1c == _T_5[7:0]) begin
        image_28 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_29 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h1d == _T_27[7:0]) begin
        image_29 <= io_pixelVal_in_7;
      end else if (8'h1d == _T_24[7:0]) begin
        image_29 <= io_pixelVal_in_6;
      end else if (8'h1d == _T_21[7:0]) begin
        image_29 <= io_pixelVal_in_5;
      end else if (8'h1d == _T_18[7:0]) begin
        image_29 <= io_pixelVal_in_4;
      end else if (8'h1d == _T_15[7:0]) begin
        image_29 <= io_pixelVal_in_3;
      end else if (8'h1d == _T_12[7:0]) begin
        image_29 <= io_pixelVal_in_2;
      end else if (8'h1d == _T_9[7:0]) begin
        image_29 <= io_pixelVal_in_1;
      end else if (8'h1d == _T_5[7:0]) begin
        image_29 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_30 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h1e == _T_27[7:0]) begin
        image_30 <= io_pixelVal_in_7;
      end else if (8'h1e == _T_24[7:0]) begin
        image_30 <= io_pixelVal_in_6;
      end else if (8'h1e == _T_21[7:0]) begin
        image_30 <= io_pixelVal_in_5;
      end else if (8'h1e == _T_18[7:0]) begin
        image_30 <= io_pixelVal_in_4;
      end else if (8'h1e == _T_15[7:0]) begin
        image_30 <= io_pixelVal_in_3;
      end else if (8'h1e == _T_12[7:0]) begin
        image_30 <= io_pixelVal_in_2;
      end else if (8'h1e == _T_9[7:0]) begin
        image_30 <= io_pixelVal_in_1;
      end else if (8'h1e == _T_5[7:0]) begin
        image_30 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_31 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h1f == _T_27[7:0]) begin
        image_31 <= io_pixelVal_in_7;
      end else if (8'h1f == _T_24[7:0]) begin
        image_31 <= io_pixelVal_in_6;
      end else if (8'h1f == _T_21[7:0]) begin
        image_31 <= io_pixelVal_in_5;
      end else if (8'h1f == _T_18[7:0]) begin
        image_31 <= io_pixelVal_in_4;
      end else if (8'h1f == _T_15[7:0]) begin
        image_31 <= io_pixelVal_in_3;
      end else if (8'h1f == _T_12[7:0]) begin
        image_31 <= io_pixelVal_in_2;
      end else if (8'h1f == _T_9[7:0]) begin
        image_31 <= io_pixelVal_in_1;
      end else if (8'h1f == _T_5[7:0]) begin
        image_31 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_32 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h20 == _T_27[7:0]) begin
        image_32 <= io_pixelVal_in_7;
      end else if (8'h20 == _T_24[7:0]) begin
        image_32 <= io_pixelVal_in_6;
      end else if (8'h20 == _T_21[7:0]) begin
        image_32 <= io_pixelVal_in_5;
      end else if (8'h20 == _T_18[7:0]) begin
        image_32 <= io_pixelVal_in_4;
      end else if (8'h20 == _T_15[7:0]) begin
        image_32 <= io_pixelVal_in_3;
      end else if (8'h20 == _T_12[7:0]) begin
        image_32 <= io_pixelVal_in_2;
      end else if (8'h20 == _T_9[7:0]) begin
        image_32 <= io_pixelVal_in_1;
      end else if (8'h20 == _T_5[7:0]) begin
        image_32 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_33 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h21 == _T_27[7:0]) begin
        image_33 <= io_pixelVal_in_7;
      end else if (8'h21 == _T_24[7:0]) begin
        image_33 <= io_pixelVal_in_6;
      end else if (8'h21 == _T_21[7:0]) begin
        image_33 <= io_pixelVal_in_5;
      end else if (8'h21 == _T_18[7:0]) begin
        image_33 <= io_pixelVal_in_4;
      end else if (8'h21 == _T_15[7:0]) begin
        image_33 <= io_pixelVal_in_3;
      end else if (8'h21 == _T_12[7:0]) begin
        image_33 <= io_pixelVal_in_2;
      end else if (8'h21 == _T_9[7:0]) begin
        image_33 <= io_pixelVal_in_1;
      end else if (8'h21 == _T_5[7:0]) begin
        image_33 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_34 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h22 == _T_27[7:0]) begin
        image_34 <= io_pixelVal_in_7;
      end else if (8'h22 == _T_24[7:0]) begin
        image_34 <= io_pixelVal_in_6;
      end else if (8'h22 == _T_21[7:0]) begin
        image_34 <= io_pixelVal_in_5;
      end else if (8'h22 == _T_18[7:0]) begin
        image_34 <= io_pixelVal_in_4;
      end else if (8'h22 == _T_15[7:0]) begin
        image_34 <= io_pixelVal_in_3;
      end else if (8'h22 == _T_12[7:0]) begin
        image_34 <= io_pixelVal_in_2;
      end else if (8'h22 == _T_9[7:0]) begin
        image_34 <= io_pixelVal_in_1;
      end else if (8'h22 == _T_5[7:0]) begin
        image_34 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_35 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h23 == _T_27[7:0]) begin
        image_35 <= io_pixelVal_in_7;
      end else if (8'h23 == _T_24[7:0]) begin
        image_35 <= io_pixelVal_in_6;
      end else if (8'h23 == _T_21[7:0]) begin
        image_35 <= io_pixelVal_in_5;
      end else if (8'h23 == _T_18[7:0]) begin
        image_35 <= io_pixelVal_in_4;
      end else if (8'h23 == _T_15[7:0]) begin
        image_35 <= io_pixelVal_in_3;
      end else if (8'h23 == _T_12[7:0]) begin
        image_35 <= io_pixelVal_in_2;
      end else if (8'h23 == _T_9[7:0]) begin
        image_35 <= io_pixelVal_in_1;
      end else if (8'h23 == _T_5[7:0]) begin
        image_35 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_36 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h24 == _T_27[7:0]) begin
        image_36 <= io_pixelVal_in_7;
      end else if (8'h24 == _T_24[7:0]) begin
        image_36 <= io_pixelVal_in_6;
      end else if (8'h24 == _T_21[7:0]) begin
        image_36 <= io_pixelVal_in_5;
      end else if (8'h24 == _T_18[7:0]) begin
        image_36 <= io_pixelVal_in_4;
      end else if (8'h24 == _T_15[7:0]) begin
        image_36 <= io_pixelVal_in_3;
      end else if (8'h24 == _T_12[7:0]) begin
        image_36 <= io_pixelVal_in_2;
      end else if (8'h24 == _T_9[7:0]) begin
        image_36 <= io_pixelVal_in_1;
      end else if (8'h24 == _T_5[7:0]) begin
        image_36 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_37 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h25 == _T_27[7:0]) begin
        image_37 <= io_pixelVal_in_7;
      end else if (8'h25 == _T_24[7:0]) begin
        image_37 <= io_pixelVal_in_6;
      end else if (8'h25 == _T_21[7:0]) begin
        image_37 <= io_pixelVal_in_5;
      end else if (8'h25 == _T_18[7:0]) begin
        image_37 <= io_pixelVal_in_4;
      end else if (8'h25 == _T_15[7:0]) begin
        image_37 <= io_pixelVal_in_3;
      end else if (8'h25 == _T_12[7:0]) begin
        image_37 <= io_pixelVal_in_2;
      end else if (8'h25 == _T_9[7:0]) begin
        image_37 <= io_pixelVal_in_1;
      end else if (8'h25 == _T_5[7:0]) begin
        image_37 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_38 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h26 == _T_27[7:0]) begin
        image_38 <= io_pixelVal_in_7;
      end else if (8'h26 == _T_24[7:0]) begin
        image_38 <= io_pixelVal_in_6;
      end else if (8'h26 == _T_21[7:0]) begin
        image_38 <= io_pixelVal_in_5;
      end else if (8'h26 == _T_18[7:0]) begin
        image_38 <= io_pixelVal_in_4;
      end else if (8'h26 == _T_15[7:0]) begin
        image_38 <= io_pixelVal_in_3;
      end else if (8'h26 == _T_12[7:0]) begin
        image_38 <= io_pixelVal_in_2;
      end else if (8'h26 == _T_9[7:0]) begin
        image_38 <= io_pixelVal_in_1;
      end else if (8'h26 == _T_5[7:0]) begin
        image_38 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_39 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h27 == _T_27[7:0]) begin
        image_39 <= io_pixelVal_in_7;
      end else if (8'h27 == _T_24[7:0]) begin
        image_39 <= io_pixelVal_in_6;
      end else if (8'h27 == _T_21[7:0]) begin
        image_39 <= io_pixelVal_in_5;
      end else if (8'h27 == _T_18[7:0]) begin
        image_39 <= io_pixelVal_in_4;
      end else if (8'h27 == _T_15[7:0]) begin
        image_39 <= io_pixelVal_in_3;
      end else if (8'h27 == _T_12[7:0]) begin
        image_39 <= io_pixelVal_in_2;
      end else if (8'h27 == _T_9[7:0]) begin
        image_39 <= io_pixelVal_in_1;
      end else if (8'h27 == _T_5[7:0]) begin
        image_39 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_40 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h28 == _T_27[7:0]) begin
        image_40 <= io_pixelVal_in_7;
      end else if (8'h28 == _T_24[7:0]) begin
        image_40 <= io_pixelVal_in_6;
      end else if (8'h28 == _T_21[7:0]) begin
        image_40 <= io_pixelVal_in_5;
      end else if (8'h28 == _T_18[7:0]) begin
        image_40 <= io_pixelVal_in_4;
      end else if (8'h28 == _T_15[7:0]) begin
        image_40 <= io_pixelVal_in_3;
      end else if (8'h28 == _T_12[7:0]) begin
        image_40 <= io_pixelVal_in_2;
      end else if (8'h28 == _T_9[7:0]) begin
        image_40 <= io_pixelVal_in_1;
      end else if (8'h28 == _T_5[7:0]) begin
        image_40 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_41 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h29 == _T_27[7:0]) begin
        image_41 <= io_pixelVal_in_7;
      end else if (8'h29 == _T_24[7:0]) begin
        image_41 <= io_pixelVal_in_6;
      end else if (8'h29 == _T_21[7:0]) begin
        image_41 <= io_pixelVal_in_5;
      end else if (8'h29 == _T_18[7:0]) begin
        image_41 <= io_pixelVal_in_4;
      end else if (8'h29 == _T_15[7:0]) begin
        image_41 <= io_pixelVal_in_3;
      end else if (8'h29 == _T_12[7:0]) begin
        image_41 <= io_pixelVal_in_2;
      end else if (8'h29 == _T_9[7:0]) begin
        image_41 <= io_pixelVal_in_1;
      end else if (8'h29 == _T_5[7:0]) begin
        image_41 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_42 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h2a == _T_27[7:0]) begin
        image_42 <= io_pixelVal_in_7;
      end else if (8'h2a == _T_24[7:0]) begin
        image_42 <= io_pixelVal_in_6;
      end else if (8'h2a == _T_21[7:0]) begin
        image_42 <= io_pixelVal_in_5;
      end else if (8'h2a == _T_18[7:0]) begin
        image_42 <= io_pixelVal_in_4;
      end else if (8'h2a == _T_15[7:0]) begin
        image_42 <= io_pixelVal_in_3;
      end else if (8'h2a == _T_12[7:0]) begin
        image_42 <= io_pixelVal_in_2;
      end else if (8'h2a == _T_9[7:0]) begin
        image_42 <= io_pixelVal_in_1;
      end else if (8'h2a == _T_5[7:0]) begin
        image_42 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_43 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h2b == _T_27[7:0]) begin
        image_43 <= io_pixelVal_in_7;
      end else if (8'h2b == _T_24[7:0]) begin
        image_43 <= io_pixelVal_in_6;
      end else if (8'h2b == _T_21[7:0]) begin
        image_43 <= io_pixelVal_in_5;
      end else if (8'h2b == _T_18[7:0]) begin
        image_43 <= io_pixelVal_in_4;
      end else if (8'h2b == _T_15[7:0]) begin
        image_43 <= io_pixelVal_in_3;
      end else if (8'h2b == _T_12[7:0]) begin
        image_43 <= io_pixelVal_in_2;
      end else if (8'h2b == _T_9[7:0]) begin
        image_43 <= io_pixelVal_in_1;
      end else if (8'h2b == _T_5[7:0]) begin
        image_43 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_44 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h2c == _T_27[7:0]) begin
        image_44 <= io_pixelVal_in_7;
      end else if (8'h2c == _T_24[7:0]) begin
        image_44 <= io_pixelVal_in_6;
      end else if (8'h2c == _T_21[7:0]) begin
        image_44 <= io_pixelVal_in_5;
      end else if (8'h2c == _T_18[7:0]) begin
        image_44 <= io_pixelVal_in_4;
      end else if (8'h2c == _T_15[7:0]) begin
        image_44 <= io_pixelVal_in_3;
      end else if (8'h2c == _T_12[7:0]) begin
        image_44 <= io_pixelVal_in_2;
      end else if (8'h2c == _T_9[7:0]) begin
        image_44 <= io_pixelVal_in_1;
      end else if (8'h2c == _T_5[7:0]) begin
        image_44 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_45 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h2d == _T_27[7:0]) begin
        image_45 <= io_pixelVal_in_7;
      end else if (8'h2d == _T_24[7:0]) begin
        image_45 <= io_pixelVal_in_6;
      end else if (8'h2d == _T_21[7:0]) begin
        image_45 <= io_pixelVal_in_5;
      end else if (8'h2d == _T_18[7:0]) begin
        image_45 <= io_pixelVal_in_4;
      end else if (8'h2d == _T_15[7:0]) begin
        image_45 <= io_pixelVal_in_3;
      end else if (8'h2d == _T_12[7:0]) begin
        image_45 <= io_pixelVal_in_2;
      end else if (8'h2d == _T_9[7:0]) begin
        image_45 <= io_pixelVal_in_1;
      end else if (8'h2d == _T_5[7:0]) begin
        image_45 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_46 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h2e == _T_27[7:0]) begin
        image_46 <= io_pixelVal_in_7;
      end else if (8'h2e == _T_24[7:0]) begin
        image_46 <= io_pixelVal_in_6;
      end else if (8'h2e == _T_21[7:0]) begin
        image_46 <= io_pixelVal_in_5;
      end else if (8'h2e == _T_18[7:0]) begin
        image_46 <= io_pixelVal_in_4;
      end else if (8'h2e == _T_15[7:0]) begin
        image_46 <= io_pixelVal_in_3;
      end else if (8'h2e == _T_12[7:0]) begin
        image_46 <= io_pixelVal_in_2;
      end else if (8'h2e == _T_9[7:0]) begin
        image_46 <= io_pixelVal_in_1;
      end else if (8'h2e == _T_5[7:0]) begin
        image_46 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_47 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h2f == _T_27[7:0]) begin
        image_47 <= io_pixelVal_in_7;
      end else if (8'h2f == _T_24[7:0]) begin
        image_47 <= io_pixelVal_in_6;
      end else if (8'h2f == _T_21[7:0]) begin
        image_47 <= io_pixelVal_in_5;
      end else if (8'h2f == _T_18[7:0]) begin
        image_47 <= io_pixelVal_in_4;
      end else if (8'h2f == _T_15[7:0]) begin
        image_47 <= io_pixelVal_in_3;
      end else if (8'h2f == _T_12[7:0]) begin
        image_47 <= io_pixelVal_in_2;
      end else if (8'h2f == _T_9[7:0]) begin
        image_47 <= io_pixelVal_in_1;
      end else if (8'h2f == _T_5[7:0]) begin
        image_47 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_48 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h30 == _T_27[7:0]) begin
        image_48 <= io_pixelVal_in_7;
      end else if (8'h30 == _T_24[7:0]) begin
        image_48 <= io_pixelVal_in_6;
      end else if (8'h30 == _T_21[7:0]) begin
        image_48 <= io_pixelVal_in_5;
      end else if (8'h30 == _T_18[7:0]) begin
        image_48 <= io_pixelVal_in_4;
      end else if (8'h30 == _T_15[7:0]) begin
        image_48 <= io_pixelVal_in_3;
      end else if (8'h30 == _T_12[7:0]) begin
        image_48 <= io_pixelVal_in_2;
      end else if (8'h30 == _T_9[7:0]) begin
        image_48 <= io_pixelVal_in_1;
      end else if (8'h30 == _T_5[7:0]) begin
        image_48 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_49 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h31 == _T_27[7:0]) begin
        image_49 <= io_pixelVal_in_7;
      end else if (8'h31 == _T_24[7:0]) begin
        image_49 <= io_pixelVal_in_6;
      end else if (8'h31 == _T_21[7:0]) begin
        image_49 <= io_pixelVal_in_5;
      end else if (8'h31 == _T_18[7:0]) begin
        image_49 <= io_pixelVal_in_4;
      end else if (8'h31 == _T_15[7:0]) begin
        image_49 <= io_pixelVal_in_3;
      end else if (8'h31 == _T_12[7:0]) begin
        image_49 <= io_pixelVal_in_2;
      end else if (8'h31 == _T_9[7:0]) begin
        image_49 <= io_pixelVal_in_1;
      end else if (8'h31 == _T_5[7:0]) begin
        image_49 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_50 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h32 == _T_27[7:0]) begin
        image_50 <= io_pixelVal_in_7;
      end else if (8'h32 == _T_24[7:0]) begin
        image_50 <= io_pixelVal_in_6;
      end else if (8'h32 == _T_21[7:0]) begin
        image_50 <= io_pixelVal_in_5;
      end else if (8'h32 == _T_18[7:0]) begin
        image_50 <= io_pixelVal_in_4;
      end else if (8'h32 == _T_15[7:0]) begin
        image_50 <= io_pixelVal_in_3;
      end else if (8'h32 == _T_12[7:0]) begin
        image_50 <= io_pixelVal_in_2;
      end else if (8'h32 == _T_9[7:0]) begin
        image_50 <= io_pixelVal_in_1;
      end else if (8'h32 == _T_5[7:0]) begin
        image_50 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_51 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h33 == _T_27[7:0]) begin
        image_51 <= io_pixelVal_in_7;
      end else if (8'h33 == _T_24[7:0]) begin
        image_51 <= io_pixelVal_in_6;
      end else if (8'h33 == _T_21[7:0]) begin
        image_51 <= io_pixelVal_in_5;
      end else if (8'h33 == _T_18[7:0]) begin
        image_51 <= io_pixelVal_in_4;
      end else if (8'h33 == _T_15[7:0]) begin
        image_51 <= io_pixelVal_in_3;
      end else if (8'h33 == _T_12[7:0]) begin
        image_51 <= io_pixelVal_in_2;
      end else if (8'h33 == _T_9[7:0]) begin
        image_51 <= io_pixelVal_in_1;
      end else if (8'h33 == _T_5[7:0]) begin
        image_51 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_52 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h34 == _T_27[7:0]) begin
        image_52 <= io_pixelVal_in_7;
      end else if (8'h34 == _T_24[7:0]) begin
        image_52 <= io_pixelVal_in_6;
      end else if (8'h34 == _T_21[7:0]) begin
        image_52 <= io_pixelVal_in_5;
      end else if (8'h34 == _T_18[7:0]) begin
        image_52 <= io_pixelVal_in_4;
      end else if (8'h34 == _T_15[7:0]) begin
        image_52 <= io_pixelVal_in_3;
      end else if (8'h34 == _T_12[7:0]) begin
        image_52 <= io_pixelVal_in_2;
      end else if (8'h34 == _T_9[7:0]) begin
        image_52 <= io_pixelVal_in_1;
      end else if (8'h34 == _T_5[7:0]) begin
        image_52 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_53 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h35 == _T_27[7:0]) begin
        image_53 <= io_pixelVal_in_7;
      end else if (8'h35 == _T_24[7:0]) begin
        image_53 <= io_pixelVal_in_6;
      end else if (8'h35 == _T_21[7:0]) begin
        image_53 <= io_pixelVal_in_5;
      end else if (8'h35 == _T_18[7:0]) begin
        image_53 <= io_pixelVal_in_4;
      end else if (8'h35 == _T_15[7:0]) begin
        image_53 <= io_pixelVal_in_3;
      end else if (8'h35 == _T_12[7:0]) begin
        image_53 <= io_pixelVal_in_2;
      end else if (8'h35 == _T_9[7:0]) begin
        image_53 <= io_pixelVal_in_1;
      end else if (8'h35 == _T_5[7:0]) begin
        image_53 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_54 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h36 == _T_27[7:0]) begin
        image_54 <= io_pixelVal_in_7;
      end else if (8'h36 == _T_24[7:0]) begin
        image_54 <= io_pixelVal_in_6;
      end else if (8'h36 == _T_21[7:0]) begin
        image_54 <= io_pixelVal_in_5;
      end else if (8'h36 == _T_18[7:0]) begin
        image_54 <= io_pixelVal_in_4;
      end else if (8'h36 == _T_15[7:0]) begin
        image_54 <= io_pixelVal_in_3;
      end else if (8'h36 == _T_12[7:0]) begin
        image_54 <= io_pixelVal_in_2;
      end else if (8'h36 == _T_9[7:0]) begin
        image_54 <= io_pixelVal_in_1;
      end else if (8'h36 == _T_5[7:0]) begin
        image_54 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_55 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h37 == _T_27[7:0]) begin
        image_55 <= io_pixelVal_in_7;
      end else if (8'h37 == _T_24[7:0]) begin
        image_55 <= io_pixelVal_in_6;
      end else if (8'h37 == _T_21[7:0]) begin
        image_55 <= io_pixelVal_in_5;
      end else if (8'h37 == _T_18[7:0]) begin
        image_55 <= io_pixelVal_in_4;
      end else if (8'h37 == _T_15[7:0]) begin
        image_55 <= io_pixelVal_in_3;
      end else if (8'h37 == _T_12[7:0]) begin
        image_55 <= io_pixelVal_in_2;
      end else if (8'h37 == _T_9[7:0]) begin
        image_55 <= io_pixelVal_in_1;
      end else if (8'h37 == _T_5[7:0]) begin
        image_55 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_56 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h38 == _T_27[7:0]) begin
        image_56 <= io_pixelVal_in_7;
      end else if (8'h38 == _T_24[7:0]) begin
        image_56 <= io_pixelVal_in_6;
      end else if (8'h38 == _T_21[7:0]) begin
        image_56 <= io_pixelVal_in_5;
      end else if (8'h38 == _T_18[7:0]) begin
        image_56 <= io_pixelVal_in_4;
      end else if (8'h38 == _T_15[7:0]) begin
        image_56 <= io_pixelVal_in_3;
      end else if (8'h38 == _T_12[7:0]) begin
        image_56 <= io_pixelVal_in_2;
      end else if (8'h38 == _T_9[7:0]) begin
        image_56 <= io_pixelVal_in_1;
      end else if (8'h38 == _T_5[7:0]) begin
        image_56 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_57 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h39 == _T_27[7:0]) begin
        image_57 <= io_pixelVal_in_7;
      end else if (8'h39 == _T_24[7:0]) begin
        image_57 <= io_pixelVal_in_6;
      end else if (8'h39 == _T_21[7:0]) begin
        image_57 <= io_pixelVal_in_5;
      end else if (8'h39 == _T_18[7:0]) begin
        image_57 <= io_pixelVal_in_4;
      end else if (8'h39 == _T_15[7:0]) begin
        image_57 <= io_pixelVal_in_3;
      end else if (8'h39 == _T_12[7:0]) begin
        image_57 <= io_pixelVal_in_2;
      end else if (8'h39 == _T_9[7:0]) begin
        image_57 <= io_pixelVal_in_1;
      end else if (8'h39 == _T_5[7:0]) begin
        image_57 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_58 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h3a == _T_27[7:0]) begin
        image_58 <= io_pixelVal_in_7;
      end else if (8'h3a == _T_24[7:0]) begin
        image_58 <= io_pixelVal_in_6;
      end else if (8'h3a == _T_21[7:0]) begin
        image_58 <= io_pixelVal_in_5;
      end else if (8'h3a == _T_18[7:0]) begin
        image_58 <= io_pixelVal_in_4;
      end else if (8'h3a == _T_15[7:0]) begin
        image_58 <= io_pixelVal_in_3;
      end else if (8'h3a == _T_12[7:0]) begin
        image_58 <= io_pixelVal_in_2;
      end else if (8'h3a == _T_9[7:0]) begin
        image_58 <= io_pixelVal_in_1;
      end else if (8'h3a == _T_5[7:0]) begin
        image_58 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_59 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h3b == _T_27[7:0]) begin
        image_59 <= io_pixelVal_in_7;
      end else if (8'h3b == _T_24[7:0]) begin
        image_59 <= io_pixelVal_in_6;
      end else if (8'h3b == _T_21[7:0]) begin
        image_59 <= io_pixelVal_in_5;
      end else if (8'h3b == _T_18[7:0]) begin
        image_59 <= io_pixelVal_in_4;
      end else if (8'h3b == _T_15[7:0]) begin
        image_59 <= io_pixelVal_in_3;
      end else if (8'h3b == _T_12[7:0]) begin
        image_59 <= io_pixelVal_in_2;
      end else if (8'h3b == _T_9[7:0]) begin
        image_59 <= io_pixelVal_in_1;
      end else if (8'h3b == _T_5[7:0]) begin
        image_59 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_60 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h3c == _T_27[7:0]) begin
        image_60 <= io_pixelVal_in_7;
      end else if (8'h3c == _T_24[7:0]) begin
        image_60 <= io_pixelVal_in_6;
      end else if (8'h3c == _T_21[7:0]) begin
        image_60 <= io_pixelVal_in_5;
      end else if (8'h3c == _T_18[7:0]) begin
        image_60 <= io_pixelVal_in_4;
      end else if (8'h3c == _T_15[7:0]) begin
        image_60 <= io_pixelVal_in_3;
      end else if (8'h3c == _T_12[7:0]) begin
        image_60 <= io_pixelVal_in_2;
      end else if (8'h3c == _T_9[7:0]) begin
        image_60 <= io_pixelVal_in_1;
      end else if (8'h3c == _T_5[7:0]) begin
        image_60 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_61 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h3d == _T_27[7:0]) begin
        image_61 <= io_pixelVal_in_7;
      end else if (8'h3d == _T_24[7:0]) begin
        image_61 <= io_pixelVal_in_6;
      end else if (8'h3d == _T_21[7:0]) begin
        image_61 <= io_pixelVal_in_5;
      end else if (8'h3d == _T_18[7:0]) begin
        image_61 <= io_pixelVal_in_4;
      end else if (8'h3d == _T_15[7:0]) begin
        image_61 <= io_pixelVal_in_3;
      end else if (8'h3d == _T_12[7:0]) begin
        image_61 <= io_pixelVal_in_2;
      end else if (8'h3d == _T_9[7:0]) begin
        image_61 <= io_pixelVal_in_1;
      end else if (8'h3d == _T_5[7:0]) begin
        image_61 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_62 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h3e == _T_27[7:0]) begin
        image_62 <= io_pixelVal_in_7;
      end else if (8'h3e == _T_24[7:0]) begin
        image_62 <= io_pixelVal_in_6;
      end else if (8'h3e == _T_21[7:0]) begin
        image_62 <= io_pixelVal_in_5;
      end else if (8'h3e == _T_18[7:0]) begin
        image_62 <= io_pixelVal_in_4;
      end else if (8'h3e == _T_15[7:0]) begin
        image_62 <= io_pixelVal_in_3;
      end else if (8'h3e == _T_12[7:0]) begin
        image_62 <= io_pixelVal_in_2;
      end else if (8'h3e == _T_9[7:0]) begin
        image_62 <= io_pixelVal_in_1;
      end else if (8'h3e == _T_5[7:0]) begin
        image_62 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_63 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h3f == _T_27[7:0]) begin
        image_63 <= io_pixelVal_in_7;
      end else if (8'h3f == _T_24[7:0]) begin
        image_63 <= io_pixelVal_in_6;
      end else if (8'h3f == _T_21[7:0]) begin
        image_63 <= io_pixelVal_in_5;
      end else if (8'h3f == _T_18[7:0]) begin
        image_63 <= io_pixelVal_in_4;
      end else if (8'h3f == _T_15[7:0]) begin
        image_63 <= io_pixelVal_in_3;
      end else if (8'h3f == _T_12[7:0]) begin
        image_63 <= io_pixelVal_in_2;
      end else if (8'h3f == _T_9[7:0]) begin
        image_63 <= io_pixelVal_in_1;
      end else if (8'h3f == _T_5[7:0]) begin
        image_63 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_64 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h40 == _T_27[7:0]) begin
        image_64 <= io_pixelVal_in_7;
      end else if (8'h40 == _T_24[7:0]) begin
        image_64 <= io_pixelVal_in_6;
      end else if (8'h40 == _T_21[7:0]) begin
        image_64 <= io_pixelVal_in_5;
      end else if (8'h40 == _T_18[7:0]) begin
        image_64 <= io_pixelVal_in_4;
      end else if (8'h40 == _T_15[7:0]) begin
        image_64 <= io_pixelVal_in_3;
      end else if (8'h40 == _T_12[7:0]) begin
        image_64 <= io_pixelVal_in_2;
      end else if (8'h40 == _T_9[7:0]) begin
        image_64 <= io_pixelVal_in_1;
      end else if (8'h40 == _T_5[7:0]) begin
        image_64 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_65 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h41 == _T_27[7:0]) begin
        image_65 <= io_pixelVal_in_7;
      end else if (8'h41 == _T_24[7:0]) begin
        image_65 <= io_pixelVal_in_6;
      end else if (8'h41 == _T_21[7:0]) begin
        image_65 <= io_pixelVal_in_5;
      end else if (8'h41 == _T_18[7:0]) begin
        image_65 <= io_pixelVal_in_4;
      end else if (8'h41 == _T_15[7:0]) begin
        image_65 <= io_pixelVal_in_3;
      end else if (8'h41 == _T_12[7:0]) begin
        image_65 <= io_pixelVal_in_2;
      end else if (8'h41 == _T_9[7:0]) begin
        image_65 <= io_pixelVal_in_1;
      end else if (8'h41 == _T_5[7:0]) begin
        image_65 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_66 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h42 == _T_27[7:0]) begin
        image_66 <= io_pixelVal_in_7;
      end else if (8'h42 == _T_24[7:0]) begin
        image_66 <= io_pixelVal_in_6;
      end else if (8'h42 == _T_21[7:0]) begin
        image_66 <= io_pixelVal_in_5;
      end else if (8'h42 == _T_18[7:0]) begin
        image_66 <= io_pixelVal_in_4;
      end else if (8'h42 == _T_15[7:0]) begin
        image_66 <= io_pixelVal_in_3;
      end else if (8'h42 == _T_12[7:0]) begin
        image_66 <= io_pixelVal_in_2;
      end else if (8'h42 == _T_9[7:0]) begin
        image_66 <= io_pixelVal_in_1;
      end else if (8'h42 == _T_5[7:0]) begin
        image_66 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_67 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h43 == _T_27[7:0]) begin
        image_67 <= io_pixelVal_in_7;
      end else if (8'h43 == _T_24[7:0]) begin
        image_67 <= io_pixelVal_in_6;
      end else if (8'h43 == _T_21[7:0]) begin
        image_67 <= io_pixelVal_in_5;
      end else if (8'h43 == _T_18[7:0]) begin
        image_67 <= io_pixelVal_in_4;
      end else if (8'h43 == _T_15[7:0]) begin
        image_67 <= io_pixelVal_in_3;
      end else if (8'h43 == _T_12[7:0]) begin
        image_67 <= io_pixelVal_in_2;
      end else if (8'h43 == _T_9[7:0]) begin
        image_67 <= io_pixelVal_in_1;
      end else if (8'h43 == _T_5[7:0]) begin
        image_67 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_68 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h44 == _T_27[7:0]) begin
        image_68 <= io_pixelVal_in_7;
      end else if (8'h44 == _T_24[7:0]) begin
        image_68 <= io_pixelVal_in_6;
      end else if (8'h44 == _T_21[7:0]) begin
        image_68 <= io_pixelVal_in_5;
      end else if (8'h44 == _T_18[7:0]) begin
        image_68 <= io_pixelVal_in_4;
      end else if (8'h44 == _T_15[7:0]) begin
        image_68 <= io_pixelVal_in_3;
      end else if (8'h44 == _T_12[7:0]) begin
        image_68 <= io_pixelVal_in_2;
      end else if (8'h44 == _T_9[7:0]) begin
        image_68 <= io_pixelVal_in_1;
      end else if (8'h44 == _T_5[7:0]) begin
        image_68 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_69 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h45 == _T_27[7:0]) begin
        image_69 <= io_pixelVal_in_7;
      end else if (8'h45 == _T_24[7:0]) begin
        image_69 <= io_pixelVal_in_6;
      end else if (8'h45 == _T_21[7:0]) begin
        image_69 <= io_pixelVal_in_5;
      end else if (8'h45 == _T_18[7:0]) begin
        image_69 <= io_pixelVal_in_4;
      end else if (8'h45 == _T_15[7:0]) begin
        image_69 <= io_pixelVal_in_3;
      end else if (8'h45 == _T_12[7:0]) begin
        image_69 <= io_pixelVal_in_2;
      end else if (8'h45 == _T_9[7:0]) begin
        image_69 <= io_pixelVal_in_1;
      end else if (8'h45 == _T_5[7:0]) begin
        image_69 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_70 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h46 == _T_27[7:0]) begin
        image_70 <= io_pixelVal_in_7;
      end else if (8'h46 == _T_24[7:0]) begin
        image_70 <= io_pixelVal_in_6;
      end else if (8'h46 == _T_21[7:0]) begin
        image_70 <= io_pixelVal_in_5;
      end else if (8'h46 == _T_18[7:0]) begin
        image_70 <= io_pixelVal_in_4;
      end else if (8'h46 == _T_15[7:0]) begin
        image_70 <= io_pixelVal_in_3;
      end else if (8'h46 == _T_12[7:0]) begin
        image_70 <= io_pixelVal_in_2;
      end else if (8'h46 == _T_9[7:0]) begin
        image_70 <= io_pixelVal_in_1;
      end else if (8'h46 == _T_5[7:0]) begin
        image_70 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_71 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h47 == _T_27[7:0]) begin
        image_71 <= io_pixelVal_in_7;
      end else if (8'h47 == _T_24[7:0]) begin
        image_71 <= io_pixelVal_in_6;
      end else if (8'h47 == _T_21[7:0]) begin
        image_71 <= io_pixelVal_in_5;
      end else if (8'h47 == _T_18[7:0]) begin
        image_71 <= io_pixelVal_in_4;
      end else if (8'h47 == _T_15[7:0]) begin
        image_71 <= io_pixelVal_in_3;
      end else if (8'h47 == _T_12[7:0]) begin
        image_71 <= io_pixelVal_in_2;
      end else if (8'h47 == _T_9[7:0]) begin
        image_71 <= io_pixelVal_in_1;
      end else if (8'h47 == _T_5[7:0]) begin
        image_71 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_72 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h48 == _T_27[7:0]) begin
        image_72 <= io_pixelVal_in_7;
      end else if (8'h48 == _T_24[7:0]) begin
        image_72 <= io_pixelVal_in_6;
      end else if (8'h48 == _T_21[7:0]) begin
        image_72 <= io_pixelVal_in_5;
      end else if (8'h48 == _T_18[7:0]) begin
        image_72 <= io_pixelVal_in_4;
      end else if (8'h48 == _T_15[7:0]) begin
        image_72 <= io_pixelVal_in_3;
      end else if (8'h48 == _T_12[7:0]) begin
        image_72 <= io_pixelVal_in_2;
      end else if (8'h48 == _T_9[7:0]) begin
        image_72 <= io_pixelVal_in_1;
      end else if (8'h48 == _T_5[7:0]) begin
        image_72 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_73 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h49 == _T_27[7:0]) begin
        image_73 <= io_pixelVal_in_7;
      end else if (8'h49 == _T_24[7:0]) begin
        image_73 <= io_pixelVal_in_6;
      end else if (8'h49 == _T_21[7:0]) begin
        image_73 <= io_pixelVal_in_5;
      end else if (8'h49 == _T_18[7:0]) begin
        image_73 <= io_pixelVal_in_4;
      end else if (8'h49 == _T_15[7:0]) begin
        image_73 <= io_pixelVal_in_3;
      end else if (8'h49 == _T_12[7:0]) begin
        image_73 <= io_pixelVal_in_2;
      end else if (8'h49 == _T_9[7:0]) begin
        image_73 <= io_pixelVal_in_1;
      end else if (8'h49 == _T_5[7:0]) begin
        image_73 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_74 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h4a == _T_27[7:0]) begin
        image_74 <= io_pixelVal_in_7;
      end else if (8'h4a == _T_24[7:0]) begin
        image_74 <= io_pixelVal_in_6;
      end else if (8'h4a == _T_21[7:0]) begin
        image_74 <= io_pixelVal_in_5;
      end else if (8'h4a == _T_18[7:0]) begin
        image_74 <= io_pixelVal_in_4;
      end else if (8'h4a == _T_15[7:0]) begin
        image_74 <= io_pixelVal_in_3;
      end else if (8'h4a == _T_12[7:0]) begin
        image_74 <= io_pixelVal_in_2;
      end else if (8'h4a == _T_9[7:0]) begin
        image_74 <= io_pixelVal_in_1;
      end else if (8'h4a == _T_5[7:0]) begin
        image_74 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_75 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h4b == _T_27[7:0]) begin
        image_75 <= io_pixelVal_in_7;
      end else if (8'h4b == _T_24[7:0]) begin
        image_75 <= io_pixelVal_in_6;
      end else if (8'h4b == _T_21[7:0]) begin
        image_75 <= io_pixelVal_in_5;
      end else if (8'h4b == _T_18[7:0]) begin
        image_75 <= io_pixelVal_in_4;
      end else if (8'h4b == _T_15[7:0]) begin
        image_75 <= io_pixelVal_in_3;
      end else if (8'h4b == _T_12[7:0]) begin
        image_75 <= io_pixelVal_in_2;
      end else if (8'h4b == _T_9[7:0]) begin
        image_75 <= io_pixelVal_in_1;
      end else if (8'h4b == _T_5[7:0]) begin
        image_75 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_76 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h4c == _T_27[7:0]) begin
        image_76 <= io_pixelVal_in_7;
      end else if (8'h4c == _T_24[7:0]) begin
        image_76 <= io_pixelVal_in_6;
      end else if (8'h4c == _T_21[7:0]) begin
        image_76 <= io_pixelVal_in_5;
      end else if (8'h4c == _T_18[7:0]) begin
        image_76 <= io_pixelVal_in_4;
      end else if (8'h4c == _T_15[7:0]) begin
        image_76 <= io_pixelVal_in_3;
      end else if (8'h4c == _T_12[7:0]) begin
        image_76 <= io_pixelVal_in_2;
      end else if (8'h4c == _T_9[7:0]) begin
        image_76 <= io_pixelVal_in_1;
      end else if (8'h4c == _T_5[7:0]) begin
        image_76 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_77 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h4d == _T_27[7:0]) begin
        image_77 <= io_pixelVal_in_7;
      end else if (8'h4d == _T_24[7:0]) begin
        image_77 <= io_pixelVal_in_6;
      end else if (8'h4d == _T_21[7:0]) begin
        image_77 <= io_pixelVal_in_5;
      end else if (8'h4d == _T_18[7:0]) begin
        image_77 <= io_pixelVal_in_4;
      end else if (8'h4d == _T_15[7:0]) begin
        image_77 <= io_pixelVal_in_3;
      end else if (8'h4d == _T_12[7:0]) begin
        image_77 <= io_pixelVal_in_2;
      end else if (8'h4d == _T_9[7:0]) begin
        image_77 <= io_pixelVal_in_1;
      end else if (8'h4d == _T_5[7:0]) begin
        image_77 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_78 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h4e == _T_27[7:0]) begin
        image_78 <= io_pixelVal_in_7;
      end else if (8'h4e == _T_24[7:0]) begin
        image_78 <= io_pixelVal_in_6;
      end else if (8'h4e == _T_21[7:0]) begin
        image_78 <= io_pixelVal_in_5;
      end else if (8'h4e == _T_18[7:0]) begin
        image_78 <= io_pixelVal_in_4;
      end else if (8'h4e == _T_15[7:0]) begin
        image_78 <= io_pixelVal_in_3;
      end else if (8'h4e == _T_12[7:0]) begin
        image_78 <= io_pixelVal_in_2;
      end else if (8'h4e == _T_9[7:0]) begin
        image_78 <= io_pixelVal_in_1;
      end else if (8'h4e == _T_5[7:0]) begin
        image_78 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_79 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h4f == _T_27[7:0]) begin
        image_79 <= io_pixelVal_in_7;
      end else if (8'h4f == _T_24[7:0]) begin
        image_79 <= io_pixelVal_in_6;
      end else if (8'h4f == _T_21[7:0]) begin
        image_79 <= io_pixelVal_in_5;
      end else if (8'h4f == _T_18[7:0]) begin
        image_79 <= io_pixelVal_in_4;
      end else if (8'h4f == _T_15[7:0]) begin
        image_79 <= io_pixelVal_in_3;
      end else if (8'h4f == _T_12[7:0]) begin
        image_79 <= io_pixelVal_in_2;
      end else if (8'h4f == _T_9[7:0]) begin
        image_79 <= io_pixelVal_in_1;
      end else if (8'h4f == _T_5[7:0]) begin
        image_79 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_80 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h50 == _T_27[7:0]) begin
        image_80 <= io_pixelVal_in_7;
      end else if (8'h50 == _T_24[7:0]) begin
        image_80 <= io_pixelVal_in_6;
      end else if (8'h50 == _T_21[7:0]) begin
        image_80 <= io_pixelVal_in_5;
      end else if (8'h50 == _T_18[7:0]) begin
        image_80 <= io_pixelVal_in_4;
      end else if (8'h50 == _T_15[7:0]) begin
        image_80 <= io_pixelVal_in_3;
      end else if (8'h50 == _T_12[7:0]) begin
        image_80 <= io_pixelVal_in_2;
      end else if (8'h50 == _T_9[7:0]) begin
        image_80 <= io_pixelVal_in_1;
      end else if (8'h50 == _T_5[7:0]) begin
        image_80 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_81 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h51 == _T_27[7:0]) begin
        image_81 <= io_pixelVal_in_7;
      end else if (8'h51 == _T_24[7:0]) begin
        image_81 <= io_pixelVal_in_6;
      end else if (8'h51 == _T_21[7:0]) begin
        image_81 <= io_pixelVal_in_5;
      end else if (8'h51 == _T_18[7:0]) begin
        image_81 <= io_pixelVal_in_4;
      end else if (8'h51 == _T_15[7:0]) begin
        image_81 <= io_pixelVal_in_3;
      end else if (8'h51 == _T_12[7:0]) begin
        image_81 <= io_pixelVal_in_2;
      end else if (8'h51 == _T_9[7:0]) begin
        image_81 <= io_pixelVal_in_1;
      end else if (8'h51 == _T_5[7:0]) begin
        image_81 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_82 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h52 == _T_27[7:0]) begin
        image_82 <= io_pixelVal_in_7;
      end else if (8'h52 == _T_24[7:0]) begin
        image_82 <= io_pixelVal_in_6;
      end else if (8'h52 == _T_21[7:0]) begin
        image_82 <= io_pixelVal_in_5;
      end else if (8'h52 == _T_18[7:0]) begin
        image_82 <= io_pixelVal_in_4;
      end else if (8'h52 == _T_15[7:0]) begin
        image_82 <= io_pixelVal_in_3;
      end else if (8'h52 == _T_12[7:0]) begin
        image_82 <= io_pixelVal_in_2;
      end else if (8'h52 == _T_9[7:0]) begin
        image_82 <= io_pixelVal_in_1;
      end else if (8'h52 == _T_5[7:0]) begin
        image_82 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_83 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h53 == _T_27[7:0]) begin
        image_83 <= io_pixelVal_in_7;
      end else if (8'h53 == _T_24[7:0]) begin
        image_83 <= io_pixelVal_in_6;
      end else if (8'h53 == _T_21[7:0]) begin
        image_83 <= io_pixelVal_in_5;
      end else if (8'h53 == _T_18[7:0]) begin
        image_83 <= io_pixelVal_in_4;
      end else if (8'h53 == _T_15[7:0]) begin
        image_83 <= io_pixelVal_in_3;
      end else if (8'h53 == _T_12[7:0]) begin
        image_83 <= io_pixelVal_in_2;
      end else if (8'h53 == _T_9[7:0]) begin
        image_83 <= io_pixelVal_in_1;
      end else if (8'h53 == _T_5[7:0]) begin
        image_83 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_84 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h54 == _T_27[7:0]) begin
        image_84 <= io_pixelVal_in_7;
      end else if (8'h54 == _T_24[7:0]) begin
        image_84 <= io_pixelVal_in_6;
      end else if (8'h54 == _T_21[7:0]) begin
        image_84 <= io_pixelVal_in_5;
      end else if (8'h54 == _T_18[7:0]) begin
        image_84 <= io_pixelVal_in_4;
      end else if (8'h54 == _T_15[7:0]) begin
        image_84 <= io_pixelVal_in_3;
      end else if (8'h54 == _T_12[7:0]) begin
        image_84 <= io_pixelVal_in_2;
      end else if (8'h54 == _T_9[7:0]) begin
        image_84 <= io_pixelVal_in_1;
      end else if (8'h54 == _T_5[7:0]) begin
        image_84 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_85 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h55 == _T_27[7:0]) begin
        image_85 <= io_pixelVal_in_7;
      end else if (8'h55 == _T_24[7:0]) begin
        image_85 <= io_pixelVal_in_6;
      end else if (8'h55 == _T_21[7:0]) begin
        image_85 <= io_pixelVal_in_5;
      end else if (8'h55 == _T_18[7:0]) begin
        image_85 <= io_pixelVal_in_4;
      end else if (8'h55 == _T_15[7:0]) begin
        image_85 <= io_pixelVal_in_3;
      end else if (8'h55 == _T_12[7:0]) begin
        image_85 <= io_pixelVal_in_2;
      end else if (8'h55 == _T_9[7:0]) begin
        image_85 <= io_pixelVal_in_1;
      end else if (8'h55 == _T_5[7:0]) begin
        image_85 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_86 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h56 == _T_27[7:0]) begin
        image_86 <= io_pixelVal_in_7;
      end else if (8'h56 == _T_24[7:0]) begin
        image_86 <= io_pixelVal_in_6;
      end else if (8'h56 == _T_21[7:0]) begin
        image_86 <= io_pixelVal_in_5;
      end else if (8'h56 == _T_18[7:0]) begin
        image_86 <= io_pixelVal_in_4;
      end else if (8'h56 == _T_15[7:0]) begin
        image_86 <= io_pixelVal_in_3;
      end else if (8'h56 == _T_12[7:0]) begin
        image_86 <= io_pixelVal_in_2;
      end else if (8'h56 == _T_9[7:0]) begin
        image_86 <= io_pixelVal_in_1;
      end else if (8'h56 == _T_5[7:0]) begin
        image_86 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_87 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h57 == _T_27[7:0]) begin
        image_87 <= io_pixelVal_in_7;
      end else if (8'h57 == _T_24[7:0]) begin
        image_87 <= io_pixelVal_in_6;
      end else if (8'h57 == _T_21[7:0]) begin
        image_87 <= io_pixelVal_in_5;
      end else if (8'h57 == _T_18[7:0]) begin
        image_87 <= io_pixelVal_in_4;
      end else if (8'h57 == _T_15[7:0]) begin
        image_87 <= io_pixelVal_in_3;
      end else if (8'h57 == _T_12[7:0]) begin
        image_87 <= io_pixelVal_in_2;
      end else if (8'h57 == _T_9[7:0]) begin
        image_87 <= io_pixelVal_in_1;
      end else if (8'h57 == _T_5[7:0]) begin
        image_87 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_88 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h58 == _T_27[7:0]) begin
        image_88 <= io_pixelVal_in_7;
      end else if (8'h58 == _T_24[7:0]) begin
        image_88 <= io_pixelVal_in_6;
      end else if (8'h58 == _T_21[7:0]) begin
        image_88 <= io_pixelVal_in_5;
      end else if (8'h58 == _T_18[7:0]) begin
        image_88 <= io_pixelVal_in_4;
      end else if (8'h58 == _T_15[7:0]) begin
        image_88 <= io_pixelVal_in_3;
      end else if (8'h58 == _T_12[7:0]) begin
        image_88 <= io_pixelVal_in_2;
      end else if (8'h58 == _T_9[7:0]) begin
        image_88 <= io_pixelVal_in_1;
      end else if (8'h58 == _T_5[7:0]) begin
        image_88 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_89 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h59 == _T_27[7:0]) begin
        image_89 <= io_pixelVal_in_7;
      end else if (8'h59 == _T_24[7:0]) begin
        image_89 <= io_pixelVal_in_6;
      end else if (8'h59 == _T_21[7:0]) begin
        image_89 <= io_pixelVal_in_5;
      end else if (8'h59 == _T_18[7:0]) begin
        image_89 <= io_pixelVal_in_4;
      end else if (8'h59 == _T_15[7:0]) begin
        image_89 <= io_pixelVal_in_3;
      end else if (8'h59 == _T_12[7:0]) begin
        image_89 <= io_pixelVal_in_2;
      end else if (8'h59 == _T_9[7:0]) begin
        image_89 <= io_pixelVal_in_1;
      end else if (8'h59 == _T_5[7:0]) begin
        image_89 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_90 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h5a == _T_27[7:0]) begin
        image_90 <= io_pixelVal_in_7;
      end else if (8'h5a == _T_24[7:0]) begin
        image_90 <= io_pixelVal_in_6;
      end else if (8'h5a == _T_21[7:0]) begin
        image_90 <= io_pixelVal_in_5;
      end else if (8'h5a == _T_18[7:0]) begin
        image_90 <= io_pixelVal_in_4;
      end else if (8'h5a == _T_15[7:0]) begin
        image_90 <= io_pixelVal_in_3;
      end else if (8'h5a == _T_12[7:0]) begin
        image_90 <= io_pixelVal_in_2;
      end else if (8'h5a == _T_9[7:0]) begin
        image_90 <= io_pixelVal_in_1;
      end else if (8'h5a == _T_5[7:0]) begin
        image_90 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_91 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h5b == _T_27[7:0]) begin
        image_91 <= io_pixelVal_in_7;
      end else if (8'h5b == _T_24[7:0]) begin
        image_91 <= io_pixelVal_in_6;
      end else if (8'h5b == _T_21[7:0]) begin
        image_91 <= io_pixelVal_in_5;
      end else if (8'h5b == _T_18[7:0]) begin
        image_91 <= io_pixelVal_in_4;
      end else if (8'h5b == _T_15[7:0]) begin
        image_91 <= io_pixelVal_in_3;
      end else if (8'h5b == _T_12[7:0]) begin
        image_91 <= io_pixelVal_in_2;
      end else if (8'h5b == _T_9[7:0]) begin
        image_91 <= io_pixelVal_in_1;
      end else if (8'h5b == _T_5[7:0]) begin
        image_91 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_92 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h5c == _T_27[7:0]) begin
        image_92 <= io_pixelVal_in_7;
      end else if (8'h5c == _T_24[7:0]) begin
        image_92 <= io_pixelVal_in_6;
      end else if (8'h5c == _T_21[7:0]) begin
        image_92 <= io_pixelVal_in_5;
      end else if (8'h5c == _T_18[7:0]) begin
        image_92 <= io_pixelVal_in_4;
      end else if (8'h5c == _T_15[7:0]) begin
        image_92 <= io_pixelVal_in_3;
      end else if (8'h5c == _T_12[7:0]) begin
        image_92 <= io_pixelVal_in_2;
      end else if (8'h5c == _T_9[7:0]) begin
        image_92 <= io_pixelVal_in_1;
      end else if (8'h5c == _T_5[7:0]) begin
        image_92 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_93 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h5d == _T_27[7:0]) begin
        image_93 <= io_pixelVal_in_7;
      end else if (8'h5d == _T_24[7:0]) begin
        image_93 <= io_pixelVal_in_6;
      end else if (8'h5d == _T_21[7:0]) begin
        image_93 <= io_pixelVal_in_5;
      end else if (8'h5d == _T_18[7:0]) begin
        image_93 <= io_pixelVal_in_4;
      end else if (8'h5d == _T_15[7:0]) begin
        image_93 <= io_pixelVal_in_3;
      end else if (8'h5d == _T_12[7:0]) begin
        image_93 <= io_pixelVal_in_2;
      end else if (8'h5d == _T_9[7:0]) begin
        image_93 <= io_pixelVal_in_1;
      end else if (8'h5d == _T_5[7:0]) begin
        image_93 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_94 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h5e == _T_27[7:0]) begin
        image_94 <= io_pixelVal_in_7;
      end else if (8'h5e == _T_24[7:0]) begin
        image_94 <= io_pixelVal_in_6;
      end else if (8'h5e == _T_21[7:0]) begin
        image_94 <= io_pixelVal_in_5;
      end else if (8'h5e == _T_18[7:0]) begin
        image_94 <= io_pixelVal_in_4;
      end else if (8'h5e == _T_15[7:0]) begin
        image_94 <= io_pixelVal_in_3;
      end else if (8'h5e == _T_12[7:0]) begin
        image_94 <= io_pixelVal_in_2;
      end else if (8'h5e == _T_9[7:0]) begin
        image_94 <= io_pixelVal_in_1;
      end else if (8'h5e == _T_5[7:0]) begin
        image_94 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_95 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h5f == _T_27[7:0]) begin
        image_95 <= io_pixelVal_in_7;
      end else if (8'h5f == _T_24[7:0]) begin
        image_95 <= io_pixelVal_in_6;
      end else if (8'h5f == _T_21[7:0]) begin
        image_95 <= io_pixelVal_in_5;
      end else if (8'h5f == _T_18[7:0]) begin
        image_95 <= io_pixelVal_in_4;
      end else if (8'h5f == _T_15[7:0]) begin
        image_95 <= io_pixelVal_in_3;
      end else if (8'h5f == _T_12[7:0]) begin
        image_95 <= io_pixelVal_in_2;
      end else if (8'h5f == _T_9[7:0]) begin
        image_95 <= io_pixelVal_in_1;
      end else if (8'h5f == _T_5[7:0]) begin
        image_95 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_96 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h60 == _T_27[7:0]) begin
        image_96 <= io_pixelVal_in_7;
      end else if (8'h60 == _T_24[7:0]) begin
        image_96 <= io_pixelVal_in_6;
      end else if (8'h60 == _T_21[7:0]) begin
        image_96 <= io_pixelVal_in_5;
      end else if (8'h60 == _T_18[7:0]) begin
        image_96 <= io_pixelVal_in_4;
      end else if (8'h60 == _T_15[7:0]) begin
        image_96 <= io_pixelVal_in_3;
      end else if (8'h60 == _T_12[7:0]) begin
        image_96 <= io_pixelVal_in_2;
      end else if (8'h60 == _T_9[7:0]) begin
        image_96 <= io_pixelVal_in_1;
      end else if (8'h60 == _T_5[7:0]) begin
        image_96 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_97 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h61 == _T_27[7:0]) begin
        image_97 <= io_pixelVal_in_7;
      end else if (8'h61 == _T_24[7:0]) begin
        image_97 <= io_pixelVal_in_6;
      end else if (8'h61 == _T_21[7:0]) begin
        image_97 <= io_pixelVal_in_5;
      end else if (8'h61 == _T_18[7:0]) begin
        image_97 <= io_pixelVal_in_4;
      end else if (8'h61 == _T_15[7:0]) begin
        image_97 <= io_pixelVal_in_3;
      end else if (8'h61 == _T_12[7:0]) begin
        image_97 <= io_pixelVal_in_2;
      end else if (8'h61 == _T_9[7:0]) begin
        image_97 <= io_pixelVal_in_1;
      end else if (8'h61 == _T_5[7:0]) begin
        image_97 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_98 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h62 == _T_27[7:0]) begin
        image_98 <= io_pixelVal_in_7;
      end else if (8'h62 == _T_24[7:0]) begin
        image_98 <= io_pixelVal_in_6;
      end else if (8'h62 == _T_21[7:0]) begin
        image_98 <= io_pixelVal_in_5;
      end else if (8'h62 == _T_18[7:0]) begin
        image_98 <= io_pixelVal_in_4;
      end else if (8'h62 == _T_15[7:0]) begin
        image_98 <= io_pixelVal_in_3;
      end else if (8'h62 == _T_12[7:0]) begin
        image_98 <= io_pixelVal_in_2;
      end else if (8'h62 == _T_9[7:0]) begin
        image_98 <= io_pixelVal_in_1;
      end else if (8'h62 == _T_5[7:0]) begin
        image_98 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_99 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h63 == _T_27[7:0]) begin
        image_99 <= io_pixelVal_in_7;
      end else if (8'h63 == _T_24[7:0]) begin
        image_99 <= io_pixelVal_in_6;
      end else if (8'h63 == _T_21[7:0]) begin
        image_99 <= io_pixelVal_in_5;
      end else if (8'h63 == _T_18[7:0]) begin
        image_99 <= io_pixelVal_in_4;
      end else if (8'h63 == _T_15[7:0]) begin
        image_99 <= io_pixelVal_in_3;
      end else if (8'h63 == _T_12[7:0]) begin
        image_99 <= io_pixelVal_in_2;
      end else if (8'h63 == _T_9[7:0]) begin
        image_99 <= io_pixelVal_in_1;
      end else if (8'h63 == _T_5[7:0]) begin
        image_99 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_100 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h64 == _T_27[7:0]) begin
        image_100 <= io_pixelVal_in_7;
      end else if (8'h64 == _T_24[7:0]) begin
        image_100 <= io_pixelVal_in_6;
      end else if (8'h64 == _T_21[7:0]) begin
        image_100 <= io_pixelVal_in_5;
      end else if (8'h64 == _T_18[7:0]) begin
        image_100 <= io_pixelVal_in_4;
      end else if (8'h64 == _T_15[7:0]) begin
        image_100 <= io_pixelVal_in_3;
      end else if (8'h64 == _T_12[7:0]) begin
        image_100 <= io_pixelVal_in_2;
      end else if (8'h64 == _T_9[7:0]) begin
        image_100 <= io_pixelVal_in_1;
      end else if (8'h64 == _T_5[7:0]) begin
        image_100 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_101 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h65 == _T_27[7:0]) begin
        image_101 <= io_pixelVal_in_7;
      end else if (8'h65 == _T_24[7:0]) begin
        image_101 <= io_pixelVal_in_6;
      end else if (8'h65 == _T_21[7:0]) begin
        image_101 <= io_pixelVal_in_5;
      end else if (8'h65 == _T_18[7:0]) begin
        image_101 <= io_pixelVal_in_4;
      end else if (8'h65 == _T_15[7:0]) begin
        image_101 <= io_pixelVal_in_3;
      end else if (8'h65 == _T_12[7:0]) begin
        image_101 <= io_pixelVal_in_2;
      end else if (8'h65 == _T_9[7:0]) begin
        image_101 <= io_pixelVal_in_1;
      end else if (8'h65 == _T_5[7:0]) begin
        image_101 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_102 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h66 == _T_27[7:0]) begin
        image_102 <= io_pixelVal_in_7;
      end else if (8'h66 == _T_24[7:0]) begin
        image_102 <= io_pixelVal_in_6;
      end else if (8'h66 == _T_21[7:0]) begin
        image_102 <= io_pixelVal_in_5;
      end else if (8'h66 == _T_18[7:0]) begin
        image_102 <= io_pixelVal_in_4;
      end else if (8'h66 == _T_15[7:0]) begin
        image_102 <= io_pixelVal_in_3;
      end else if (8'h66 == _T_12[7:0]) begin
        image_102 <= io_pixelVal_in_2;
      end else if (8'h66 == _T_9[7:0]) begin
        image_102 <= io_pixelVal_in_1;
      end else if (8'h66 == _T_5[7:0]) begin
        image_102 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_103 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h67 == _T_27[7:0]) begin
        image_103 <= io_pixelVal_in_7;
      end else if (8'h67 == _T_24[7:0]) begin
        image_103 <= io_pixelVal_in_6;
      end else if (8'h67 == _T_21[7:0]) begin
        image_103 <= io_pixelVal_in_5;
      end else if (8'h67 == _T_18[7:0]) begin
        image_103 <= io_pixelVal_in_4;
      end else if (8'h67 == _T_15[7:0]) begin
        image_103 <= io_pixelVal_in_3;
      end else if (8'h67 == _T_12[7:0]) begin
        image_103 <= io_pixelVal_in_2;
      end else if (8'h67 == _T_9[7:0]) begin
        image_103 <= io_pixelVal_in_1;
      end else if (8'h67 == _T_5[7:0]) begin
        image_103 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_104 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h68 == _T_27[7:0]) begin
        image_104 <= io_pixelVal_in_7;
      end else if (8'h68 == _T_24[7:0]) begin
        image_104 <= io_pixelVal_in_6;
      end else if (8'h68 == _T_21[7:0]) begin
        image_104 <= io_pixelVal_in_5;
      end else if (8'h68 == _T_18[7:0]) begin
        image_104 <= io_pixelVal_in_4;
      end else if (8'h68 == _T_15[7:0]) begin
        image_104 <= io_pixelVal_in_3;
      end else if (8'h68 == _T_12[7:0]) begin
        image_104 <= io_pixelVal_in_2;
      end else if (8'h68 == _T_9[7:0]) begin
        image_104 <= io_pixelVal_in_1;
      end else if (8'h68 == _T_5[7:0]) begin
        image_104 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_105 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h69 == _T_27[7:0]) begin
        image_105 <= io_pixelVal_in_7;
      end else if (8'h69 == _T_24[7:0]) begin
        image_105 <= io_pixelVal_in_6;
      end else if (8'h69 == _T_21[7:0]) begin
        image_105 <= io_pixelVal_in_5;
      end else if (8'h69 == _T_18[7:0]) begin
        image_105 <= io_pixelVal_in_4;
      end else if (8'h69 == _T_15[7:0]) begin
        image_105 <= io_pixelVal_in_3;
      end else if (8'h69 == _T_12[7:0]) begin
        image_105 <= io_pixelVal_in_2;
      end else if (8'h69 == _T_9[7:0]) begin
        image_105 <= io_pixelVal_in_1;
      end else if (8'h69 == _T_5[7:0]) begin
        image_105 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_106 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h6a == _T_27[7:0]) begin
        image_106 <= io_pixelVal_in_7;
      end else if (8'h6a == _T_24[7:0]) begin
        image_106 <= io_pixelVal_in_6;
      end else if (8'h6a == _T_21[7:0]) begin
        image_106 <= io_pixelVal_in_5;
      end else if (8'h6a == _T_18[7:0]) begin
        image_106 <= io_pixelVal_in_4;
      end else if (8'h6a == _T_15[7:0]) begin
        image_106 <= io_pixelVal_in_3;
      end else if (8'h6a == _T_12[7:0]) begin
        image_106 <= io_pixelVal_in_2;
      end else if (8'h6a == _T_9[7:0]) begin
        image_106 <= io_pixelVal_in_1;
      end else if (8'h6a == _T_5[7:0]) begin
        image_106 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_107 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h6b == _T_27[7:0]) begin
        image_107 <= io_pixelVal_in_7;
      end else if (8'h6b == _T_24[7:0]) begin
        image_107 <= io_pixelVal_in_6;
      end else if (8'h6b == _T_21[7:0]) begin
        image_107 <= io_pixelVal_in_5;
      end else if (8'h6b == _T_18[7:0]) begin
        image_107 <= io_pixelVal_in_4;
      end else if (8'h6b == _T_15[7:0]) begin
        image_107 <= io_pixelVal_in_3;
      end else if (8'h6b == _T_12[7:0]) begin
        image_107 <= io_pixelVal_in_2;
      end else if (8'h6b == _T_9[7:0]) begin
        image_107 <= io_pixelVal_in_1;
      end else if (8'h6b == _T_5[7:0]) begin
        image_107 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_108 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h6c == _T_27[7:0]) begin
        image_108 <= io_pixelVal_in_7;
      end else if (8'h6c == _T_24[7:0]) begin
        image_108 <= io_pixelVal_in_6;
      end else if (8'h6c == _T_21[7:0]) begin
        image_108 <= io_pixelVal_in_5;
      end else if (8'h6c == _T_18[7:0]) begin
        image_108 <= io_pixelVal_in_4;
      end else if (8'h6c == _T_15[7:0]) begin
        image_108 <= io_pixelVal_in_3;
      end else if (8'h6c == _T_12[7:0]) begin
        image_108 <= io_pixelVal_in_2;
      end else if (8'h6c == _T_9[7:0]) begin
        image_108 <= io_pixelVal_in_1;
      end else if (8'h6c == _T_5[7:0]) begin
        image_108 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_109 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h6d == _T_27[7:0]) begin
        image_109 <= io_pixelVal_in_7;
      end else if (8'h6d == _T_24[7:0]) begin
        image_109 <= io_pixelVal_in_6;
      end else if (8'h6d == _T_21[7:0]) begin
        image_109 <= io_pixelVal_in_5;
      end else if (8'h6d == _T_18[7:0]) begin
        image_109 <= io_pixelVal_in_4;
      end else if (8'h6d == _T_15[7:0]) begin
        image_109 <= io_pixelVal_in_3;
      end else if (8'h6d == _T_12[7:0]) begin
        image_109 <= io_pixelVal_in_2;
      end else if (8'h6d == _T_9[7:0]) begin
        image_109 <= io_pixelVal_in_1;
      end else if (8'h6d == _T_5[7:0]) begin
        image_109 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_110 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h6e == _T_27[7:0]) begin
        image_110 <= io_pixelVal_in_7;
      end else if (8'h6e == _T_24[7:0]) begin
        image_110 <= io_pixelVal_in_6;
      end else if (8'h6e == _T_21[7:0]) begin
        image_110 <= io_pixelVal_in_5;
      end else if (8'h6e == _T_18[7:0]) begin
        image_110 <= io_pixelVal_in_4;
      end else if (8'h6e == _T_15[7:0]) begin
        image_110 <= io_pixelVal_in_3;
      end else if (8'h6e == _T_12[7:0]) begin
        image_110 <= io_pixelVal_in_2;
      end else if (8'h6e == _T_9[7:0]) begin
        image_110 <= io_pixelVal_in_1;
      end else if (8'h6e == _T_5[7:0]) begin
        image_110 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_111 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h6f == _T_27[7:0]) begin
        image_111 <= io_pixelVal_in_7;
      end else if (8'h6f == _T_24[7:0]) begin
        image_111 <= io_pixelVal_in_6;
      end else if (8'h6f == _T_21[7:0]) begin
        image_111 <= io_pixelVal_in_5;
      end else if (8'h6f == _T_18[7:0]) begin
        image_111 <= io_pixelVal_in_4;
      end else if (8'h6f == _T_15[7:0]) begin
        image_111 <= io_pixelVal_in_3;
      end else if (8'h6f == _T_12[7:0]) begin
        image_111 <= io_pixelVal_in_2;
      end else if (8'h6f == _T_9[7:0]) begin
        image_111 <= io_pixelVal_in_1;
      end else if (8'h6f == _T_5[7:0]) begin
        image_111 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_112 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h70 == _T_27[7:0]) begin
        image_112 <= io_pixelVal_in_7;
      end else if (8'h70 == _T_24[7:0]) begin
        image_112 <= io_pixelVal_in_6;
      end else if (8'h70 == _T_21[7:0]) begin
        image_112 <= io_pixelVal_in_5;
      end else if (8'h70 == _T_18[7:0]) begin
        image_112 <= io_pixelVal_in_4;
      end else if (8'h70 == _T_15[7:0]) begin
        image_112 <= io_pixelVal_in_3;
      end else if (8'h70 == _T_12[7:0]) begin
        image_112 <= io_pixelVal_in_2;
      end else if (8'h70 == _T_9[7:0]) begin
        image_112 <= io_pixelVal_in_1;
      end else if (8'h70 == _T_5[7:0]) begin
        image_112 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_113 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h71 == _T_27[7:0]) begin
        image_113 <= io_pixelVal_in_7;
      end else if (8'h71 == _T_24[7:0]) begin
        image_113 <= io_pixelVal_in_6;
      end else if (8'h71 == _T_21[7:0]) begin
        image_113 <= io_pixelVal_in_5;
      end else if (8'h71 == _T_18[7:0]) begin
        image_113 <= io_pixelVal_in_4;
      end else if (8'h71 == _T_15[7:0]) begin
        image_113 <= io_pixelVal_in_3;
      end else if (8'h71 == _T_12[7:0]) begin
        image_113 <= io_pixelVal_in_2;
      end else if (8'h71 == _T_9[7:0]) begin
        image_113 <= io_pixelVal_in_1;
      end else if (8'h71 == _T_5[7:0]) begin
        image_113 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_114 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h72 == _T_27[7:0]) begin
        image_114 <= io_pixelVal_in_7;
      end else if (8'h72 == _T_24[7:0]) begin
        image_114 <= io_pixelVal_in_6;
      end else if (8'h72 == _T_21[7:0]) begin
        image_114 <= io_pixelVal_in_5;
      end else if (8'h72 == _T_18[7:0]) begin
        image_114 <= io_pixelVal_in_4;
      end else if (8'h72 == _T_15[7:0]) begin
        image_114 <= io_pixelVal_in_3;
      end else if (8'h72 == _T_12[7:0]) begin
        image_114 <= io_pixelVal_in_2;
      end else if (8'h72 == _T_9[7:0]) begin
        image_114 <= io_pixelVal_in_1;
      end else if (8'h72 == _T_5[7:0]) begin
        image_114 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_115 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h73 == _T_27[7:0]) begin
        image_115 <= io_pixelVal_in_7;
      end else if (8'h73 == _T_24[7:0]) begin
        image_115 <= io_pixelVal_in_6;
      end else if (8'h73 == _T_21[7:0]) begin
        image_115 <= io_pixelVal_in_5;
      end else if (8'h73 == _T_18[7:0]) begin
        image_115 <= io_pixelVal_in_4;
      end else if (8'h73 == _T_15[7:0]) begin
        image_115 <= io_pixelVal_in_3;
      end else if (8'h73 == _T_12[7:0]) begin
        image_115 <= io_pixelVal_in_2;
      end else if (8'h73 == _T_9[7:0]) begin
        image_115 <= io_pixelVal_in_1;
      end else if (8'h73 == _T_5[7:0]) begin
        image_115 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_116 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h74 == _T_27[7:0]) begin
        image_116 <= io_pixelVal_in_7;
      end else if (8'h74 == _T_24[7:0]) begin
        image_116 <= io_pixelVal_in_6;
      end else if (8'h74 == _T_21[7:0]) begin
        image_116 <= io_pixelVal_in_5;
      end else if (8'h74 == _T_18[7:0]) begin
        image_116 <= io_pixelVal_in_4;
      end else if (8'h74 == _T_15[7:0]) begin
        image_116 <= io_pixelVal_in_3;
      end else if (8'h74 == _T_12[7:0]) begin
        image_116 <= io_pixelVal_in_2;
      end else if (8'h74 == _T_9[7:0]) begin
        image_116 <= io_pixelVal_in_1;
      end else if (8'h74 == _T_5[7:0]) begin
        image_116 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_117 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h75 == _T_27[7:0]) begin
        image_117 <= io_pixelVal_in_7;
      end else if (8'h75 == _T_24[7:0]) begin
        image_117 <= io_pixelVal_in_6;
      end else if (8'h75 == _T_21[7:0]) begin
        image_117 <= io_pixelVal_in_5;
      end else if (8'h75 == _T_18[7:0]) begin
        image_117 <= io_pixelVal_in_4;
      end else if (8'h75 == _T_15[7:0]) begin
        image_117 <= io_pixelVal_in_3;
      end else if (8'h75 == _T_12[7:0]) begin
        image_117 <= io_pixelVal_in_2;
      end else if (8'h75 == _T_9[7:0]) begin
        image_117 <= io_pixelVal_in_1;
      end else if (8'h75 == _T_5[7:0]) begin
        image_117 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_118 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h76 == _T_27[7:0]) begin
        image_118 <= io_pixelVal_in_7;
      end else if (8'h76 == _T_24[7:0]) begin
        image_118 <= io_pixelVal_in_6;
      end else if (8'h76 == _T_21[7:0]) begin
        image_118 <= io_pixelVal_in_5;
      end else if (8'h76 == _T_18[7:0]) begin
        image_118 <= io_pixelVal_in_4;
      end else if (8'h76 == _T_15[7:0]) begin
        image_118 <= io_pixelVal_in_3;
      end else if (8'h76 == _T_12[7:0]) begin
        image_118 <= io_pixelVal_in_2;
      end else if (8'h76 == _T_9[7:0]) begin
        image_118 <= io_pixelVal_in_1;
      end else if (8'h76 == _T_5[7:0]) begin
        image_118 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_119 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h77 == _T_27[7:0]) begin
        image_119 <= io_pixelVal_in_7;
      end else if (8'h77 == _T_24[7:0]) begin
        image_119 <= io_pixelVal_in_6;
      end else if (8'h77 == _T_21[7:0]) begin
        image_119 <= io_pixelVal_in_5;
      end else if (8'h77 == _T_18[7:0]) begin
        image_119 <= io_pixelVal_in_4;
      end else if (8'h77 == _T_15[7:0]) begin
        image_119 <= io_pixelVal_in_3;
      end else if (8'h77 == _T_12[7:0]) begin
        image_119 <= io_pixelVal_in_2;
      end else if (8'h77 == _T_9[7:0]) begin
        image_119 <= io_pixelVal_in_1;
      end else if (8'h77 == _T_5[7:0]) begin
        image_119 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_120 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h78 == _T_27[7:0]) begin
        image_120 <= io_pixelVal_in_7;
      end else if (8'h78 == _T_24[7:0]) begin
        image_120 <= io_pixelVal_in_6;
      end else if (8'h78 == _T_21[7:0]) begin
        image_120 <= io_pixelVal_in_5;
      end else if (8'h78 == _T_18[7:0]) begin
        image_120 <= io_pixelVal_in_4;
      end else if (8'h78 == _T_15[7:0]) begin
        image_120 <= io_pixelVal_in_3;
      end else if (8'h78 == _T_12[7:0]) begin
        image_120 <= io_pixelVal_in_2;
      end else if (8'h78 == _T_9[7:0]) begin
        image_120 <= io_pixelVal_in_1;
      end else if (8'h78 == _T_5[7:0]) begin
        image_120 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_121 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h79 == _T_27[7:0]) begin
        image_121 <= io_pixelVal_in_7;
      end else if (8'h79 == _T_24[7:0]) begin
        image_121 <= io_pixelVal_in_6;
      end else if (8'h79 == _T_21[7:0]) begin
        image_121 <= io_pixelVal_in_5;
      end else if (8'h79 == _T_18[7:0]) begin
        image_121 <= io_pixelVal_in_4;
      end else if (8'h79 == _T_15[7:0]) begin
        image_121 <= io_pixelVal_in_3;
      end else if (8'h79 == _T_12[7:0]) begin
        image_121 <= io_pixelVal_in_2;
      end else if (8'h79 == _T_9[7:0]) begin
        image_121 <= io_pixelVal_in_1;
      end else if (8'h79 == _T_5[7:0]) begin
        image_121 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_122 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h7a == _T_27[7:0]) begin
        image_122 <= io_pixelVal_in_7;
      end else if (8'h7a == _T_24[7:0]) begin
        image_122 <= io_pixelVal_in_6;
      end else if (8'h7a == _T_21[7:0]) begin
        image_122 <= io_pixelVal_in_5;
      end else if (8'h7a == _T_18[7:0]) begin
        image_122 <= io_pixelVal_in_4;
      end else if (8'h7a == _T_15[7:0]) begin
        image_122 <= io_pixelVal_in_3;
      end else if (8'h7a == _T_12[7:0]) begin
        image_122 <= io_pixelVal_in_2;
      end else if (8'h7a == _T_9[7:0]) begin
        image_122 <= io_pixelVal_in_1;
      end else if (8'h7a == _T_5[7:0]) begin
        image_122 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_123 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h7b == _T_27[7:0]) begin
        image_123 <= io_pixelVal_in_7;
      end else if (8'h7b == _T_24[7:0]) begin
        image_123 <= io_pixelVal_in_6;
      end else if (8'h7b == _T_21[7:0]) begin
        image_123 <= io_pixelVal_in_5;
      end else if (8'h7b == _T_18[7:0]) begin
        image_123 <= io_pixelVal_in_4;
      end else if (8'h7b == _T_15[7:0]) begin
        image_123 <= io_pixelVal_in_3;
      end else if (8'h7b == _T_12[7:0]) begin
        image_123 <= io_pixelVal_in_2;
      end else if (8'h7b == _T_9[7:0]) begin
        image_123 <= io_pixelVal_in_1;
      end else if (8'h7b == _T_5[7:0]) begin
        image_123 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_124 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h7c == _T_27[7:0]) begin
        image_124 <= io_pixelVal_in_7;
      end else if (8'h7c == _T_24[7:0]) begin
        image_124 <= io_pixelVal_in_6;
      end else if (8'h7c == _T_21[7:0]) begin
        image_124 <= io_pixelVal_in_5;
      end else if (8'h7c == _T_18[7:0]) begin
        image_124 <= io_pixelVal_in_4;
      end else if (8'h7c == _T_15[7:0]) begin
        image_124 <= io_pixelVal_in_3;
      end else if (8'h7c == _T_12[7:0]) begin
        image_124 <= io_pixelVal_in_2;
      end else if (8'h7c == _T_9[7:0]) begin
        image_124 <= io_pixelVal_in_1;
      end else if (8'h7c == _T_5[7:0]) begin
        image_124 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_125 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h7d == _T_27[7:0]) begin
        image_125 <= io_pixelVal_in_7;
      end else if (8'h7d == _T_24[7:0]) begin
        image_125 <= io_pixelVal_in_6;
      end else if (8'h7d == _T_21[7:0]) begin
        image_125 <= io_pixelVal_in_5;
      end else if (8'h7d == _T_18[7:0]) begin
        image_125 <= io_pixelVal_in_4;
      end else if (8'h7d == _T_15[7:0]) begin
        image_125 <= io_pixelVal_in_3;
      end else if (8'h7d == _T_12[7:0]) begin
        image_125 <= io_pixelVal_in_2;
      end else if (8'h7d == _T_9[7:0]) begin
        image_125 <= io_pixelVal_in_1;
      end else if (8'h7d == _T_5[7:0]) begin
        image_125 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_126 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h7e == _T_27[7:0]) begin
        image_126 <= io_pixelVal_in_7;
      end else if (8'h7e == _T_24[7:0]) begin
        image_126 <= io_pixelVal_in_6;
      end else if (8'h7e == _T_21[7:0]) begin
        image_126 <= io_pixelVal_in_5;
      end else if (8'h7e == _T_18[7:0]) begin
        image_126 <= io_pixelVal_in_4;
      end else if (8'h7e == _T_15[7:0]) begin
        image_126 <= io_pixelVal_in_3;
      end else if (8'h7e == _T_12[7:0]) begin
        image_126 <= io_pixelVal_in_2;
      end else if (8'h7e == _T_9[7:0]) begin
        image_126 <= io_pixelVal_in_1;
      end else if (8'h7e == _T_5[7:0]) begin
        image_126 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_127 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h7f == _T_27[7:0]) begin
        image_127 <= io_pixelVal_in_7;
      end else if (8'h7f == _T_24[7:0]) begin
        image_127 <= io_pixelVal_in_6;
      end else if (8'h7f == _T_21[7:0]) begin
        image_127 <= io_pixelVal_in_5;
      end else if (8'h7f == _T_18[7:0]) begin
        image_127 <= io_pixelVal_in_4;
      end else if (8'h7f == _T_15[7:0]) begin
        image_127 <= io_pixelVal_in_3;
      end else if (8'h7f == _T_12[7:0]) begin
        image_127 <= io_pixelVal_in_2;
      end else if (8'h7f == _T_9[7:0]) begin
        image_127 <= io_pixelVal_in_1;
      end else if (8'h7f == _T_5[7:0]) begin
        image_127 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_128 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h80 == _T_27[7:0]) begin
        image_128 <= io_pixelVal_in_7;
      end else if (8'h80 == _T_24[7:0]) begin
        image_128 <= io_pixelVal_in_6;
      end else if (8'h80 == _T_21[7:0]) begin
        image_128 <= io_pixelVal_in_5;
      end else if (8'h80 == _T_18[7:0]) begin
        image_128 <= io_pixelVal_in_4;
      end else if (8'h80 == _T_15[7:0]) begin
        image_128 <= io_pixelVal_in_3;
      end else if (8'h80 == _T_12[7:0]) begin
        image_128 <= io_pixelVal_in_2;
      end else if (8'h80 == _T_9[7:0]) begin
        image_128 <= io_pixelVal_in_1;
      end else if (8'h80 == _T_5[7:0]) begin
        image_128 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_129 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h81 == _T_27[7:0]) begin
        image_129 <= io_pixelVal_in_7;
      end else if (8'h81 == _T_24[7:0]) begin
        image_129 <= io_pixelVal_in_6;
      end else if (8'h81 == _T_21[7:0]) begin
        image_129 <= io_pixelVal_in_5;
      end else if (8'h81 == _T_18[7:0]) begin
        image_129 <= io_pixelVal_in_4;
      end else if (8'h81 == _T_15[7:0]) begin
        image_129 <= io_pixelVal_in_3;
      end else if (8'h81 == _T_12[7:0]) begin
        image_129 <= io_pixelVal_in_2;
      end else if (8'h81 == _T_9[7:0]) begin
        image_129 <= io_pixelVal_in_1;
      end else if (8'h81 == _T_5[7:0]) begin
        image_129 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_130 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h82 == _T_27[7:0]) begin
        image_130 <= io_pixelVal_in_7;
      end else if (8'h82 == _T_24[7:0]) begin
        image_130 <= io_pixelVal_in_6;
      end else if (8'h82 == _T_21[7:0]) begin
        image_130 <= io_pixelVal_in_5;
      end else if (8'h82 == _T_18[7:0]) begin
        image_130 <= io_pixelVal_in_4;
      end else if (8'h82 == _T_15[7:0]) begin
        image_130 <= io_pixelVal_in_3;
      end else if (8'h82 == _T_12[7:0]) begin
        image_130 <= io_pixelVal_in_2;
      end else if (8'h82 == _T_9[7:0]) begin
        image_130 <= io_pixelVal_in_1;
      end else if (8'h82 == _T_5[7:0]) begin
        image_130 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_131 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h83 == _T_27[7:0]) begin
        image_131 <= io_pixelVal_in_7;
      end else if (8'h83 == _T_24[7:0]) begin
        image_131 <= io_pixelVal_in_6;
      end else if (8'h83 == _T_21[7:0]) begin
        image_131 <= io_pixelVal_in_5;
      end else if (8'h83 == _T_18[7:0]) begin
        image_131 <= io_pixelVal_in_4;
      end else if (8'h83 == _T_15[7:0]) begin
        image_131 <= io_pixelVal_in_3;
      end else if (8'h83 == _T_12[7:0]) begin
        image_131 <= io_pixelVal_in_2;
      end else if (8'h83 == _T_9[7:0]) begin
        image_131 <= io_pixelVal_in_1;
      end else if (8'h83 == _T_5[7:0]) begin
        image_131 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_132 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h84 == _T_27[7:0]) begin
        image_132 <= io_pixelVal_in_7;
      end else if (8'h84 == _T_24[7:0]) begin
        image_132 <= io_pixelVal_in_6;
      end else if (8'h84 == _T_21[7:0]) begin
        image_132 <= io_pixelVal_in_5;
      end else if (8'h84 == _T_18[7:0]) begin
        image_132 <= io_pixelVal_in_4;
      end else if (8'h84 == _T_15[7:0]) begin
        image_132 <= io_pixelVal_in_3;
      end else if (8'h84 == _T_12[7:0]) begin
        image_132 <= io_pixelVal_in_2;
      end else if (8'h84 == _T_9[7:0]) begin
        image_132 <= io_pixelVal_in_1;
      end else if (8'h84 == _T_5[7:0]) begin
        image_132 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_133 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h85 == _T_27[7:0]) begin
        image_133 <= io_pixelVal_in_7;
      end else if (8'h85 == _T_24[7:0]) begin
        image_133 <= io_pixelVal_in_6;
      end else if (8'h85 == _T_21[7:0]) begin
        image_133 <= io_pixelVal_in_5;
      end else if (8'h85 == _T_18[7:0]) begin
        image_133 <= io_pixelVal_in_4;
      end else if (8'h85 == _T_15[7:0]) begin
        image_133 <= io_pixelVal_in_3;
      end else if (8'h85 == _T_12[7:0]) begin
        image_133 <= io_pixelVal_in_2;
      end else if (8'h85 == _T_9[7:0]) begin
        image_133 <= io_pixelVal_in_1;
      end else if (8'h85 == _T_5[7:0]) begin
        image_133 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_134 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h86 == _T_27[7:0]) begin
        image_134 <= io_pixelVal_in_7;
      end else if (8'h86 == _T_24[7:0]) begin
        image_134 <= io_pixelVal_in_6;
      end else if (8'h86 == _T_21[7:0]) begin
        image_134 <= io_pixelVal_in_5;
      end else if (8'h86 == _T_18[7:0]) begin
        image_134 <= io_pixelVal_in_4;
      end else if (8'h86 == _T_15[7:0]) begin
        image_134 <= io_pixelVal_in_3;
      end else if (8'h86 == _T_12[7:0]) begin
        image_134 <= io_pixelVal_in_2;
      end else if (8'h86 == _T_9[7:0]) begin
        image_134 <= io_pixelVal_in_1;
      end else if (8'h86 == _T_5[7:0]) begin
        image_134 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_135 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h87 == _T_27[7:0]) begin
        image_135 <= io_pixelVal_in_7;
      end else if (8'h87 == _T_24[7:0]) begin
        image_135 <= io_pixelVal_in_6;
      end else if (8'h87 == _T_21[7:0]) begin
        image_135 <= io_pixelVal_in_5;
      end else if (8'h87 == _T_18[7:0]) begin
        image_135 <= io_pixelVal_in_4;
      end else if (8'h87 == _T_15[7:0]) begin
        image_135 <= io_pixelVal_in_3;
      end else if (8'h87 == _T_12[7:0]) begin
        image_135 <= io_pixelVal_in_2;
      end else if (8'h87 == _T_9[7:0]) begin
        image_135 <= io_pixelVal_in_1;
      end else if (8'h87 == _T_5[7:0]) begin
        image_135 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_136 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h88 == _T_27[7:0]) begin
        image_136 <= io_pixelVal_in_7;
      end else if (8'h88 == _T_24[7:0]) begin
        image_136 <= io_pixelVal_in_6;
      end else if (8'h88 == _T_21[7:0]) begin
        image_136 <= io_pixelVal_in_5;
      end else if (8'h88 == _T_18[7:0]) begin
        image_136 <= io_pixelVal_in_4;
      end else if (8'h88 == _T_15[7:0]) begin
        image_136 <= io_pixelVal_in_3;
      end else if (8'h88 == _T_12[7:0]) begin
        image_136 <= io_pixelVal_in_2;
      end else if (8'h88 == _T_9[7:0]) begin
        image_136 <= io_pixelVal_in_1;
      end else if (8'h88 == _T_5[7:0]) begin
        image_136 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_137 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h89 == _T_27[7:0]) begin
        image_137 <= io_pixelVal_in_7;
      end else if (8'h89 == _T_24[7:0]) begin
        image_137 <= io_pixelVal_in_6;
      end else if (8'h89 == _T_21[7:0]) begin
        image_137 <= io_pixelVal_in_5;
      end else if (8'h89 == _T_18[7:0]) begin
        image_137 <= io_pixelVal_in_4;
      end else if (8'h89 == _T_15[7:0]) begin
        image_137 <= io_pixelVal_in_3;
      end else if (8'h89 == _T_12[7:0]) begin
        image_137 <= io_pixelVal_in_2;
      end else if (8'h89 == _T_9[7:0]) begin
        image_137 <= io_pixelVal_in_1;
      end else if (8'h89 == _T_5[7:0]) begin
        image_137 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_138 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h8a == _T_27[7:0]) begin
        image_138 <= io_pixelVal_in_7;
      end else if (8'h8a == _T_24[7:0]) begin
        image_138 <= io_pixelVal_in_6;
      end else if (8'h8a == _T_21[7:0]) begin
        image_138 <= io_pixelVal_in_5;
      end else if (8'h8a == _T_18[7:0]) begin
        image_138 <= io_pixelVal_in_4;
      end else if (8'h8a == _T_15[7:0]) begin
        image_138 <= io_pixelVal_in_3;
      end else if (8'h8a == _T_12[7:0]) begin
        image_138 <= io_pixelVal_in_2;
      end else if (8'h8a == _T_9[7:0]) begin
        image_138 <= io_pixelVal_in_1;
      end else if (8'h8a == _T_5[7:0]) begin
        image_138 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_139 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h8b == _T_27[7:0]) begin
        image_139 <= io_pixelVal_in_7;
      end else if (8'h8b == _T_24[7:0]) begin
        image_139 <= io_pixelVal_in_6;
      end else if (8'h8b == _T_21[7:0]) begin
        image_139 <= io_pixelVal_in_5;
      end else if (8'h8b == _T_18[7:0]) begin
        image_139 <= io_pixelVal_in_4;
      end else if (8'h8b == _T_15[7:0]) begin
        image_139 <= io_pixelVal_in_3;
      end else if (8'h8b == _T_12[7:0]) begin
        image_139 <= io_pixelVal_in_2;
      end else if (8'h8b == _T_9[7:0]) begin
        image_139 <= io_pixelVal_in_1;
      end else if (8'h8b == _T_5[7:0]) begin
        image_139 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_140 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h8c == _T_27[7:0]) begin
        image_140 <= io_pixelVal_in_7;
      end else if (8'h8c == _T_24[7:0]) begin
        image_140 <= io_pixelVal_in_6;
      end else if (8'h8c == _T_21[7:0]) begin
        image_140 <= io_pixelVal_in_5;
      end else if (8'h8c == _T_18[7:0]) begin
        image_140 <= io_pixelVal_in_4;
      end else if (8'h8c == _T_15[7:0]) begin
        image_140 <= io_pixelVal_in_3;
      end else if (8'h8c == _T_12[7:0]) begin
        image_140 <= io_pixelVal_in_2;
      end else if (8'h8c == _T_9[7:0]) begin
        image_140 <= io_pixelVal_in_1;
      end else if (8'h8c == _T_5[7:0]) begin
        image_140 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_141 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h8d == _T_27[7:0]) begin
        image_141 <= io_pixelVal_in_7;
      end else if (8'h8d == _T_24[7:0]) begin
        image_141 <= io_pixelVal_in_6;
      end else if (8'h8d == _T_21[7:0]) begin
        image_141 <= io_pixelVal_in_5;
      end else if (8'h8d == _T_18[7:0]) begin
        image_141 <= io_pixelVal_in_4;
      end else if (8'h8d == _T_15[7:0]) begin
        image_141 <= io_pixelVal_in_3;
      end else if (8'h8d == _T_12[7:0]) begin
        image_141 <= io_pixelVal_in_2;
      end else if (8'h8d == _T_9[7:0]) begin
        image_141 <= io_pixelVal_in_1;
      end else if (8'h8d == _T_5[7:0]) begin
        image_141 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_142 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h8e == _T_27[7:0]) begin
        image_142 <= io_pixelVal_in_7;
      end else if (8'h8e == _T_24[7:0]) begin
        image_142 <= io_pixelVal_in_6;
      end else if (8'h8e == _T_21[7:0]) begin
        image_142 <= io_pixelVal_in_5;
      end else if (8'h8e == _T_18[7:0]) begin
        image_142 <= io_pixelVal_in_4;
      end else if (8'h8e == _T_15[7:0]) begin
        image_142 <= io_pixelVal_in_3;
      end else if (8'h8e == _T_12[7:0]) begin
        image_142 <= io_pixelVal_in_2;
      end else if (8'h8e == _T_9[7:0]) begin
        image_142 <= io_pixelVal_in_1;
      end else if (8'h8e == _T_5[7:0]) begin
        image_142 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_143 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h8f == _T_27[7:0]) begin
        image_143 <= io_pixelVal_in_7;
      end else if (8'h8f == _T_24[7:0]) begin
        image_143 <= io_pixelVal_in_6;
      end else if (8'h8f == _T_21[7:0]) begin
        image_143 <= io_pixelVal_in_5;
      end else if (8'h8f == _T_18[7:0]) begin
        image_143 <= io_pixelVal_in_4;
      end else if (8'h8f == _T_15[7:0]) begin
        image_143 <= io_pixelVal_in_3;
      end else if (8'h8f == _T_12[7:0]) begin
        image_143 <= io_pixelVal_in_2;
      end else if (8'h8f == _T_9[7:0]) begin
        image_143 <= io_pixelVal_in_1;
      end else if (8'h8f == _T_5[7:0]) begin
        image_143 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_144 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h90 == _T_27[7:0]) begin
        image_144 <= io_pixelVal_in_7;
      end else if (8'h90 == _T_24[7:0]) begin
        image_144 <= io_pixelVal_in_6;
      end else if (8'h90 == _T_21[7:0]) begin
        image_144 <= io_pixelVal_in_5;
      end else if (8'h90 == _T_18[7:0]) begin
        image_144 <= io_pixelVal_in_4;
      end else if (8'h90 == _T_15[7:0]) begin
        image_144 <= io_pixelVal_in_3;
      end else if (8'h90 == _T_12[7:0]) begin
        image_144 <= io_pixelVal_in_2;
      end else if (8'h90 == _T_9[7:0]) begin
        image_144 <= io_pixelVal_in_1;
      end else if (8'h90 == _T_5[7:0]) begin
        image_144 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_145 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h91 == _T_27[7:0]) begin
        image_145 <= io_pixelVal_in_7;
      end else if (8'h91 == _T_24[7:0]) begin
        image_145 <= io_pixelVal_in_6;
      end else if (8'h91 == _T_21[7:0]) begin
        image_145 <= io_pixelVal_in_5;
      end else if (8'h91 == _T_18[7:0]) begin
        image_145 <= io_pixelVal_in_4;
      end else if (8'h91 == _T_15[7:0]) begin
        image_145 <= io_pixelVal_in_3;
      end else if (8'h91 == _T_12[7:0]) begin
        image_145 <= io_pixelVal_in_2;
      end else if (8'h91 == _T_9[7:0]) begin
        image_145 <= io_pixelVal_in_1;
      end else if (8'h91 == _T_5[7:0]) begin
        image_145 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_146 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h92 == _T_27[7:0]) begin
        image_146 <= io_pixelVal_in_7;
      end else if (8'h92 == _T_24[7:0]) begin
        image_146 <= io_pixelVal_in_6;
      end else if (8'h92 == _T_21[7:0]) begin
        image_146 <= io_pixelVal_in_5;
      end else if (8'h92 == _T_18[7:0]) begin
        image_146 <= io_pixelVal_in_4;
      end else if (8'h92 == _T_15[7:0]) begin
        image_146 <= io_pixelVal_in_3;
      end else if (8'h92 == _T_12[7:0]) begin
        image_146 <= io_pixelVal_in_2;
      end else if (8'h92 == _T_9[7:0]) begin
        image_146 <= io_pixelVal_in_1;
      end else if (8'h92 == _T_5[7:0]) begin
        image_146 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_147 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h93 == _T_27[7:0]) begin
        image_147 <= io_pixelVal_in_7;
      end else if (8'h93 == _T_24[7:0]) begin
        image_147 <= io_pixelVal_in_6;
      end else if (8'h93 == _T_21[7:0]) begin
        image_147 <= io_pixelVal_in_5;
      end else if (8'h93 == _T_18[7:0]) begin
        image_147 <= io_pixelVal_in_4;
      end else if (8'h93 == _T_15[7:0]) begin
        image_147 <= io_pixelVal_in_3;
      end else if (8'h93 == _T_12[7:0]) begin
        image_147 <= io_pixelVal_in_2;
      end else if (8'h93 == _T_9[7:0]) begin
        image_147 <= io_pixelVal_in_1;
      end else if (8'h93 == _T_5[7:0]) begin
        image_147 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_148 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h94 == _T_27[7:0]) begin
        image_148 <= io_pixelVal_in_7;
      end else if (8'h94 == _T_24[7:0]) begin
        image_148 <= io_pixelVal_in_6;
      end else if (8'h94 == _T_21[7:0]) begin
        image_148 <= io_pixelVal_in_5;
      end else if (8'h94 == _T_18[7:0]) begin
        image_148 <= io_pixelVal_in_4;
      end else if (8'h94 == _T_15[7:0]) begin
        image_148 <= io_pixelVal_in_3;
      end else if (8'h94 == _T_12[7:0]) begin
        image_148 <= io_pixelVal_in_2;
      end else if (8'h94 == _T_9[7:0]) begin
        image_148 <= io_pixelVal_in_1;
      end else if (8'h94 == _T_5[7:0]) begin
        image_148 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_149 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h95 == _T_27[7:0]) begin
        image_149 <= io_pixelVal_in_7;
      end else if (8'h95 == _T_24[7:0]) begin
        image_149 <= io_pixelVal_in_6;
      end else if (8'h95 == _T_21[7:0]) begin
        image_149 <= io_pixelVal_in_5;
      end else if (8'h95 == _T_18[7:0]) begin
        image_149 <= io_pixelVal_in_4;
      end else if (8'h95 == _T_15[7:0]) begin
        image_149 <= io_pixelVal_in_3;
      end else if (8'h95 == _T_12[7:0]) begin
        image_149 <= io_pixelVal_in_2;
      end else if (8'h95 == _T_9[7:0]) begin
        image_149 <= io_pixelVal_in_1;
      end else if (8'h95 == _T_5[7:0]) begin
        image_149 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_150 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h96 == _T_27[7:0]) begin
        image_150 <= io_pixelVal_in_7;
      end else if (8'h96 == _T_24[7:0]) begin
        image_150 <= io_pixelVal_in_6;
      end else if (8'h96 == _T_21[7:0]) begin
        image_150 <= io_pixelVal_in_5;
      end else if (8'h96 == _T_18[7:0]) begin
        image_150 <= io_pixelVal_in_4;
      end else if (8'h96 == _T_15[7:0]) begin
        image_150 <= io_pixelVal_in_3;
      end else if (8'h96 == _T_12[7:0]) begin
        image_150 <= io_pixelVal_in_2;
      end else if (8'h96 == _T_9[7:0]) begin
        image_150 <= io_pixelVal_in_1;
      end else if (8'h96 == _T_5[7:0]) begin
        image_150 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_151 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h97 == _T_27[7:0]) begin
        image_151 <= io_pixelVal_in_7;
      end else if (8'h97 == _T_24[7:0]) begin
        image_151 <= io_pixelVal_in_6;
      end else if (8'h97 == _T_21[7:0]) begin
        image_151 <= io_pixelVal_in_5;
      end else if (8'h97 == _T_18[7:0]) begin
        image_151 <= io_pixelVal_in_4;
      end else if (8'h97 == _T_15[7:0]) begin
        image_151 <= io_pixelVal_in_3;
      end else if (8'h97 == _T_12[7:0]) begin
        image_151 <= io_pixelVal_in_2;
      end else if (8'h97 == _T_9[7:0]) begin
        image_151 <= io_pixelVal_in_1;
      end else if (8'h97 == _T_5[7:0]) begin
        image_151 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_152 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h98 == _T_27[7:0]) begin
        image_152 <= io_pixelVal_in_7;
      end else if (8'h98 == _T_24[7:0]) begin
        image_152 <= io_pixelVal_in_6;
      end else if (8'h98 == _T_21[7:0]) begin
        image_152 <= io_pixelVal_in_5;
      end else if (8'h98 == _T_18[7:0]) begin
        image_152 <= io_pixelVal_in_4;
      end else if (8'h98 == _T_15[7:0]) begin
        image_152 <= io_pixelVal_in_3;
      end else if (8'h98 == _T_12[7:0]) begin
        image_152 <= io_pixelVal_in_2;
      end else if (8'h98 == _T_9[7:0]) begin
        image_152 <= io_pixelVal_in_1;
      end else if (8'h98 == _T_5[7:0]) begin
        image_152 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_153 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h99 == _T_27[7:0]) begin
        image_153 <= io_pixelVal_in_7;
      end else if (8'h99 == _T_24[7:0]) begin
        image_153 <= io_pixelVal_in_6;
      end else if (8'h99 == _T_21[7:0]) begin
        image_153 <= io_pixelVal_in_5;
      end else if (8'h99 == _T_18[7:0]) begin
        image_153 <= io_pixelVal_in_4;
      end else if (8'h99 == _T_15[7:0]) begin
        image_153 <= io_pixelVal_in_3;
      end else if (8'h99 == _T_12[7:0]) begin
        image_153 <= io_pixelVal_in_2;
      end else if (8'h99 == _T_9[7:0]) begin
        image_153 <= io_pixelVal_in_1;
      end else if (8'h99 == _T_5[7:0]) begin
        image_153 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_154 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h9a == _T_27[7:0]) begin
        image_154 <= io_pixelVal_in_7;
      end else if (8'h9a == _T_24[7:0]) begin
        image_154 <= io_pixelVal_in_6;
      end else if (8'h9a == _T_21[7:0]) begin
        image_154 <= io_pixelVal_in_5;
      end else if (8'h9a == _T_18[7:0]) begin
        image_154 <= io_pixelVal_in_4;
      end else if (8'h9a == _T_15[7:0]) begin
        image_154 <= io_pixelVal_in_3;
      end else if (8'h9a == _T_12[7:0]) begin
        image_154 <= io_pixelVal_in_2;
      end else if (8'h9a == _T_9[7:0]) begin
        image_154 <= io_pixelVal_in_1;
      end else if (8'h9a == _T_5[7:0]) begin
        image_154 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_155 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h9b == _T_27[7:0]) begin
        image_155 <= io_pixelVal_in_7;
      end else if (8'h9b == _T_24[7:0]) begin
        image_155 <= io_pixelVal_in_6;
      end else if (8'h9b == _T_21[7:0]) begin
        image_155 <= io_pixelVal_in_5;
      end else if (8'h9b == _T_18[7:0]) begin
        image_155 <= io_pixelVal_in_4;
      end else if (8'h9b == _T_15[7:0]) begin
        image_155 <= io_pixelVal_in_3;
      end else if (8'h9b == _T_12[7:0]) begin
        image_155 <= io_pixelVal_in_2;
      end else if (8'h9b == _T_9[7:0]) begin
        image_155 <= io_pixelVal_in_1;
      end else if (8'h9b == _T_5[7:0]) begin
        image_155 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_156 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h9c == _T_27[7:0]) begin
        image_156 <= io_pixelVal_in_7;
      end else if (8'h9c == _T_24[7:0]) begin
        image_156 <= io_pixelVal_in_6;
      end else if (8'h9c == _T_21[7:0]) begin
        image_156 <= io_pixelVal_in_5;
      end else if (8'h9c == _T_18[7:0]) begin
        image_156 <= io_pixelVal_in_4;
      end else if (8'h9c == _T_15[7:0]) begin
        image_156 <= io_pixelVal_in_3;
      end else if (8'h9c == _T_12[7:0]) begin
        image_156 <= io_pixelVal_in_2;
      end else if (8'h9c == _T_9[7:0]) begin
        image_156 <= io_pixelVal_in_1;
      end else if (8'h9c == _T_5[7:0]) begin
        image_156 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_157 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h9d == _T_27[7:0]) begin
        image_157 <= io_pixelVal_in_7;
      end else if (8'h9d == _T_24[7:0]) begin
        image_157 <= io_pixelVal_in_6;
      end else if (8'h9d == _T_21[7:0]) begin
        image_157 <= io_pixelVal_in_5;
      end else if (8'h9d == _T_18[7:0]) begin
        image_157 <= io_pixelVal_in_4;
      end else if (8'h9d == _T_15[7:0]) begin
        image_157 <= io_pixelVal_in_3;
      end else if (8'h9d == _T_12[7:0]) begin
        image_157 <= io_pixelVal_in_2;
      end else if (8'h9d == _T_9[7:0]) begin
        image_157 <= io_pixelVal_in_1;
      end else if (8'h9d == _T_5[7:0]) begin
        image_157 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_158 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h9e == _T_27[7:0]) begin
        image_158 <= io_pixelVal_in_7;
      end else if (8'h9e == _T_24[7:0]) begin
        image_158 <= io_pixelVal_in_6;
      end else if (8'h9e == _T_21[7:0]) begin
        image_158 <= io_pixelVal_in_5;
      end else if (8'h9e == _T_18[7:0]) begin
        image_158 <= io_pixelVal_in_4;
      end else if (8'h9e == _T_15[7:0]) begin
        image_158 <= io_pixelVal_in_3;
      end else if (8'h9e == _T_12[7:0]) begin
        image_158 <= io_pixelVal_in_2;
      end else if (8'h9e == _T_9[7:0]) begin
        image_158 <= io_pixelVal_in_1;
      end else if (8'h9e == _T_5[7:0]) begin
        image_158 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_159 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'h9f == _T_27[7:0]) begin
        image_159 <= io_pixelVal_in_7;
      end else if (8'h9f == _T_24[7:0]) begin
        image_159 <= io_pixelVal_in_6;
      end else if (8'h9f == _T_21[7:0]) begin
        image_159 <= io_pixelVal_in_5;
      end else if (8'h9f == _T_18[7:0]) begin
        image_159 <= io_pixelVal_in_4;
      end else if (8'h9f == _T_15[7:0]) begin
        image_159 <= io_pixelVal_in_3;
      end else if (8'h9f == _T_12[7:0]) begin
        image_159 <= io_pixelVal_in_2;
      end else if (8'h9f == _T_9[7:0]) begin
        image_159 <= io_pixelVal_in_1;
      end else if (8'h9f == _T_5[7:0]) begin
        image_159 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_160 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'ha0 == _T_27[7:0]) begin
        image_160 <= io_pixelVal_in_7;
      end else if (8'ha0 == _T_24[7:0]) begin
        image_160 <= io_pixelVal_in_6;
      end else if (8'ha0 == _T_21[7:0]) begin
        image_160 <= io_pixelVal_in_5;
      end else if (8'ha0 == _T_18[7:0]) begin
        image_160 <= io_pixelVal_in_4;
      end else if (8'ha0 == _T_15[7:0]) begin
        image_160 <= io_pixelVal_in_3;
      end else if (8'ha0 == _T_12[7:0]) begin
        image_160 <= io_pixelVal_in_2;
      end else if (8'ha0 == _T_9[7:0]) begin
        image_160 <= io_pixelVal_in_1;
      end else if (8'ha0 == _T_5[7:0]) begin
        image_160 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_161 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'ha1 == _T_27[7:0]) begin
        image_161 <= io_pixelVal_in_7;
      end else if (8'ha1 == _T_24[7:0]) begin
        image_161 <= io_pixelVal_in_6;
      end else if (8'ha1 == _T_21[7:0]) begin
        image_161 <= io_pixelVal_in_5;
      end else if (8'ha1 == _T_18[7:0]) begin
        image_161 <= io_pixelVal_in_4;
      end else if (8'ha1 == _T_15[7:0]) begin
        image_161 <= io_pixelVal_in_3;
      end else if (8'ha1 == _T_12[7:0]) begin
        image_161 <= io_pixelVal_in_2;
      end else if (8'ha1 == _T_9[7:0]) begin
        image_161 <= io_pixelVal_in_1;
      end else if (8'ha1 == _T_5[7:0]) begin
        image_161 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_162 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'ha2 == _T_27[7:0]) begin
        image_162 <= io_pixelVal_in_7;
      end else if (8'ha2 == _T_24[7:0]) begin
        image_162 <= io_pixelVal_in_6;
      end else if (8'ha2 == _T_21[7:0]) begin
        image_162 <= io_pixelVal_in_5;
      end else if (8'ha2 == _T_18[7:0]) begin
        image_162 <= io_pixelVal_in_4;
      end else if (8'ha2 == _T_15[7:0]) begin
        image_162 <= io_pixelVal_in_3;
      end else if (8'ha2 == _T_12[7:0]) begin
        image_162 <= io_pixelVal_in_2;
      end else if (8'ha2 == _T_9[7:0]) begin
        image_162 <= io_pixelVal_in_1;
      end else if (8'ha2 == _T_5[7:0]) begin
        image_162 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_163 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'ha3 == _T_27[7:0]) begin
        image_163 <= io_pixelVal_in_7;
      end else if (8'ha3 == _T_24[7:0]) begin
        image_163 <= io_pixelVal_in_6;
      end else if (8'ha3 == _T_21[7:0]) begin
        image_163 <= io_pixelVal_in_5;
      end else if (8'ha3 == _T_18[7:0]) begin
        image_163 <= io_pixelVal_in_4;
      end else if (8'ha3 == _T_15[7:0]) begin
        image_163 <= io_pixelVal_in_3;
      end else if (8'ha3 == _T_12[7:0]) begin
        image_163 <= io_pixelVal_in_2;
      end else if (8'ha3 == _T_9[7:0]) begin
        image_163 <= io_pixelVal_in_1;
      end else if (8'ha3 == _T_5[7:0]) begin
        image_163 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_164 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'ha4 == _T_27[7:0]) begin
        image_164 <= io_pixelVal_in_7;
      end else if (8'ha4 == _T_24[7:0]) begin
        image_164 <= io_pixelVal_in_6;
      end else if (8'ha4 == _T_21[7:0]) begin
        image_164 <= io_pixelVal_in_5;
      end else if (8'ha4 == _T_18[7:0]) begin
        image_164 <= io_pixelVal_in_4;
      end else if (8'ha4 == _T_15[7:0]) begin
        image_164 <= io_pixelVal_in_3;
      end else if (8'ha4 == _T_12[7:0]) begin
        image_164 <= io_pixelVal_in_2;
      end else if (8'ha4 == _T_9[7:0]) begin
        image_164 <= io_pixelVal_in_1;
      end else if (8'ha4 == _T_5[7:0]) begin
        image_164 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_165 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'ha5 == _T_27[7:0]) begin
        image_165 <= io_pixelVal_in_7;
      end else if (8'ha5 == _T_24[7:0]) begin
        image_165 <= io_pixelVal_in_6;
      end else if (8'ha5 == _T_21[7:0]) begin
        image_165 <= io_pixelVal_in_5;
      end else if (8'ha5 == _T_18[7:0]) begin
        image_165 <= io_pixelVal_in_4;
      end else if (8'ha5 == _T_15[7:0]) begin
        image_165 <= io_pixelVal_in_3;
      end else if (8'ha5 == _T_12[7:0]) begin
        image_165 <= io_pixelVal_in_2;
      end else if (8'ha5 == _T_9[7:0]) begin
        image_165 <= io_pixelVal_in_1;
      end else if (8'ha5 == _T_5[7:0]) begin
        image_165 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_166 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'ha6 == _T_27[7:0]) begin
        image_166 <= io_pixelVal_in_7;
      end else if (8'ha6 == _T_24[7:0]) begin
        image_166 <= io_pixelVal_in_6;
      end else if (8'ha6 == _T_21[7:0]) begin
        image_166 <= io_pixelVal_in_5;
      end else if (8'ha6 == _T_18[7:0]) begin
        image_166 <= io_pixelVal_in_4;
      end else if (8'ha6 == _T_15[7:0]) begin
        image_166 <= io_pixelVal_in_3;
      end else if (8'ha6 == _T_12[7:0]) begin
        image_166 <= io_pixelVal_in_2;
      end else if (8'ha6 == _T_9[7:0]) begin
        image_166 <= io_pixelVal_in_1;
      end else if (8'ha6 == _T_5[7:0]) begin
        image_166 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_167 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'ha7 == _T_27[7:0]) begin
        image_167 <= io_pixelVal_in_7;
      end else if (8'ha7 == _T_24[7:0]) begin
        image_167 <= io_pixelVal_in_6;
      end else if (8'ha7 == _T_21[7:0]) begin
        image_167 <= io_pixelVal_in_5;
      end else if (8'ha7 == _T_18[7:0]) begin
        image_167 <= io_pixelVal_in_4;
      end else if (8'ha7 == _T_15[7:0]) begin
        image_167 <= io_pixelVal_in_3;
      end else if (8'ha7 == _T_12[7:0]) begin
        image_167 <= io_pixelVal_in_2;
      end else if (8'ha7 == _T_9[7:0]) begin
        image_167 <= io_pixelVal_in_1;
      end else if (8'ha7 == _T_5[7:0]) begin
        image_167 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_168 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'ha8 == _T_27[7:0]) begin
        image_168 <= io_pixelVal_in_7;
      end else if (8'ha8 == _T_24[7:0]) begin
        image_168 <= io_pixelVal_in_6;
      end else if (8'ha8 == _T_21[7:0]) begin
        image_168 <= io_pixelVal_in_5;
      end else if (8'ha8 == _T_18[7:0]) begin
        image_168 <= io_pixelVal_in_4;
      end else if (8'ha8 == _T_15[7:0]) begin
        image_168 <= io_pixelVal_in_3;
      end else if (8'ha8 == _T_12[7:0]) begin
        image_168 <= io_pixelVal_in_2;
      end else if (8'ha8 == _T_9[7:0]) begin
        image_168 <= io_pixelVal_in_1;
      end else if (8'ha8 == _T_5[7:0]) begin
        image_168 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_169 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'ha9 == _T_27[7:0]) begin
        image_169 <= io_pixelVal_in_7;
      end else if (8'ha9 == _T_24[7:0]) begin
        image_169 <= io_pixelVal_in_6;
      end else if (8'ha9 == _T_21[7:0]) begin
        image_169 <= io_pixelVal_in_5;
      end else if (8'ha9 == _T_18[7:0]) begin
        image_169 <= io_pixelVal_in_4;
      end else if (8'ha9 == _T_15[7:0]) begin
        image_169 <= io_pixelVal_in_3;
      end else if (8'ha9 == _T_12[7:0]) begin
        image_169 <= io_pixelVal_in_2;
      end else if (8'ha9 == _T_9[7:0]) begin
        image_169 <= io_pixelVal_in_1;
      end else if (8'ha9 == _T_5[7:0]) begin
        image_169 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_170 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'haa == _T_27[7:0]) begin
        image_170 <= io_pixelVal_in_7;
      end else if (8'haa == _T_24[7:0]) begin
        image_170 <= io_pixelVal_in_6;
      end else if (8'haa == _T_21[7:0]) begin
        image_170 <= io_pixelVal_in_5;
      end else if (8'haa == _T_18[7:0]) begin
        image_170 <= io_pixelVal_in_4;
      end else if (8'haa == _T_15[7:0]) begin
        image_170 <= io_pixelVal_in_3;
      end else if (8'haa == _T_12[7:0]) begin
        image_170 <= io_pixelVal_in_2;
      end else if (8'haa == _T_9[7:0]) begin
        image_170 <= io_pixelVal_in_1;
      end else if (8'haa == _T_5[7:0]) begin
        image_170 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_171 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'hab == _T_27[7:0]) begin
        image_171 <= io_pixelVal_in_7;
      end else if (8'hab == _T_24[7:0]) begin
        image_171 <= io_pixelVal_in_6;
      end else if (8'hab == _T_21[7:0]) begin
        image_171 <= io_pixelVal_in_5;
      end else if (8'hab == _T_18[7:0]) begin
        image_171 <= io_pixelVal_in_4;
      end else if (8'hab == _T_15[7:0]) begin
        image_171 <= io_pixelVal_in_3;
      end else if (8'hab == _T_12[7:0]) begin
        image_171 <= io_pixelVal_in_2;
      end else if (8'hab == _T_9[7:0]) begin
        image_171 <= io_pixelVal_in_1;
      end else if (8'hab == _T_5[7:0]) begin
        image_171 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_172 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'hac == _T_27[7:0]) begin
        image_172 <= io_pixelVal_in_7;
      end else if (8'hac == _T_24[7:0]) begin
        image_172 <= io_pixelVal_in_6;
      end else if (8'hac == _T_21[7:0]) begin
        image_172 <= io_pixelVal_in_5;
      end else if (8'hac == _T_18[7:0]) begin
        image_172 <= io_pixelVal_in_4;
      end else if (8'hac == _T_15[7:0]) begin
        image_172 <= io_pixelVal_in_3;
      end else if (8'hac == _T_12[7:0]) begin
        image_172 <= io_pixelVal_in_2;
      end else if (8'hac == _T_9[7:0]) begin
        image_172 <= io_pixelVal_in_1;
      end else if (8'hac == _T_5[7:0]) begin
        image_172 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_173 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'had == _T_27[7:0]) begin
        image_173 <= io_pixelVal_in_7;
      end else if (8'had == _T_24[7:0]) begin
        image_173 <= io_pixelVal_in_6;
      end else if (8'had == _T_21[7:0]) begin
        image_173 <= io_pixelVal_in_5;
      end else if (8'had == _T_18[7:0]) begin
        image_173 <= io_pixelVal_in_4;
      end else if (8'had == _T_15[7:0]) begin
        image_173 <= io_pixelVal_in_3;
      end else if (8'had == _T_12[7:0]) begin
        image_173 <= io_pixelVal_in_2;
      end else if (8'had == _T_9[7:0]) begin
        image_173 <= io_pixelVal_in_1;
      end else if (8'had == _T_5[7:0]) begin
        image_173 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_174 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'hae == _T_27[7:0]) begin
        image_174 <= io_pixelVal_in_7;
      end else if (8'hae == _T_24[7:0]) begin
        image_174 <= io_pixelVal_in_6;
      end else if (8'hae == _T_21[7:0]) begin
        image_174 <= io_pixelVal_in_5;
      end else if (8'hae == _T_18[7:0]) begin
        image_174 <= io_pixelVal_in_4;
      end else if (8'hae == _T_15[7:0]) begin
        image_174 <= io_pixelVal_in_3;
      end else if (8'hae == _T_12[7:0]) begin
        image_174 <= io_pixelVal_in_2;
      end else if (8'hae == _T_9[7:0]) begin
        image_174 <= io_pixelVal_in_1;
      end else if (8'hae == _T_5[7:0]) begin
        image_174 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_175 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'haf == _T_27[7:0]) begin
        image_175 <= io_pixelVal_in_7;
      end else if (8'haf == _T_24[7:0]) begin
        image_175 <= io_pixelVal_in_6;
      end else if (8'haf == _T_21[7:0]) begin
        image_175 <= io_pixelVal_in_5;
      end else if (8'haf == _T_18[7:0]) begin
        image_175 <= io_pixelVal_in_4;
      end else if (8'haf == _T_15[7:0]) begin
        image_175 <= io_pixelVal_in_3;
      end else if (8'haf == _T_12[7:0]) begin
        image_175 <= io_pixelVal_in_2;
      end else if (8'haf == _T_9[7:0]) begin
        image_175 <= io_pixelVal_in_1;
      end else if (8'haf == _T_5[7:0]) begin
        image_175 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_176 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'hb0 == _T_27[7:0]) begin
        image_176 <= io_pixelVal_in_7;
      end else if (8'hb0 == _T_24[7:0]) begin
        image_176 <= io_pixelVal_in_6;
      end else if (8'hb0 == _T_21[7:0]) begin
        image_176 <= io_pixelVal_in_5;
      end else if (8'hb0 == _T_18[7:0]) begin
        image_176 <= io_pixelVal_in_4;
      end else if (8'hb0 == _T_15[7:0]) begin
        image_176 <= io_pixelVal_in_3;
      end else if (8'hb0 == _T_12[7:0]) begin
        image_176 <= io_pixelVal_in_2;
      end else if (8'hb0 == _T_9[7:0]) begin
        image_176 <= io_pixelVal_in_1;
      end else if (8'hb0 == _T_5[7:0]) begin
        image_176 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_177 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'hb1 == _T_27[7:0]) begin
        image_177 <= io_pixelVal_in_7;
      end else if (8'hb1 == _T_24[7:0]) begin
        image_177 <= io_pixelVal_in_6;
      end else if (8'hb1 == _T_21[7:0]) begin
        image_177 <= io_pixelVal_in_5;
      end else if (8'hb1 == _T_18[7:0]) begin
        image_177 <= io_pixelVal_in_4;
      end else if (8'hb1 == _T_15[7:0]) begin
        image_177 <= io_pixelVal_in_3;
      end else if (8'hb1 == _T_12[7:0]) begin
        image_177 <= io_pixelVal_in_2;
      end else if (8'hb1 == _T_9[7:0]) begin
        image_177 <= io_pixelVal_in_1;
      end else if (8'hb1 == _T_5[7:0]) begin
        image_177 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_178 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'hb2 == _T_27[7:0]) begin
        image_178 <= io_pixelVal_in_7;
      end else if (8'hb2 == _T_24[7:0]) begin
        image_178 <= io_pixelVal_in_6;
      end else if (8'hb2 == _T_21[7:0]) begin
        image_178 <= io_pixelVal_in_5;
      end else if (8'hb2 == _T_18[7:0]) begin
        image_178 <= io_pixelVal_in_4;
      end else if (8'hb2 == _T_15[7:0]) begin
        image_178 <= io_pixelVal_in_3;
      end else if (8'hb2 == _T_12[7:0]) begin
        image_178 <= io_pixelVal_in_2;
      end else if (8'hb2 == _T_9[7:0]) begin
        image_178 <= io_pixelVal_in_1;
      end else if (8'hb2 == _T_5[7:0]) begin
        image_178 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_179 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'hb3 == _T_27[7:0]) begin
        image_179 <= io_pixelVal_in_7;
      end else if (8'hb3 == _T_24[7:0]) begin
        image_179 <= io_pixelVal_in_6;
      end else if (8'hb3 == _T_21[7:0]) begin
        image_179 <= io_pixelVal_in_5;
      end else if (8'hb3 == _T_18[7:0]) begin
        image_179 <= io_pixelVal_in_4;
      end else if (8'hb3 == _T_15[7:0]) begin
        image_179 <= io_pixelVal_in_3;
      end else if (8'hb3 == _T_12[7:0]) begin
        image_179 <= io_pixelVal_in_2;
      end else if (8'hb3 == _T_9[7:0]) begin
        image_179 <= io_pixelVal_in_1;
      end else if (8'hb3 == _T_5[7:0]) begin
        image_179 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_180 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'hb4 == _T_27[7:0]) begin
        image_180 <= io_pixelVal_in_7;
      end else if (8'hb4 == _T_24[7:0]) begin
        image_180 <= io_pixelVal_in_6;
      end else if (8'hb4 == _T_21[7:0]) begin
        image_180 <= io_pixelVal_in_5;
      end else if (8'hb4 == _T_18[7:0]) begin
        image_180 <= io_pixelVal_in_4;
      end else if (8'hb4 == _T_15[7:0]) begin
        image_180 <= io_pixelVal_in_3;
      end else if (8'hb4 == _T_12[7:0]) begin
        image_180 <= io_pixelVal_in_2;
      end else if (8'hb4 == _T_9[7:0]) begin
        image_180 <= io_pixelVal_in_1;
      end else if (8'hb4 == _T_5[7:0]) begin
        image_180 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_181 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'hb5 == _T_27[7:0]) begin
        image_181 <= io_pixelVal_in_7;
      end else if (8'hb5 == _T_24[7:0]) begin
        image_181 <= io_pixelVal_in_6;
      end else if (8'hb5 == _T_21[7:0]) begin
        image_181 <= io_pixelVal_in_5;
      end else if (8'hb5 == _T_18[7:0]) begin
        image_181 <= io_pixelVal_in_4;
      end else if (8'hb5 == _T_15[7:0]) begin
        image_181 <= io_pixelVal_in_3;
      end else if (8'hb5 == _T_12[7:0]) begin
        image_181 <= io_pixelVal_in_2;
      end else if (8'hb5 == _T_9[7:0]) begin
        image_181 <= io_pixelVal_in_1;
      end else if (8'hb5 == _T_5[7:0]) begin
        image_181 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_182 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'hb6 == _T_27[7:0]) begin
        image_182 <= io_pixelVal_in_7;
      end else if (8'hb6 == _T_24[7:0]) begin
        image_182 <= io_pixelVal_in_6;
      end else if (8'hb6 == _T_21[7:0]) begin
        image_182 <= io_pixelVal_in_5;
      end else if (8'hb6 == _T_18[7:0]) begin
        image_182 <= io_pixelVal_in_4;
      end else if (8'hb6 == _T_15[7:0]) begin
        image_182 <= io_pixelVal_in_3;
      end else if (8'hb6 == _T_12[7:0]) begin
        image_182 <= io_pixelVal_in_2;
      end else if (8'hb6 == _T_9[7:0]) begin
        image_182 <= io_pixelVal_in_1;
      end else if (8'hb6 == _T_5[7:0]) begin
        image_182 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_183 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'hb7 == _T_27[7:0]) begin
        image_183 <= io_pixelVal_in_7;
      end else if (8'hb7 == _T_24[7:0]) begin
        image_183 <= io_pixelVal_in_6;
      end else if (8'hb7 == _T_21[7:0]) begin
        image_183 <= io_pixelVal_in_5;
      end else if (8'hb7 == _T_18[7:0]) begin
        image_183 <= io_pixelVal_in_4;
      end else if (8'hb7 == _T_15[7:0]) begin
        image_183 <= io_pixelVal_in_3;
      end else if (8'hb7 == _T_12[7:0]) begin
        image_183 <= io_pixelVal_in_2;
      end else if (8'hb7 == _T_9[7:0]) begin
        image_183 <= io_pixelVal_in_1;
      end else if (8'hb7 == _T_5[7:0]) begin
        image_183 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_184 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'hb8 == _T_27[7:0]) begin
        image_184 <= io_pixelVal_in_7;
      end else if (8'hb8 == _T_24[7:0]) begin
        image_184 <= io_pixelVal_in_6;
      end else if (8'hb8 == _T_21[7:0]) begin
        image_184 <= io_pixelVal_in_5;
      end else if (8'hb8 == _T_18[7:0]) begin
        image_184 <= io_pixelVal_in_4;
      end else if (8'hb8 == _T_15[7:0]) begin
        image_184 <= io_pixelVal_in_3;
      end else if (8'hb8 == _T_12[7:0]) begin
        image_184 <= io_pixelVal_in_2;
      end else if (8'hb8 == _T_9[7:0]) begin
        image_184 <= io_pixelVal_in_1;
      end else if (8'hb8 == _T_5[7:0]) begin
        image_184 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_185 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'hb9 == _T_27[7:0]) begin
        image_185 <= io_pixelVal_in_7;
      end else if (8'hb9 == _T_24[7:0]) begin
        image_185 <= io_pixelVal_in_6;
      end else if (8'hb9 == _T_21[7:0]) begin
        image_185 <= io_pixelVal_in_5;
      end else if (8'hb9 == _T_18[7:0]) begin
        image_185 <= io_pixelVal_in_4;
      end else if (8'hb9 == _T_15[7:0]) begin
        image_185 <= io_pixelVal_in_3;
      end else if (8'hb9 == _T_12[7:0]) begin
        image_185 <= io_pixelVal_in_2;
      end else if (8'hb9 == _T_9[7:0]) begin
        image_185 <= io_pixelVal_in_1;
      end else if (8'hb9 == _T_5[7:0]) begin
        image_185 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_186 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'hba == _T_27[7:0]) begin
        image_186 <= io_pixelVal_in_7;
      end else if (8'hba == _T_24[7:0]) begin
        image_186 <= io_pixelVal_in_6;
      end else if (8'hba == _T_21[7:0]) begin
        image_186 <= io_pixelVal_in_5;
      end else if (8'hba == _T_18[7:0]) begin
        image_186 <= io_pixelVal_in_4;
      end else if (8'hba == _T_15[7:0]) begin
        image_186 <= io_pixelVal_in_3;
      end else if (8'hba == _T_12[7:0]) begin
        image_186 <= io_pixelVal_in_2;
      end else if (8'hba == _T_9[7:0]) begin
        image_186 <= io_pixelVal_in_1;
      end else if (8'hba == _T_5[7:0]) begin
        image_186 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_187 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'hbb == _T_27[7:0]) begin
        image_187 <= io_pixelVal_in_7;
      end else if (8'hbb == _T_24[7:0]) begin
        image_187 <= io_pixelVal_in_6;
      end else if (8'hbb == _T_21[7:0]) begin
        image_187 <= io_pixelVal_in_5;
      end else if (8'hbb == _T_18[7:0]) begin
        image_187 <= io_pixelVal_in_4;
      end else if (8'hbb == _T_15[7:0]) begin
        image_187 <= io_pixelVal_in_3;
      end else if (8'hbb == _T_12[7:0]) begin
        image_187 <= io_pixelVal_in_2;
      end else if (8'hbb == _T_9[7:0]) begin
        image_187 <= io_pixelVal_in_1;
      end else if (8'hbb == _T_5[7:0]) begin
        image_187 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_188 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'hbc == _T_27[7:0]) begin
        image_188 <= io_pixelVal_in_7;
      end else if (8'hbc == _T_24[7:0]) begin
        image_188 <= io_pixelVal_in_6;
      end else if (8'hbc == _T_21[7:0]) begin
        image_188 <= io_pixelVal_in_5;
      end else if (8'hbc == _T_18[7:0]) begin
        image_188 <= io_pixelVal_in_4;
      end else if (8'hbc == _T_15[7:0]) begin
        image_188 <= io_pixelVal_in_3;
      end else if (8'hbc == _T_12[7:0]) begin
        image_188 <= io_pixelVal_in_2;
      end else if (8'hbc == _T_9[7:0]) begin
        image_188 <= io_pixelVal_in_1;
      end else if (8'hbc == _T_5[7:0]) begin
        image_188 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_189 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'hbd == _T_27[7:0]) begin
        image_189 <= io_pixelVal_in_7;
      end else if (8'hbd == _T_24[7:0]) begin
        image_189 <= io_pixelVal_in_6;
      end else if (8'hbd == _T_21[7:0]) begin
        image_189 <= io_pixelVal_in_5;
      end else if (8'hbd == _T_18[7:0]) begin
        image_189 <= io_pixelVal_in_4;
      end else if (8'hbd == _T_15[7:0]) begin
        image_189 <= io_pixelVal_in_3;
      end else if (8'hbd == _T_12[7:0]) begin
        image_189 <= io_pixelVal_in_2;
      end else if (8'hbd == _T_9[7:0]) begin
        image_189 <= io_pixelVal_in_1;
      end else if (8'hbd == _T_5[7:0]) begin
        image_189 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_190 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'hbe == _T_27[7:0]) begin
        image_190 <= io_pixelVal_in_7;
      end else if (8'hbe == _T_24[7:0]) begin
        image_190 <= io_pixelVal_in_6;
      end else if (8'hbe == _T_21[7:0]) begin
        image_190 <= io_pixelVal_in_5;
      end else if (8'hbe == _T_18[7:0]) begin
        image_190 <= io_pixelVal_in_4;
      end else if (8'hbe == _T_15[7:0]) begin
        image_190 <= io_pixelVal_in_3;
      end else if (8'hbe == _T_12[7:0]) begin
        image_190 <= io_pixelVal_in_2;
      end else if (8'hbe == _T_9[7:0]) begin
        image_190 <= io_pixelVal_in_1;
      end else if (8'hbe == _T_5[7:0]) begin
        image_190 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      image_191 <= 4'h7;
    end else if (io_valid_in) begin
      if (8'hbf == _T_27[7:0]) begin
        image_191 <= io_pixelVal_in_7;
      end else if (8'hbf == _T_24[7:0]) begin
        image_191 <= io_pixelVal_in_6;
      end else if (8'hbf == _T_21[7:0]) begin
        image_191 <= io_pixelVal_in_5;
      end else if (8'hbf == _T_18[7:0]) begin
        image_191 <= io_pixelVal_in_4;
      end else if (8'hbf == _T_15[7:0]) begin
        image_191 <= io_pixelVal_in_3;
      end else if (8'hbf == _T_12[7:0]) begin
        image_191 <= io_pixelVal_in_2;
      end else if (8'hbf == _T_9[7:0]) begin
        image_191 <= io_pixelVal_in_1;
      end else if (8'hbf == _T_5[7:0]) begin
        image_191 <= io_pixelVal_in_0;
      end
    end
    if (reset) begin
      pixelIndex <= 32'h0;
    end else if (io_valid_in) begin
      if (_T_32) begin
        pixelIndex <= 32'h0;
      end else begin
        pixelIndex <= _T_30;
      end
    end
  end
endmodule
module ImageProcessing(
  input         clock,
  input         reset,
  input  [10:0] io_rowIndex,
  input  [10:0] io_colIndex,
  input  [5:0]  io_SPI_filterIndex,
  input         io_SPI_invert,
  input         io_SPI_distort,
  output [3:0]  io_pixelVal_out
);
  wire  filter_clock; // @[ImageProcessing.scala 19:22]
  wire  filter_reset; // @[ImageProcessing.scala 19:22]
  wire [5:0] filter_io_SPI_filterIndex; // @[ImageProcessing.scala 19:22]
  wire [3:0] filter_io_pixelVal_out_0; // @[ImageProcessing.scala 19:22]
  wire [3:0] filter_io_pixelVal_out_1; // @[ImageProcessing.scala 19:22]
  wire [3:0] filter_io_pixelVal_out_2; // @[ImageProcessing.scala 19:22]
  wire [3:0] filter_io_pixelVal_out_3; // @[ImageProcessing.scala 19:22]
  wire [3:0] filter_io_pixelVal_out_4; // @[ImageProcessing.scala 19:22]
  wire [3:0] filter_io_pixelVal_out_5; // @[ImageProcessing.scala 19:22]
  wire [3:0] filter_io_pixelVal_out_6; // @[ImageProcessing.scala 19:22]
  wire [3:0] filter_io_pixelVal_out_7; // @[ImageProcessing.scala 19:22]
  wire  filter_io_valid_out; // @[ImageProcessing.scala 19:22]
  wire  videoBuffer_clock; // @[ImageProcessing.scala 20:27]
  wire  videoBuffer_reset; // @[ImageProcessing.scala 20:27]
  wire [3:0] videoBuffer_io_pixelVal_in_0; // @[ImageProcessing.scala 20:27]
  wire [3:0] videoBuffer_io_pixelVal_in_1; // @[ImageProcessing.scala 20:27]
  wire [3:0] videoBuffer_io_pixelVal_in_2; // @[ImageProcessing.scala 20:27]
  wire [3:0] videoBuffer_io_pixelVal_in_3; // @[ImageProcessing.scala 20:27]
  wire [3:0] videoBuffer_io_pixelVal_in_4; // @[ImageProcessing.scala 20:27]
  wire [3:0] videoBuffer_io_pixelVal_in_5; // @[ImageProcessing.scala 20:27]
  wire [3:0] videoBuffer_io_pixelVal_in_6; // @[ImageProcessing.scala 20:27]
  wire [3:0] videoBuffer_io_pixelVal_in_7; // @[ImageProcessing.scala 20:27]
  wire  videoBuffer_io_valid_in; // @[ImageProcessing.scala 20:27]
  wire [10:0] videoBuffer_io_rowIndex; // @[ImageProcessing.scala 20:27]
  wire [10:0] videoBuffer_io_colIndex; // @[ImageProcessing.scala 20:27]
  wire [3:0] videoBuffer_io_pixelVal_out; // @[ImageProcessing.scala 20:27]
  Filter filter ( // @[ImageProcessing.scala 19:22]
    .clock(filter_clock),
    .reset(filter_reset),
    .io_SPI_filterIndex(filter_io_SPI_filterIndex),
    .io_pixelVal_out_0(filter_io_pixelVal_out_0),
    .io_pixelVal_out_1(filter_io_pixelVal_out_1),
    .io_pixelVal_out_2(filter_io_pixelVal_out_2),
    .io_pixelVal_out_3(filter_io_pixelVal_out_3),
    .io_pixelVal_out_4(filter_io_pixelVal_out_4),
    .io_pixelVal_out_5(filter_io_pixelVal_out_5),
    .io_pixelVal_out_6(filter_io_pixelVal_out_6),
    .io_pixelVal_out_7(filter_io_pixelVal_out_7),
    .io_valid_out(filter_io_valid_out)
  );
  VideoBuffer videoBuffer ( // @[ImageProcessing.scala 20:27]
    .clock(videoBuffer_clock),
    .reset(videoBuffer_reset),
    .io_pixelVal_in_0(videoBuffer_io_pixelVal_in_0),
    .io_pixelVal_in_1(videoBuffer_io_pixelVal_in_1),
    .io_pixelVal_in_2(videoBuffer_io_pixelVal_in_2),
    .io_pixelVal_in_3(videoBuffer_io_pixelVal_in_3),
    .io_pixelVal_in_4(videoBuffer_io_pixelVal_in_4),
    .io_pixelVal_in_5(videoBuffer_io_pixelVal_in_5),
    .io_pixelVal_in_6(videoBuffer_io_pixelVal_in_6),
    .io_pixelVal_in_7(videoBuffer_io_pixelVal_in_7),
    .io_valid_in(videoBuffer_io_valid_in),
    .io_rowIndex(videoBuffer_io_rowIndex),
    .io_colIndex(videoBuffer_io_colIndex),
    .io_pixelVal_out(videoBuffer_io_pixelVal_out)
  );
  assign io_pixelVal_out = videoBuffer_io_pixelVal_out; // @[ImageProcessing.scala 34:19]
  assign filter_clock = clock;
  assign filter_reset = reset;
  assign filter_io_SPI_filterIndex = io_SPI_filterIndex; // @[ImageProcessing.scala 25:29]
  assign videoBuffer_clock = clock;
  assign videoBuffer_reset = reset;
  assign videoBuffer_io_pixelVal_in_0 = filter_io_pixelVal_out_0; // @[ImageProcessing.scala 30:34]
  assign videoBuffer_io_pixelVal_in_1 = filter_io_pixelVal_out_1; // @[ImageProcessing.scala 30:34]
  assign videoBuffer_io_pixelVal_in_2 = filter_io_pixelVal_out_2; // @[ImageProcessing.scala 30:34]
  assign videoBuffer_io_pixelVal_in_3 = filter_io_pixelVal_out_3; // @[ImageProcessing.scala 30:34]
  assign videoBuffer_io_pixelVal_in_4 = filter_io_pixelVal_out_4; // @[ImageProcessing.scala 30:34]
  assign videoBuffer_io_pixelVal_in_5 = filter_io_pixelVal_out_5; // @[ImageProcessing.scala 30:34]
  assign videoBuffer_io_pixelVal_in_6 = filter_io_pixelVal_out_6; // @[ImageProcessing.scala 30:34]
  assign videoBuffer_io_pixelVal_in_7 = filter_io_pixelVal_out_7; // @[ImageProcessing.scala 30:34]
  assign videoBuffer_io_valid_in = filter_io_valid_out; // @[ImageProcessing.scala 33:27]
  assign videoBuffer_io_rowIndex = io_rowIndex; // @[ImageProcessing.scala 22:27]
  assign videoBuffer_io_colIndex = io_colIndex; // @[ImageProcessing.scala 23:27]
endmodule
