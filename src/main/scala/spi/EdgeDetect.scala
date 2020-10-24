package spi

import chisel3._
import chisel3.util._


/** Chisel module for detecting rising or falling edges
 *
 *  @param fallingEdge if true, detect falling edge, otherwise detect rising edge
 */
class EdgeDetect(fallingEdge: Boolean) extends Module {
  val io = IO(new Bundle{
    val din     = Input(Bool ())  // Input signal
    val edge    = Output(Bool ()) // Boolean indicating edge of input signal
  })

  val stateReg = RegInit(UInt(1.W), 0.U) // Stores previous value of input signal

  io.edge := false.B

  switch (stateReg) {
    // Rising edge detection
    is(0.U) {
      when(io.din) {
        stateReg := 1.U
        if (!fallingEdge) {
          io.edge := true.B
        } 
      }
    }
    // Falling edge detection
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
