package morphinator

import chisel3._
import chisel3.util.Counter

class DotProd(val elements: Int) extends Module {

  val io = IO(
    new Bundle {
      val dataInA     = Input(UInt(8.W))
      val dataInB     = Input(SInt(8.W))

      val dataOut     = Output(SInt(9.W))
      val outputValid = Output(Bool())
    }
  )

  val (countVal, countReset)  = Counter(true.B, elements)
  val accumulator = RegInit(SInt(9.W), 0.S)
  val product = io.dataInA.asSInt * io.dataInB
  accumulator := accumulator + product
  //printf("VALOUT: %d, %d, %d, %d\n", io.dataInA, io.dataInB, product, accumulator)
  io.dataOut := accumulator + product

  when(countReset) { // here on overflow
    io.outputValid := true.B
    accumulator := 0.S

    printf("VALOUTidghspdolgnfgkln\n")
  } .otherwise {
    io.outputValid := false.B
  }
}
