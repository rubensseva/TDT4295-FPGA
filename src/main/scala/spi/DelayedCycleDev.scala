// See README.md for license details.

package spi

import chisel3._
import chisel3.util.Decoupled

class DelayedCycleDev extends Module {
  val io = IO(new Bundle {
    val testIn = Input(UInt (32.W))
    val testPrevVal = Output(UInt (32.W))
    val testCurrVal = Output(UInt (32.W))
  })

  val prevValReg = RegInit (0.U(32.W))

  prevValReg := io.testIn

  io.testPrevVal := prevValReg

  io.testCurrVal := io.testIn

  printf("io.testIn: %d preValReg: %d io.testPrevVal %d\n", io.testIn, prevValReg, io.testPrevVal)
}
