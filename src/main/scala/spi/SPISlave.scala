package morphinator

import chisel3._
import chisel3.util._

/** Chisel module for SPI slave
 */
class SPISlave extends Module {
  val io = IO(new Bundle{
    val SPISignals          = Input(new SPISignals)

    val currentByte         = Output(UInt(8.W)) // The current byte that is read
    val isCurrentlyReading  = Output(UInt(1.W)) // Are we currently reading something into CurrentByte
  })

  io.isCurrentlyReading := 0.U

  val edgeDetect = Module(new EdgeDetect(true))
  edgeDetect.io.din := io.SPISignals.SCLK

  val shiftRegister = Module(new ShiftRegister(8, true))
  shiftRegister.io.enable := 0.U
  shiftRegister.io.in := 0.U

  io.currentByte := shiftRegister.io.out

  // When slave select is low, use edge detect and shift register modules
  // to read from MOSI at appropriate times, and store result in shift register
  when (!io.SPISignals.SS) {
    io.isCurrentlyReading := 1.U
    when (edgeDetect.io.edge) {
      shiftRegister.io.enable := 1.U
      shiftRegister.io.in := io.SPISignals.MOSI
    }
  }
}

object SPISlave extends App {
  chisel3.Driver.execute(args, () => new SPISlave)
}
