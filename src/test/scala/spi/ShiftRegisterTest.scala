package morphinator

import chisel3._
import chisel3.iotesters
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}
import org.scalatest._


class ShiftRegisterValuesTest(dut: ShiftRegister) extends PeekPokeTester(dut) {
  println("Starting shift register test")
  poke(dut.io.enable, 0)
  step(3)
  poke(dut.io.enable, 1)
  poke(dut.io.in, 0)
  step(1)
  expect(dut.io.out, 0)
  step(7)
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

class ShiftRegisterMSBFirstValuesTest(dut: ShiftRegister) extends PeekPokeTester(dut) {
  println("Starting shift register MSB first test")
  poke(dut.io.enable, 0)
  step(3)
  poke(dut.io.enable, 1)
  poke(dut.io.in, 0)
  step(1)
  expect(dut.io.out, 0)
  step(7)
  expect(dut.io.out, 0)
  step(1)
  expect(dut.io.out, 0)
  poke(dut.io.in, 1)
  expect(dut.io.out, 0)
  step(1)
  expect(dut.io.out, 1)
  step(1)
  expect(dut.io.out, 3)
  step(1)
  expect(dut.io.out, 7)
  step(1)
  expect(dut.io.out, 15)
  step(1)
  expect(dut.io.out, 31)
  step(1)
  expect(dut.io.out, 63)
  step(1)
  expect(dut.io.out, 127)
  step(1)
  expect(dut.io.out, 255)
  step(1)
  expect(dut.io.out, 255)
  step(1)
  expect(dut.io.out, 255)
  poke(dut.io.in, 0)
  step(1)
  expect(dut.io.out, 254)
  step(1)
  expect(dut.io.out, 252)
  step(1)
  expect(dut.io.out, 248)
  step(1)
  expect(dut.io.out, 240)
  poke(dut.io.in, 1)
  step(1)
  expect(dut.io.out, 225)
  poke(dut.io.in, 1)
  step(1)
  expect(dut.io.out, 195)
  println("Shift register test done")
}


class ShiftRegisterOtherWidthValuesTest(dut: ShiftRegister) extends PeekPokeTester(dut) {
  println("Starting shift other width register test")
  poke(dut.io.enable, 0)
  step(3)
  poke(dut.io.enable, 1)
  poke(dut.io.in, 0)
  step(1)
  expect(dut.io.out, 0)
  step(7)
  expect(dut.io.out, 0)
  poke(dut.io.in, 1)
  expect(dut.io.out, 0)
  step(1)
  expect(dut.io.out, 4096)
  step(1)
  expect(dut.io.out, 6144)
  step(1)
  expect(dut.io.out, 7168)
  step(1)
  expect(dut.io.out, 7680)
  step(1)
  expect(dut.io.out, 7936)
  step(1)
  expect(dut.io.out, 8064)
  step(1)
  expect(dut.io.out, 8128)
  step(1)
  expect(dut.io.out, 8160)
  step(1)
  expect(dut.io.out, 8176)
  step(1)
  expect(dut.io.out, 8184)
  step(1)
  expect(dut.io.out, 8188)
  step(1)
  expect(dut.io.out, 8190)
  step(1)
  expect(dut.io.out, 8191)
  step(1)
  expect(dut.io.out, 8191)
  step(1)
  expect(dut.io.out, 8191)
  step(1)
  expect(dut.io.out, 8191)
  step(1)
  expect(dut.io.out, 8191)
  poke(dut.io.in, 0)
  step(1)
  expect(dut.io.out, 4095)
  step(1)
  expect(dut.io.out, 2047)
  step(1)
  expect(dut.io.out, 1023)
  poke(dut.io.in, 1)
  step(1)
  expect(dut.io.out, 4607)
  poke(dut.io.in, 1)
  step(1)
  expect(dut.io.out, 6399)
  println("Shift register test done")
}

class ShiftRegisterDisabledStoreTest(dut: ShiftRegister) extends PeekPokeTester(dut) {
  println("Starting shift store disable test")
  poke(dut.io.enable, 0)
  step(3)
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
  step(3)
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
  "When LSB first, width of 8, enable is true and receiving input" should "store correct values" in {
      chisel3.iotesters.Driver (() => new ShiftRegister (8, false)) { c =>
      new ShiftRegisterValuesTest(c)
    } should be (true)
  }
  "When LSB first, width of 13, enable is true and receiving input" should "store correct values" in {
      chisel3.iotesters.Driver (() => new ShiftRegister (13, false)) { c =>
      new ShiftRegisterOtherWidthValuesTest(c)
    } should be (true)
  }
  "When LSB first, width of 8, enable is false and receiving input" should "not store anything" in {
      chisel3.iotesters.Driver (() => new ShiftRegister (8, false)) { c =>
      new ShiftRegisterDisabledStoreTest(c)
    } should be (true)
  }
  "When LSB first, width of 8, previously received data but enable is false" should "not shift input" in {
      chisel3.iotesters.Driver (() => new ShiftRegister (8, false)) { c =>
      new ShiftRegisterDisableShiftTest(c)
    } should be (true)
  }
  "When MSB first, width of 8, enable is true and receiving input" should "store correct values" in {
      chisel3.iotesters.Driver (() => new ShiftRegister (8, true)) { c =>
      new ShiftRegisterMSBFirstValuesTest(c)
    } should be (true)
  }
}

