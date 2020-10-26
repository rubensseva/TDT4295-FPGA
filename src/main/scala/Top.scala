package morphinator

import chisel3._
import chisel3.util._

class Top extends Module {
  val io = IO(new Bundle{
    val SPISignals          = Input(new SPISignals)

  })

  val spiSlave = Module(new SPISlave)
  spiSlave.io.SPISignals := io.SPISignals

  val spiInterfacer = Module(new SPIInterfacer)
  spiInterfacer.io.currentByte := spiSlave.io.currentByte
  spiInterfacer.io.isCurrentlyReading := spiSlave.io.isCurrentlyReading

}
