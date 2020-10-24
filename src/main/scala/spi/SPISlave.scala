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

  val edgeDetect = Module(new EdgeDetect)
  edgeDetect.io.din := io.SCLK

  val shiftRegister = Module(new ShiftRegister(8, true))
  shiftRegister.io.in := 0.U

  val currentByte = RegInit(UInt(8.W), 0.U)
  io.CurrentByte := currentByte
}
