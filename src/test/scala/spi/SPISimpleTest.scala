// See README.md for license details.

package spi

import java.io.File

import chisel3.iotesters
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}


class DelayedCycelDevTester(dut: DelayedCycleDev) extends PeekPokeTester(dut) {
  println("poke");
  poke(dut.io.testIn, 3)
  println("Prev clk: " + peek(dut.io.testPrevVal).toString)
  println("Curr clk: " + peek(dut.io.testCurrVal).toString)
  println("step");
  step (1)
  println("Prev clk: " + peek(dut.io.testPrevVal).toString)
  println("Curr clk: " + peek(dut.io.testCurrVal).toString)
  println("poke");
  poke(dut.io.testIn, 6)
  println("Prev clk: " + peek(dut.io.testPrevVal).toString)
  println("Curr clk: " + peek(dut.io.testCurrVal).toString)
  println("step");
  step (1)
  println("Prev clk: " + peek(dut.io.testPrevVal).toString)
  println("Curr clk: " + peek(dut.io.testCurrVal).toString)

}


object DelayedCycelDevTester extends App {
  chisel3. iotesters .Driver (() => new DelayedCycleDev ()) { c =>
    new DelayedCycelDevTester (c)
  }
}

