package spi

import chisel3._
import chisel3.util._


// fallingEdge param is just for which edge to detect. If it is false, EdgeDetect will
// detect on rising edge instead.
class EdgeDetect(fallingEdge: Boolean) extends Module {
  val io = IO(new Bundle{
    val din = Input(Bool ())
    val edge = Output(Bool ())
  })

  val stateReg = RegInit(UInt(1.W), 0.U)

  io.edge := false.B

  switch (stateReg) {
    is(0.U) {
      when(io.din) {
        stateReg := 1.U
        if (!fallingEdge) {
          io.edge := true.B
        } 
      }
    }
    is(1.U) {
      when (!io.din) {
        stateReg := 0.U
        if (fallingEdge) {
          io.edge := true.B
        } 
      }
    }
  }
}
