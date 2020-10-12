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

  val risingFSM = Module(new RisingFsm)
  risingFSM.io.din := io.SCLK

  val shiftRegister = Module(new ShiftRegister)

  when (io.SS && risingFSM.io.din) {
    shiftRegister.io.in := io.MOSI;
    io.isCurrentlyReading := true.B
  } otherwise {
    io.isCurrentlyReading := false.B
    io.CurrentByte := shiftRegister.out
  }
}
