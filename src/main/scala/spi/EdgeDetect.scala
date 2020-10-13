package spi

import chisel3._
import chisel3.util._


class EdgeDetect extends Module {
  val io = IO(new Bundle{
    val din = Input(Bool ())
    val edge = Output(Bool ())
  })
  // The two states
  val zero :: one :: Nil = Enum (2)
  // The state register
  val stateReg = RegInit(zero)
  // default value for output
  io.edge := false.B
  // Next state and output logic
  // CURRENTLY: Rising edge detection
  switch (stateReg) {
    is(zero) {
      when(io.din) {
        stateReg := one
        io.edge := true.B
      }
    }
    is(one) {
      when (!io.din) {
        stateReg := zero
      }
    }
  }
}
