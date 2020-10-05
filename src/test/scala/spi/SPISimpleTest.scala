// See README.md for license details.

package spi

import java.io.File

import chisel3.iotesters
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}


class SPISimpleTester(dut: SPI) extends PeekPokeTester(dut) {
  poke(dut.io.input, 5)
  step (1)
  println("Result is: " + peek(dut.io.output).toString)
}


object SPISimpleTester extends App {
  chisel3. iotesters .Driver (() => new SPI ()) { c =>
    new SPISimpleTester (c)
  }
}

