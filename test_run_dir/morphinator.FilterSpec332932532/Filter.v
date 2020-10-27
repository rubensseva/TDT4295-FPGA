module DotProd(
  input         clock,
  input         reset,
  input  [15:0] io_dataInA,
  input  [15:0] io_dataInB,
  output [15:0] io_dataOut,
  output        io_outputValid
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] countVal; // @[Counter.scala 29:33]
  wire  countReset = countVal == 4'h8; // @[Counter.scala 38:24]
  wire [3:0] _T_2 = countVal + 4'h1; // @[Counter.scala 39:22]
  reg [15:0] accumulator; // @[DotProd.scala 19:28]
  wire [31:0] product = io_dataInA * io_dataInB; // @[DotProd.scala 20:28]
  wire [31:0] _GEN_5 = {{16'd0}, accumulator}; // @[DotProd.scala 21:30]
  wire [31:0] _T_4 = _GEN_5 + product; // @[DotProd.scala 21:30]
  wire [31:0] _GEN_4 = countReset ? 32'h0 : _T_4; // @[DotProd.scala 24:20]
  assign io_dataOut = _T_4[15:0]; // @[DotProd.scala 22:14]
  assign io_outputValid = countVal == 4'h8; // @[DotProd.scala 25:20 DotProd.scala 28:20]
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
  accumulator = _RAND_1[15:0];
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
      accumulator <= 16'h0;
    end else begin
      accumulator <= _GEN_4[15:0];
    end
  end
endmodule
module KernelConvolution(
  input         clock,
  input         reset,
  input  [15:0] io_kernelVal_in,
  input  [15:0] io_pixelVal_in_0,
  input  [15:0] io_pixelVal_in_1,
  input  [15:0] io_pixelVal_in_2,
  input  [15:0] io_pixelVal_in_3,
  input  [15:0] io_pixelVal_in_4,
  input  [15:0] io_pixelVal_in_5,
  input  [15:0] io_pixelVal_in_6,
  input  [15:0] io_pixelVal_in_7,
  input  [15:0] io_pixelVal_in_8,
  input  [15:0] io_pixelVal_in_9,
  input  [15:0] io_pixelVal_in_10,
  input  [15:0] io_pixelVal_in_11,
  input  [15:0] io_pixelVal_in_12,
  input  [15:0] io_pixelVal_in_13,
  input  [15:0] io_pixelVal_in_14,
  input  [15:0] io_pixelVal_in_15,
  input  [15:0] io_pixelVal_in_16,
  input  [15:0] io_pixelVal_in_17,
  output [15:0] io_pixelVal_out_0,
  output [15:0] io_pixelVal_out_1,
  output [15:0] io_pixelVal_out_2,
  output [15:0] io_pixelVal_out_3,
  output [15:0] io_pixelVal_out_4,
  output [15:0] io_pixelVal_out_5,
  output [15:0] io_pixelVal_out_6,
  output [15:0] io_pixelVal_out_7,
  output [15:0] io_pixelVal_out_8,
  output [15:0] io_pixelVal_out_9,
  output [15:0] io_pixelVal_out_10,
  output [15:0] io_pixelVal_out_11,
  output [15:0] io_pixelVal_out_12,
  output [15:0] io_pixelVal_out_13,
  output [15:0] io_pixelVal_out_14,
  output [15:0] io_pixelVal_out_15,
  output [15:0] io_pixelVal_out_16,
  output [15:0] io_pixelVal_out_17,
  output        io_valid_out
);
  wire  DotProd_clock; // @[KernelConvolution.scala 21:58]
  wire  DotProd_reset; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_io_dataInA; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_io_dataInB; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_io_dataOut; // @[KernelConvolution.scala 21:58]
  wire  DotProd_io_outputValid; // @[KernelConvolution.scala 21:58]
  wire  DotProd_1_clock; // @[KernelConvolution.scala 21:58]
  wire  DotProd_1_reset; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_1_io_dataInA; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_1_io_dataInB; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_1_io_dataOut; // @[KernelConvolution.scala 21:58]
  wire  DotProd_1_io_outputValid; // @[KernelConvolution.scala 21:58]
  wire  DotProd_2_clock; // @[KernelConvolution.scala 21:58]
  wire  DotProd_2_reset; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_2_io_dataInA; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_2_io_dataInB; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_2_io_dataOut; // @[KernelConvolution.scala 21:58]
  wire  DotProd_2_io_outputValid; // @[KernelConvolution.scala 21:58]
  wire  DotProd_3_clock; // @[KernelConvolution.scala 21:58]
  wire  DotProd_3_reset; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_3_io_dataInA; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_3_io_dataInB; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_3_io_dataOut; // @[KernelConvolution.scala 21:58]
  wire  DotProd_3_io_outputValid; // @[KernelConvolution.scala 21:58]
  wire  DotProd_4_clock; // @[KernelConvolution.scala 21:58]
  wire  DotProd_4_reset; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_4_io_dataInA; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_4_io_dataInB; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_4_io_dataOut; // @[KernelConvolution.scala 21:58]
  wire  DotProd_4_io_outputValid; // @[KernelConvolution.scala 21:58]
  wire  DotProd_5_clock; // @[KernelConvolution.scala 21:58]
  wire  DotProd_5_reset; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_5_io_dataInA; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_5_io_dataInB; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_5_io_dataOut; // @[KernelConvolution.scala 21:58]
  wire  DotProd_5_io_outputValid; // @[KernelConvolution.scala 21:58]
  wire  DotProd_6_clock; // @[KernelConvolution.scala 21:58]
  wire  DotProd_6_reset; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_6_io_dataInA; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_6_io_dataInB; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_6_io_dataOut; // @[KernelConvolution.scala 21:58]
  wire  DotProd_6_io_outputValid; // @[KernelConvolution.scala 21:58]
  wire  DotProd_7_clock; // @[KernelConvolution.scala 21:58]
  wire  DotProd_7_reset; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_7_io_dataInA; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_7_io_dataInB; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_7_io_dataOut; // @[KernelConvolution.scala 21:58]
  wire  DotProd_7_io_outputValid; // @[KernelConvolution.scala 21:58]
  wire  DotProd_8_clock; // @[KernelConvolution.scala 21:58]
  wire  DotProd_8_reset; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_8_io_dataInA; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_8_io_dataInB; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_8_io_dataOut; // @[KernelConvolution.scala 21:58]
  wire  DotProd_8_io_outputValid; // @[KernelConvolution.scala 21:58]
  wire  DotProd_9_clock; // @[KernelConvolution.scala 21:58]
  wire  DotProd_9_reset; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_9_io_dataInA; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_9_io_dataInB; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_9_io_dataOut; // @[KernelConvolution.scala 21:58]
  wire  DotProd_9_io_outputValid; // @[KernelConvolution.scala 21:58]
  wire  DotProd_10_clock; // @[KernelConvolution.scala 21:58]
  wire  DotProd_10_reset; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_10_io_dataInA; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_10_io_dataInB; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_10_io_dataOut; // @[KernelConvolution.scala 21:58]
  wire  DotProd_10_io_outputValid; // @[KernelConvolution.scala 21:58]
  wire  DotProd_11_clock; // @[KernelConvolution.scala 21:58]
  wire  DotProd_11_reset; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_11_io_dataInA; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_11_io_dataInB; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_11_io_dataOut; // @[KernelConvolution.scala 21:58]
  wire  DotProd_11_io_outputValid; // @[KernelConvolution.scala 21:58]
  wire  DotProd_12_clock; // @[KernelConvolution.scala 21:58]
  wire  DotProd_12_reset; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_12_io_dataInA; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_12_io_dataInB; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_12_io_dataOut; // @[KernelConvolution.scala 21:58]
  wire  DotProd_12_io_outputValid; // @[KernelConvolution.scala 21:58]
  wire  DotProd_13_clock; // @[KernelConvolution.scala 21:58]
  wire  DotProd_13_reset; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_13_io_dataInA; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_13_io_dataInB; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_13_io_dataOut; // @[KernelConvolution.scala 21:58]
  wire  DotProd_13_io_outputValid; // @[KernelConvolution.scala 21:58]
  wire  DotProd_14_clock; // @[KernelConvolution.scala 21:58]
  wire  DotProd_14_reset; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_14_io_dataInA; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_14_io_dataInB; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_14_io_dataOut; // @[KernelConvolution.scala 21:58]
  wire  DotProd_14_io_outputValid; // @[KernelConvolution.scala 21:58]
  wire  DotProd_15_clock; // @[KernelConvolution.scala 21:58]
  wire  DotProd_15_reset; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_15_io_dataInA; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_15_io_dataInB; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_15_io_dataOut; // @[KernelConvolution.scala 21:58]
  wire  DotProd_15_io_outputValid; // @[KernelConvolution.scala 21:58]
  wire  DotProd_16_clock; // @[KernelConvolution.scala 21:58]
  wire  DotProd_16_reset; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_16_io_dataInA; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_16_io_dataInB; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_16_io_dataOut; // @[KernelConvolution.scala 21:58]
  wire  DotProd_16_io_outputValid; // @[KernelConvolution.scala 21:58]
  wire  DotProd_17_clock; // @[KernelConvolution.scala 21:58]
  wire  DotProd_17_reset; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_17_io_dataInA; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_17_io_dataInB; // @[KernelConvolution.scala 21:58]
  wire [15:0] DotProd_17_io_dataOut; // @[KernelConvolution.scala 21:58]
  wire  DotProd_17_io_outputValid; // @[KernelConvolution.scala 21:58]
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
  DotProd DotProd_8 ( // @[KernelConvolution.scala 21:58]
    .clock(DotProd_8_clock),
    .reset(DotProd_8_reset),
    .io_dataInA(DotProd_8_io_dataInA),
    .io_dataInB(DotProd_8_io_dataInB),
    .io_dataOut(DotProd_8_io_dataOut),
    .io_outputValid(DotProd_8_io_outputValid)
  );
  DotProd DotProd_9 ( // @[KernelConvolution.scala 21:58]
    .clock(DotProd_9_clock),
    .reset(DotProd_9_reset),
    .io_dataInA(DotProd_9_io_dataInA),
    .io_dataInB(DotProd_9_io_dataInB),
    .io_dataOut(DotProd_9_io_dataOut),
    .io_outputValid(DotProd_9_io_outputValid)
  );
  DotProd DotProd_10 ( // @[KernelConvolution.scala 21:58]
    .clock(DotProd_10_clock),
    .reset(DotProd_10_reset),
    .io_dataInA(DotProd_10_io_dataInA),
    .io_dataInB(DotProd_10_io_dataInB),
    .io_dataOut(DotProd_10_io_dataOut),
    .io_outputValid(DotProd_10_io_outputValid)
  );
  DotProd DotProd_11 ( // @[KernelConvolution.scala 21:58]
    .clock(DotProd_11_clock),
    .reset(DotProd_11_reset),
    .io_dataInA(DotProd_11_io_dataInA),
    .io_dataInB(DotProd_11_io_dataInB),
    .io_dataOut(DotProd_11_io_dataOut),
    .io_outputValid(DotProd_11_io_outputValid)
  );
  DotProd DotProd_12 ( // @[KernelConvolution.scala 21:58]
    .clock(DotProd_12_clock),
    .reset(DotProd_12_reset),
    .io_dataInA(DotProd_12_io_dataInA),
    .io_dataInB(DotProd_12_io_dataInB),
    .io_dataOut(DotProd_12_io_dataOut),
    .io_outputValid(DotProd_12_io_outputValid)
  );
  DotProd DotProd_13 ( // @[KernelConvolution.scala 21:58]
    .clock(DotProd_13_clock),
    .reset(DotProd_13_reset),
    .io_dataInA(DotProd_13_io_dataInA),
    .io_dataInB(DotProd_13_io_dataInB),
    .io_dataOut(DotProd_13_io_dataOut),
    .io_outputValid(DotProd_13_io_outputValid)
  );
  DotProd DotProd_14 ( // @[KernelConvolution.scala 21:58]
    .clock(DotProd_14_clock),
    .reset(DotProd_14_reset),
    .io_dataInA(DotProd_14_io_dataInA),
    .io_dataInB(DotProd_14_io_dataInB),
    .io_dataOut(DotProd_14_io_dataOut),
    .io_outputValid(DotProd_14_io_outputValid)
  );
  DotProd DotProd_15 ( // @[KernelConvolution.scala 21:58]
    .clock(DotProd_15_clock),
    .reset(DotProd_15_reset),
    .io_dataInA(DotProd_15_io_dataInA),
    .io_dataInB(DotProd_15_io_dataInB),
    .io_dataOut(DotProd_15_io_dataOut),
    .io_outputValid(DotProd_15_io_outputValid)
  );
  DotProd DotProd_16 ( // @[KernelConvolution.scala 21:58]
    .clock(DotProd_16_clock),
    .reset(DotProd_16_reset),
    .io_dataInA(DotProd_16_io_dataInA),
    .io_dataInB(DotProd_16_io_dataInB),
    .io_dataOut(DotProd_16_io_dataOut),
    .io_outputValid(DotProd_16_io_outputValid)
  );
  DotProd DotProd_17 ( // @[KernelConvolution.scala 21:58]
    .clock(DotProd_17_clock),
    .reset(DotProd_17_reset),
    .io_dataInA(DotProd_17_io_dataInA),
    .io_dataInB(DotProd_17_io_dataInB),
    .io_dataOut(DotProd_17_io_dataOut),
    .io_outputValid(DotProd_17_io_outputValid)
  );
  assign io_pixelVal_out_0 = DotProd_io_dataOut; // @[KernelConvolution.scala 25:33 KernelConvolution.scala 33:34]
  assign io_pixelVal_out_1 = DotProd_1_io_dataOut; // @[KernelConvolution.scala 25:33 KernelConvolution.scala 33:34]
  assign io_pixelVal_out_2 = DotProd_2_io_dataOut; // @[KernelConvolution.scala 25:33 KernelConvolution.scala 33:34]
  assign io_pixelVal_out_3 = DotProd_3_io_dataOut; // @[KernelConvolution.scala 25:33 KernelConvolution.scala 33:34]
  assign io_pixelVal_out_4 = DotProd_4_io_dataOut; // @[KernelConvolution.scala 25:33 KernelConvolution.scala 33:34]
  assign io_pixelVal_out_5 = DotProd_5_io_dataOut; // @[KernelConvolution.scala 25:33 KernelConvolution.scala 33:34]
  assign io_pixelVal_out_6 = DotProd_6_io_dataOut; // @[KernelConvolution.scala 25:33 KernelConvolution.scala 33:34]
  assign io_pixelVal_out_7 = DotProd_7_io_dataOut; // @[KernelConvolution.scala 25:33 KernelConvolution.scala 33:34]
  assign io_pixelVal_out_8 = DotProd_8_io_dataOut; // @[KernelConvolution.scala 25:33 KernelConvolution.scala 33:34]
  assign io_pixelVal_out_9 = DotProd_9_io_dataOut; // @[KernelConvolution.scala 25:33 KernelConvolution.scala 33:34]
  assign io_pixelVal_out_10 = DotProd_10_io_dataOut; // @[KernelConvolution.scala 25:33 KernelConvolution.scala 33:34]
  assign io_pixelVal_out_11 = DotProd_11_io_dataOut; // @[KernelConvolution.scala 25:33 KernelConvolution.scala 33:34]
  assign io_pixelVal_out_12 = DotProd_12_io_dataOut; // @[KernelConvolution.scala 25:33 KernelConvolution.scala 33:34]
  assign io_pixelVal_out_13 = DotProd_13_io_dataOut; // @[KernelConvolution.scala 25:33 KernelConvolution.scala 33:34]
  assign io_pixelVal_out_14 = DotProd_14_io_dataOut; // @[KernelConvolution.scala 25:33 KernelConvolution.scala 33:34]
  assign io_pixelVal_out_15 = DotProd_15_io_dataOut; // @[KernelConvolution.scala 25:33 KernelConvolution.scala 33:34]
  assign io_pixelVal_out_16 = DotProd_16_io_dataOut; // @[KernelConvolution.scala 25:33 KernelConvolution.scala 33:34]
  assign io_pixelVal_out_17 = DotProd_17_io_dataOut; // @[KernelConvolution.scala 25:33 KernelConvolution.scala 33:34]
  assign io_valid_out = DotProd_io_outputValid; // @[KernelConvolution.scala 35:30]
  assign DotProd_clock = clock;
  assign DotProd_reset = reset;
  assign DotProd_io_dataInA = io_pixelVal_in_0; // @[KernelConvolution.scala 21:32]
  assign DotProd_io_dataInB = io_kernelVal_in; // @[KernelConvolution.scala 21:32]
  assign DotProd_1_clock = clock;
  assign DotProd_1_reset = reset;
  assign DotProd_1_io_dataInA = io_pixelVal_in_1; // @[KernelConvolution.scala 21:32]
  assign DotProd_1_io_dataInB = io_kernelVal_in; // @[KernelConvolution.scala 21:32]
  assign DotProd_2_clock = clock;
  assign DotProd_2_reset = reset;
  assign DotProd_2_io_dataInA = io_pixelVal_in_2; // @[KernelConvolution.scala 21:32]
  assign DotProd_2_io_dataInB = io_kernelVal_in; // @[KernelConvolution.scala 21:32]
  assign DotProd_3_clock = clock;
  assign DotProd_3_reset = reset;
  assign DotProd_3_io_dataInA = io_pixelVal_in_3; // @[KernelConvolution.scala 21:32]
  assign DotProd_3_io_dataInB = io_kernelVal_in; // @[KernelConvolution.scala 21:32]
  assign DotProd_4_clock = clock;
  assign DotProd_4_reset = reset;
  assign DotProd_4_io_dataInA = io_pixelVal_in_4; // @[KernelConvolution.scala 21:32]
  assign DotProd_4_io_dataInB = io_kernelVal_in; // @[KernelConvolution.scala 21:32]
  assign DotProd_5_clock = clock;
  assign DotProd_5_reset = reset;
  assign DotProd_5_io_dataInA = io_pixelVal_in_5; // @[KernelConvolution.scala 21:32]
  assign DotProd_5_io_dataInB = io_kernelVal_in; // @[KernelConvolution.scala 21:32]
  assign DotProd_6_clock = clock;
  assign DotProd_6_reset = reset;
  assign DotProd_6_io_dataInA = io_pixelVal_in_6; // @[KernelConvolution.scala 21:32]
  assign DotProd_6_io_dataInB = io_kernelVal_in; // @[KernelConvolution.scala 21:32]
  assign DotProd_7_clock = clock;
  assign DotProd_7_reset = reset;
  assign DotProd_7_io_dataInA = io_pixelVal_in_7; // @[KernelConvolution.scala 21:32]
  assign DotProd_7_io_dataInB = io_kernelVal_in; // @[KernelConvolution.scala 21:32]
  assign DotProd_8_clock = clock;
  assign DotProd_8_reset = reset;
  assign DotProd_8_io_dataInA = io_pixelVal_in_8; // @[KernelConvolution.scala 21:32]
  assign DotProd_8_io_dataInB = io_kernelVal_in; // @[KernelConvolution.scala 21:32]
  assign DotProd_9_clock = clock;
  assign DotProd_9_reset = reset;
  assign DotProd_9_io_dataInA = io_pixelVal_in_9; // @[KernelConvolution.scala 21:32]
  assign DotProd_9_io_dataInB = io_kernelVal_in; // @[KernelConvolution.scala 21:32]
  assign DotProd_10_clock = clock;
  assign DotProd_10_reset = reset;
  assign DotProd_10_io_dataInA = io_pixelVal_in_10; // @[KernelConvolution.scala 21:32]
  assign DotProd_10_io_dataInB = io_kernelVal_in; // @[KernelConvolution.scala 21:32]
  assign DotProd_11_clock = clock;
  assign DotProd_11_reset = reset;
  assign DotProd_11_io_dataInA = io_pixelVal_in_11; // @[KernelConvolution.scala 21:32]
  assign DotProd_11_io_dataInB = io_kernelVal_in; // @[KernelConvolution.scala 21:32]
  assign DotProd_12_clock = clock;
  assign DotProd_12_reset = reset;
  assign DotProd_12_io_dataInA = io_pixelVal_in_12; // @[KernelConvolution.scala 21:32]
  assign DotProd_12_io_dataInB = io_kernelVal_in; // @[KernelConvolution.scala 21:32]
  assign DotProd_13_clock = clock;
  assign DotProd_13_reset = reset;
  assign DotProd_13_io_dataInA = io_pixelVal_in_13; // @[KernelConvolution.scala 21:32]
  assign DotProd_13_io_dataInB = io_kernelVal_in; // @[KernelConvolution.scala 21:32]
  assign DotProd_14_clock = clock;
  assign DotProd_14_reset = reset;
  assign DotProd_14_io_dataInA = io_pixelVal_in_14; // @[KernelConvolution.scala 21:32]
  assign DotProd_14_io_dataInB = io_kernelVal_in; // @[KernelConvolution.scala 21:32]
  assign DotProd_15_clock = clock;
  assign DotProd_15_reset = reset;
  assign DotProd_15_io_dataInA = io_pixelVal_in_15; // @[KernelConvolution.scala 21:32]
  assign DotProd_15_io_dataInB = io_kernelVal_in; // @[KernelConvolution.scala 21:32]
  assign DotProd_16_clock = clock;
  assign DotProd_16_reset = reset;
  assign DotProd_16_io_dataInA = io_pixelVal_in_16; // @[KernelConvolution.scala 21:32]
  assign DotProd_16_io_dataInB = io_kernelVal_in; // @[KernelConvolution.scala 21:32]
  assign DotProd_17_clock = clock;
  assign DotProd_17_reset = reset;
  assign DotProd_17_io_dataInA = io_pixelVal_in_17; // @[KernelConvolution.scala 21:32]
  assign DotProd_17_io_dataInB = io_kernelVal_in; // @[KernelConvolution.scala 21:32]
endmodule
module Filter(
  input         clock,
  input         reset,
  input  [5:0]  io_SPI_filterIndex,
  input         io_SPI_invert,
  input         io_SPI_distort,
  output [15:0] io_pixelVal_out_0,
  output [15:0] io_pixelVal_out_1,
  output [15:0] io_pixelVal_out_2,
  output [15:0] io_pixelVal_out_3,
  output [15:0] io_pixelVal_out_4,
  output [15:0] io_pixelVal_out_5,
  output [15:0] io_pixelVal_out_6,
  output [15:0] io_pixelVal_out_7,
  output [15:0] io_pixelVal_out_8,
  output [15:0] io_pixelVal_out_9,
  output [15:0] io_pixelVal_out_10,
  output [15:0] io_pixelVal_out_11,
  output [15:0] io_pixelVal_out_12,
  output [15:0] io_pixelVal_out_13,
  output [15:0] io_pixelVal_out_14,
  output [15:0] io_pixelVal_out_15,
  output [15:0] io_pixelVal_out_16,
  output [15:0] io_pixelVal_out_17,
  output        io_valid_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  KernelConvolution_clock; // @[Filter.scala 52:35]
  wire  KernelConvolution_reset; // @[Filter.scala 52:35]
  wire [15:0] KernelConvolution_io_kernelVal_in; // @[Filter.scala 52:35]
  wire [15:0] KernelConvolution_io_pixelVal_in_0; // @[Filter.scala 52:35]
  wire [15:0] KernelConvolution_io_pixelVal_in_1; // @[Filter.scala 52:35]
  wire [15:0] KernelConvolution_io_pixelVal_in_2; // @[Filter.scala 52:35]
  wire [15:0] KernelConvolution_io_pixelVal_in_3; // @[Filter.scala 52:35]
  wire [15:0] KernelConvolution_io_pixelVal_in_4; // @[Filter.scala 52:35]
  wire [15:0] KernelConvolution_io_pixelVal_in_5; // @[Filter.scala 52:35]
  wire [15:0] KernelConvolution_io_pixelVal_in_6; // @[Filter.scala 52:35]
  wire [15:0] KernelConvolution_io_pixelVal_in_7; // @[Filter.scala 52:35]
  wire [15:0] KernelConvolution_io_pixelVal_in_8; // @[Filter.scala 52:35]
  wire [15:0] KernelConvolution_io_pixelVal_in_9; // @[Filter.scala 52:35]
  wire [15:0] KernelConvolution_io_pixelVal_in_10; // @[Filter.scala 52:35]
  wire [15:0] KernelConvolution_io_pixelVal_in_11; // @[Filter.scala 52:35]
  wire [15:0] KernelConvolution_io_pixelVal_in_12; // @[Filter.scala 52:35]
  wire [15:0] KernelConvolution_io_pixelVal_in_13; // @[Filter.scala 52:35]
  wire [15:0] KernelConvolution_io_pixelVal_in_14; // @[Filter.scala 52:35]
  wire [15:0] KernelConvolution_io_pixelVal_in_15; // @[Filter.scala 52:35]
  wire [15:0] KernelConvolution_io_pixelVal_in_16; // @[Filter.scala 52:35]
  wire [15:0] KernelConvolution_io_pixelVal_in_17; // @[Filter.scala 52:35]
  wire [15:0] KernelConvolution_io_pixelVal_out_0; // @[Filter.scala 52:35]
  wire [15:0] KernelConvolution_io_pixelVal_out_1; // @[Filter.scala 52:35]
  wire [15:0] KernelConvolution_io_pixelVal_out_2; // @[Filter.scala 52:35]
  wire [15:0] KernelConvolution_io_pixelVal_out_3; // @[Filter.scala 52:35]
  wire [15:0] KernelConvolution_io_pixelVal_out_4; // @[Filter.scala 52:35]
  wire [15:0] KernelConvolution_io_pixelVal_out_5; // @[Filter.scala 52:35]
  wire [15:0] KernelConvolution_io_pixelVal_out_6; // @[Filter.scala 52:35]
  wire [15:0] KernelConvolution_io_pixelVal_out_7; // @[Filter.scala 52:35]
  wire [15:0] KernelConvolution_io_pixelVal_out_8; // @[Filter.scala 52:35]
  wire [15:0] KernelConvolution_io_pixelVal_out_9; // @[Filter.scala 52:35]
  wire [15:0] KernelConvolution_io_pixelVal_out_10; // @[Filter.scala 52:35]
  wire [15:0] KernelConvolution_io_pixelVal_out_11; // @[Filter.scala 52:35]
  wire [15:0] KernelConvolution_io_pixelVal_out_12; // @[Filter.scala 52:35]
  wire [15:0] KernelConvolution_io_pixelVal_out_13; // @[Filter.scala 52:35]
  wire [15:0] KernelConvolution_io_pixelVal_out_14; // @[Filter.scala 52:35]
  wire [15:0] KernelConvolution_io_pixelVal_out_15; // @[Filter.scala 52:35]
  wire [15:0] KernelConvolution_io_pixelVal_out_16; // @[Filter.scala 52:35]
  wire [15:0] KernelConvolution_io_pixelVal_out_17; // @[Filter.scala 52:35]
  wire  KernelConvolution_io_valid_out; // @[Filter.scala 52:35]
  reg [3:0] kernelCounter; // @[Counter.scala 29:33]
  wire  kernelCountReset = kernelCounter == 4'h8; // @[Counter.scala 38:24]
  wire [3:0] _T_6 = kernelCounter + 4'h1; // @[Counter.scala 39:22]
  wire  _GEN_784 = ~io_SPI_filterIndex[0]; // @[Filter.scala 55:36]
  wire  _GEN_785 = 4'h4 == kernelCounter; // @[Filter.scala 55:36]
  wire [15:0] _GEN_7 = _GEN_784 & _GEN_785 ? 16'h1 : 16'h0; // @[Filter.scala 55:36]
  wire  _GEN_787 = 4'h5 == kernelCounter; // @[Filter.scala 55:36]
  wire [15:0] _GEN_8 = _GEN_784 & _GEN_787 ? 16'h0 : _GEN_7; // @[Filter.scala 55:36]
  wire  _GEN_789 = 4'h6 == kernelCounter; // @[Filter.scala 55:36]
  wire [15:0] _GEN_9 = _GEN_784 & _GEN_789 ? 16'h0 : _GEN_8; // @[Filter.scala 55:36]
  wire  _GEN_791 = 4'h7 == kernelCounter; // @[Filter.scala 55:36]
  wire [15:0] _GEN_10 = _GEN_784 & _GEN_791 ? 16'h0 : _GEN_9; // @[Filter.scala 55:36]
  wire  _GEN_793 = 4'h8 == kernelCounter; // @[Filter.scala 55:36]
  wire [15:0] _GEN_11 = _GEN_784 & _GEN_793 ? 16'h0 : _GEN_10; // @[Filter.scala 55:36]
  wire  _GEN_794 = 4'h0 == kernelCounter; // @[Filter.scala 55:36]
  wire [15:0] _GEN_12 = io_SPI_filterIndex[0] & _GEN_794 ? 16'h1 : _GEN_11; // @[Filter.scala 55:36]
  wire  _GEN_795 = 4'h1 == kernelCounter; // @[Filter.scala 55:36]
  wire [15:0] _GEN_13 = io_SPI_filterIndex[0] & _GEN_795 ? 16'h1 : _GEN_12; // @[Filter.scala 55:36]
  wire  _GEN_796 = 4'h2 == kernelCounter; // @[Filter.scala 55:36]
  wire [15:0] _GEN_14 = io_SPI_filterIndex[0] & _GEN_796 ? 16'h1 : _GEN_13; // @[Filter.scala 55:36]
  wire  _GEN_797 = 4'h3 == kernelCounter; // @[Filter.scala 55:36]
  wire [15:0] _GEN_15 = io_SPI_filterIndex[0] & _GEN_797 ? 16'h1 : _GEN_14; // @[Filter.scala 55:36]
  wire [15:0] _GEN_16 = io_SPI_filterIndex[0] & _GEN_785 ? 16'h1 : _GEN_15; // @[Filter.scala 55:36]
  wire [15:0] _GEN_17 = io_SPI_filterIndex[0] & _GEN_787 ? 16'h1 : _GEN_16; // @[Filter.scala 55:36]
  wire [15:0] _GEN_18 = io_SPI_filterIndex[0] & _GEN_789 ? 16'h1 : _GEN_17; // @[Filter.scala 55:36]
  wire [15:0] _GEN_19 = io_SPI_filterIndex[0] & _GEN_791 ? 16'h1 : _GEN_18; // @[Filter.scala 55:36]
  reg [1:0] imageCounterX; // @[Counter.scala 29:33]
  wire  imageCounterXReset = imageCounterX == 2'h2; // @[Counter.scala 38:24]
  wire [1:0] _T_10 = imageCounterX + 2'h1; // @[Counter.scala 39:22]
  reg [1:0] imageCounterY; // @[Counter.scala 29:33]
  wire  _T_11 = imageCounterY == 2'h2; // @[Counter.scala 38:24]
  wire [1:0] _T_13 = imageCounterY + 2'h1; // @[Counter.scala 39:22]
  reg [31:0] pixelIndex; // @[Filter.scala 59:29]
  wire [32:0] _T_14 = {{1'd0}, pixelIndex}; // @[Filter.scala 62:29]
  wire [31:0] _T_16 = _T_14[31:0] / 32'h6; // @[Filter.scala 62:36]
  wire [31:0] _GEN_803 = {{30'd0}, imageCounterX}; // @[Filter.scala 62:51]
  wire [31:0] _T_18 = _T_16 + _GEN_803; // @[Filter.scala 62:51]
  wire [31:0] _T_20 = _T_18 - 32'h1; // @[Filter.scala 62:67]
  wire [31:0] _GEN_0 = _T_14[31:0] % 32'h6; // @[Filter.scala 63:36]
  wire [2:0] _T_23 = _GEN_0[2:0]; // @[Filter.scala 63:36]
  wire [2:0] _GEN_804 = {{1'd0}, imageCounterY}; // @[Filter.scala 63:51]
  wire [2:0] _T_25 = _T_23 + _GEN_804; // @[Filter.scala 63:51]
  wire [2:0] _T_27 = _T_25 - 3'h1; // @[Filter.scala 63:67]
  wire  _T_29 = _T_20 >= 32'h6; // @[Filter.scala 64:27]
  wire  _T_33 = _T_27 >= 3'h6; // @[Filter.scala 64:59]
  wire  _T_34 = _T_29 | _T_33; // @[Filter.scala 64:54]
  wire [5:0] _T_35 = _T_27 * 3'h6; // @[Filter.scala 67:57]
  wire [31:0] _GEN_805 = {{26'd0}, _T_35}; // @[Filter.scala 67:72]
  wire [31:0] _T_37 = _GEN_805 + _T_20; // @[Filter.scala 67:72]
  wire [15:0] _GEN_28 = 6'h1 == _T_37[5:0] ? 16'h64 : 16'hc8; // @[Filter.scala 67:46]
  wire [15:0] _GEN_29 = 6'h2 == _T_37[5:0] ? 16'h32 : _GEN_28; // @[Filter.scala 67:46]
  wire [15:0] _GEN_30 = 6'h3 == _T_37[5:0] ? 16'hc8 : _GEN_29; // @[Filter.scala 67:46]
  wire [15:0] _GEN_31 = 6'h4 == _T_37[5:0] ? 16'h64 : _GEN_30; // @[Filter.scala 67:46]
  wire [15:0] _GEN_32 = 6'h5 == _T_37[5:0] ? 16'h32 : _GEN_31; // @[Filter.scala 67:46]
  wire [15:0] _GEN_33 = 6'h6 == _T_37[5:0] ? 16'h64 : _GEN_32; // @[Filter.scala 67:46]
  wire [15:0] _GEN_34 = 6'h7 == _T_37[5:0] ? 16'h32 : _GEN_33; // @[Filter.scala 67:46]
  wire [15:0] _GEN_35 = 6'h8 == _T_37[5:0] ? 16'hc8 : _GEN_34; // @[Filter.scala 67:46]
  wire [15:0] _GEN_36 = 6'h9 == _T_37[5:0] ? 16'h64 : _GEN_35; // @[Filter.scala 67:46]
  wire [15:0] _GEN_37 = 6'ha == _T_37[5:0] ? 16'h32 : _GEN_36; // @[Filter.scala 67:46]
  wire [15:0] _GEN_38 = 6'hb == _T_37[5:0] ? 16'hc8 : _GEN_37; // @[Filter.scala 67:46]
  wire [15:0] _GEN_39 = 6'hc == _T_37[5:0] ? 16'h32 : _GEN_38; // @[Filter.scala 67:46]
  wire [15:0] _GEN_40 = 6'hd == _T_37[5:0] ? 16'hc8 : _GEN_39; // @[Filter.scala 67:46]
  wire [15:0] _GEN_41 = 6'he == _T_37[5:0] ? 16'h64 : _GEN_40; // @[Filter.scala 67:46]
  wire [15:0] _GEN_42 = 6'hf == _T_37[5:0] ? 16'h32 : _GEN_41; // @[Filter.scala 67:46]
  wire [15:0] _GEN_43 = 6'h10 == _T_37[5:0] ? 16'hc8 : _GEN_42; // @[Filter.scala 67:46]
  wire [15:0] _GEN_44 = 6'h11 == _T_37[5:0] ? 16'h64 : _GEN_43; // @[Filter.scala 67:46]
  wire [15:0] _GEN_45 = 6'h12 == _T_37[5:0] ? 16'hc8 : _GEN_44; // @[Filter.scala 67:46]
  wire [15:0] _GEN_46 = 6'h13 == _T_37[5:0] ? 16'h64 : _GEN_45; // @[Filter.scala 67:46]
  wire [15:0] _GEN_47 = 6'h14 == _T_37[5:0] ? 16'h32 : _GEN_46; // @[Filter.scala 67:46]
  wire [15:0] _GEN_48 = 6'h15 == _T_37[5:0] ? 16'hc8 : _GEN_47; // @[Filter.scala 67:46]
  wire [15:0] _GEN_49 = 6'h16 == _T_37[5:0] ? 16'h64 : _GEN_48; // @[Filter.scala 67:46]
  wire [15:0] _GEN_50 = 6'h17 == _T_37[5:0] ? 16'h32 : _GEN_49; // @[Filter.scala 67:46]
  wire [15:0] _GEN_51 = 6'h18 == _T_37[5:0] ? 16'h64 : _GEN_50; // @[Filter.scala 67:46]
  wire [15:0] _GEN_52 = 6'h19 == _T_37[5:0] ? 16'h32 : _GEN_51; // @[Filter.scala 67:46]
  wire [15:0] _GEN_53 = 6'h1a == _T_37[5:0] ? 16'hc8 : _GEN_52; // @[Filter.scala 67:46]
  wire [15:0] _GEN_54 = 6'h1b == _T_37[5:0] ? 16'h64 : _GEN_53; // @[Filter.scala 67:46]
  wire [15:0] _GEN_55 = 6'h1c == _T_37[5:0] ? 16'h32 : _GEN_54; // @[Filter.scala 67:46]
  wire [15:0] _GEN_56 = 6'h1d == _T_37[5:0] ? 16'hc8 : _GEN_55; // @[Filter.scala 67:46]
  wire [15:0] _GEN_57 = 6'h1e == _T_37[5:0] ? 16'h32 : _GEN_56; // @[Filter.scala 67:46]
  wire [15:0] _GEN_58 = 6'h1f == _T_37[5:0] ? 16'hc8 : _GEN_57; // @[Filter.scala 67:46]
  wire [15:0] _GEN_59 = 6'h20 == _T_37[5:0] ? 16'h64 : _GEN_58; // @[Filter.scala 67:46]
  wire [15:0] _GEN_60 = 6'h21 == _T_37[5:0] ? 16'h32 : _GEN_59; // @[Filter.scala 67:46]
  wire [15:0] _GEN_61 = 6'h22 == _T_37[5:0] ? 16'hc8 : _GEN_60; // @[Filter.scala 67:46]
  wire [15:0] _GEN_62 = 6'h23 == _T_37[5:0] ? 16'h64 : _GEN_61; // @[Filter.scala 67:46]
  wire [31:0] _T_40 = pixelIndex + 32'h1; // @[Filter.scala 62:29]
  wire [31:0] _T_41 = _T_40 / 32'h6; // @[Filter.scala 62:36]
  wire [31:0] _T_43 = _T_41 + _GEN_803; // @[Filter.scala 62:51]
  wire [31:0] _T_45 = _T_43 - 32'h1; // @[Filter.scala 62:67]
  wire [31:0] _GEN_1 = _T_40 % 32'h6; // @[Filter.scala 63:36]
  wire [2:0] _T_48 = _GEN_1[2:0]; // @[Filter.scala 63:36]
  wire [2:0] _T_50 = _T_48 + _GEN_804; // @[Filter.scala 63:51]
  wire [2:0] _T_52 = _T_50 - 3'h1; // @[Filter.scala 63:67]
  wire  _T_54 = _T_45 >= 32'h6; // @[Filter.scala 64:27]
  wire  _T_58 = _T_52 >= 3'h6; // @[Filter.scala 64:59]
  wire  _T_59 = _T_54 | _T_58; // @[Filter.scala 64:54]
  wire [5:0] _T_60 = _T_52 * 3'h6; // @[Filter.scala 67:57]
  wire [31:0] _GEN_808 = {{26'd0}, _T_60}; // @[Filter.scala 67:72]
  wire [31:0] _T_62 = _GEN_808 + _T_45; // @[Filter.scala 67:72]
  wire [15:0] _GEN_65 = 6'h1 == _T_62[5:0] ? 16'h64 : 16'hc8; // @[Filter.scala 67:46]
  wire [15:0] _GEN_66 = 6'h2 == _T_62[5:0] ? 16'h32 : _GEN_65; // @[Filter.scala 67:46]
  wire [15:0] _GEN_67 = 6'h3 == _T_62[5:0] ? 16'hc8 : _GEN_66; // @[Filter.scala 67:46]
  wire [15:0] _GEN_68 = 6'h4 == _T_62[5:0] ? 16'h64 : _GEN_67; // @[Filter.scala 67:46]
  wire [15:0] _GEN_69 = 6'h5 == _T_62[5:0] ? 16'h32 : _GEN_68; // @[Filter.scala 67:46]
  wire [15:0] _GEN_70 = 6'h6 == _T_62[5:0] ? 16'h64 : _GEN_69; // @[Filter.scala 67:46]
  wire [15:0] _GEN_71 = 6'h7 == _T_62[5:0] ? 16'h32 : _GEN_70; // @[Filter.scala 67:46]
  wire [15:0] _GEN_72 = 6'h8 == _T_62[5:0] ? 16'hc8 : _GEN_71; // @[Filter.scala 67:46]
  wire [15:0] _GEN_73 = 6'h9 == _T_62[5:0] ? 16'h64 : _GEN_72; // @[Filter.scala 67:46]
  wire [15:0] _GEN_74 = 6'ha == _T_62[5:0] ? 16'h32 : _GEN_73; // @[Filter.scala 67:46]
  wire [15:0] _GEN_75 = 6'hb == _T_62[5:0] ? 16'hc8 : _GEN_74; // @[Filter.scala 67:46]
  wire [15:0] _GEN_76 = 6'hc == _T_62[5:0] ? 16'h32 : _GEN_75; // @[Filter.scala 67:46]
  wire [15:0] _GEN_77 = 6'hd == _T_62[5:0] ? 16'hc8 : _GEN_76; // @[Filter.scala 67:46]
  wire [15:0] _GEN_78 = 6'he == _T_62[5:0] ? 16'h64 : _GEN_77; // @[Filter.scala 67:46]
  wire [15:0] _GEN_79 = 6'hf == _T_62[5:0] ? 16'h32 : _GEN_78; // @[Filter.scala 67:46]
  wire [15:0] _GEN_80 = 6'h10 == _T_62[5:0] ? 16'hc8 : _GEN_79; // @[Filter.scala 67:46]
  wire [15:0] _GEN_81 = 6'h11 == _T_62[5:0] ? 16'h64 : _GEN_80; // @[Filter.scala 67:46]
  wire [15:0] _GEN_82 = 6'h12 == _T_62[5:0] ? 16'hc8 : _GEN_81; // @[Filter.scala 67:46]
  wire [15:0] _GEN_83 = 6'h13 == _T_62[5:0] ? 16'h64 : _GEN_82; // @[Filter.scala 67:46]
  wire [15:0] _GEN_84 = 6'h14 == _T_62[5:0] ? 16'h32 : _GEN_83; // @[Filter.scala 67:46]
  wire [15:0] _GEN_85 = 6'h15 == _T_62[5:0] ? 16'hc8 : _GEN_84; // @[Filter.scala 67:46]
  wire [15:0] _GEN_86 = 6'h16 == _T_62[5:0] ? 16'h64 : _GEN_85; // @[Filter.scala 67:46]
  wire [15:0] _GEN_87 = 6'h17 == _T_62[5:0] ? 16'h32 : _GEN_86; // @[Filter.scala 67:46]
  wire [15:0] _GEN_88 = 6'h18 == _T_62[5:0] ? 16'h64 : _GEN_87; // @[Filter.scala 67:46]
  wire [15:0] _GEN_89 = 6'h19 == _T_62[5:0] ? 16'h32 : _GEN_88; // @[Filter.scala 67:46]
  wire [15:0] _GEN_90 = 6'h1a == _T_62[5:0] ? 16'hc8 : _GEN_89; // @[Filter.scala 67:46]
  wire [15:0] _GEN_91 = 6'h1b == _T_62[5:0] ? 16'h64 : _GEN_90; // @[Filter.scala 67:46]
  wire [15:0] _GEN_92 = 6'h1c == _T_62[5:0] ? 16'h32 : _GEN_91; // @[Filter.scala 67:46]
  wire [15:0] _GEN_93 = 6'h1d == _T_62[5:0] ? 16'hc8 : _GEN_92; // @[Filter.scala 67:46]
  wire [15:0] _GEN_94 = 6'h1e == _T_62[5:0] ? 16'h32 : _GEN_93; // @[Filter.scala 67:46]
  wire [15:0] _GEN_95 = 6'h1f == _T_62[5:0] ? 16'hc8 : _GEN_94; // @[Filter.scala 67:46]
  wire [15:0] _GEN_96 = 6'h20 == _T_62[5:0] ? 16'h64 : _GEN_95; // @[Filter.scala 67:46]
  wire [15:0] _GEN_97 = 6'h21 == _T_62[5:0] ? 16'h32 : _GEN_96; // @[Filter.scala 67:46]
  wire [15:0] _GEN_98 = 6'h22 == _T_62[5:0] ? 16'hc8 : _GEN_97; // @[Filter.scala 67:46]
  wire [15:0] _GEN_99 = 6'h23 == _T_62[5:0] ? 16'h64 : _GEN_98; // @[Filter.scala 67:46]
  wire [31:0] _T_65 = pixelIndex + 32'h2; // @[Filter.scala 62:29]
  wire [31:0] _T_66 = _T_65 / 32'h6; // @[Filter.scala 62:36]
  wire [31:0] _T_68 = _T_66 + _GEN_803; // @[Filter.scala 62:51]
  wire [31:0] _T_70 = _T_68 - 32'h1; // @[Filter.scala 62:67]
  wire [31:0] _GEN_2 = _T_65 % 32'h6; // @[Filter.scala 63:36]
  wire [2:0] _T_73 = _GEN_2[2:0]; // @[Filter.scala 63:36]
  wire [2:0] _T_75 = _T_73 + _GEN_804; // @[Filter.scala 63:51]
  wire [2:0] _T_77 = _T_75 - 3'h1; // @[Filter.scala 63:67]
  wire  _T_79 = _T_70 >= 32'h6; // @[Filter.scala 64:27]
  wire  _T_83 = _T_77 >= 3'h6; // @[Filter.scala 64:59]
  wire  _T_84 = _T_79 | _T_83; // @[Filter.scala 64:54]
  wire [5:0] _T_85 = _T_77 * 3'h6; // @[Filter.scala 67:57]
  wire [31:0] _GEN_811 = {{26'd0}, _T_85}; // @[Filter.scala 67:72]
  wire [31:0] _T_87 = _GEN_811 + _T_70; // @[Filter.scala 67:72]
  wire [15:0] _GEN_102 = 6'h1 == _T_87[5:0] ? 16'h64 : 16'hc8; // @[Filter.scala 67:46]
  wire [15:0] _GEN_103 = 6'h2 == _T_87[5:0] ? 16'h32 : _GEN_102; // @[Filter.scala 67:46]
  wire [15:0] _GEN_104 = 6'h3 == _T_87[5:0] ? 16'hc8 : _GEN_103; // @[Filter.scala 67:46]
  wire [15:0] _GEN_105 = 6'h4 == _T_87[5:0] ? 16'h64 : _GEN_104; // @[Filter.scala 67:46]
  wire [15:0] _GEN_106 = 6'h5 == _T_87[5:0] ? 16'h32 : _GEN_105; // @[Filter.scala 67:46]
  wire [15:0] _GEN_107 = 6'h6 == _T_87[5:0] ? 16'h64 : _GEN_106; // @[Filter.scala 67:46]
  wire [15:0] _GEN_108 = 6'h7 == _T_87[5:0] ? 16'h32 : _GEN_107; // @[Filter.scala 67:46]
  wire [15:0] _GEN_109 = 6'h8 == _T_87[5:0] ? 16'hc8 : _GEN_108; // @[Filter.scala 67:46]
  wire [15:0] _GEN_110 = 6'h9 == _T_87[5:0] ? 16'h64 : _GEN_109; // @[Filter.scala 67:46]
  wire [15:0] _GEN_111 = 6'ha == _T_87[5:0] ? 16'h32 : _GEN_110; // @[Filter.scala 67:46]
  wire [15:0] _GEN_112 = 6'hb == _T_87[5:0] ? 16'hc8 : _GEN_111; // @[Filter.scala 67:46]
  wire [15:0] _GEN_113 = 6'hc == _T_87[5:0] ? 16'h32 : _GEN_112; // @[Filter.scala 67:46]
  wire [15:0] _GEN_114 = 6'hd == _T_87[5:0] ? 16'hc8 : _GEN_113; // @[Filter.scala 67:46]
  wire [15:0] _GEN_115 = 6'he == _T_87[5:0] ? 16'h64 : _GEN_114; // @[Filter.scala 67:46]
  wire [15:0] _GEN_116 = 6'hf == _T_87[5:0] ? 16'h32 : _GEN_115; // @[Filter.scala 67:46]
  wire [15:0] _GEN_117 = 6'h10 == _T_87[5:0] ? 16'hc8 : _GEN_116; // @[Filter.scala 67:46]
  wire [15:0] _GEN_118 = 6'h11 == _T_87[5:0] ? 16'h64 : _GEN_117; // @[Filter.scala 67:46]
  wire [15:0] _GEN_119 = 6'h12 == _T_87[5:0] ? 16'hc8 : _GEN_118; // @[Filter.scala 67:46]
  wire [15:0] _GEN_120 = 6'h13 == _T_87[5:0] ? 16'h64 : _GEN_119; // @[Filter.scala 67:46]
  wire [15:0] _GEN_121 = 6'h14 == _T_87[5:0] ? 16'h32 : _GEN_120; // @[Filter.scala 67:46]
  wire [15:0] _GEN_122 = 6'h15 == _T_87[5:0] ? 16'hc8 : _GEN_121; // @[Filter.scala 67:46]
  wire [15:0] _GEN_123 = 6'h16 == _T_87[5:0] ? 16'h64 : _GEN_122; // @[Filter.scala 67:46]
  wire [15:0] _GEN_124 = 6'h17 == _T_87[5:0] ? 16'h32 : _GEN_123; // @[Filter.scala 67:46]
  wire [15:0] _GEN_125 = 6'h18 == _T_87[5:0] ? 16'h64 : _GEN_124; // @[Filter.scala 67:46]
  wire [15:0] _GEN_126 = 6'h19 == _T_87[5:0] ? 16'h32 : _GEN_125; // @[Filter.scala 67:46]
  wire [15:0] _GEN_127 = 6'h1a == _T_87[5:0] ? 16'hc8 : _GEN_126; // @[Filter.scala 67:46]
  wire [15:0] _GEN_128 = 6'h1b == _T_87[5:0] ? 16'h64 : _GEN_127; // @[Filter.scala 67:46]
  wire [15:0] _GEN_129 = 6'h1c == _T_87[5:0] ? 16'h32 : _GEN_128; // @[Filter.scala 67:46]
  wire [15:0] _GEN_130 = 6'h1d == _T_87[5:0] ? 16'hc8 : _GEN_129; // @[Filter.scala 67:46]
  wire [15:0] _GEN_131 = 6'h1e == _T_87[5:0] ? 16'h32 : _GEN_130; // @[Filter.scala 67:46]
  wire [15:0] _GEN_132 = 6'h1f == _T_87[5:0] ? 16'hc8 : _GEN_131; // @[Filter.scala 67:46]
  wire [15:0] _GEN_133 = 6'h20 == _T_87[5:0] ? 16'h64 : _GEN_132; // @[Filter.scala 67:46]
  wire [15:0] _GEN_134 = 6'h21 == _T_87[5:0] ? 16'h32 : _GEN_133; // @[Filter.scala 67:46]
  wire [15:0] _GEN_135 = 6'h22 == _T_87[5:0] ? 16'hc8 : _GEN_134; // @[Filter.scala 67:46]
  wire [15:0] _GEN_136 = 6'h23 == _T_87[5:0] ? 16'h64 : _GEN_135; // @[Filter.scala 67:46]
  wire [31:0] _T_90 = pixelIndex + 32'h3; // @[Filter.scala 62:29]
  wire [31:0] _T_91 = _T_90 / 32'h6; // @[Filter.scala 62:36]
  wire [31:0] _T_93 = _T_91 + _GEN_803; // @[Filter.scala 62:51]
  wire [31:0] _T_95 = _T_93 - 32'h1; // @[Filter.scala 62:67]
  wire [31:0] _GEN_3 = _T_90 % 32'h6; // @[Filter.scala 63:36]
  wire [2:0] _T_98 = _GEN_3[2:0]; // @[Filter.scala 63:36]
  wire [2:0] _T_100 = _T_98 + _GEN_804; // @[Filter.scala 63:51]
  wire [2:0] _T_102 = _T_100 - 3'h1; // @[Filter.scala 63:67]
  wire  _T_104 = _T_95 >= 32'h6; // @[Filter.scala 64:27]
  wire  _T_108 = _T_102 >= 3'h6; // @[Filter.scala 64:59]
  wire  _T_109 = _T_104 | _T_108; // @[Filter.scala 64:54]
  wire [5:0] _T_110 = _T_102 * 3'h6; // @[Filter.scala 67:57]
  wire [31:0] _GEN_814 = {{26'd0}, _T_110}; // @[Filter.scala 67:72]
  wire [31:0] _T_112 = _GEN_814 + _T_95; // @[Filter.scala 67:72]
  wire [15:0] _GEN_139 = 6'h1 == _T_112[5:0] ? 16'h64 : 16'hc8; // @[Filter.scala 67:46]
  wire [15:0] _GEN_140 = 6'h2 == _T_112[5:0] ? 16'h32 : _GEN_139; // @[Filter.scala 67:46]
  wire [15:0] _GEN_141 = 6'h3 == _T_112[5:0] ? 16'hc8 : _GEN_140; // @[Filter.scala 67:46]
  wire [15:0] _GEN_142 = 6'h4 == _T_112[5:0] ? 16'h64 : _GEN_141; // @[Filter.scala 67:46]
  wire [15:0] _GEN_143 = 6'h5 == _T_112[5:0] ? 16'h32 : _GEN_142; // @[Filter.scala 67:46]
  wire [15:0] _GEN_144 = 6'h6 == _T_112[5:0] ? 16'h64 : _GEN_143; // @[Filter.scala 67:46]
  wire [15:0] _GEN_145 = 6'h7 == _T_112[5:0] ? 16'h32 : _GEN_144; // @[Filter.scala 67:46]
  wire [15:0] _GEN_146 = 6'h8 == _T_112[5:0] ? 16'hc8 : _GEN_145; // @[Filter.scala 67:46]
  wire [15:0] _GEN_147 = 6'h9 == _T_112[5:0] ? 16'h64 : _GEN_146; // @[Filter.scala 67:46]
  wire [15:0] _GEN_148 = 6'ha == _T_112[5:0] ? 16'h32 : _GEN_147; // @[Filter.scala 67:46]
  wire [15:0] _GEN_149 = 6'hb == _T_112[5:0] ? 16'hc8 : _GEN_148; // @[Filter.scala 67:46]
  wire [15:0] _GEN_150 = 6'hc == _T_112[5:0] ? 16'h32 : _GEN_149; // @[Filter.scala 67:46]
  wire [15:0] _GEN_151 = 6'hd == _T_112[5:0] ? 16'hc8 : _GEN_150; // @[Filter.scala 67:46]
  wire [15:0] _GEN_152 = 6'he == _T_112[5:0] ? 16'h64 : _GEN_151; // @[Filter.scala 67:46]
  wire [15:0] _GEN_153 = 6'hf == _T_112[5:0] ? 16'h32 : _GEN_152; // @[Filter.scala 67:46]
  wire [15:0] _GEN_154 = 6'h10 == _T_112[5:0] ? 16'hc8 : _GEN_153; // @[Filter.scala 67:46]
  wire [15:0] _GEN_155 = 6'h11 == _T_112[5:0] ? 16'h64 : _GEN_154; // @[Filter.scala 67:46]
  wire [15:0] _GEN_156 = 6'h12 == _T_112[5:0] ? 16'hc8 : _GEN_155; // @[Filter.scala 67:46]
  wire [15:0] _GEN_157 = 6'h13 == _T_112[5:0] ? 16'h64 : _GEN_156; // @[Filter.scala 67:46]
  wire [15:0] _GEN_158 = 6'h14 == _T_112[5:0] ? 16'h32 : _GEN_157; // @[Filter.scala 67:46]
  wire [15:0] _GEN_159 = 6'h15 == _T_112[5:0] ? 16'hc8 : _GEN_158; // @[Filter.scala 67:46]
  wire [15:0] _GEN_160 = 6'h16 == _T_112[5:0] ? 16'h64 : _GEN_159; // @[Filter.scala 67:46]
  wire [15:0] _GEN_161 = 6'h17 == _T_112[5:0] ? 16'h32 : _GEN_160; // @[Filter.scala 67:46]
  wire [15:0] _GEN_162 = 6'h18 == _T_112[5:0] ? 16'h64 : _GEN_161; // @[Filter.scala 67:46]
  wire [15:0] _GEN_163 = 6'h19 == _T_112[5:0] ? 16'h32 : _GEN_162; // @[Filter.scala 67:46]
  wire [15:0] _GEN_164 = 6'h1a == _T_112[5:0] ? 16'hc8 : _GEN_163; // @[Filter.scala 67:46]
  wire [15:0] _GEN_165 = 6'h1b == _T_112[5:0] ? 16'h64 : _GEN_164; // @[Filter.scala 67:46]
  wire [15:0] _GEN_166 = 6'h1c == _T_112[5:0] ? 16'h32 : _GEN_165; // @[Filter.scala 67:46]
  wire [15:0] _GEN_167 = 6'h1d == _T_112[5:0] ? 16'hc8 : _GEN_166; // @[Filter.scala 67:46]
  wire [15:0] _GEN_168 = 6'h1e == _T_112[5:0] ? 16'h32 : _GEN_167; // @[Filter.scala 67:46]
  wire [15:0] _GEN_169 = 6'h1f == _T_112[5:0] ? 16'hc8 : _GEN_168; // @[Filter.scala 67:46]
  wire [15:0] _GEN_170 = 6'h20 == _T_112[5:0] ? 16'h64 : _GEN_169; // @[Filter.scala 67:46]
  wire [15:0] _GEN_171 = 6'h21 == _T_112[5:0] ? 16'h32 : _GEN_170; // @[Filter.scala 67:46]
  wire [15:0] _GEN_172 = 6'h22 == _T_112[5:0] ? 16'hc8 : _GEN_171; // @[Filter.scala 67:46]
  wire [15:0] _GEN_173 = 6'h23 == _T_112[5:0] ? 16'h64 : _GEN_172; // @[Filter.scala 67:46]
  wire [31:0] _T_115 = pixelIndex + 32'h4; // @[Filter.scala 62:29]
  wire [31:0] _T_116 = _T_115 / 32'h6; // @[Filter.scala 62:36]
  wire [31:0] _T_118 = _T_116 + _GEN_803; // @[Filter.scala 62:51]
  wire [31:0] _T_120 = _T_118 - 32'h1; // @[Filter.scala 62:67]
  wire [31:0] _GEN_4 = _T_115 % 32'h6; // @[Filter.scala 63:36]
  wire [2:0] _T_123 = _GEN_4[2:0]; // @[Filter.scala 63:36]
  wire [2:0] _T_125 = _T_123 + _GEN_804; // @[Filter.scala 63:51]
  wire [2:0] _T_127 = _T_125 - 3'h1; // @[Filter.scala 63:67]
  wire  _T_129 = _T_120 >= 32'h6; // @[Filter.scala 64:27]
  wire  _T_133 = _T_127 >= 3'h6; // @[Filter.scala 64:59]
  wire  _T_134 = _T_129 | _T_133; // @[Filter.scala 64:54]
  wire [5:0] _T_135 = _T_127 * 3'h6; // @[Filter.scala 67:57]
  wire [31:0] _GEN_817 = {{26'd0}, _T_135}; // @[Filter.scala 67:72]
  wire [31:0] _T_137 = _GEN_817 + _T_120; // @[Filter.scala 67:72]
  wire [15:0] _GEN_176 = 6'h1 == _T_137[5:0] ? 16'h64 : 16'hc8; // @[Filter.scala 67:46]
  wire [15:0] _GEN_177 = 6'h2 == _T_137[5:0] ? 16'h32 : _GEN_176; // @[Filter.scala 67:46]
  wire [15:0] _GEN_178 = 6'h3 == _T_137[5:0] ? 16'hc8 : _GEN_177; // @[Filter.scala 67:46]
  wire [15:0] _GEN_179 = 6'h4 == _T_137[5:0] ? 16'h64 : _GEN_178; // @[Filter.scala 67:46]
  wire [15:0] _GEN_180 = 6'h5 == _T_137[5:0] ? 16'h32 : _GEN_179; // @[Filter.scala 67:46]
  wire [15:0] _GEN_181 = 6'h6 == _T_137[5:0] ? 16'h64 : _GEN_180; // @[Filter.scala 67:46]
  wire [15:0] _GEN_182 = 6'h7 == _T_137[5:0] ? 16'h32 : _GEN_181; // @[Filter.scala 67:46]
  wire [15:0] _GEN_183 = 6'h8 == _T_137[5:0] ? 16'hc8 : _GEN_182; // @[Filter.scala 67:46]
  wire [15:0] _GEN_184 = 6'h9 == _T_137[5:0] ? 16'h64 : _GEN_183; // @[Filter.scala 67:46]
  wire [15:0] _GEN_185 = 6'ha == _T_137[5:0] ? 16'h32 : _GEN_184; // @[Filter.scala 67:46]
  wire [15:0] _GEN_186 = 6'hb == _T_137[5:0] ? 16'hc8 : _GEN_185; // @[Filter.scala 67:46]
  wire [15:0] _GEN_187 = 6'hc == _T_137[5:0] ? 16'h32 : _GEN_186; // @[Filter.scala 67:46]
  wire [15:0] _GEN_188 = 6'hd == _T_137[5:0] ? 16'hc8 : _GEN_187; // @[Filter.scala 67:46]
  wire [15:0] _GEN_189 = 6'he == _T_137[5:0] ? 16'h64 : _GEN_188; // @[Filter.scala 67:46]
  wire [15:0] _GEN_190 = 6'hf == _T_137[5:0] ? 16'h32 : _GEN_189; // @[Filter.scala 67:46]
  wire [15:0] _GEN_191 = 6'h10 == _T_137[5:0] ? 16'hc8 : _GEN_190; // @[Filter.scala 67:46]
  wire [15:0] _GEN_192 = 6'h11 == _T_137[5:0] ? 16'h64 : _GEN_191; // @[Filter.scala 67:46]
  wire [15:0] _GEN_193 = 6'h12 == _T_137[5:0] ? 16'hc8 : _GEN_192; // @[Filter.scala 67:46]
  wire [15:0] _GEN_194 = 6'h13 == _T_137[5:0] ? 16'h64 : _GEN_193; // @[Filter.scala 67:46]
  wire [15:0] _GEN_195 = 6'h14 == _T_137[5:0] ? 16'h32 : _GEN_194; // @[Filter.scala 67:46]
  wire [15:0] _GEN_196 = 6'h15 == _T_137[5:0] ? 16'hc8 : _GEN_195; // @[Filter.scala 67:46]
  wire [15:0] _GEN_197 = 6'h16 == _T_137[5:0] ? 16'h64 : _GEN_196; // @[Filter.scala 67:46]
  wire [15:0] _GEN_198 = 6'h17 == _T_137[5:0] ? 16'h32 : _GEN_197; // @[Filter.scala 67:46]
  wire [15:0] _GEN_199 = 6'h18 == _T_137[5:0] ? 16'h64 : _GEN_198; // @[Filter.scala 67:46]
  wire [15:0] _GEN_200 = 6'h19 == _T_137[5:0] ? 16'h32 : _GEN_199; // @[Filter.scala 67:46]
  wire [15:0] _GEN_201 = 6'h1a == _T_137[5:0] ? 16'hc8 : _GEN_200; // @[Filter.scala 67:46]
  wire [15:0] _GEN_202 = 6'h1b == _T_137[5:0] ? 16'h64 : _GEN_201; // @[Filter.scala 67:46]
  wire [15:0] _GEN_203 = 6'h1c == _T_137[5:0] ? 16'h32 : _GEN_202; // @[Filter.scala 67:46]
  wire [15:0] _GEN_204 = 6'h1d == _T_137[5:0] ? 16'hc8 : _GEN_203; // @[Filter.scala 67:46]
  wire [15:0] _GEN_205 = 6'h1e == _T_137[5:0] ? 16'h32 : _GEN_204; // @[Filter.scala 67:46]
  wire [15:0] _GEN_206 = 6'h1f == _T_137[5:0] ? 16'hc8 : _GEN_205; // @[Filter.scala 67:46]
  wire [15:0] _GEN_207 = 6'h20 == _T_137[5:0] ? 16'h64 : _GEN_206; // @[Filter.scala 67:46]
  wire [15:0] _GEN_208 = 6'h21 == _T_137[5:0] ? 16'h32 : _GEN_207; // @[Filter.scala 67:46]
  wire [15:0] _GEN_209 = 6'h22 == _T_137[5:0] ? 16'hc8 : _GEN_208; // @[Filter.scala 67:46]
  wire [15:0] _GEN_210 = 6'h23 == _T_137[5:0] ? 16'h64 : _GEN_209; // @[Filter.scala 67:46]
  wire [31:0] _T_140 = pixelIndex + 32'h5; // @[Filter.scala 62:29]
  wire [31:0] _T_141 = _T_140 / 32'h6; // @[Filter.scala 62:36]
  wire [31:0] _T_143 = _T_141 + _GEN_803; // @[Filter.scala 62:51]
  wire [31:0] _T_145 = _T_143 - 32'h1; // @[Filter.scala 62:67]
  wire [31:0] _GEN_5 = _T_140 % 32'h6; // @[Filter.scala 63:36]
  wire [2:0] _T_148 = _GEN_5[2:0]; // @[Filter.scala 63:36]
  wire [2:0] _T_150 = _T_148 + _GEN_804; // @[Filter.scala 63:51]
  wire [2:0] _T_152 = _T_150 - 3'h1; // @[Filter.scala 63:67]
  wire  _T_154 = _T_145 >= 32'h6; // @[Filter.scala 64:27]
  wire  _T_158 = _T_152 >= 3'h6; // @[Filter.scala 64:59]
  wire  _T_159 = _T_154 | _T_158; // @[Filter.scala 64:54]
  wire [5:0] _T_160 = _T_152 * 3'h6; // @[Filter.scala 67:57]
  wire [31:0] _GEN_820 = {{26'd0}, _T_160}; // @[Filter.scala 67:72]
  wire [31:0] _T_162 = _GEN_820 + _T_145; // @[Filter.scala 67:72]
  wire [15:0] _GEN_213 = 6'h1 == _T_162[5:0] ? 16'h64 : 16'hc8; // @[Filter.scala 67:46]
  wire [15:0] _GEN_214 = 6'h2 == _T_162[5:0] ? 16'h32 : _GEN_213; // @[Filter.scala 67:46]
  wire [15:0] _GEN_215 = 6'h3 == _T_162[5:0] ? 16'hc8 : _GEN_214; // @[Filter.scala 67:46]
  wire [15:0] _GEN_216 = 6'h4 == _T_162[5:0] ? 16'h64 : _GEN_215; // @[Filter.scala 67:46]
  wire [15:0] _GEN_217 = 6'h5 == _T_162[5:0] ? 16'h32 : _GEN_216; // @[Filter.scala 67:46]
  wire [15:0] _GEN_218 = 6'h6 == _T_162[5:0] ? 16'h64 : _GEN_217; // @[Filter.scala 67:46]
  wire [15:0] _GEN_219 = 6'h7 == _T_162[5:0] ? 16'h32 : _GEN_218; // @[Filter.scala 67:46]
  wire [15:0] _GEN_220 = 6'h8 == _T_162[5:0] ? 16'hc8 : _GEN_219; // @[Filter.scala 67:46]
  wire [15:0] _GEN_221 = 6'h9 == _T_162[5:0] ? 16'h64 : _GEN_220; // @[Filter.scala 67:46]
  wire [15:0] _GEN_222 = 6'ha == _T_162[5:0] ? 16'h32 : _GEN_221; // @[Filter.scala 67:46]
  wire [15:0] _GEN_223 = 6'hb == _T_162[5:0] ? 16'hc8 : _GEN_222; // @[Filter.scala 67:46]
  wire [15:0] _GEN_224 = 6'hc == _T_162[5:0] ? 16'h32 : _GEN_223; // @[Filter.scala 67:46]
  wire [15:0] _GEN_225 = 6'hd == _T_162[5:0] ? 16'hc8 : _GEN_224; // @[Filter.scala 67:46]
  wire [15:0] _GEN_226 = 6'he == _T_162[5:0] ? 16'h64 : _GEN_225; // @[Filter.scala 67:46]
  wire [15:0] _GEN_227 = 6'hf == _T_162[5:0] ? 16'h32 : _GEN_226; // @[Filter.scala 67:46]
  wire [15:0] _GEN_228 = 6'h10 == _T_162[5:0] ? 16'hc8 : _GEN_227; // @[Filter.scala 67:46]
  wire [15:0] _GEN_229 = 6'h11 == _T_162[5:0] ? 16'h64 : _GEN_228; // @[Filter.scala 67:46]
  wire [15:0] _GEN_230 = 6'h12 == _T_162[5:0] ? 16'hc8 : _GEN_229; // @[Filter.scala 67:46]
  wire [15:0] _GEN_231 = 6'h13 == _T_162[5:0] ? 16'h64 : _GEN_230; // @[Filter.scala 67:46]
  wire [15:0] _GEN_232 = 6'h14 == _T_162[5:0] ? 16'h32 : _GEN_231; // @[Filter.scala 67:46]
  wire [15:0] _GEN_233 = 6'h15 == _T_162[5:0] ? 16'hc8 : _GEN_232; // @[Filter.scala 67:46]
  wire [15:0] _GEN_234 = 6'h16 == _T_162[5:0] ? 16'h64 : _GEN_233; // @[Filter.scala 67:46]
  wire [15:0] _GEN_235 = 6'h17 == _T_162[5:0] ? 16'h32 : _GEN_234; // @[Filter.scala 67:46]
  wire [15:0] _GEN_236 = 6'h18 == _T_162[5:0] ? 16'h64 : _GEN_235; // @[Filter.scala 67:46]
  wire [15:0] _GEN_237 = 6'h19 == _T_162[5:0] ? 16'h32 : _GEN_236; // @[Filter.scala 67:46]
  wire [15:0] _GEN_238 = 6'h1a == _T_162[5:0] ? 16'hc8 : _GEN_237; // @[Filter.scala 67:46]
  wire [15:0] _GEN_239 = 6'h1b == _T_162[5:0] ? 16'h64 : _GEN_238; // @[Filter.scala 67:46]
  wire [15:0] _GEN_240 = 6'h1c == _T_162[5:0] ? 16'h32 : _GEN_239; // @[Filter.scala 67:46]
  wire [15:0] _GEN_241 = 6'h1d == _T_162[5:0] ? 16'hc8 : _GEN_240; // @[Filter.scala 67:46]
  wire [15:0] _GEN_242 = 6'h1e == _T_162[5:0] ? 16'h32 : _GEN_241; // @[Filter.scala 67:46]
  wire [15:0] _GEN_243 = 6'h1f == _T_162[5:0] ? 16'hc8 : _GEN_242; // @[Filter.scala 67:46]
  wire [15:0] _GEN_244 = 6'h20 == _T_162[5:0] ? 16'h64 : _GEN_243; // @[Filter.scala 67:46]
  wire [15:0] _GEN_245 = 6'h21 == _T_162[5:0] ? 16'h32 : _GEN_244; // @[Filter.scala 67:46]
  wire [15:0] _GEN_246 = 6'h22 == _T_162[5:0] ? 16'hc8 : _GEN_245; // @[Filter.scala 67:46]
  wire [15:0] _GEN_247 = 6'h23 == _T_162[5:0] ? 16'h64 : _GEN_246; // @[Filter.scala 67:46]
  wire [31:0] _T_165 = pixelIndex + 32'h6; // @[Filter.scala 62:29]
  wire [31:0] _T_166 = _T_165 / 32'h6; // @[Filter.scala 62:36]
  wire [31:0] _T_168 = _T_166 + _GEN_803; // @[Filter.scala 62:51]
  wire [31:0] _T_170 = _T_168 - 32'h1; // @[Filter.scala 62:67]
  wire [31:0] _GEN_6 = _T_165 % 32'h6; // @[Filter.scala 63:36]
  wire [2:0] _T_173 = _GEN_6[2:0]; // @[Filter.scala 63:36]
  wire [2:0] _T_175 = _T_173 + _GEN_804; // @[Filter.scala 63:51]
  wire [2:0] _T_177 = _T_175 - 3'h1; // @[Filter.scala 63:67]
  wire  _T_179 = _T_170 >= 32'h6; // @[Filter.scala 64:27]
  wire  _T_183 = _T_177 >= 3'h6; // @[Filter.scala 64:59]
  wire  _T_184 = _T_179 | _T_183; // @[Filter.scala 64:54]
  wire [5:0] _T_185 = _T_177 * 3'h6; // @[Filter.scala 67:57]
  wire [31:0] _GEN_823 = {{26'd0}, _T_185}; // @[Filter.scala 67:72]
  wire [31:0] _T_187 = _GEN_823 + _T_170; // @[Filter.scala 67:72]
  wire [15:0] _GEN_250 = 6'h1 == _T_187[5:0] ? 16'h64 : 16'hc8; // @[Filter.scala 67:46]
  wire [15:0] _GEN_251 = 6'h2 == _T_187[5:0] ? 16'h32 : _GEN_250; // @[Filter.scala 67:46]
  wire [15:0] _GEN_252 = 6'h3 == _T_187[5:0] ? 16'hc8 : _GEN_251; // @[Filter.scala 67:46]
  wire [15:0] _GEN_253 = 6'h4 == _T_187[5:0] ? 16'h64 : _GEN_252; // @[Filter.scala 67:46]
  wire [15:0] _GEN_254 = 6'h5 == _T_187[5:0] ? 16'h32 : _GEN_253; // @[Filter.scala 67:46]
  wire [15:0] _GEN_255 = 6'h6 == _T_187[5:0] ? 16'h64 : _GEN_254; // @[Filter.scala 67:46]
  wire [15:0] _GEN_256 = 6'h7 == _T_187[5:0] ? 16'h32 : _GEN_255; // @[Filter.scala 67:46]
  wire [15:0] _GEN_257 = 6'h8 == _T_187[5:0] ? 16'hc8 : _GEN_256; // @[Filter.scala 67:46]
  wire [15:0] _GEN_258 = 6'h9 == _T_187[5:0] ? 16'h64 : _GEN_257; // @[Filter.scala 67:46]
  wire [15:0] _GEN_259 = 6'ha == _T_187[5:0] ? 16'h32 : _GEN_258; // @[Filter.scala 67:46]
  wire [15:0] _GEN_260 = 6'hb == _T_187[5:0] ? 16'hc8 : _GEN_259; // @[Filter.scala 67:46]
  wire [15:0] _GEN_261 = 6'hc == _T_187[5:0] ? 16'h32 : _GEN_260; // @[Filter.scala 67:46]
  wire [15:0] _GEN_262 = 6'hd == _T_187[5:0] ? 16'hc8 : _GEN_261; // @[Filter.scala 67:46]
  wire [15:0] _GEN_263 = 6'he == _T_187[5:0] ? 16'h64 : _GEN_262; // @[Filter.scala 67:46]
  wire [15:0] _GEN_264 = 6'hf == _T_187[5:0] ? 16'h32 : _GEN_263; // @[Filter.scala 67:46]
  wire [15:0] _GEN_265 = 6'h10 == _T_187[5:0] ? 16'hc8 : _GEN_264; // @[Filter.scala 67:46]
  wire [15:0] _GEN_266 = 6'h11 == _T_187[5:0] ? 16'h64 : _GEN_265; // @[Filter.scala 67:46]
  wire [15:0] _GEN_267 = 6'h12 == _T_187[5:0] ? 16'hc8 : _GEN_266; // @[Filter.scala 67:46]
  wire [15:0] _GEN_268 = 6'h13 == _T_187[5:0] ? 16'h64 : _GEN_267; // @[Filter.scala 67:46]
  wire [15:0] _GEN_269 = 6'h14 == _T_187[5:0] ? 16'h32 : _GEN_268; // @[Filter.scala 67:46]
  wire [15:0] _GEN_270 = 6'h15 == _T_187[5:0] ? 16'hc8 : _GEN_269; // @[Filter.scala 67:46]
  wire [15:0] _GEN_271 = 6'h16 == _T_187[5:0] ? 16'h64 : _GEN_270; // @[Filter.scala 67:46]
  wire [15:0] _GEN_272 = 6'h17 == _T_187[5:0] ? 16'h32 : _GEN_271; // @[Filter.scala 67:46]
  wire [15:0] _GEN_273 = 6'h18 == _T_187[5:0] ? 16'h64 : _GEN_272; // @[Filter.scala 67:46]
  wire [15:0] _GEN_274 = 6'h19 == _T_187[5:0] ? 16'h32 : _GEN_273; // @[Filter.scala 67:46]
  wire [15:0] _GEN_275 = 6'h1a == _T_187[5:0] ? 16'hc8 : _GEN_274; // @[Filter.scala 67:46]
  wire [15:0] _GEN_276 = 6'h1b == _T_187[5:0] ? 16'h64 : _GEN_275; // @[Filter.scala 67:46]
  wire [15:0] _GEN_277 = 6'h1c == _T_187[5:0] ? 16'h32 : _GEN_276; // @[Filter.scala 67:46]
  wire [15:0] _GEN_278 = 6'h1d == _T_187[5:0] ? 16'hc8 : _GEN_277; // @[Filter.scala 67:46]
  wire [15:0] _GEN_279 = 6'h1e == _T_187[5:0] ? 16'h32 : _GEN_278; // @[Filter.scala 67:46]
  wire [15:0] _GEN_280 = 6'h1f == _T_187[5:0] ? 16'hc8 : _GEN_279; // @[Filter.scala 67:46]
  wire [15:0] _GEN_281 = 6'h20 == _T_187[5:0] ? 16'h64 : _GEN_280; // @[Filter.scala 67:46]
  wire [15:0] _GEN_282 = 6'h21 == _T_187[5:0] ? 16'h32 : _GEN_281; // @[Filter.scala 67:46]
  wire [15:0] _GEN_283 = 6'h22 == _T_187[5:0] ? 16'hc8 : _GEN_282; // @[Filter.scala 67:46]
  wire [15:0] _GEN_284 = 6'h23 == _T_187[5:0] ? 16'h64 : _GEN_283; // @[Filter.scala 67:46]
  wire [31:0] _T_190 = pixelIndex + 32'h7; // @[Filter.scala 62:29]
  wire [31:0] _T_191 = _T_190 / 32'h6; // @[Filter.scala 62:36]
  wire [31:0] _T_193 = _T_191 + _GEN_803; // @[Filter.scala 62:51]
  wire [31:0] _T_195 = _T_193 - 32'h1; // @[Filter.scala 62:67]
  wire [31:0] _GEN_20 = _T_190 % 32'h6; // @[Filter.scala 63:36]
  wire [2:0] _T_198 = _GEN_20[2:0]; // @[Filter.scala 63:36]
  wire [2:0] _T_200 = _T_198 + _GEN_804; // @[Filter.scala 63:51]
  wire [2:0] _T_202 = _T_200 - 3'h1; // @[Filter.scala 63:67]
  wire  _T_204 = _T_195 >= 32'h6; // @[Filter.scala 64:27]
  wire  _T_208 = _T_202 >= 3'h6; // @[Filter.scala 64:59]
  wire  _T_209 = _T_204 | _T_208; // @[Filter.scala 64:54]
  wire [5:0] _T_210 = _T_202 * 3'h6; // @[Filter.scala 67:57]
  wire [31:0] _GEN_826 = {{26'd0}, _T_210}; // @[Filter.scala 67:72]
  wire [31:0] _T_212 = _GEN_826 + _T_195; // @[Filter.scala 67:72]
  wire [15:0] _GEN_287 = 6'h1 == _T_212[5:0] ? 16'h64 : 16'hc8; // @[Filter.scala 67:46]
  wire [15:0] _GEN_288 = 6'h2 == _T_212[5:0] ? 16'h32 : _GEN_287; // @[Filter.scala 67:46]
  wire [15:0] _GEN_289 = 6'h3 == _T_212[5:0] ? 16'hc8 : _GEN_288; // @[Filter.scala 67:46]
  wire [15:0] _GEN_290 = 6'h4 == _T_212[5:0] ? 16'h64 : _GEN_289; // @[Filter.scala 67:46]
  wire [15:0] _GEN_291 = 6'h5 == _T_212[5:0] ? 16'h32 : _GEN_290; // @[Filter.scala 67:46]
  wire [15:0] _GEN_292 = 6'h6 == _T_212[5:0] ? 16'h64 : _GEN_291; // @[Filter.scala 67:46]
  wire [15:0] _GEN_293 = 6'h7 == _T_212[5:0] ? 16'h32 : _GEN_292; // @[Filter.scala 67:46]
  wire [15:0] _GEN_294 = 6'h8 == _T_212[5:0] ? 16'hc8 : _GEN_293; // @[Filter.scala 67:46]
  wire [15:0] _GEN_295 = 6'h9 == _T_212[5:0] ? 16'h64 : _GEN_294; // @[Filter.scala 67:46]
  wire [15:0] _GEN_296 = 6'ha == _T_212[5:0] ? 16'h32 : _GEN_295; // @[Filter.scala 67:46]
  wire [15:0] _GEN_297 = 6'hb == _T_212[5:0] ? 16'hc8 : _GEN_296; // @[Filter.scala 67:46]
  wire [15:0] _GEN_298 = 6'hc == _T_212[5:0] ? 16'h32 : _GEN_297; // @[Filter.scala 67:46]
  wire [15:0] _GEN_299 = 6'hd == _T_212[5:0] ? 16'hc8 : _GEN_298; // @[Filter.scala 67:46]
  wire [15:0] _GEN_300 = 6'he == _T_212[5:0] ? 16'h64 : _GEN_299; // @[Filter.scala 67:46]
  wire [15:0] _GEN_301 = 6'hf == _T_212[5:0] ? 16'h32 : _GEN_300; // @[Filter.scala 67:46]
  wire [15:0] _GEN_302 = 6'h10 == _T_212[5:0] ? 16'hc8 : _GEN_301; // @[Filter.scala 67:46]
  wire [15:0] _GEN_303 = 6'h11 == _T_212[5:0] ? 16'h64 : _GEN_302; // @[Filter.scala 67:46]
  wire [15:0] _GEN_304 = 6'h12 == _T_212[5:0] ? 16'hc8 : _GEN_303; // @[Filter.scala 67:46]
  wire [15:0] _GEN_305 = 6'h13 == _T_212[5:0] ? 16'h64 : _GEN_304; // @[Filter.scala 67:46]
  wire [15:0] _GEN_306 = 6'h14 == _T_212[5:0] ? 16'h32 : _GEN_305; // @[Filter.scala 67:46]
  wire [15:0] _GEN_307 = 6'h15 == _T_212[5:0] ? 16'hc8 : _GEN_306; // @[Filter.scala 67:46]
  wire [15:0] _GEN_308 = 6'h16 == _T_212[5:0] ? 16'h64 : _GEN_307; // @[Filter.scala 67:46]
  wire [15:0] _GEN_309 = 6'h17 == _T_212[5:0] ? 16'h32 : _GEN_308; // @[Filter.scala 67:46]
  wire [15:0] _GEN_310 = 6'h18 == _T_212[5:0] ? 16'h64 : _GEN_309; // @[Filter.scala 67:46]
  wire [15:0] _GEN_311 = 6'h19 == _T_212[5:0] ? 16'h32 : _GEN_310; // @[Filter.scala 67:46]
  wire [15:0] _GEN_312 = 6'h1a == _T_212[5:0] ? 16'hc8 : _GEN_311; // @[Filter.scala 67:46]
  wire [15:0] _GEN_313 = 6'h1b == _T_212[5:0] ? 16'h64 : _GEN_312; // @[Filter.scala 67:46]
  wire [15:0] _GEN_314 = 6'h1c == _T_212[5:0] ? 16'h32 : _GEN_313; // @[Filter.scala 67:46]
  wire [15:0] _GEN_315 = 6'h1d == _T_212[5:0] ? 16'hc8 : _GEN_314; // @[Filter.scala 67:46]
  wire [15:0] _GEN_316 = 6'h1e == _T_212[5:0] ? 16'h32 : _GEN_315; // @[Filter.scala 67:46]
  wire [15:0] _GEN_317 = 6'h1f == _T_212[5:0] ? 16'hc8 : _GEN_316; // @[Filter.scala 67:46]
  wire [15:0] _GEN_318 = 6'h20 == _T_212[5:0] ? 16'h64 : _GEN_317; // @[Filter.scala 67:46]
  wire [15:0] _GEN_319 = 6'h21 == _T_212[5:0] ? 16'h32 : _GEN_318; // @[Filter.scala 67:46]
  wire [15:0] _GEN_320 = 6'h22 == _T_212[5:0] ? 16'hc8 : _GEN_319; // @[Filter.scala 67:46]
  wire [15:0] _GEN_321 = 6'h23 == _T_212[5:0] ? 16'h64 : _GEN_320; // @[Filter.scala 67:46]
  wire [31:0] _T_215 = pixelIndex + 32'h8; // @[Filter.scala 62:29]
  wire [31:0] _T_216 = _T_215 / 32'h6; // @[Filter.scala 62:36]
  wire [31:0] _T_218 = _T_216 + _GEN_803; // @[Filter.scala 62:51]
  wire [31:0] _T_220 = _T_218 - 32'h1; // @[Filter.scala 62:67]
  wire [31:0] _GEN_21 = _T_215 % 32'h6; // @[Filter.scala 63:36]
  wire [2:0] _T_223 = _GEN_21[2:0]; // @[Filter.scala 63:36]
  wire [2:0] _T_225 = _T_223 + _GEN_804; // @[Filter.scala 63:51]
  wire [2:0] _T_227 = _T_225 - 3'h1; // @[Filter.scala 63:67]
  wire  _T_229 = _T_220 >= 32'h6; // @[Filter.scala 64:27]
  wire  _T_233 = _T_227 >= 3'h6; // @[Filter.scala 64:59]
  wire  _T_234 = _T_229 | _T_233; // @[Filter.scala 64:54]
  wire [5:0] _T_235 = _T_227 * 3'h6; // @[Filter.scala 67:57]
  wire [31:0] _GEN_829 = {{26'd0}, _T_235}; // @[Filter.scala 67:72]
  wire [31:0] _T_237 = _GEN_829 + _T_220; // @[Filter.scala 67:72]
  wire [15:0] _GEN_324 = 6'h1 == _T_237[5:0] ? 16'h64 : 16'hc8; // @[Filter.scala 67:46]
  wire [15:0] _GEN_325 = 6'h2 == _T_237[5:0] ? 16'h32 : _GEN_324; // @[Filter.scala 67:46]
  wire [15:0] _GEN_326 = 6'h3 == _T_237[5:0] ? 16'hc8 : _GEN_325; // @[Filter.scala 67:46]
  wire [15:0] _GEN_327 = 6'h4 == _T_237[5:0] ? 16'h64 : _GEN_326; // @[Filter.scala 67:46]
  wire [15:0] _GEN_328 = 6'h5 == _T_237[5:0] ? 16'h32 : _GEN_327; // @[Filter.scala 67:46]
  wire [15:0] _GEN_329 = 6'h6 == _T_237[5:0] ? 16'h64 : _GEN_328; // @[Filter.scala 67:46]
  wire [15:0] _GEN_330 = 6'h7 == _T_237[5:0] ? 16'h32 : _GEN_329; // @[Filter.scala 67:46]
  wire [15:0] _GEN_331 = 6'h8 == _T_237[5:0] ? 16'hc8 : _GEN_330; // @[Filter.scala 67:46]
  wire [15:0] _GEN_332 = 6'h9 == _T_237[5:0] ? 16'h64 : _GEN_331; // @[Filter.scala 67:46]
  wire [15:0] _GEN_333 = 6'ha == _T_237[5:0] ? 16'h32 : _GEN_332; // @[Filter.scala 67:46]
  wire [15:0] _GEN_334 = 6'hb == _T_237[5:0] ? 16'hc8 : _GEN_333; // @[Filter.scala 67:46]
  wire [15:0] _GEN_335 = 6'hc == _T_237[5:0] ? 16'h32 : _GEN_334; // @[Filter.scala 67:46]
  wire [15:0] _GEN_336 = 6'hd == _T_237[5:0] ? 16'hc8 : _GEN_335; // @[Filter.scala 67:46]
  wire [15:0] _GEN_337 = 6'he == _T_237[5:0] ? 16'h64 : _GEN_336; // @[Filter.scala 67:46]
  wire [15:0] _GEN_338 = 6'hf == _T_237[5:0] ? 16'h32 : _GEN_337; // @[Filter.scala 67:46]
  wire [15:0] _GEN_339 = 6'h10 == _T_237[5:0] ? 16'hc8 : _GEN_338; // @[Filter.scala 67:46]
  wire [15:0] _GEN_340 = 6'h11 == _T_237[5:0] ? 16'h64 : _GEN_339; // @[Filter.scala 67:46]
  wire [15:0] _GEN_341 = 6'h12 == _T_237[5:0] ? 16'hc8 : _GEN_340; // @[Filter.scala 67:46]
  wire [15:0] _GEN_342 = 6'h13 == _T_237[5:0] ? 16'h64 : _GEN_341; // @[Filter.scala 67:46]
  wire [15:0] _GEN_343 = 6'h14 == _T_237[5:0] ? 16'h32 : _GEN_342; // @[Filter.scala 67:46]
  wire [15:0] _GEN_344 = 6'h15 == _T_237[5:0] ? 16'hc8 : _GEN_343; // @[Filter.scala 67:46]
  wire [15:0] _GEN_345 = 6'h16 == _T_237[5:0] ? 16'h64 : _GEN_344; // @[Filter.scala 67:46]
  wire [15:0] _GEN_346 = 6'h17 == _T_237[5:0] ? 16'h32 : _GEN_345; // @[Filter.scala 67:46]
  wire [15:0] _GEN_347 = 6'h18 == _T_237[5:0] ? 16'h64 : _GEN_346; // @[Filter.scala 67:46]
  wire [15:0] _GEN_348 = 6'h19 == _T_237[5:0] ? 16'h32 : _GEN_347; // @[Filter.scala 67:46]
  wire [15:0] _GEN_349 = 6'h1a == _T_237[5:0] ? 16'hc8 : _GEN_348; // @[Filter.scala 67:46]
  wire [15:0] _GEN_350 = 6'h1b == _T_237[5:0] ? 16'h64 : _GEN_349; // @[Filter.scala 67:46]
  wire [15:0] _GEN_351 = 6'h1c == _T_237[5:0] ? 16'h32 : _GEN_350; // @[Filter.scala 67:46]
  wire [15:0] _GEN_352 = 6'h1d == _T_237[5:0] ? 16'hc8 : _GEN_351; // @[Filter.scala 67:46]
  wire [15:0] _GEN_353 = 6'h1e == _T_237[5:0] ? 16'h32 : _GEN_352; // @[Filter.scala 67:46]
  wire [15:0] _GEN_354 = 6'h1f == _T_237[5:0] ? 16'hc8 : _GEN_353; // @[Filter.scala 67:46]
  wire [15:0] _GEN_355 = 6'h20 == _T_237[5:0] ? 16'h64 : _GEN_354; // @[Filter.scala 67:46]
  wire [15:0] _GEN_356 = 6'h21 == _T_237[5:0] ? 16'h32 : _GEN_355; // @[Filter.scala 67:46]
  wire [15:0] _GEN_357 = 6'h22 == _T_237[5:0] ? 16'hc8 : _GEN_356; // @[Filter.scala 67:46]
  wire [15:0] _GEN_358 = 6'h23 == _T_237[5:0] ? 16'h64 : _GEN_357; // @[Filter.scala 67:46]
  wire [31:0] _T_240 = pixelIndex + 32'h9; // @[Filter.scala 62:29]
  wire [31:0] _T_241 = _T_240 / 32'h6; // @[Filter.scala 62:36]
  wire [31:0] _T_243 = _T_241 + _GEN_803; // @[Filter.scala 62:51]
  wire [31:0] _T_245 = _T_243 - 32'h1; // @[Filter.scala 62:67]
  wire [31:0] _GEN_22 = _T_240 % 32'h6; // @[Filter.scala 63:36]
  wire [2:0] _T_248 = _GEN_22[2:0]; // @[Filter.scala 63:36]
  wire [2:0] _T_250 = _T_248 + _GEN_804; // @[Filter.scala 63:51]
  wire [2:0] _T_252 = _T_250 - 3'h1; // @[Filter.scala 63:67]
  wire  _T_254 = _T_245 >= 32'h6; // @[Filter.scala 64:27]
  wire  _T_258 = _T_252 >= 3'h6; // @[Filter.scala 64:59]
  wire  _T_259 = _T_254 | _T_258; // @[Filter.scala 64:54]
  wire [5:0] _T_260 = _T_252 * 3'h6; // @[Filter.scala 67:57]
  wire [31:0] _GEN_832 = {{26'd0}, _T_260}; // @[Filter.scala 67:72]
  wire [31:0] _T_262 = _GEN_832 + _T_245; // @[Filter.scala 67:72]
  wire [15:0] _GEN_361 = 6'h1 == _T_262[5:0] ? 16'h64 : 16'hc8; // @[Filter.scala 67:46]
  wire [15:0] _GEN_362 = 6'h2 == _T_262[5:0] ? 16'h32 : _GEN_361; // @[Filter.scala 67:46]
  wire [15:0] _GEN_363 = 6'h3 == _T_262[5:0] ? 16'hc8 : _GEN_362; // @[Filter.scala 67:46]
  wire [15:0] _GEN_364 = 6'h4 == _T_262[5:0] ? 16'h64 : _GEN_363; // @[Filter.scala 67:46]
  wire [15:0] _GEN_365 = 6'h5 == _T_262[5:0] ? 16'h32 : _GEN_364; // @[Filter.scala 67:46]
  wire [15:0] _GEN_366 = 6'h6 == _T_262[5:0] ? 16'h64 : _GEN_365; // @[Filter.scala 67:46]
  wire [15:0] _GEN_367 = 6'h7 == _T_262[5:0] ? 16'h32 : _GEN_366; // @[Filter.scala 67:46]
  wire [15:0] _GEN_368 = 6'h8 == _T_262[5:0] ? 16'hc8 : _GEN_367; // @[Filter.scala 67:46]
  wire [15:0] _GEN_369 = 6'h9 == _T_262[5:0] ? 16'h64 : _GEN_368; // @[Filter.scala 67:46]
  wire [15:0] _GEN_370 = 6'ha == _T_262[5:0] ? 16'h32 : _GEN_369; // @[Filter.scala 67:46]
  wire [15:0] _GEN_371 = 6'hb == _T_262[5:0] ? 16'hc8 : _GEN_370; // @[Filter.scala 67:46]
  wire [15:0] _GEN_372 = 6'hc == _T_262[5:0] ? 16'h32 : _GEN_371; // @[Filter.scala 67:46]
  wire [15:0] _GEN_373 = 6'hd == _T_262[5:0] ? 16'hc8 : _GEN_372; // @[Filter.scala 67:46]
  wire [15:0] _GEN_374 = 6'he == _T_262[5:0] ? 16'h64 : _GEN_373; // @[Filter.scala 67:46]
  wire [15:0] _GEN_375 = 6'hf == _T_262[5:0] ? 16'h32 : _GEN_374; // @[Filter.scala 67:46]
  wire [15:0] _GEN_376 = 6'h10 == _T_262[5:0] ? 16'hc8 : _GEN_375; // @[Filter.scala 67:46]
  wire [15:0] _GEN_377 = 6'h11 == _T_262[5:0] ? 16'h64 : _GEN_376; // @[Filter.scala 67:46]
  wire [15:0] _GEN_378 = 6'h12 == _T_262[5:0] ? 16'hc8 : _GEN_377; // @[Filter.scala 67:46]
  wire [15:0] _GEN_379 = 6'h13 == _T_262[5:0] ? 16'h64 : _GEN_378; // @[Filter.scala 67:46]
  wire [15:0] _GEN_380 = 6'h14 == _T_262[5:0] ? 16'h32 : _GEN_379; // @[Filter.scala 67:46]
  wire [15:0] _GEN_381 = 6'h15 == _T_262[5:0] ? 16'hc8 : _GEN_380; // @[Filter.scala 67:46]
  wire [15:0] _GEN_382 = 6'h16 == _T_262[5:0] ? 16'h64 : _GEN_381; // @[Filter.scala 67:46]
  wire [15:0] _GEN_383 = 6'h17 == _T_262[5:0] ? 16'h32 : _GEN_382; // @[Filter.scala 67:46]
  wire [15:0] _GEN_384 = 6'h18 == _T_262[5:0] ? 16'h64 : _GEN_383; // @[Filter.scala 67:46]
  wire [15:0] _GEN_385 = 6'h19 == _T_262[5:0] ? 16'h32 : _GEN_384; // @[Filter.scala 67:46]
  wire [15:0] _GEN_386 = 6'h1a == _T_262[5:0] ? 16'hc8 : _GEN_385; // @[Filter.scala 67:46]
  wire [15:0] _GEN_387 = 6'h1b == _T_262[5:0] ? 16'h64 : _GEN_386; // @[Filter.scala 67:46]
  wire [15:0] _GEN_388 = 6'h1c == _T_262[5:0] ? 16'h32 : _GEN_387; // @[Filter.scala 67:46]
  wire [15:0] _GEN_389 = 6'h1d == _T_262[5:0] ? 16'hc8 : _GEN_388; // @[Filter.scala 67:46]
  wire [15:0] _GEN_390 = 6'h1e == _T_262[5:0] ? 16'h32 : _GEN_389; // @[Filter.scala 67:46]
  wire [15:0] _GEN_391 = 6'h1f == _T_262[5:0] ? 16'hc8 : _GEN_390; // @[Filter.scala 67:46]
  wire [15:0] _GEN_392 = 6'h20 == _T_262[5:0] ? 16'h64 : _GEN_391; // @[Filter.scala 67:46]
  wire [15:0] _GEN_393 = 6'h21 == _T_262[5:0] ? 16'h32 : _GEN_392; // @[Filter.scala 67:46]
  wire [15:0] _GEN_394 = 6'h22 == _T_262[5:0] ? 16'hc8 : _GEN_393; // @[Filter.scala 67:46]
  wire [15:0] _GEN_395 = 6'h23 == _T_262[5:0] ? 16'h64 : _GEN_394; // @[Filter.scala 67:46]
  wire [31:0] _T_265 = pixelIndex + 32'ha; // @[Filter.scala 62:29]
  wire [31:0] _T_266 = _T_265 / 32'h6; // @[Filter.scala 62:36]
  wire [31:0] _T_268 = _T_266 + _GEN_803; // @[Filter.scala 62:51]
  wire [31:0] _T_270 = _T_268 - 32'h1; // @[Filter.scala 62:67]
  wire [31:0] _GEN_23 = _T_265 % 32'h6; // @[Filter.scala 63:36]
  wire [2:0] _T_273 = _GEN_23[2:0]; // @[Filter.scala 63:36]
  wire [2:0] _T_275 = _T_273 + _GEN_804; // @[Filter.scala 63:51]
  wire [2:0] _T_277 = _T_275 - 3'h1; // @[Filter.scala 63:67]
  wire  _T_279 = _T_270 >= 32'h6; // @[Filter.scala 64:27]
  wire  _T_283 = _T_277 >= 3'h6; // @[Filter.scala 64:59]
  wire  _T_284 = _T_279 | _T_283; // @[Filter.scala 64:54]
  wire [5:0] _T_285 = _T_277 * 3'h6; // @[Filter.scala 67:57]
  wire [31:0] _GEN_835 = {{26'd0}, _T_285}; // @[Filter.scala 67:72]
  wire [31:0] _T_287 = _GEN_835 + _T_270; // @[Filter.scala 67:72]
  wire [15:0] _GEN_398 = 6'h1 == _T_287[5:0] ? 16'h64 : 16'hc8; // @[Filter.scala 67:46]
  wire [15:0] _GEN_399 = 6'h2 == _T_287[5:0] ? 16'h32 : _GEN_398; // @[Filter.scala 67:46]
  wire [15:0] _GEN_400 = 6'h3 == _T_287[5:0] ? 16'hc8 : _GEN_399; // @[Filter.scala 67:46]
  wire [15:0] _GEN_401 = 6'h4 == _T_287[5:0] ? 16'h64 : _GEN_400; // @[Filter.scala 67:46]
  wire [15:0] _GEN_402 = 6'h5 == _T_287[5:0] ? 16'h32 : _GEN_401; // @[Filter.scala 67:46]
  wire [15:0] _GEN_403 = 6'h6 == _T_287[5:0] ? 16'h64 : _GEN_402; // @[Filter.scala 67:46]
  wire [15:0] _GEN_404 = 6'h7 == _T_287[5:0] ? 16'h32 : _GEN_403; // @[Filter.scala 67:46]
  wire [15:0] _GEN_405 = 6'h8 == _T_287[5:0] ? 16'hc8 : _GEN_404; // @[Filter.scala 67:46]
  wire [15:0] _GEN_406 = 6'h9 == _T_287[5:0] ? 16'h64 : _GEN_405; // @[Filter.scala 67:46]
  wire [15:0] _GEN_407 = 6'ha == _T_287[5:0] ? 16'h32 : _GEN_406; // @[Filter.scala 67:46]
  wire [15:0] _GEN_408 = 6'hb == _T_287[5:0] ? 16'hc8 : _GEN_407; // @[Filter.scala 67:46]
  wire [15:0] _GEN_409 = 6'hc == _T_287[5:0] ? 16'h32 : _GEN_408; // @[Filter.scala 67:46]
  wire [15:0] _GEN_410 = 6'hd == _T_287[5:0] ? 16'hc8 : _GEN_409; // @[Filter.scala 67:46]
  wire [15:0] _GEN_411 = 6'he == _T_287[5:0] ? 16'h64 : _GEN_410; // @[Filter.scala 67:46]
  wire [15:0] _GEN_412 = 6'hf == _T_287[5:0] ? 16'h32 : _GEN_411; // @[Filter.scala 67:46]
  wire [15:0] _GEN_413 = 6'h10 == _T_287[5:0] ? 16'hc8 : _GEN_412; // @[Filter.scala 67:46]
  wire [15:0] _GEN_414 = 6'h11 == _T_287[5:0] ? 16'h64 : _GEN_413; // @[Filter.scala 67:46]
  wire [15:0] _GEN_415 = 6'h12 == _T_287[5:0] ? 16'hc8 : _GEN_414; // @[Filter.scala 67:46]
  wire [15:0] _GEN_416 = 6'h13 == _T_287[5:0] ? 16'h64 : _GEN_415; // @[Filter.scala 67:46]
  wire [15:0] _GEN_417 = 6'h14 == _T_287[5:0] ? 16'h32 : _GEN_416; // @[Filter.scala 67:46]
  wire [15:0] _GEN_418 = 6'h15 == _T_287[5:0] ? 16'hc8 : _GEN_417; // @[Filter.scala 67:46]
  wire [15:0] _GEN_419 = 6'h16 == _T_287[5:0] ? 16'h64 : _GEN_418; // @[Filter.scala 67:46]
  wire [15:0] _GEN_420 = 6'h17 == _T_287[5:0] ? 16'h32 : _GEN_419; // @[Filter.scala 67:46]
  wire [15:0] _GEN_421 = 6'h18 == _T_287[5:0] ? 16'h64 : _GEN_420; // @[Filter.scala 67:46]
  wire [15:0] _GEN_422 = 6'h19 == _T_287[5:0] ? 16'h32 : _GEN_421; // @[Filter.scala 67:46]
  wire [15:0] _GEN_423 = 6'h1a == _T_287[5:0] ? 16'hc8 : _GEN_422; // @[Filter.scala 67:46]
  wire [15:0] _GEN_424 = 6'h1b == _T_287[5:0] ? 16'h64 : _GEN_423; // @[Filter.scala 67:46]
  wire [15:0] _GEN_425 = 6'h1c == _T_287[5:0] ? 16'h32 : _GEN_424; // @[Filter.scala 67:46]
  wire [15:0] _GEN_426 = 6'h1d == _T_287[5:0] ? 16'hc8 : _GEN_425; // @[Filter.scala 67:46]
  wire [15:0] _GEN_427 = 6'h1e == _T_287[5:0] ? 16'h32 : _GEN_426; // @[Filter.scala 67:46]
  wire [15:0] _GEN_428 = 6'h1f == _T_287[5:0] ? 16'hc8 : _GEN_427; // @[Filter.scala 67:46]
  wire [15:0] _GEN_429 = 6'h20 == _T_287[5:0] ? 16'h64 : _GEN_428; // @[Filter.scala 67:46]
  wire [15:0] _GEN_430 = 6'h21 == _T_287[5:0] ? 16'h32 : _GEN_429; // @[Filter.scala 67:46]
  wire [15:0] _GEN_431 = 6'h22 == _T_287[5:0] ? 16'hc8 : _GEN_430; // @[Filter.scala 67:46]
  wire [15:0] _GEN_432 = 6'h23 == _T_287[5:0] ? 16'h64 : _GEN_431; // @[Filter.scala 67:46]
  wire [31:0] _T_290 = pixelIndex + 32'hb; // @[Filter.scala 62:29]
  wire [31:0] _T_291 = _T_290 / 32'h6; // @[Filter.scala 62:36]
  wire [31:0] _T_293 = _T_291 + _GEN_803; // @[Filter.scala 62:51]
  wire [31:0] _T_295 = _T_293 - 32'h1; // @[Filter.scala 62:67]
  wire [31:0] _GEN_24 = _T_290 % 32'h6; // @[Filter.scala 63:36]
  wire [2:0] _T_298 = _GEN_24[2:0]; // @[Filter.scala 63:36]
  wire [2:0] _T_300 = _T_298 + _GEN_804; // @[Filter.scala 63:51]
  wire [2:0] _T_302 = _T_300 - 3'h1; // @[Filter.scala 63:67]
  wire  _T_304 = _T_295 >= 32'h6; // @[Filter.scala 64:27]
  wire  _T_308 = _T_302 >= 3'h6; // @[Filter.scala 64:59]
  wire  _T_309 = _T_304 | _T_308; // @[Filter.scala 64:54]
  wire [5:0] _T_310 = _T_302 * 3'h6; // @[Filter.scala 67:57]
  wire [31:0] _GEN_838 = {{26'd0}, _T_310}; // @[Filter.scala 67:72]
  wire [31:0] _T_312 = _GEN_838 + _T_295; // @[Filter.scala 67:72]
  wire [15:0] _GEN_435 = 6'h1 == _T_312[5:0] ? 16'h64 : 16'hc8; // @[Filter.scala 67:46]
  wire [15:0] _GEN_436 = 6'h2 == _T_312[5:0] ? 16'h32 : _GEN_435; // @[Filter.scala 67:46]
  wire [15:0] _GEN_437 = 6'h3 == _T_312[5:0] ? 16'hc8 : _GEN_436; // @[Filter.scala 67:46]
  wire [15:0] _GEN_438 = 6'h4 == _T_312[5:0] ? 16'h64 : _GEN_437; // @[Filter.scala 67:46]
  wire [15:0] _GEN_439 = 6'h5 == _T_312[5:0] ? 16'h32 : _GEN_438; // @[Filter.scala 67:46]
  wire [15:0] _GEN_440 = 6'h6 == _T_312[5:0] ? 16'h64 : _GEN_439; // @[Filter.scala 67:46]
  wire [15:0] _GEN_441 = 6'h7 == _T_312[5:0] ? 16'h32 : _GEN_440; // @[Filter.scala 67:46]
  wire [15:0] _GEN_442 = 6'h8 == _T_312[5:0] ? 16'hc8 : _GEN_441; // @[Filter.scala 67:46]
  wire [15:0] _GEN_443 = 6'h9 == _T_312[5:0] ? 16'h64 : _GEN_442; // @[Filter.scala 67:46]
  wire [15:0] _GEN_444 = 6'ha == _T_312[5:0] ? 16'h32 : _GEN_443; // @[Filter.scala 67:46]
  wire [15:0] _GEN_445 = 6'hb == _T_312[5:0] ? 16'hc8 : _GEN_444; // @[Filter.scala 67:46]
  wire [15:0] _GEN_446 = 6'hc == _T_312[5:0] ? 16'h32 : _GEN_445; // @[Filter.scala 67:46]
  wire [15:0] _GEN_447 = 6'hd == _T_312[5:0] ? 16'hc8 : _GEN_446; // @[Filter.scala 67:46]
  wire [15:0] _GEN_448 = 6'he == _T_312[5:0] ? 16'h64 : _GEN_447; // @[Filter.scala 67:46]
  wire [15:0] _GEN_449 = 6'hf == _T_312[5:0] ? 16'h32 : _GEN_448; // @[Filter.scala 67:46]
  wire [15:0] _GEN_450 = 6'h10 == _T_312[5:0] ? 16'hc8 : _GEN_449; // @[Filter.scala 67:46]
  wire [15:0] _GEN_451 = 6'h11 == _T_312[5:0] ? 16'h64 : _GEN_450; // @[Filter.scala 67:46]
  wire [15:0] _GEN_452 = 6'h12 == _T_312[5:0] ? 16'hc8 : _GEN_451; // @[Filter.scala 67:46]
  wire [15:0] _GEN_453 = 6'h13 == _T_312[5:0] ? 16'h64 : _GEN_452; // @[Filter.scala 67:46]
  wire [15:0] _GEN_454 = 6'h14 == _T_312[5:0] ? 16'h32 : _GEN_453; // @[Filter.scala 67:46]
  wire [15:0] _GEN_455 = 6'h15 == _T_312[5:0] ? 16'hc8 : _GEN_454; // @[Filter.scala 67:46]
  wire [15:0] _GEN_456 = 6'h16 == _T_312[5:0] ? 16'h64 : _GEN_455; // @[Filter.scala 67:46]
  wire [15:0] _GEN_457 = 6'h17 == _T_312[5:0] ? 16'h32 : _GEN_456; // @[Filter.scala 67:46]
  wire [15:0] _GEN_458 = 6'h18 == _T_312[5:0] ? 16'h64 : _GEN_457; // @[Filter.scala 67:46]
  wire [15:0] _GEN_459 = 6'h19 == _T_312[5:0] ? 16'h32 : _GEN_458; // @[Filter.scala 67:46]
  wire [15:0] _GEN_460 = 6'h1a == _T_312[5:0] ? 16'hc8 : _GEN_459; // @[Filter.scala 67:46]
  wire [15:0] _GEN_461 = 6'h1b == _T_312[5:0] ? 16'h64 : _GEN_460; // @[Filter.scala 67:46]
  wire [15:0] _GEN_462 = 6'h1c == _T_312[5:0] ? 16'h32 : _GEN_461; // @[Filter.scala 67:46]
  wire [15:0] _GEN_463 = 6'h1d == _T_312[5:0] ? 16'hc8 : _GEN_462; // @[Filter.scala 67:46]
  wire [15:0] _GEN_464 = 6'h1e == _T_312[5:0] ? 16'h32 : _GEN_463; // @[Filter.scala 67:46]
  wire [15:0] _GEN_465 = 6'h1f == _T_312[5:0] ? 16'hc8 : _GEN_464; // @[Filter.scala 67:46]
  wire [15:0] _GEN_466 = 6'h20 == _T_312[5:0] ? 16'h64 : _GEN_465; // @[Filter.scala 67:46]
  wire [15:0] _GEN_467 = 6'h21 == _T_312[5:0] ? 16'h32 : _GEN_466; // @[Filter.scala 67:46]
  wire [15:0] _GEN_468 = 6'h22 == _T_312[5:0] ? 16'hc8 : _GEN_467; // @[Filter.scala 67:46]
  wire [15:0] _GEN_469 = 6'h23 == _T_312[5:0] ? 16'h64 : _GEN_468; // @[Filter.scala 67:46]
  wire [31:0] _T_315 = pixelIndex + 32'hc; // @[Filter.scala 62:29]
  wire [31:0] _T_316 = _T_315 / 32'h6; // @[Filter.scala 62:36]
  wire [31:0] _T_318 = _T_316 + _GEN_803; // @[Filter.scala 62:51]
  wire [31:0] _T_320 = _T_318 - 32'h1; // @[Filter.scala 62:67]
  wire [31:0] _GEN_25 = _T_315 % 32'h6; // @[Filter.scala 63:36]
  wire [2:0] _T_323 = _GEN_25[2:0]; // @[Filter.scala 63:36]
  wire [2:0] _T_325 = _T_323 + _GEN_804; // @[Filter.scala 63:51]
  wire [2:0] _T_327 = _T_325 - 3'h1; // @[Filter.scala 63:67]
  wire  _T_329 = _T_320 >= 32'h6; // @[Filter.scala 64:27]
  wire  _T_333 = _T_327 >= 3'h6; // @[Filter.scala 64:59]
  wire  _T_334 = _T_329 | _T_333; // @[Filter.scala 64:54]
  wire [5:0] _T_335 = _T_327 * 3'h6; // @[Filter.scala 67:57]
  wire [31:0] _GEN_841 = {{26'd0}, _T_335}; // @[Filter.scala 67:72]
  wire [31:0] _T_337 = _GEN_841 + _T_320; // @[Filter.scala 67:72]
  wire [15:0] _GEN_472 = 6'h1 == _T_337[5:0] ? 16'h64 : 16'hc8; // @[Filter.scala 67:46]
  wire [15:0] _GEN_473 = 6'h2 == _T_337[5:0] ? 16'h32 : _GEN_472; // @[Filter.scala 67:46]
  wire [15:0] _GEN_474 = 6'h3 == _T_337[5:0] ? 16'hc8 : _GEN_473; // @[Filter.scala 67:46]
  wire [15:0] _GEN_475 = 6'h4 == _T_337[5:0] ? 16'h64 : _GEN_474; // @[Filter.scala 67:46]
  wire [15:0] _GEN_476 = 6'h5 == _T_337[5:0] ? 16'h32 : _GEN_475; // @[Filter.scala 67:46]
  wire [15:0] _GEN_477 = 6'h6 == _T_337[5:0] ? 16'h64 : _GEN_476; // @[Filter.scala 67:46]
  wire [15:0] _GEN_478 = 6'h7 == _T_337[5:0] ? 16'h32 : _GEN_477; // @[Filter.scala 67:46]
  wire [15:0] _GEN_479 = 6'h8 == _T_337[5:0] ? 16'hc8 : _GEN_478; // @[Filter.scala 67:46]
  wire [15:0] _GEN_480 = 6'h9 == _T_337[5:0] ? 16'h64 : _GEN_479; // @[Filter.scala 67:46]
  wire [15:0] _GEN_481 = 6'ha == _T_337[5:0] ? 16'h32 : _GEN_480; // @[Filter.scala 67:46]
  wire [15:0] _GEN_482 = 6'hb == _T_337[5:0] ? 16'hc8 : _GEN_481; // @[Filter.scala 67:46]
  wire [15:0] _GEN_483 = 6'hc == _T_337[5:0] ? 16'h32 : _GEN_482; // @[Filter.scala 67:46]
  wire [15:0] _GEN_484 = 6'hd == _T_337[5:0] ? 16'hc8 : _GEN_483; // @[Filter.scala 67:46]
  wire [15:0] _GEN_485 = 6'he == _T_337[5:0] ? 16'h64 : _GEN_484; // @[Filter.scala 67:46]
  wire [15:0] _GEN_486 = 6'hf == _T_337[5:0] ? 16'h32 : _GEN_485; // @[Filter.scala 67:46]
  wire [15:0] _GEN_487 = 6'h10 == _T_337[5:0] ? 16'hc8 : _GEN_486; // @[Filter.scala 67:46]
  wire [15:0] _GEN_488 = 6'h11 == _T_337[5:0] ? 16'h64 : _GEN_487; // @[Filter.scala 67:46]
  wire [15:0] _GEN_489 = 6'h12 == _T_337[5:0] ? 16'hc8 : _GEN_488; // @[Filter.scala 67:46]
  wire [15:0] _GEN_490 = 6'h13 == _T_337[5:0] ? 16'h64 : _GEN_489; // @[Filter.scala 67:46]
  wire [15:0] _GEN_491 = 6'h14 == _T_337[5:0] ? 16'h32 : _GEN_490; // @[Filter.scala 67:46]
  wire [15:0] _GEN_492 = 6'h15 == _T_337[5:0] ? 16'hc8 : _GEN_491; // @[Filter.scala 67:46]
  wire [15:0] _GEN_493 = 6'h16 == _T_337[5:0] ? 16'h64 : _GEN_492; // @[Filter.scala 67:46]
  wire [15:0] _GEN_494 = 6'h17 == _T_337[5:0] ? 16'h32 : _GEN_493; // @[Filter.scala 67:46]
  wire [15:0] _GEN_495 = 6'h18 == _T_337[5:0] ? 16'h64 : _GEN_494; // @[Filter.scala 67:46]
  wire [15:0] _GEN_496 = 6'h19 == _T_337[5:0] ? 16'h32 : _GEN_495; // @[Filter.scala 67:46]
  wire [15:0] _GEN_497 = 6'h1a == _T_337[5:0] ? 16'hc8 : _GEN_496; // @[Filter.scala 67:46]
  wire [15:0] _GEN_498 = 6'h1b == _T_337[5:0] ? 16'h64 : _GEN_497; // @[Filter.scala 67:46]
  wire [15:0] _GEN_499 = 6'h1c == _T_337[5:0] ? 16'h32 : _GEN_498; // @[Filter.scala 67:46]
  wire [15:0] _GEN_500 = 6'h1d == _T_337[5:0] ? 16'hc8 : _GEN_499; // @[Filter.scala 67:46]
  wire [15:0] _GEN_501 = 6'h1e == _T_337[5:0] ? 16'h32 : _GEN_500; // @[Filter.scala 67:46]
  wire [15:0] _GEN_502 = 6'h1f == _T_337[5:0] ? 16'hc8 : _GEN_501; // @[Filter.scala 67:46]
  wire [15:0] _GEN_503 = 6'h20 == _T_337[5:0] ? 16'h64 : _GEN_502; // @[Filter.scala 67:46]
  wire [15:0] _GEN_504 = 6'h21 == _T_337[5:0] ? 16'h32 : _GEN_503; // @[Filter.scala 67:46]
  wire [15:0] _GEN_505 = 6'h22 == _T_337[5:0] ? 16'hc8 : _GEN_504; // @[Filter.scala 67:46]
  wire [15:0] _GEN_506 = 6'h23 == _T_337[5:0] ? 16'h64 : _GEN_505; // @[Filter.scala 67:46]
  wire [31:0] _T_340 = pixelIndex + 32'hd; // @[Filter.scala 62:29]
  wire [31:0] _T_341 = _T_340 / 32'h6; // @[Filter.scala 62:36]
  wire [31:0] _T_343 = _T_341 + _GEN_803; // @[Filter.scala 62:51]
  wire [31:0] _T_345 = _T_343 - 32'h1; // @[Filter.scala 62:67]
  wire [31:0] _GEN_26 = _T_340 % 32'h6; // @[Filter.scala 63:36]
  wire [2:0] _T_348 = _GEN_26[2:0]; // @[Filter.scala 63:36]
  wire [2:0] _T_350 = _T_348 + _GEN_804; // @[Filter.scala 63:51]
  wire [2:0] _T_352 = _T_350 - 3'h1; // @[Filter.scala 63:67]
  wire  _T_354 = _T_345 >= 32'h6; // @[Filter.scala 64:27]
  wire  _T_358 = _T_352 >= 3'h6; // @[Filter.scala 64:59]
  wire  _T_359 = _T_354 | _T_358; // @[Filter.scala 64:54]
  wire [5:0] _T_360 = _T_352 * 3'h6; // @[Filter.scala 67:57]
  wire [31:0] _GEN_844 = {{26'd0}, _T_360}; // @[Filter.scala 67:72]
  wire [31:0] _T_362 = _GEN_844 + _T_345; // @[Filter.scala 67:72]
  wire [15:0] _GEN_509 = 6'h1 == _T_362[5:0] ? 16'h64 : 16'hc8; // @[Filter.scala 67:46]
  wire [15:0] _GEN_510 = 6'h2 == _T_362[5:0] ? 16'h32 : _GEN_509; // @[Filter.scala 67:46]
  wire [15:0] _GEN_511 = 6'h3 == _T_362[5:0] ? 16'hc8 : _GEN_510; // @[Filter.scala 67:46]
  wire [15:0] _GEN_512 = 6'h4 == _T_362[5:0] ? 16'h64 : _GEN_511; // @[Filter.scala 67:46]
  wire [15:0] _GEN_513 = 6'h5 == _T_362[5:0] ? 16'h32 : _GEN_512; // @[Filter.scala 67:46]
  wire [15:0] _GEN_514 = 6'h6 == _T_362[5:0] ? 16'h64 : _GEN_513; // @[Filter.scala 67:46]
  wire [15:0] _GEN_515 = 6'h7 == _T_362[5:0] ? 16'h32 : _GEN_514; // @[Filter.scala 67:46]
  wire [15:0] _GEN_516 = 6'h8 == _T_362[5:0] ? 16'hc8 : _GEN_515; // @[Filter.scala 67:46]
  wire [15:0] _GEN_517 = 6'h9 == _T_362[5:0] ? 16'h64 : _GEN_516; // @[Filter.scala 67:46]
  wire [15:0] _GEN_518 = 6'ha == _T_362[5:0] ? 16'h32 : _GEN_517; // @[Filter.scala 67:46]
  wire [15:0] _GEN_519 = 6'hb == _T_362[5:0] ? 16'hc8 : _GEN_518; // @[Filter.scala 67:46]
  wire [15:0] _GEN_520 = 6'hc == _T_362[5:0] ? 16'h32 : _GEN_519; // @[Filter.scala 67:46]
  wire [15:0] _GEN_521 = 6'hd == _T_362[5:0] ? 16'hc8 : _GEN_520; // @[Filter.scala 67:46]
  wire [15:0] _GEN_522 = 6'he == _T_362[5:0] ? 16'h64 : _GEN_521; // @[Filter.scala 67:46]
  wire [15:0] _GEN_523 = 6'hf == _T_362[5:0] ? 16'h32 : _GEN_522; // @[Filter.scala 67:46]
  wire [15:0] _GEN_524 = 6'h10 == _T_362[5:0] ? 16'hc8 : _GEN_523; // @[Filter.scala 67:46]
  wire [15:0] _GEN_525 = 6'h11 == _T_362[5:0] ? 16'h64 : _GEN_524; // @[Filter.scala 67:46]
  wire [15:0] _GEN_526 = 6'h12 == _T_362[5:0] ? 16'hc8 : _GEN_525; // @[Filter.scala 67:46]
  wire [15:0] _GEN_527 = 6'h13 == _T_362[5:0] ? 16'h64 : _GEN_526; // @[Filter.scala 67:46]
  wire [15:0] _GEN_528 = 6'h14 == _T_362[5:0] ? 16'h32 : _GEN_527; // @[Filter.scala 67:46]
  wire [15:0] _GEN_529 = 6'h15 == _T_362[5:0] ? 16'hc8 : _GEN_528; // @[Filter.scala 67:46]
  wire [15:0] _GEN_530 = 6'h16 == _T_362[5:0] ? 16'h64 : _GEN_529; // @[Filter.scala 67:46]
  wire [15:0] _GEN_531 = 6'h17 == _T_362[5:0] ? 16'h32 : _GEN_530; // @[Filter.scala 67:46]
  wire [15:0] _GEN_532 = 6'h18 == _T_362[5:0] ? 16'h64 : _GEN_531; // @[Filter.scala 67:46]
  wire [15:0] _GEN_533 = 6'h19 == _T_362[5:0] ? 16'h32 : _GEN_532; // @[Filter.scala 67:46]
  wire [15:0] _GEN_534 = 6'h1a == _T_362[5:0] ? 16'hc8 : _GEN_533; // @[Filter.scala 67:46]
  wire [15:0] _GEN_535 = 6'h1b == _T_362[5:0] ? 16'h64 : _GEN_534; // @[Filter.scala 67:46]
  wire [15:0] _GEN_536 = 6'h1c == _T_362[5:0] ? 16'h32 : _GEN_535; // @[Filter.scala 67:46]
  wire [15:0] _GEN_537 = 6'h1d == _T_362[5:0] ? 16'hc8 : _GEN_536; // @[Filter.scala 67:46]
  wire [15:0] _GEN_538 = 6'h1e == _T_362[5:0] ? 16'h32 : _GEN_537; // @[Filter.scala 67:46]
  wire [15:0] _GEN_539 = 6'h1f == _T_362[5:0] ? 16'hc8 : _GEN_538; // @[Filter.scala 67:46]
  wire [15:0] _GEN_540 = 6'h20 == _T_362[5:0] ? 16'h64 : _GEN_539; // @[Filter.scala 67:46]
  wire [15:0] _GEN_541 = 6'h21 == _T_362[5:0] ? 16'h32 : _GEN_540; // @[Filter.scala 67:46]
  wire [15:0] _GEN_542 = 6'h22 == _T_362[5:0] ? 16'hc8 : _GEN_541; // @[Filter.scala 67:46]
  wire [15:0] _GEN_543 = 6'h23 == _T_362[5:0] ? 16'h64 : _GEN_542; // @[Filter.scala 67:46]
  wire [31:0] _T_365 = pixelIndex + 32'he; // @[Filter.scala 62:29]
  wire [31:0] _T_366 = _T_365 / 32'h6; // @[Filter.scala 62:36]
  wire [31:0] _T_368 = _T_366 + _GEN_803; // @[Filter.scala 62:51]
  wire [31:0] _T_370 = _T_368 - 32'h1; // @[Filter.scala 62:67]
  wire [31:0] _GEN_27 = _T_365 % 32'h6; // @[Filter.scala 63:36]
  wire [2:0] _T_373 = _GEN_27[2:0]; // @[Filter.scala 63:36]
  wire [2:0] _T_375 = _T_373 + _GEN_804; // @[Filter.scala 63:51]
  wire [2:0] _T_377 = _T_375 - 3'h1; // @[Filter.scala 63:67]
  wire  _T_379 = _T_370 >= 32'h6; // @[Filter.scala 64:27]
  wire  _T_383 = _T_377 >= 3'h6; // @[Filter.scala 64:59]
  wire  _T_384 = _T_379 | _T_383; // @[Filter.scala 64:54]
  wire [5:0] _T_385 = _T_377 * 3'h6; // @[Filter.scala 67:57]
  wire [31:0] _GEN_847 = {{26'd0}, _T_385}; // @[Filter.scala 67:72]
  wire [31:0] _T_387 = _GEN_847 + _T_370; // @[Filter.scala 67:72]
  wire [15:0] _GEN_546 = 6'h1 == _T_387[5:0] ? 16'h64 : 16'hc8; // @[Filter.scala 67:46]
  wire [15:0] _GEN_547 = 6'h2 == _T_387[5:0] ? 16'h32 : _GEN_546; // @[Filter.scala 67:46]
  wire [15:0] _GEN_548 = 6'h3 == _T_387[5:0] ? 16'hc8 : _GEN_547; // @[Filter.scala 67:46]
  wire [15:0] _GEN_549 = 6'h4 == _T_387[5:0] ? 16'h64 : _GEN_548; // @[Filter.scala 67:46]
  wire [15:0] _GEN_550 = 6'h5 == _T_387[5:0] ? 16'h32 : _GEN_549; // @[Filter.scala 67:46]
  wire [15:0] _GEN_551 = 6'h6 == _T_387[5:0] ? 16'h64 : _GEN_550; // @[Filter.scala 67:46]
  wire [15:0] _GEN_552 = 6'h7 == _T_387[5:0] ? 16'h32 : _GEN_551; // @[Filter.scala 67:46]
  wire [15:0] _GEN_553 = 6'h8 == _T_387[5:0] ? 16'hc8 : _GEN_552; // @[Filter.scala 67:46]
  wire [15:0] _GEN_554 = 6'h9 == _T_387[5:0] ? 16'h64 : _GEN_553; // @[Filter.scala 67:46]
  wire [15:0] _GEN_555 = 6'ha == _T_387[5:0] ? 16'h32 : _GEN_554; // @[Filter.scala 67:46]
  wire [15:0] _GEN_556 = 6'hb == _T_387[5:0] ? 16'hc8 : _GEN_555; // @[Filter.scala 67:46]
  wire [15:0] _GEN_557 = 6'hc == _T_387[5:0] ? 16'h32 : _GEN_556; // @[Filter.scala 67:46]
  wire [15:0] _GEN_558 = 6'hd == _T_387[5:0] ? 16'hc8 : _GEN_557; // @[Filter.scala 67:46]
  wire [15:0] _GEN_559 = 6'he == _T_387[5:0] ? 16'h64 : _GEN_558; // @[Filter.scala 67:46]
  wire [15:0] _GEN_560 = 6'hf == _T_387[5:0] ? 16'h32 : _GEN_559; // @[Filter.scala 67:46]
  wire [15:0] _GEN_561 = 6'h10 == _T_387[5:0] ? 16'hc8 : _GEN_560; // @[Filter.scala 67:46]
  wire [15:0] _GEN_562 = 6'h11 == _T_387[5:0] ? 16'h64 : _GEN_561; // @[Filter.scala 67:46]
  wire [15:0] _GEN_563 = 6'h12 == _T_387[5:0] ? 16'hc8 : _GEN_562; // @[Filter.scala 67:46]
  wire [15:0] _GEN_564 = 6'h13 == _T_387[5:0] ? 16'h64 : _GEN_563; // @[Filter.scala 67:46]
  wire [15:0] _GEN_565 = 6'h14 == _T_387[5:0] ? 16'h32 : _GEN_564; // @[Filter.scala 67:46]
  wire [15:0] _GEN_566 = 6'h15 == _T_387[5:0] ? 16'hc8 : _GEN_565; // @[Filter.scala 67:46]
  wire [15:0] _GEN_567 = 6'h16 == _T_387[5:0] ? 16'h64 : _GEN_566; // @[Filter.scala 67:46]
  wire [15:0] _GEN_568 = 6'h17 == _T_387[5:0] ? 16'h32 : _GEN_567; // @[Filter.scala 67:46]
  wire [15:0] _GEN_569 = 6'h18 == _T_387[5:0] ? 16'h64 : _GEN_568; // @[Filter.scala 67:46]
  wire [15:0] _GEN_570 = 6'h19 == _T_387[5:0] ? 16'h32 : _GEN_569; // @[Filter.scala 67:46]
  wire [15:0] _GEN_571 = 6'h1a == _T_387[5:0] ? 16'hc8 : _GEN_570; // @[Filter.scala 67:46]
  wire [15:0] _GEN_572 = 6'h1b == _T_387[5:0] ? 16'h64 : _GEN_571; // @[Filter.scala 67:46]
  wire [15:0] _GEN_573 = 6'h1c == _T_387[5:0] ? 16'h32 : _GEN_572; // @[Filter.scala 67:46]
  wire [15:0] _GEN_574 = 6'h1d == _T_387[5:0] ? 16'hc8 : _GEN_573; // @[Filter.scala 67:46]
  wire [15:0] _GEN_575 = 6'h1e == _T_387[5:0] ? 16'h32 : _GEN_574; // @[Filter.scala 67:46]
  wire [15:0] _GEN_576 = 6'h1f == _T_387[5:0] ? 16'hc8 : _GEN_575; // @[Filter.scala 67:46]
  wire [15:0] _GEN_577 = 6'h20 == _T_387[5:0] ? 16'h64 : _GEN_576; // @[Filter.scala 67:46]
  wire [15:0] _GEN_578 = 6'h21 == _T_387[5:0] ? 16'h32 : _GEN_577; // @[Filter.scala 67:46]
  wire [15:0] _GEN_579 = 6'h22 == _T_387[5:0] ? 16'hc8 : _GEN_578; // @[Filter.scala 67:46]
  wire [15:0] _GEN_580 = 6'h23 == _T_387[5:0] ? 16'h64 : _GEN_579; // @[Filter.scala 67:46]
  wire [31:0] _T_390 = pixelIndex + 32'hf; // @[Filter.scala 62:29]
  wire [31:0] _T_391 = _T_390 / 32'h6; // @[Filter.scala 62:36]
  wire [31:0] _T_393 = _T_391 + _GEN_803; // @[Filter.scala 62:51]
  wire [31:0] _T_395 = _T_393 - 32'h1; // @[Filter.scala 62:67]
  wire [31:0] _GEN_63 = _T_390 % 32'h6; // @[Filter.scala 63:36]
  wire [2:0] _T_398 = _GEN_63[2:0]; // @[Filter.scala 63:36]
  wire [2:0] _T_400 = _T_398 + _GEN_804; // @[Filter.scala 63:51]
  wire [2:0] _T_402 = _T_400 - 3'h1; // @[Filter.scala 63:67]
  wire  _T_404 = _T_395 >= 32'h6; // @[Filter.scala 64:27]
  wire  _T_408 = _T_402 >= 3'h6; // @[Filter.scala 64:59]
  wire  _T_409 = _T_404 | _T_408; // @[Filter.scala 64:54]
  wire [5:0] _T_410 = _T_402 * 3'h6; // @[Filter.scala 67:57]
  wire [31:0] _GEN_850 = {{26'd0}, _T_410}; // @[Filter.scala 67:72]
  wire [31:0] _T_412 = _GEN_850 + _T_395; // @[Filter.scala 67:72]
  wire [15:0] _GEN_583 = 6'h1 == _T_412[5:0] ? 16'h64 : 16'hc8; // @[Filter.scala 67:46]
  wire [15:0] _GEN_584 = 6'h2 == _T_412[5:0] ? 16'h32 : _GEN_583; // @[Filter.scala 67:46]
  wire [15:0] _GEN_585 = 6'h3 == _T_412[5:0] ? 16'hc8 : _GEN_584; // @[Filter.scala 67:46]
  wire [15:0] _GEN_586 = 6'h4 == _T_412[5:0] ? 16'h64 : _GEN_585; // @[Filter.scala 67:46]
  wire [15:0] _GEN_587 = 6'h5 == _T_412[5:0] ? 16'h32 : _GEN_586; // @[Filter.scala 67:46]
  wire [15:0] _GEN_588 = 6'h6 == _T_412[5:0] ? 16'h64 : _GEN_587; // @[Filter.scala 67:46]
  wire [15:0] _GEN_589 = 6'h7 == _T_412[5:0] ? 16'h32 : _GEN_588; // @[Filter.scala 67:46]
  wire [15:0] _GEN_590 = 6'h8 == _T_412[5:0] ? 16'hc8 : _GEN_589; // @[Filter.scala 67:46]
  wire [15:0] _GEN_591 = 6'h9 == _T_412[5:0] ? 16'h64 : _GEN_590; // @[Filter.scala 67:46]
  wire [15:0] _GEN_592 = 6'ha == _T_412[5:0] ? 16'h32 : _GEN_591; // @[Filter.scala 67:46]
  wire [15:0] _GEN_593 = 6'hb == _T_412[5:0] ? 16'hc8 : _GEN_592; // @[Filter.scala 67:46]
  wire [15:0] _GEN_594 = 6'hc == _T_412[5:0] ? 16'h32 : _GEN_593; // @[Filter.scala 67:46]
  wire [15:0] _GEN_595 = 6'hd == _T_412[5:0] ? 16'hc8 : _GEN_594; // @[Filter.scala 67:46]
  wire [15:0] _GEN_596 = 6'he == _T_412[5:0] ? 16'h64 : _GEN_595; // @[Filter.scala 67:46]
  wire [15:0] _GEN_597 = 6'hf == _T_412[5:0] ? 16'h32 : _GEN_596; // @[Filter.scala 67:46]
  wire [15:0] _GEN_598 = 6'h10 == _T_412[5:0] ? 16'hc8 : _GEN_597; // @[Filter.scala 67:46]
  wire [15:0] _GEN_599 = 6'h11 == _T_412[5:0] ? 16'h64 : _GEN_598; // @[Filter.scala 67:46]
  wire [15:0] _GEN_600 = 6'h12 == _T_412[5:0] ? 16'hc8 : _GEN_599; // @[Filter.scala 67:46]
  wire [15:0] _GEN_601 = 6'h13 == _T_412[5:0] ? 16'h64 : _GEN_600; // @[Filter.scala 67:46]
  wire [15:0] _GEN_602 = 6'h14 == _T_412[5:0] ? 16'h32 : _GEN_601; // @[Filter.scala 67:46]
  wire [15:0] _GEN_603 = 6'h15 == _T_412[5:0] ? 16'hc8 : _GEN_602; // @[Filter.scala 67:46]
  wire [15:0] _GEN_604 = 6'h16 == _T_412[5:0] ? 16'h64 : _GEN_603; // @[Filter.scala 67:46]
  wire [15:0] _GEN_605 = 6'h17 == _T_412[5:0] ? 16'h32 : _GEN_604; // @[Filter.scala 67:46]
  wire [15:0] _GEN_606 = 6'h18 == _T_412[5:0] ? 16'h64 : _GEN_605; // @[Filter.scala 67:46]
  wire [15:0] _GEN_607 = 6'h19 == _T_412[5:0] ? 16'h32 : _GEN_606; // @[Filter.scala 67:46]
  wire [15:0] _GEN_608 = 6'h1a == _T_412[5:0] ? 16'hc8 : _GEN_607; // @[Filter.scala 67:46]
  wire [15:0] _GEN_609 = 6'h1b == _T_412[5:0] ? 16'h64 : _GEN_608; // @[Filter.scala 67:46]
  wire [15:0] _GEN_610 = 6'h1c == _T_412[5:0] ? 16'h32 : _GEN_609; // @[Filter.scala 67:46]
  wire [15:0] _GEN_611 = 6'h1d == _T_412[5:0] ? 16'hc8 : _GEN_610; // @[Filter.scala 67:46]
  wire [15:0] _GEN_612 = 6'h1e == _T_412[5:0] ? 16'h32 : _GEN_611; // @[Filter.scala 67:46]
  wire [15:0] _GEN_613 = 6'h1f == _T_412[5:0] ? 16'hc8 : _GEN_612; // @[Filter.scala 67:46]
  wire [15:0] _GEN_614 = 6'h20 == _T_412[5:0] ? 16'h64 : _GEN_613; // @[Filter.scala 67:46]
  wire [15:0] _GEN_615 = 6'h21 == _T_412[5:0] ? 16'h32 : _GEN_614; // @[Filter.scala 67:46]
  wire [15:0] _GEN_616 = 6'h22 == _T_412[5:0] ? 16'hc8 : _GEN_615; // @[Filter.scala 67:46]
  wire [15:0] _GEN_617 = 6'h23 == _T_412[5:0] ? 16'h64 : _GEN_616; // @[Filter.scala 67:46]
  wire [31:0] _T_415 = pixelIndex + 32'h10; // @[Filter.scala 62:29]
  wire [31:0] _T_416 = _T_415 / 32'h6; // @[Filter.scala 62:36]
  wire [31:0] _T_418 = _T_416 + _GEN_803; // @[Filter.scala 62:51]
  wire [31:0] _T_420 = _T_418 - 32'h1; // @[Filter.scala 62:67]
  wire [31:0] _GEN_64 = _T_415 % 32'h6; // @[Filter.scala 63:36]
  wire [2:0] _T_423 = _GEN_64[2:0]; // @[Filter.scala 63:36]
  wire [2:0] _T_425 = _T_423 + _GEN_804; // @[Filter.scala 63:51]
  wire [2:0] _T_427 = _T_425 - 3'h1; // @[Filter.scala 63:67]
  wire  _T_429 = _T_420 >= 32'h6; // @[Filter.scala 64:27]
  wire  _T_433 = _T_427 >= 3'h6; // @[Filter.scala 64:59]
  wire  _T_434 = _T_429 | _T_433; // @[Filter.scala 64:54]
  wire [5:0] _T_435 = _T_427 * 3'h6; // @[Filter.scala 67:57]
  wire [31:0] _GEN_853 = {{26'd0}, _T_435}; // @[Filter.scala 67:72]
  wire [31:0] _T_437 = _GEN_853 + _T_420; // @[Filter.scala 67:72]
  wire [15:0] _GEN_620 = 6'h1 == _T_437[5:0] ? 16'h64 : 16'hc8; // @[Filter.scala 67:46]
  wire [15:0] _GEN_621 = 6'h2 == _T_437[5:0] ? 16'h32 : _GEN_620; // @[Filter.scala 67:46]
  wire [15:0] _GEN_622 = 6'h3 == _T_437[5:0] ? 16'hc8 : _GEN_621; // @[Filter.scala 67:46]
  wire [15:0] _GEN_623 = 6'h4 == _T_437[5:0] ? 16'h64 : _GEN_622; // @[Filter.scala 67:46]
  wire [15:0] _GEN_624 = 6'h5 == _T_437[5:0] ? 16'h32 : _GEN_623; // @[Filter.scala 67:46]
  wire [15:0] _GEN_625 = 6'h6 == _T_437[5:0] ? 16'h64 : _GEN_624; // @[Filter.scala 67:46]
  wire [15:0] _GEN_626 = 6'h7 == _T_437[5:0] ? 16'h32 : _GEN_625; // @[Filter.scala 67:46]
  wire [15:0] _GEN_627 = 6'h8 == _T_437[5:0] ? 16'hc8 : _GEN_626; // @[Filter.scala 67:46]
  wire [15:0] _GEN_628 = 6'h9 == _T_437[5:0] ? 16'h64 : _GEN_627; // @[Filter.scala 67:46]
  wire [15:0] _GEN_629 = 6'ha == _T_437[5:0] ? 16'h32 : _GEN_628; // @[Filter.scala 67:46]
  wire [15:0] _GEN_630 = 6'hb == _T_437[5:0] ? 16'hc8 : _GEN_629; // @[Filter.scala 67:46]
  wire [15:0] _GEN_631 = 6'hc == _T_437[5:0] ? 16'h32 : _GEN_630; // @[Filter.scala 67:46]
  wire [15:0] _GEN_632 = 6'hd == _T_437[5:0] ? 16'hc8 : _GEN_631; // @[Filter.scala 67:46]
  wire [15:0] _GEN_633 = 6'he == _T_437[5:0] ? 16'h64 : _GEN_632; // @[Filter.scala 67:46]
  wire [15:0] _GEN_634 = 6'hf == _T_437[5:0] ? 16'h32 : _GEN_633; // @[Filter.scala 67:46]
  wire [15:0] _GEN_635 = 6'h10 == _T_437[5:0] ? 16'hc8 : _GEN_634; // @[Filter.scala 67:46]
  wire [15:0] _GEN_636 = 6'h11 == _T_437[5:0] ? 16'h64 : _GEN_635; // @[Filter.scala 67:46]
  wire [15:0] _GEN_637 = 6'h12 == _T_437[5:0] ? 16'hc8 : _GEN_636; // @[Filter.scala 67:46]
  wire [15:0] _GEN_638 = 6'h13 == _T_437[5:0] ? 16'h64 : _GEN_637; // @[Filter.scala 67:46]
  wire [15:0] _GEN_639 = 6'h14 == _T_437[5:0] ? 16'h32 : _GEN_638; // @[Filter.scala 67:46]
  wire [15:0] _GEN_640 = 6'h15 == _T_437[5:0] ? 16'hc8 : _GEN_639; // @[Filter.scala 67:46]
  wire [15:0] _GEN_641 = 6'h16 == _T_437[5:0] ? 16'h64 : _GEN_640; // @[Filter.scala 67:46]
  wire [15:0] _GEN_642 = 6'h17 == _T_437[5:0] ? 16'h32 : _GEN_641; // @[Filter.scala 67:46]
  wire [15:0] _GEN_643 = 6'h18 == _T_437[5:0] ? 16'h64 : _GEN_642; // @[Filter.scala 67:46]
  wire [15:0] _GEN_644 = 6'h19 == _T_437[5:0] ? 16'h32 : _GEN_643; // @[Filter.scala 67:46]
  wire [15:0] _GEN_645 = 6'h1a == _T_437[5:0] ? 16'hc8 : _GEN_644; // @[Filter.scala 67:46]
  wire [15:0] _GEN_646 = 6'h1b == _T_437[5:0] ? 16'h64 : _GEN_645; // @[Filter.scala 67:46]
  wire [15:0] _GEN_647 = 6'h1c == _T_437[5:0] ? 16'h32 : _GEN_646; // @[Filter.scala 67:46]
  wire [15:0] _GEN_648 = 6'h1d == _T_437[5:0] ? 16'hc8 : _GEN_647; // @[Filter.scala 67:46]
  wire [15:0] _GEN_649 = 6'h1e == _T_437[5:0] ? 16'h32 : _GEN_648; // @[Filter.scala 67:46]
  wire [15:0] _GEN_650 = 6'h1f == _T_437[5:0] ? 16'hc8 : _GEN_649; // @[Filter.scala 67:46]
  wire [15:0] _GEN_651 = 6'h20 == _T_437[5:0] ? 16'h64 : _GEN_650; // @[Filter.scala 67:46]
  wire [15:0] _GEN_652 = 6'h21 == _T_437[5:0] ? 16'h32 : _GEN_651; // @[Filter.scala 67:46]
  wire [15:0] _GEN_653 = 6'h22 == _T_437[5:0] ? 16'hc8 : _GEN_652; // @[Filter.scala 67:46]
  wire [15:0] _GEN_654 = 6'h23 == _T_437[5:0] ? 16'h64 : _GEN_653; // @[Filter.scala 67:46]
  wire [31:0] _T_440 = pixelIndex + 32'h11; // @[Filter.scala 62:29]
  wire [31:0] _T_441 = _T_440 / 32'h6; // @[Filter.scala 62:36]
  wire [31:0] _T_443 = _T_441 + _GEN_803; // @[Filter.scala 62:51]
  wire [31:0] _T_445 = _T_443 - 32'h1; // @[Filter.scala 62:67]
  wire [31:0] _GEN_100 = _T_440 % 32'h6; // @[Filter.scala 63:36]
  wire [2:0] _T_448 = _GEN_100[2:0]; // @[Filter.scala 63:36]
  wire [2:0] _T_450 = _T_448 + _GEN_804; // @[Filter.scala 63:51]
  wire [2:0] _T_452 = _T_450 - 3'h1; // @[Filter.scala 63:67]
  wire  _T_454 = _T_445 >= 32'h6; // @[Filter.scala 64:27]
  wire  _T_458 = _T_452 >= 3'h6; // @[Filter.scala 64:59]
  wire  _T_459 = _T_454 | _T_458; // @[Filter.scala 64:54]
  wire [5:0] _T_460 = _T_452 * 3'h6; // @[Filter.scala 67:57]
  wire [31:0] _GEN_856 = {{26'd0}, _T_460}; // @[Filter.scala 67:72]
  wire [31:0] _T_462 = _GEN_856 + _T_445; // @[Filter.scala 67:72]
  wire [15:0] _GEN_657 = 6'h1 == _T_462[5:0] ? 16'h64 : 16'hc8; // @[Filter.scala 67:46]
  wire [15:0] _GEN_658 = 6'h2 == _T_462[5:0] ? 16'h32 : _GEN_657; // @[Filter.scala 67:46]
  wire [15:0] _GEN_659 = 6'h3 == _T_462[5:0] ? 16'hc8 : _GEN_658; // @[Filter.scala 67:46]
  wire [15:0] _GEN_660 = 6'h4 == _T_462[5:0] ? 16'h64 : _GEN_659; // @[Filter.scala 67:46]
  wire [15:0] _GEN_661 = 6'h5 == _T_462[5:0] ? 16'h32 : _GEN_660; // @[Filter.scala 67:46]
  wire [15:0] _GEN_662 = 6'h6 == _T_462[5:0] ? 16'h64 : _GEN_661; // @[Filter.scala 67:46]
  wire [15:0] _GEN_663 = 6'h7 == _T_462[5:0] ? 16'h32 : _GEN_662; // @[Filter.scala 67:46]
  wire [15:0] _GEN_664 = 6'h8 == _T_462[5:0] ? 16'hc8 : _GEN_663; // @[Filter.scala 67:46]
  wire [15:0] _GEN_665 = 6'h9 == _T_462[5:0] ? 16'h64 : _GEN_664; // @[Filter.scala 67:46]
  wire [15:0] _GEN_666 = 6'ha == _T_462[5:0] ? 16'h32 : _GEN_665; // @[Filter.scala 67:46]
  wire [15:0] _GEN_667 = 6'hb == _T_462[5:0] ? 16'hc8 : _GEN_666; // @[Filter.scala 67:46]
  wire [15:0] _GEN_668 = 6'hc == _T_462[5:0] ? 16'h32 : _GEN_667; // @[Filter.scala 67:46]
  wire [15:0] _GEN_669 = 6'hd == _T_462[5:0] ? 16'hc8 : _GEN_668; // @[Filter.scala 67:46]
  wire [15:0] _GEN_670 = 6'he == _T_462[5:0] ? 16'h64 : _GEN_669; // @[Filter.scala 67:46]
  wire [15:0] _GEN_671 = 6'hf == _T_462[5:0] ? 16'h32 : _GEN_670; // @[Filter.scala 67:46]
  wire [15:0] _GEN_672 = 6'h10 == _T_462[5:0] ? 16'hc8 : _GEN_671; // @[Filter.scala 67:46]
  wire [15:0] _GEN_673 = 6'h11 == _T_462[5:0] ? 16'h64 : _GEN_672; // @[Filter.scala 67:46]
  wire [15:0] _GEN_674 = 6'h12 == _T_462[5:0] ? 16'hc8 : _GEN_673; // @[Filter.scala 67:46]
  wire [15:0] _GEN_675 = 6'h13 == _T_462[5:0] ? 16'h64 : _GEN_674; // @[Filter.scala 67:46]
  wire [15:0] _GEN_676 = 6'h14 == _T_462[5:0] ? 16'h32 : _GEN_675; // @[Filter.scala 67:46]
  wire [15:0] _GEN_677 = 6'h15 == _T_462[5:0] ? 16'hc8 : _GEN_676; // @[Filter.scala 67:46]
  wire [15:0] _GEN_678 = 6'h16 == _T_462[5:0] ? 16'h64 : _GEN_677; // @[Filter.scala 67:46]
  wire [15:0] _GEN_679 = 6'h17 == _T_462[5:0] ? 16'h32 : _GEN_678; // @[Filter.scala 67:46]
  wire [15:0] _GEN_680 = 6'h18 == _T_462[5:0] ? 16'h64 : _GEN_679; // @[Filter.scala 67:46]
  wire [15:0] _GEN_681 = 6'h19 == _T_462[5:0] ? 16'h32 : _GEN_680; // @[Filter.scala 67:46]
  wire [15:0] _GEN_682 = 6'h1a == _T_462[5:0] ? 16'hc8 : _GEN_681; // @[Filter.scala 67:46]
  wire [15:0] _GEN_683 = 6'h1b == _T_462[5:0] ? 16'h64 : _GEN_682; // @[Filter.scala 67:46]
  wire [15:0] _GEN_684 = 6'h1c == _T_462[5:0] ? 16'h32 : _GEN_683; // @[Filter.scala 67:46]
  wire [15:0] _GEN_685 = 6'h1d == _T_462[5:0] ? 16'hc8 : _GEN_684; // @[Filter.scala 67:46]
  wire [15:0] _GEN_686 = 6'h1e == _T_462[5:0] ? 16'h32 : _GEN_685; // @[Filter.scala 67:46]
  wire [15:0] _GEN_687 = 6'h1f == _T_462[5:0] ? 16'hc8 : _GEN_686; // @[Filter.scala 67:46]
  wire [15:0] _GEN_688 = 6'h20 == _T_462[5:0] ? 16'h64 : _GEN_687; // @[Filter.scala 67:46]
  wire [15:0] _GEN_689 = 6'h21 == _T_462[5:0] ? 16'h32 : _GEN_688; // @[Filter.scala 67:46]
  wire [15:0] _GEN_690 = 6'h22 == _T_462[5:0] ? 16'hc8 : _GEN_689; // @[Filter.scala 67:46]
  wire [15:0] _GEN_691 = 6'h23 == _T_462[5:0] ? 16'h64 : _GEN_690; // @[Filter.scala 67:46]
  wire [31:0] _GEN_694 = io_SPI_filterIndex[0] ? 32'h9 : 32'h1; // @[Filter.scala 73:77]
  wire [31:0] _GEN_857 = {{16'd0}, KernelConvolution_io_pixelVal_out_0}; // @[Filter.scala 73:77]
  wire [31:0] _GEN_859 = {{16'd0}, KernelConvolution_io_pixelVal_out_1}; // @[Filter.scala 73:77]
  wire [31:0] _GEN_861 = {{16'd0}, KernelConvolution_io_pixelVal_out_2}; // @[Filter.scala 73:77]
  wire [31:0] _GEN_863 = {{16'd0}, KernelConvolution_io_pixelVal_out_3}; // @[Filter.scala 73:77]
  wire [31:0] _GEN_865 = {{16'd0}, KernelConvolution_io_pixelVal_out_4}; // @[Filter.scala 73:77]
  wire [31:0] _GEN_867 = {{16'd0}, KernelConvolution_io_pixelVal_out_5}; // @[Filter.scala 73:77]
  wire [31:0] _GEN_869 = {{16'd0}, KernelConvolution_io_pixelVal_out_6}; // @[Filter.scala 73:77]
  wire [31:0] _GEN_871 = {{16'd0}, KernelConvolution_io_pixelVal_out_7}; // @[Filter.scala 73:77]
  wire [31:0] _GEN_873 = {{16'd0}, KernelConvolution_io_pixelVal_out_8}; // @[Filter.scala 73:77]
  wire [31:0] _GEN_875 = {{16'd0}, KernelConvolution_io_pixelVal_out_9}; // @[Filter.scala 73:77]
  wire [31:0] _GEN_877 = {{16'd0}, KernelConvolution_io_pixelVal_out_10}; // @[Filter.scala 73:77]
  wire [31:0] _GEN_879 = {{16'd0}, KernelConvolution_io_pixelVal_out_11}; // @[Filter.scala 73:77]
  wire [31:0] _GEN_881 = {{16'd0}, KernelConvolution_io_pixelVal_out_12}; // @[Filter.scala 73:77]
  wire [31:0] _GEN_883 = {{16'd0}, KernelConvolution_io_pixelVal_out_13}; // @[Filter.scala 73:77]
  wire [31:0] _GEN_885 = {{16'd0}, KernelConvolution_io_pixelVal_out_14}; // @[Filter.scala 73:77]
  wire [31:0] _GEN_887 = {{16'd0}, KernelConvolution_io_pixelVal_out_15}; // @[Filter.scala 73:77]
  wire [31:0] _GEN_889 = {{16'd0}, KernelConvolution_io_pixelVal_out_16}; // @[Filter.scala 73:77]
  wire [31:0] _GEN_891 = {{16'd0}, KernelConvolution_io_pixelVal_out_17}; // @[Filter.scala 73:77]
  wire [31:0] _T_573 = pixelIndex + 32'h12; // @[Filter.scala 82:34]
  KernelConvolution KernelConvolution ( // @[Filter.scala 52:35]
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
    .io_pixelVal_in_8(KernelConvolution_io_pixelVal_in_8),
    .io_pixelVal_in_9(KernelConvolution_io_pixelVal_in_9),
    .io_pixelVal_in_10(KernelConvolution_io_pixelVal_in_10),
    .io_pixelVal_in_11(KernelConvolution_io_pixelVal_in_11),
    .io_pixelVal_in_12(KernelConvolution_io_pixelVal_in_12),
    .io_pixelVal_in_13(KernelConvolution_io_pixelVal_in_13),
    .io_pixelVal_in_14(KernelConvolution_io_pixelVal_in_14),
    .io_pixelVal_in_15(KernelConvolution_io_pixelVal_in_15),
    .io_pixelVal_in_16(KernelConvolution_io_pixelVal_in_16),
    .io_pixelVal_in_17(KernelConvolution_io_pixelVal_in_17),
    .io_pixelVal_out_0(KernelConvolution_io_pixelVal_out_0),
    .io_pixelVal_out_1(KernelConvolution_io_pixelVal_out_1),
    .io_pixelVal_out_2(KernelConvolution_io_pixelVal_out_2),
    .io_pixelVal_out_3(KernelConvolution_io_pixelVal_out_3),
    .io_pixelVal_out_4(KernelConvolution_io_pixelVal_out_4),
    .io_pixelVal_out_5(KernelConvolution_io_pixelVal_out_5),
    .io_pixelVal_out_6(KernelConvolution_io_pixelVal_out_6),
    .io_pixelVal_out_7(KernelConvolution_io_pixelVal_out_7),
    .io_pixelVal_out_8(KernelConvolution_io_pixelVal_out_8),
    .io_pixelVal_out_9(KernelConvolution_io_pixelVal_out_9),
    .io_pixelVal_out_10(KernelConvolution_io_pixelVal_out_10),
    .io_pixelVal_out_11(KernelConvolution_io_pixelVal_out_11),
    .io_pixelVal_out_12(KernelConvolution_io_pixelVal_out_12),
    .io_pixelVal_out_13(KernelConvolution_io_pixelVal_out_13),
    .io_pixelVal_out_14(KernelConvolution_io_pixelVal_out_14),
    .io_pixelVal_out_15(KernelConvolution_io_pixelVal_out_15),
    .io_pixelVal_out_16(KernelConvolution_io_pixelVal_out_16),
    .io_pixelVal_out_17(KernelConvolution_io_pixelVal_out_17),
    .io_valid_out(KernelConvolution_io_valid_out)
  );
  assign io_pixelVal_out_0 = _GEN_857 / _GEN_694; // @[Filter.scala 73:32 Filter.scala 75:32]
  assign io_pixelVal_out_1 = _GEN_859 / _GEN_694; // @[Filter.scala 73:32 Filter.scala 75:32]
  assign io_pixelVal_out_2 = _GEN_861 / _GEN_694; // @[Filter.scala 73:32 Filter.scala 75:32]
  assign io_pixelVal_out_3 = _GEN_863 / _GEN_694; // @[Filter.scala 73:32 Filter.scala 75:32]
  assign io_pixelVal_out_4 = _GEN_865 / _GEN_694; // @[Filter.scala 73:32 Filter.scala 75:32]
  assign io_pixelVal_out_5 = _GEN_867 / _GEN_694; // @[Filter.scala 73:32 Filter.scala 75:32]
  assign io_pixelVal_out_6 = _GEN_869 / _GEN_694; // @[Filter.scala 73:32 Filter.scala 75:32]
  assign io_pixelVal_out_7 = _GEN_871 / _GEN_694; // @[Filter.scala 73:32 Filter.scala 75:32]
  assign io_pixelVal_out_8 = _GEN_873 / _GEN_694; // @[Filter.scala 73:32 Filter.scala 75:32]
  assign io_pixelVal_out_9 = _GEN_875 / _GEN_694; // @[Filter.scala 73:32 Filter.scala 75:32]
  assign io_pixelVal_out_10 = _GEN_877 / _GEN_694; // @[Filter.scala 73:32 Filter.scala 75:32]
  assign io_pixelVal_out_11 = _GEN_879 / _GEN_694; // @[Filter.scala 73:32 Filter.scala 75:32]
  assign io_pixelVal_out_12 = _GEN_881 / _GEN_694; // @[Filter.scala 73:32 Filter.scala 75:32]
  assign io_pixelVal_out_13 = _GEN_883 / _GEN_694; // @[Filter.scala 73:32 Filter.scala 75:32]
  assign io_pixelVal_out_14 = _GEN_885 / _GEN_694; // @[Filter.scala 73:32 Filter.scala 75:32]
  assign io_pixelVal_out_15 = _GEN_887 / _GEN_694; // @[Filter.scala 73:32 Filter.scala 75:32]
  assign io_pixelVal_out_16 = _GEN_889 / _GEN_694; // @[Filter.scala 73:32 Filter.scala 75:32]
  assign io_pixelVal_out_17 = _GEN_891 / _GEN_694; // @[Filter.scala 73:32 Filter.scala 75:32]
  assign io_valid_out = KernelConvolution_io_valid_out; // @[Filter.scala 79:18]
  assign KernelConvolution_clock = clock;
  assign KernelConvolution_reset = reset;
  assign KernelConvolution_io_kernelVal_in = io_SPI_filterIndex[0] & _GEN_793 ? 16'h1 : _GEN_19; // @[Filter.scala 55:36]
  assign KernelConvolution_io_pixelVal_in_0 = _T_34 ? 16'h0 : _GEN_62; // @[Filter.scala 65:46 Filter.scala 67:46]
  assign KernelConvolution_io_pixelVal_in_1 = _T_59 ? 16'h0 : _GEN_99; // @[Filter.scala 65:46 Filter.scala 67:46]
  assign KernelConvolution_io_pixelVal_in_2 = _T_84 ? 16'h0 : _GEN_136; // @[Filter.scala 65:46 Filter.scala 67:46]
  assign KernelConvolution_io_pixelVal_in_3 = _T_109 ? 16'h0 : _GEN_173; // @[Filter.scala 65:46 Filter.scala 67:46]
  assign KernelConvolution_io_pixelVal_in_4 = _T_134 ? 16'h0 : _GEN_210; // @[Filter.scala 65:46 Filter.scala 67:46]
  assign KernelConvolution_io_pixelVal_in_5 = _T_159 ? 16'h0 : _GEN_247; // @[Filter.scala 65:46 Filter.scala 67:46]
  assign KernelConvolution_io_pixelVal_in_6 = _T_184 ? 16'h0 : _GEN_284; // @[Filter.scala 65:46 Filter.scala 67:46]
  assign KernelConvolution_io_pixelVal_in_7 = _T_209 ? 16'h0 : _GEN_321; // @[Filter.scala 65:46 Filter.scala 67:46]
  assign KernelConvolution_io_pixelVal_in_8 = _T_234 ? 16'h0 : _GEN_358; // @[Filter.scala 65:46 Filter.scala 67:46]
  assign KernelConvolution_io_pixelVal_in_9 = _T_259 ? 16'h0 : _GEN_395; // @[Filter.scala 65:46 Filter.scala 67:46]
  assign KernelConvolution_io_pixelVal_in_10 = _T_284 ? 16'h0 : _GEN_432; // @[Filter.scala 65:46 Filter.scala 67:46]
  assign KernelConvolution_io_pixelVal_in_11 = _T_309 ? 16'h0 : _GEN_469; // @[Filter.scala 65:46 Filter.scala 67:46]
  assign KernelConvolution_io_pixelVal_in_12 = _T_334 ? 16'h0 : _GEN_506; // @[Filter.scala 65:46 Filter.scala 67:46]
  assign KernelConvolution_io_pixelVal_in_13 = _T_359 ? 16'h0 : _GEN_543; // @[Filter.scala 65:46 Filter.scala 67:46]
  assign KernelConvolution_io_pixelVal_in_14 = _T_384 ? 16'h0 : _GEN_580; // @[Filter.scala 65:46 Filter.scala 67:46]
  assign KernelConvolution_io_pixelVal_in_15 = _T_409 ? 16'h0 : _GEN_617; // @[Filter.scala 65:46 Filter.scala 67:46]
  assign KernelConvolution_io_pixelVal_in_16 = _T_434 ? 16'h0 : _GEN_654; // @[Filter.scala 65:46 Filter.scala 67:46]
  assign KernelConvolution_io_pixelVal_in_17 = _T_459 ? 16'h0 : _GEN_691; // @[Filter.scala 65:46 Filter.scala 67:46]
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
      kernelCounter <= _T_6;
    end
    if (reset) begin
      imageCounterX <= 2'h0;
    end else if (imageCounterXReset) begin
      imageCounterX <= 2'h0;
    end else begin
      imageCounterX <= _T_10;
    end
    if (reset) begin
      imageCounterY <= 2'h0;
    end else if (imageCounterXReset) begin
      if (_T_11) begin
        imageCounterY <= 2'h0;
      end else begin
        imageCounterY <= _T_13;
      end
    end
    if (reset) begin
      pixelIndex <= 32'h0;
    end else if (kernelCountReset) begin
      pixelIndex <= _T_573;
    end
  end
endmodule
