package spi

import chisel3.iotesters
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}


class EdgeDetectTest(dut: EdgeDetect) extends PeekPokeTester(dut) {
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


object EdgeDetectTest extends App {
  chisel3. iotesters .Driver (() => new EdgeDetect ()) { c =>
    new EdgeDetectTest (c)
  }
}

