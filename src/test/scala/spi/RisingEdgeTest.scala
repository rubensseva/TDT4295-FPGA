package spi

import chisel3.iotesters
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}


class RisingEdgeTest(dut: RisingFsm) extends PeekPokeTester(dut) {
  println("Starting rising edge test")
  poke(dut.io.din, 0)
  step(1)
  expect(dut.io.risingEdge, 0)
  step(1)
  expect(dut.io.risingEdge, 0)
  poke(dut.io.din, 1)
  expect(dut.io.risingEdge, 1)
  step(1)
  expect(dut.io.risingEdge, 0)
  poke(dut.io.din, 1)
  expect(dut.io.risingEdge, 0)
  step(1)
  expect(dut.io.risingEdge, 0)
  step(1)
  expect(dut.io.risingEdge, 0)
  poke(dut.io.din, 0)
  expect(dut.io.risingEdge, 0)
}


object RisingEdgeTest extends App {
  chisel3. iotesters .Driver (() => new RisingFsm ()) { c =>
    new RisingEdgeTest (c)
  }
}

