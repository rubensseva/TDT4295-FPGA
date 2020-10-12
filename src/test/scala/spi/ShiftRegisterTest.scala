package spi

import chisel3.iotesters
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}


class ShiftRegisterTest(dut: ShiftRegister) extends PeekPokeTester(dut) {
  println("Starting shift register test")
  poke(dut.io.in, 0)
  step(1)
  expect(dut.io.out, 0)
  step(1)
  expect(dut.io.out, 0)
  step(1)
  expect(dut.io.out, 0)
  step(1)
  expect(dut.io.out, 0)
  step(1)
  expect(dut.io.out, 0)
  step(1)
  expect(dut.io.out, 0)
  step(1)
  expect(dut.io.out, 0)
  step(1)
  expect(dut.io.out, 0)
  step(1)
  expect(dut.io.out, 0)
  step(1)
  expect(dut.io.out, 0)
  poke(dut.io.in, 1)
  expect(dut.io.out, 0)
  step(1)
  expect(dut.io.out, 128)
  step(1)
  expect(dut.io.out, 192)
  step(1)
  expect(dut.io.out, 224)
  step(1)
  expect(dut.io.out, 240)
  step(1)
  expect(dut.io.out, 248)
  step(1)
  expect(dut.io.out, 252)
  step(1)
  expect(dut.io.out, 254)
  step(1)
  expect(dut.io.out, 255)
  step(1)
  expect(dut.io.out, 255)
  step(1)
  expect(dut.io.out, 255)
  poke(dut.io.in, 0)
  step(1)
  expect(dut.io.out, 127)
  step(1)
  expect(dut.io.out, 63)
  step(1)
  expect(dut.io.out, 31)
  step(1)
  expect(dut.io.out, 15)
  poke(dut.io.in, 1)
  step(1)
  expect(dut.io.out, 135)
  poke(dut.io.in, 1)
  step(1)
  expect(dut.io.out, 195)
  println("Shift register test done")
}


object ShiftRegisterTest extends App {
  chisel3. iotesters .Driver (() => new ShiftRegister ()) { c =>
    new ShiftRegisterTest (c)
  }
}

