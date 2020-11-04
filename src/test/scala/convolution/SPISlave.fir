;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit SPISlave : 
  module EdgeDetect : 
    input clock : Clock
    input reset : Reset
    output io : {flip din : UInt<1>, edge : UInt<1>}
    
    reg stateReg : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[EdgeDetect.scala 17:25]
    io.edge <= UInt<1>("h00") @[EdgeDetect.scala 19:11]
    node _T = eq(UInt<1>("h00"), stateReg) @[Conditional.scala 37:30]
    when _T : @[Conditional.scala 40:58]
      when io.din : @[EdgeDetect.scala 24:20]
        stateReg <= UInt<1>("h01") @[EdgeDetect.scala 25:18]
        skip @[EdgeDetect.scala 24:20]
      skip @[Conditional.scala 40:58]
    else : @[Conditional.scala 39:67]
      node _T_1 = eq(UInt<1>("h01"), stateReg) @[Conditional.scala 37:30]
      when _T_1 : @[Conditional.scala 39:67]
        node _T_2 = eq(io.din, UInt<1>("h00")) @[EdgeDetect.scala 33:13]
        when _T_2 : @[EdgeDetect.scala 33:22]
          stateReg <= UInt<1>("h00") @[EdgeDetect.scala 34:18]
          io.edge <= UInt<1>("h01") @[EdgeDetect.scala 36:19]
          skip @[EdgeDetect.scala 33:22]
        skip @[Conditional.scala 39:67]
    
  module ShiftRegister : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<1>, flip enable : UInt<1>, out : UInt<8>}
    
    wire _T : UInt<1>[8] @[ShiftRegister.scala 21:34]
    _T[0] <= UInt<1>("h00") @[ShiftRegister.scala 21:34]
    _T[1] <= UInt<1>("h00") @[ShiftRegister.scala 21:34]
    _T[2] <= UInt<1>("h00") @[ShiftRegister.scala 21:34]
    _T[3] <= UInt<1>("h00") @[ShiftRegister.scala 21:34]
    _T[4] <= UInt<1>("h00") @[ShiftRegister.scala 21:34]
    _T[5] <= UInt<1>("h00") @[ShiftRegister.scala 21:34]
    _T[6] <= UInt<1>("h00") @[ShiftRegister.scala 21:34]
    _T[7] <= UInt<1>("h00") @[ShiftRegister.scala 21:34]
    reg registers : UInt<1>[8], clock with : (reset => (reset, _T)) @[ShiftRegister.scala 21:26]
    node _T_1 = eq(io.enable, UInt<1>("h01")) @[ShiftRegister.scala 24:18]
    when _T_1 : @[ShiftRegister.scala 24:27]
      registers[0] <= io.in @[ShiftRegister.scala 25:18]
      registers[1] <= registers[0] @[ShiftRegister.scala 27:20]
      registers[2] <= registers[1] @[ShiftRegister.scala 27:20]
      registers[3] <= registers[2] @[ShiftRegister.scala 27:20]
      registers[4] <= registers[3] @[ShiftRegister.scala 27:20]
      registers[5] <= registers[4] @[ShiftRegister.scala 27:20]
      registers[6] <= registers[5] @[ShiftRegister.scala 27:20]
      registers[7] <= registers[6] @[ShiftRegister.scala 27:20]
      skip @[ShiftRegister.scala 24:27]
    node _T_2 = cat(registers[6], registers[7]) @[Cat.scala 29:58]
    node _T_3 = cat(registers[4], registers[5]) @[Cat.scala 29:58]
    node _T_4 = cat(_T_3, _T_2) @[Cat.scala 29:58]
    node _T_5 = cat(registers[2], registers[3]) @[Cat.scala 29:58]
    node _T_6 = cat(registers[0], registers[1]) @[Cat.scala 29:58]
    node _T_7 = cat(_T_6, _T_5) @[Cat.scala 29:58]
    node _T_8 = cat(_T_7, _T_4) @[Cat.scala 29:58]
    node _T_9 = shl(UInt<4>("h0f"), 4) @[Bitwise.scala 102:47]
    node _T_10 = xor(UInt<8>("h0ff"), _T_9) @[Bitwise.scala 102:21]
    node _T_11 = shr(_T_8, 4) @[Bitwise.scala 103:21]
    node _T_12 = and(_T_11, _T_10) @[Bitwise.scala 103:31]
    node _T_13 = bits(_T_8, 3, 0) @[Bitwise.scala 103:46]
    node _T_14 = shl(_T_13, 4) @[Bitwise.scala 103:65]
    node _T_15 = not(_T_10) @[Bitwise.scala 103:77]
    node _T_16 = and(_T_14, _T_15) @[Bitwise.scala 103:75]
    node _T_17 = or(_T_12, _T_16) @[Bitwise.scala 103:39]
    node _T_18 = bits(_T_10, 5, 0) @[Bitwise.scala 102:28]
    node _T_19 = shl(_T_18, 2) @[Bitwise.scala 102:47]
    node _T_20 = xor(_T_10, _T_19) @[Bitwise.scala 102:21]
    node _T_21 = shr(_T_17, 2) @[Bitwise.scala 103:21]
    node _T_22 = and(_T_21, _T_20) @[Bitwise.scala 103:31]
    node _T_23 = bits(_T_17, 5, 0) @[Bitwise.scala 103:46]
    node _T_24 = shl(_T_23, 2) @[Bitwise.scala 103:65]
    node _T_25 = not(_T_20) @[Bitwise.scala 103:77]
    node _T_26 = and(_T_24, _T_25) @[Bitwise.scala 103:75]
    node _T_27 = or(_T_22, _T_26) @[Bitwise.scala 103:39]
    node _T_28 = bits(_T_20, 6, 0) @[Bitwise.scala 102:28]
    node _T_29 = shl(_T_28, 1) @[Bitwise.scala 102:47]
    node _T_30 = xor(_T_20, _T_29) @[Bitwise.scala 102:21]
    node _T_31 = shr(_T_27, 1) @[Bitwise.scala 103:21]
    node _T_32 = and(_T_31, _T_30) @[Bitwise.scala 103:31]
    node _T_33 = bits(_T_27, 6, 0) @[Bitwise.scala 103:46]
    node _T_34 = shl(_T_33, 1) @[Bitwise.scala 103:65]
    node _T_35 = not(_T_30) @[Bitwise.scala 103:77]
    node _T_36 = and(_T_34, _T_35) @[Bitwise.scala 103:75]
    node _T_37 = or(_T_32, _T_36) @[Bitwise.scala 103:39]
    io.out <= _T_37 @[ShiftRegister.scala 32:12]
    
  module SPISlave : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip SPISignals : {SCLK : UInt<1>, MOSI : UInt<1>, SS : UInt<1>}, currentByte : UInt<8>, isCurrentlyReading : UInt<1>}
    
    io.isCurrentlyReading <= UInt<1>("h00") @[SPISlave.scala 16:25]
    inst edgeDetect of EdgeDetect @[SPISlave.scala 18:26]
    edgeDetect.clock <= clock
    edgeDetect.reset <= reset
    edgeDetect.io.din <= io.SPISignals.SCLK @[SPISlave.scala 19:21]
    inst shiftRegister of ShiftRegister @[SPISlave.scala 21:29]
    shiftRegister.clock <= clock
    shiftRegister.reset <= reset
    shiftRegister.io.enable <= UInt<1>("h00") @[SPISlave.scala 22:27]
    shiftRegister.io.in <= UInt<1>("h00") @[SPISlave.scala 23:23]
    io.currentByte <= shiftRegister.io.out @[SPISlave.scala 25:18]
    node _T = eq(io.SPISignals.SS, UInt<1>("h00")) @[SPISlave.scala 29:9]
    when _T : @[SPISlave.scala 29:28]
      io.isCurrentlyReading <= UInt<1>("h01") @[SPISlave.scala 30:27]
      when edgeDetect.io.edge : @[SPISlave.scala 31:31]
        shiftRegister.io.enable <= UInt<1>("h01") @[SPISlave.scala 32:31]
        shiftRegister.io.in <= io.SPISignals.MOSI @[SPISlave.scala 33:27]
        skip @[SPISlave.scala 31:31]
      skip @[SPISlave.scala 29:28]
    
