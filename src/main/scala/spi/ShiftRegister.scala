package spi

import chisel3._
import chisel3.util._


class ShiftRegister(width: Int, MSBFirst: Boolean) extends Module {
  val io = IO(new Bundle {
    val in        = Input(UInt(1.W))
    val enable    = Input(UInt(1.W))

    val out       = Output(UInt(width.W))
  })

  val registers = RegInit(VecInit(Seq.fill(width)(0.U(1.W))))
  when(io.enable === 1.U) {
    registers(0) := io.in
    for (i <- 1 to (width - 1)) {
      registers(i) := registers(i - 1)
    }
  }

  if (MSBFirst) {
    io.out := Reverse(Cat(registers))
  } else {
    io.out := Cat(registers)
  }

  printf("%b\n", io.out)
}
