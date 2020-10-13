package spi

import chisel3._
import chisel3.util._


class ShiftRegister extends Module {
  val io = IO(new Bundle {
    val in        = Input(UInt(1.W))
    val enable    = Input(UInt(1.W))

    val out       = Output(UInt(8.W))
  })

  val r0 = RegInit(UInt(1.W), 0.U)
  val r1 = RegInit(UInt(1.W), 0.U)
  val r2 = RegInit(UInt(1.W), 0.U)
  val r3 = RegInit(UInt(1.W), 0.U)
  val r4 = RegInit(UInt(1.W), 0.U)
  val r5 = RegInit(UInt(1.W), 0.U)
  val r6 = RegInit(UInt(1.W), 0.U)
  val r7 = RegInit(UInt(1.W), 0.U)

  when(io.enable === 1.U) {
    r0 := io.in
    r1 := r0
    r2 := r1
    r3 := r2
    r4 := r3
    r5 := r4
    r6 := r5
    r7 := r6
  }

  io.out := Cat(r0, r1, r2, r3, r4, r5, r6, r7)

  printf("%b\n", io.out)
}
