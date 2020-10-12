package spi

import chisel3._
import chisel3.util._


class ShiftRegister extends Module {
  val io = IO(new Bundle {
    val in  = Input(UInt(1.W))
    val out = Output(UInt(8.W))
  })

  val r0 = RegNext(io.in, 0.U)
  val r1 = RegNext(r0, 0.U)
  val r2 = RegNext(r1, 0.U)
  val r3 = RegNext(r2, 0.U)
  val r4 = RegNext(r3, 0.U)
  val r5 = RegNext(r4, 0.U)
  val r6 = RegNext(r5, 0.U)
  val r7 = RegNext(r6, 0.U)
  io.out := Cat(r0, r1, r2, r3, r4, r5, r6, r7)

  printf("%b\n", io.out)
}


