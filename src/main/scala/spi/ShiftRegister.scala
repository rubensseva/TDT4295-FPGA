package spi

import chisel3._
import chisel3.util._


/** Chisel module for a generalized shift register
 * 
 * @param width    Width of shift register
 * @param MSBFirst Direction of bits and shift. If true, bits will be shifted to the left.
 */
class ShiftRegister(width: Int, MSBFirst: Boolean) extends Module {
  val io = IO(new Bundle {
    val in        = Input(UInt(1.W))      // The current bit to insert
    val enable    = Input(UInt(1.W))      // Enable input and shifting

    val out       = Output(UInt(width.W)) // Output bits 
  })

  // Initialize vector of `width` length with registers of 1 bit length and init value 0
  val registers = RegInit(VecInit(Seq.fill(width)(0.U(1.W))))

  // Store input, and perform shift 
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
}
