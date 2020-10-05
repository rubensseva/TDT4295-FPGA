// See README.md for license details.

package spi

import chisel3._
import chisel3.util.Decoupled

class SPI extends Module {
  val io = IO(new Bundle {
    val input = Input(UInt (32.W))
    val output = Output(UInt (32.W))
  })

  io.output := io.input
}
