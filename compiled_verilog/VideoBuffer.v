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
`endif // RANDOMIZE_REG_INIT
  reg [3:0] image_0; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_1; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_2; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_3; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_4; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_5; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_6; // @[VideoBuffer.scala 19:24]
  reg [3:0] image_7; // @[VideoBuffer.scala 19:24]
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
  wire [3:0] _GEN_8 = 8'h8 == _T_3[7:0] ? 4'h7 : _GEN_7; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_9 = 8'h9 == _T_3[7:0] ? 4'h7 : _GEN_8; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_10 = 8'ha == _T_3[7:0] ? 4'h7 : _GEN_9; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_11 = 8'hb == _T_3[7:0] ? 4'h7 : _GEN_10; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_12 = 8'hc == _T_3[7:0] ? 4'h7 : _GEN_11; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_13 = 8'hd == _T_3[7:0] ? 4'h7 : _GEN_12; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_14 = 8'he == _T_3[7:0] ? 4'h7 : _GEN_13; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_15 = 8'hf == _T_3[7:0] ? 4'h7 : _GEN_14; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_16 = 8'h10 == _T_3[7:0] ? 4'h7 : _GEN_15; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_17 = 8'h11 == _T_3[7:0] ? 4'h7 : _GEN_16; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_18 = 8'h12 == _T_3[7:0] ? 4'h7 : _GEN_17; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_19 = 8'h13 == _T_3[7:0] ? 4'h7 : _GEN_18; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_20 = 8'h14 == _T_3[7:0] ? 4'h7 : _GEN_19; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_21 = 8'h15 == _T_3[7:0] ? 4'h7 : _GEN_20; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_22 = 8'h16 == _T_3[7:0] ? 4'h7 : _GEN_21; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_23 = 8'h17 == _T_3[7:0] ? 4'h7 : _GEN_22; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_24 = 8'h18 == _T_3[7:0] ? 4'h7 : _GEN_23; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_25 = 8'h19 == _T_3[7:0] ? 4'h7 : _GEN_24; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_26 = 8'h1a == _T_3[7:0] ? 4'h7 : _GEN_25; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_27 = 8'h1b == _T_3[7:0] ? 4'h7 : _GEN_26; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_28 = 8'h1c == _T_3[7:0] ? 4'h7 : _GEN_27; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_29 = 8'h1d == _T_3[7:0] ? 4'h7 : _GEN_28; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_30 = 8'h1e == _T_3[7:0] ? 4'h7 : _GEN_29; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_31 = 8'h1f == _T_3[7:0] ? 4'h7 : _GEN_30; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_32 = 8'h20 == _T_3[7:0] ? 4'h7 : _GEN_31; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_33 = 8'h21 == _T_3[7:0] ? 4'h7 : _GEN_32; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_34 = 8'h22 == _T_3[7:0] ? 4'h7 : _GEN_33; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_35 = 8'h23 == _T_3[7:0] ? 4'h7 : _GEN_34; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_36 = 8'h24 == _T_3[7:0] ? 4'h7 : _GEN_35; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_37 = 8'h25 == _T_3[7:0] ? 4'h7 : _GEN_36; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_38 = 8'h26 == _T_3[7:0] ? 4'h7 : _GEN_37; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_39 = 8'h27 == _T_3[7:0] ? 4'h7 : _GEN_38; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_40 = 8'h28 == _T_3[7:0] ? 4'h7 : _GEN_39; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_41 = 8'h29 == _T_3[7:0] ? 4'h7 : _GEN_40; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_42 = 8'h2a == _T_3[7:0] ? 4'h7 : _GEN_41; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_43 = 8'h2b == _T_3[7:0] ? 4'h7 : _GEN_42; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_44 = 8'h2c == _T_3[7:0] ? 4'h7 : _GEN_43; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_45 = 8'h2d == _T_3[7:0] ? 4'h7 : _GEN_44; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_46 = 8'h2e == _T_3[7:0] ? 4'h7 : _GEN_45; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_47 = 8'h2f == _T_3[7:0] ? 4'h7 : _GEN_46; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_48 = 8'h30 == _T_3[7:0] ? 4'h7 : _GEN_47; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_49 = 8'h31 == _T_3[7:0] ? 4'h7 : _GEN_48; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_50 = 8'h32 == _T_3[7:0] ? 4'h7 : _GEN_49; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_51 = 8'h33 == _T_3[7:0] ? 4'h7 : _GEN_50; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_52 = 8'h34 == _T_3[7:0] ? 4'h7 : _GEN_51; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_53 = 8'h35 == _T_3[7:0] ? 4'h7 : _GEN_52; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_54 = 8'h36 == _T_3[7:0] ? 4'h7 : _GEN_53; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_55 = 8'h37 == _T_3[7:0] ? 4'h7 : _GEN_54; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_56 = 8'h38 == _T_3[7:0] ? 4'h7 : _GEN_55; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_57 = 8'h39 == _T_3[7:0] ? 4'h7 : _GEN_56; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_58 = 8'h3a == _T_3[7:0] ? 4'h7 : _GEN_57; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_59 = 8'h3b == _T_3[7:0] ? 4'h7 : _GEN_58; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_60 = 8'h3c == _T_3[7:0] ? 4'h7 : _GEN_59; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_61 = 8'h3d == _T_3[7:0] ? 4'h7 : _GEN_60; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_62 = 8'h3e == _T_3[7:0] ? 4'h7 : _GEN_61; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_63 = 8'h3f == _T_3[7:0] ? 4'h7 : _GEN_62; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_64 = 8'h40 == _T_3[7:0] ? 4'h7 : _GEN_63; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_65 = 8'h41 == _T_3[7:0] ? 4'h7 : _GEN_64; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_66 = 8'h42 == _T_3[7:0] ? 4'h7 : _GEN_65; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_67 = 8'h43 == _T_3[7:0] ? 4'h7 : _GEN_66; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_68 = 8'h44 == _T_3[7:0] ? 4'h7 : _GEN_67; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_69 = 8'h45 == _T_3[7:0] ? 4'h7 : _GEN_68; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_70 = 8'h46 == _T_3[7:0] ? 4'h7 : _GEN_69; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_71 = 8'h47 == _T_3[7:0] ? 4'h7 : _GEN_70; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_72 = 8'h48 == _T_3[7:0] ? 4'h7 : _GEN_71; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_73 = 8'h49 == _T_3[7:0] ? 4'h7 : _GEN_72; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_74 = 8'h4a == _T_3[7:0] ? 4'h7 : _GEN_73; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_75 = 8'h4b == _T_3[7:0] ? 4'h7 : _GEN_74; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_76 = 8'h4c == _T_3[7:0] ? 4'h7 : _GEN_75; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_77 = 8'h4d == _T_3[7:0] ? 4'h7 : _GEN_76; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_78 = 8'h4e == _T_3[7:0] ? 4'h7 : _GEN_77; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_79 = 8'h4f == _T_3[7:0] ? 4'h7 : _GEN_78; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_80 = 8'h50 == _T_3[7:0] ? 4'h7 : _GEN_79; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_81 = 8'h51 == _T_3[7:0] ? 4'h7 : _GEN_80; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_82 = 8'h52 == _T_3[7:0] ? 4'h7 : _GEN_81; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_83 = 8'h53 == _T_3[7:0] ? 4'h7 : _GEN_82; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_84 = 8'h54 == _T_3[7:0] ? 4'h7 : _GEN_83; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_85 = 8'h55 == _T_3[7:0] ? 4'h7 : _GEN_84; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_86 = 8'h56 == _T_3[7:0] ? 4'h7 : _GEN_85; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_87 = 8'h57 == _T_3[7:0] ? 4'h7 : _GEN_86; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_88 = 8'h58 == _T_3[7:0] ? 4'h7 : _GEN_87; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_89 = 8'h59 == _T_3[7:0] ? 4'h7 : _GEN_88; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_90 = 8'h5a == _T_3[7:0] ? 4'h7 : _GEN_89; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_91 = 8'h5b == _T_3[7:0] ? 4'h7 : _GEN_90; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_92 = 8'h5c == _T_3[7:0] ? 4'h7 : _GEN_91; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_93 = 8'h5d == _T_3[7:0] ? 4'h7 : _GEN_92; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_94 = 8'h5e == _T_3[7:0] ? 4'h7 : _GEN_93; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_95 = 8'h5f == _T_3[7:0] ? 4'h7 : _GEN_94; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_96 = 8'h60 == _T_3[7:0] ? 4'h7 : _GEN_95; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_97 = 8'h61 == _T_3[7:0] ? 4'h7 : _GEN_96; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_98 = 8'h62 == _T_3[7:0] ? 4'h7 : _GEN_97; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_99 = 8'h63 == _T_3[7:0] ? 4'h7 : _GEN_98; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_100 = 8'h64 == _T_3[7:0] ? 4'h7 : _GEN_99; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_101 = 8'h65 == _T_3[7:0] ? 4'h7 : _GEN_100; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_102 = 8'h66 == _T_3[7:0] ? 4'h7 : _GEN_101; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_103 = 8'h67 == _T_3[7:0] ? 4'h7 : _GEN_102; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_104 = 8'h68 == _T_3[7:0] ? 4'h7 : _GEN_103; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_105 = 8'h69 == _T_3[7:0] ? 4'h7 : _GEN_104; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_106 = 8'h6a == _T_3[7:0] ? 4'h7 : _GEN_105; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_107 = 8'h6b == _T_3[7:0] ? 4'h7 : _GEN_106; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_108 = 8'h6c == _T_3[7:0] ? 4'h7 : _GEN_107; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_109 = 8'h6d == _T_3[7:0] ? 4'h7 : _GEN_108; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_110 = 8'h6e == _T_3[7:0] ? 4'h7 : _GEN_109; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_111 = 8'h6f == _T_3[7:0] ? 4'h7 : _GEN_110; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_112 = 8'h70 == _T_3[7:0] ? 4'h7 : _GEN_111; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_113 = 8'h71 == _T_3[7:0] ? 4'h7 : _GEN_112; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_114 = 8'h72 == _T_3[7:0] ? 4'h7 : _GEN_113; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_115 = 8'h73 == _T_3[7:0] ? 4'h7 : _GEN_114; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_116 = 8'h74 == _T_3[7:0] ? 4'h7 : _GEN_115; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_117 = 8'h75 == _T_3[7:0] ? 4'h7 : _GEN_116; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_118 = 8'h76 == _T_3[7:0] ? 4'h7 : _GEN_117; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_119 = 8'h77 == _T_3[7:0] ? 4'h7 : _GEN_118; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_120 = 8'h78 == _T_3[7:0] ? 4'h7 : _GEN_119; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_121 = 8'h79 == _T_3[7:0] ? 4'h7 : _GEN_120; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_122 = 8'h7a == _T_3[7:0] ? 4'h7 : _GEN_121; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_123 = 8'h7b == _T_3[7:0] ? 4'h7 : _GEN_122; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_124 = 8'h7c == _T_3[7:0] ? 4'h7 : _GEN_123; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_125 = 8'h7d == _T_3[7:0] ? 4'h7 : _GEN_124; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_126 = 8'h7e == _T_3[7:0] ? 4'h7 : _GEN_125; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_127 = 8'h7f == _T_3[7:0] ? 4'h7 : _GEN_126; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_128 = 8'h80 == _T_3[7:0] ? 4'h7 : _GEN_127; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_129 = 8'h81 == _T_3[7:0] ? 4'h7 : _GEN_128; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_130 = 8'h82 == _T_3[7:0] ? 4'h7 : _GEN_129; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_131 = 8'h83 == _T_3[7:0] ? 4'h7 : _GEN_130; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_132 = 8'h84 == _T_3[7:0] ? 4'h7 : _GEN_131; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_133 = 8'h85 == _T_3[7:0] ? 4'h7 : _GEN_132; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_134 = 8'h86 == _T_3[7:0] ? 4'h7 : _GEN_133; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_135 = 8'h87 == _T_3[7:0] ? 4'h7 : _GEN_134; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_136 = 8'h88 == _T_3[7:0] ? 4'h7 : _GEN_135; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_137 = 8'h89 == _T_3[7:0] ? 4'h7 : _GEN_136; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_138 = 8'h8a == _T_3[7:0] ? 4'h7 : _GEN_137; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_139 = 8'h8b == _T_3[7:0] ? 4'h7 : _GEN_138; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_140 = 8'h8c == _T_3[7:0] ? 4'h7 : _GEN_139; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_141 = 8'h8d == _T_3[7:0] ? 4'h7 : _GEN_140; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_142 = 8'h8e == _T_3[7:0] ? 4'h7 : _GEN_141; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_143 = 8'h8f == _T_3[7:0] ? 4'h7 : _GEN_142; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_144 = 8'h90 == _T_3[7:0] ? 4'h7 : _GEN_143; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_145 = 8'h91 == _T_3[7:0] ? 4'h7 : _GEN_144; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_146 = 8'h92 == _T_3[7:0] ? 4'h7 : _GEN_145; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_147 = 8'h93 == _T_3[7:0] ? 4'h7 : _GEN_146; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_148 = 8'h94 == _T_3[7:0] ? 4'h7 : _GEN_147; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_149 = 8'h95 == _T_3[7:0] ? 4'h7 : _GEN_148; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_150 = 8'h96 == _T_3[7:0] ? 4'h7 : _GEN_149; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_151 = 8'h97 == _T_3[7:0] ? 4'h7 : _GEN_150; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_152 = 8'h98 == _T_3[7:0] ? 4'h7 : _GEN_151; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_153 = 8'h99 == _T_3[7:0] ? 4'h7 : _GEN_152; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_154 = 8'h9a == _T_3[7:0] ? 4'h7 : _GEN_153; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_155 = 8'h9b == _T_3[7:0] ? 4'h7 : _GEN_154; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_156 = 8'h9c == _T_3[7:0] ? 4'h7 : _GEN_155; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_157 = 8'h9d == _T_3[7:0] ? 4'h7 : _GEN_156; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_158 = 8'h9e == _T_3[7:0] ? 4'h7 : _GEN_157; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_159 = 8'h9f == _T_3[7:0] ? 4'h7 : _GEN_158; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_160 = 8'ha0 == _T_3[7:0] ? 4'h7 : _GEN_159; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_161 = 8'ha1 == _T_3[7:0] ? 4'h7 : _GEN_160; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_162 = 8'ha2 == _T_3[7:0] ? 4'h7 : _GEN_161; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_163 = 8'ha3 == _T_3[7:0] ? 4'h7 : _GEN_162; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_164 = 8'ha4 == _T_3[7:0] ? 4'h7 : _GEN_163; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_165 = 8'ha5 == _T_3[7:0] ? 4'h7 : _GEN_164; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_166 = 8'ha6 == _T_3[7:0] ? 4'h7 : _GEN_165; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_167 = 8'ha7 == _T_3[7:0] ? 4'h7 : _GEN_166; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_168 = 8'ha8 == _T_3[7:0] ? 4'h7 : _GEN_167; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_169 = 8'ha9 == _T_3[7:0] ? 4'h7 : _GEN_168; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_170 = 8'haa == _T_3[7:0] ? 4'h7 : _GEN_169; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_171 = 8'hab == _T_3[7:0] ? 4'h7 : _GEN_170; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_172 = 8'hac == _T_3[7:0] ? 4'h7 : _GEN_171; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_173 = 8'had == _T_3[7:0] ? 4'h7 : _GEN_172; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_174 = 8'hae == _T_3[7:0] ? 4'h7 : _GEN_173; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_175 = 8'haf == _T_3[7:0] ? 4'h7 : _GEN_174; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_176 = 8'hb0 == _T_3[7:0] ? 4'h7 : _GEN_175; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_177 = 8'hb1 == _T_3[7:0] ? 4'h7 : _GEN_176; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_178 = 8'hb2 == _T_3[7:0] ? 4'h7 : _GEN_177; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_179 = 8'hb3 == _T_3[7:0] ? 4'h7 : _GEN_178; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_180 = 8'hb4 == _T_3[7:0] ? 4'h7 : _GEN_179; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_181 = 8'hb5 == _T_3[7:0] ? 4'h7 : _GEN_180; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_182 = 8'hb6 == _T_3[7:0] ? 4'h7 : _GEN_181; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_183 = 8'hb7 == _T_3[7:0] ? 4'h7 : _GEN_182; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_184 = 8'hb8 == _T_3[7:0] ? 4'h7 : _GEN_183; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_185 = 8'hb9 == _T_3[7:0] ? 4'h7 : _GEN_184; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_186 = 8'hba == _T_3[7:0] ? 4'h7 : _GEN_185; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_187 = 8'hbb == _T_3[7:0] ? 4'h7 : _GEN_186; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_188 = 8'hbc == _T_3[7:0] ? 4'h7 : _GEN_187; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_189 = 8'hbd == _T_3[7:0] ? 4'h7 : _GEN_188; // @[VideoBuffer.scala 30:25]
  wire [3:0] _GEN_190 = 8'hbe == _T_3[7:0] ? 4'h7 : _GEN_189; // @[VideoBuffer.scala 30:25]
  assign io_pixelVal_out = 8'hbf == _T_3[7:0] ? 4'h7 : _GEN_190; // @[VideoBuffer.scala 30:25]
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
      image_0 <= io_pixelVal_in_0;
    end
    if (reset) begin
      image_1 <= 4'h7;
    end else if (io_valid_in) begin
      image_1 <= io_pixelVal_in_1;
    end
    if (reset) begin
      image_2 <= 4'h7;
    end else if (io_valid_in) begin
      image_2 <= io_pixelVal_in_2;
    end
    if (reset) begin
      image_3 <= 4'h7;
    end else if (io_valid_in) begin
      image_3 <= io_pixelVal_in_3;
    end
    if (reset) begin
      image_4 <= 4'h7;
    end else if (io_valid_in) begin
      image_4 <= io_pixelVal_in_4;
    end
    if (reset) begin
      image_5 <= 4'h7;
    end else if (io_valid_in) begin
      image_5 <= io_pixelVal_in_5;
    end
    if (reset) begin
      image_6 <= 4'h7;
    end else if (io_valid_in) begin
      image_6 <= io_pixelVal_in_6;
    end
    if (reset) begin
      image_7 <= 4'h7;
    end else if (io_valid_in) begin
      image_7 <= io_pixelVal_in_7;
    end
  end
endmodule
