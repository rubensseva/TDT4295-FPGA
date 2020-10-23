package spi

import chisel3._
import chisel3.iotesters
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}
import org.scalatest._


class ShiftRegisterValuesTest(dut: ShiftRegister) extends PeekPokeTester(dut) {
  println("Starting shift register test")
  poke(dut.io.enable, 0)
  step(1)
  step(1)
  step(1)
  poke(dut.io.enable, 1)
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

class ShiftRegisterDisabledStoreTest(dut: ShiftRegister) extends PeekPokeTester(dut) {
  println("Starting shift store disable test")
  poke(dut.io.enable, 0)
  step(1)
  step(1)
  step(1)
  poke(dut.io.in, 1)
  step(1)
  expect(dut.io.out, 0)
  step(1)
  expect(dut.io.out, 0)
  step(1)
  expect(dut.io.out, 0)
  poke(dut.io.in, 0)
  step(1)
  expect(dut.io.out, 0)
  poke(dut.io.in, 1)
  step(1)
  expect(dut.io.out, 0)
  step(1)
  expect(dut.io.out, 0)
}

class ShiftRegisterDisableShiftTest(dut: ShiftRegister) extends PeekPokeTester(dut) {
  println("Starting shift register shift disable test")
  poke(dut.io.enable, 0)
  step(1)
  step(1)
  step(1)
  poke(dut.io.enable, 1)
  poke(dut.io.in, 1)
  expect(dut.io.out, 0)
  step(1)
  expect(dut.io.out, 128)
  step(1)
  expect(dut.io.out, 192)
  poke(dut.io.enable, 0)
  step(1)
  expect(dut.io.out, 192)
  step(1)
  expect(dut.io.out, 192)
  step(1)
  expect(dut.io.out, 192)
}


class ShiftRegisterTests extends FlatSpec with Matchers {
  "When enable is true and receiving input" should "store correct values" in {
      chisel3.iotesters.Driver (() => new ShiftRegister ()) { c =>
      new ShiftRegisterValuesTest(c)
    } should be (true)
  }
  "When enable is false and receiving input" should "not store anything" in {
      chisel3.iotesters.Driver (() => new ShiftRegister ()) { c =>
      new ShiftRegisterDisabledStoreTest(c)
    } should be (true)
  }
  "When previously received data but enable is false" should "not shift input" in {
      chisel3.iotesters.Driver (() => new ShiftRegister ()) { c =>
      new ShiftRegisterDisableShiftTest(c)
    } should be (true)
  }
}

