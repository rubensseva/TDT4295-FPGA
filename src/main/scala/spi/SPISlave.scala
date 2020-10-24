package spi

import chisel3._
import chisel3.util._

class SPISlave extends Module {
  val io = IO(new Bundle{
    val SCLK  = Input(UInt(1.W))
    val MOSI  = Input(UInt(1.W))
    val MISO  = Input(UInt(1.W))
    val SS    = Input(UInt(1.W))
    val CurrentByte = Output(UInt(8.W))
    val isCurrentlyReading = Output(UInt(1.W))
  })

  io.isCurrentlyReading := 0.U

  val edgeDetect = Module(new EdgeDetect(true))
  edgeDetect.io.din := io.SCLK

  val shiftRegister = Module(new ShiftRegister(8, true))
  shiftRegister.io.enable := 0.U
  shiftRegister.io.in := 0.U

  io.CurrentByte := shiftRegister.io.out

  when (!io.SS) {
    io.isCurrentlyReading := 1.U
    when (edgeDetect.io.edge) {
      printf("Edge detected!\n")
      shiftRegister.io.enable := 1.U
      shiftRegister.io.in := io.MOSI
    }
  }
}
