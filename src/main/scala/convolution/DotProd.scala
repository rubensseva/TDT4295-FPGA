package morphinator

import chisel3._
import chisel3.util.Counter

class DotProd(val elements: Int) extends Module {

  val io = IO(
    new Bundle {
      val dataInA     = Input(UInt(4.W))
      val dataInB     = Input(SInt(5.W))

      val dataOut     = Output(UInt(4.W))
      val outputValid = Output(Bool())
    }
  )

  val (countVal, countReset)  = Counter(true.B, elements)
  val accumulator = RegInit(SInt(8.W), 0.S)
  val product = io.dataInA.asSInt * io.dataInB
  accumulator := accumulator + product
  when(accumulator + product < 0.S)  {
    io.dataOut := 0.U 
  } .elsewhen (accumulator + product > 15.S) {
    io.dataOut := 15.U 
  }.otherwise {
    io.dataOut := (accumulator + product).asUInt
  }

  when(countReset) { // here on overflow
    io.outputValid := true.B
    accumulator := 0.S
  } .otherwise {
    io.outputValid := false.B
  }
}
