package morphinator

import chisel3._
import chisel3.util._

/** Chisel module for interfacing through SPI
 */
class SPIInterfacer extends Module {
  val io = IO(new Bundle{
    val currentByte = Input(UInt(8.W))
    val isCurrentlyReading = Input(UInt(1.W))

    val out  = Output(UInt(8.W)) 
  })

  io.out := 0.U;

  when (!io.isCurrentlyReading) {
    io.out := io.currentByte
  }
}
