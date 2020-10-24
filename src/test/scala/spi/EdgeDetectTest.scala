package spi

import chisel3.iotesters
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}
import org.scalatest._


class EdgeDetectRisingEdgeTest(dut: EdgeDetect) extends PeekPokeTester(dut) {
  println("Starting rising edge test")
  poke(dut.io.din, 0)
  step(5)
  expect(dut.io.edge, 0)
  step(1)
  expect(dut.io.edge, 0)
  poke(dut.io.din, 1)
  expect(dut.io.edge, 1)
  println("Should be 1 " + peek(dut.io.edge).toString(10))
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
  step(10)
  expect(dut.io.edge, 0)
}

class EdgeDetectFallingEdgeTest(dut: EdgeDetect) extends PeekPokeTester(dut) {
  println("Starting rising edge test")
  poke(dut.io.din, 0)
  step(5)
  expect(dut.io.edge, 0)
  step(1)
  poke(dut.io.din, 1)
  expect(dut.io.edge, 0)
  step(1)
  expect(dut.io.edge, 0)
  step(1)
  poke(dut.io.din, 0)
  expect(dut.io.edge, 1)
  step(1)
  expect(dut.io.edge, 0)
  step(10)
  expect(dut.io.edge, 0)
}



class EdgeDetectTests extends FlatSpec with Matchers {
    "When in rising edge config and receiving values" should "only detect rising edge" in {
      chisel3.iotesters.Driver (() => new EdgeDetect (false)) { c =>
      new EdgeDetectRisingEdgeTest(c)
    } should be (true)
  }
  "When in falling edge config receiving values" should "only detect falling edge" in {
      chisel3.iotesters.Driver (() => new EdgeDetect (true)) { c =>
      new EdgeDetectFallingEdgeTest(c)
    } should be (true)
  }
}
