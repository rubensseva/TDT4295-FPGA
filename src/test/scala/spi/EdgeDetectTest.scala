package spi

import chisel3.iotesters
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}
import org.scalatest._


class EdgeDetectValuesTest(dut: EdgeDetect) extends PeekPokeTester(dut) {
  println("Starting rising edge test")
  poke(dut.io.din, 0)
  step(1)
  expect(dut.io.edge, 0)
  step(1)
  expect(dut.io.edge, 0)
  poke(dut.io.din, 1)
  expect(dut.io.edge, 1)
  step(1)
  expect(dut.io.edge, 0)
  poke(dut.io.din, 1)
  expect(dut.io.edge, 0)
  step(1)
  expect(dut.io.edge, 0)
  step(1)
  expect(dut.io.edge, 0)
  poke(dut.io.din, 0)
  expect(dut.io.edge, 0)
}



class EdgeDetectTests extends FlatSpec with Matchers {
  "When receiving values" should "detect edge" in {
      chisel3.iotesters.Driver (() => new EdgeDetect ()) { c =>
      new EdgeDetectValuesTest(c)
    } should be (true)
  }
}
