package spi

import chisel3._
import chisel3.iotesters
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}
import org.scalatest._


class SPISlaveSimpleTest(dut: SPISlave) extends PeekPokeTester(dut) {
  println("Starting SPISlave simple test")
  poke(dut.io.SCLK, 0);
  poke(dut.io.SS, 1);
  step(5);

  // 1
  poke (dut.io.SS, 0);
  poke(dut.io.SCLK, 1);
  poke(dut.io.MOSI, 1);
  step(3); 
  poke(dut.io.SCLK, 0);
  step(3);

  // 2
  poke(dut.io.SCLK, 1);
  poke(dut.io.MOSI, 0);
  step(3);
  poke(dut.io.SCLK, 0);
  step(3);

  // 3
  poke(dut.io.SCLK, 1);
  step(3);
  poke(dut.io.SCLK, 0);
  step(3);

  // 4
  poke(dut.io.SCLK, 1);
  step(3);
  poke(dut.io.SCLK, 0);
  step(3);
  
  // 5
  poke(dut.io.SCLK, 1);
  step(3);
  poke(dut.io.SCLK, 0);
  step(3);

  // 6
  poke(dut.io.SCLK, 1);
  step(3);
  poke(dut.io.SCLK, 0);
  step(3);

  // 7
  poke(dut.io.SCLK, 1);
  step(3);
  poke(dut.io.SCLK, 0);
  step(3);

  // 8
  poke(dut.io.SCLK, 1);
  step(3);
  poke(dut.io.SCLK, 0);
  step(3);

  
  poke(dut.io.SS, 1);
  expect(dut.io.CurrentByte, 128);
}

class SPISlaveValuesTest(dut: SPISlave) extends PeekPokeTester(dut) {
  println("Starting SPISlave values test")
  poke(dut.io.SCLK, 0);
  poke(dut.io.SS, 1);
  step(5);

  // 1
  poke (dut.io.SS, 0);
  poke(dut.io.SCLK, 1);
  poke(dut.io.MOSI, 0);
  step(3); 
  poke(dut.io.SCLK, 0); 
  step(3);

  // 2
  poke(dut.io.SCLK, 1);
  poke(dut.io.MOSI, 1);
  step(3);
  poke(dut.io.SCLK, 0);
  step(3);

  // 3
  poke(dut.io.SCLK, 1);
  poke(dut.io.MOSI, 0);
  step(3);
  poke(dut.io.SCLK, 0);
  step(3);

  // 4
  poke(dut.io.SCLK, 1);
  step(3);
  poke(dut.io.SCLK, 0);
  step(3);
  
  // 5
  poke(dut.io.SCLK, 1);
  step(3);
  poke(dut.io.SCLK, 1);
  step(3);

  // 6
  poke(dut.io.SCLK, 1);
  step(3);
  poke(dut.io.SCLK, 0);
  step(3);

  // 7
  poke(dut.io.SCLK, 1);
  step(3);
  poke(dut.io.SCLK, 1);
  step(3);

  // 8
  poke(dut.io.SCLK, 1);
  step(3);
  poke(dut.io.SCLK, 1);
  step(3);

  
  poke(dut.io.SS, 1);
  expect(dut.io.CurrentByte, 67);
}

class SPISlaveSlowClockTest(dut: SPISlave) extends PeekPokeTester(dut) {
  println("Starting SPISlave slow clock test")
  poke(dut.io.SCLK, 0);
  poke(dut.io.SS, 1);
  step(100000);

  // 1
  poke (dut.io.SS, 0);
  poke(dut.io.SCLK, 1);
  poke(dut.io.MOSI, 0);
  step(10000); 
  poke(dut.io.SCLK, 0); 
  step(10000);

  // 2
  poke(dut.io.SCLK, 1);
  poke(dut.io.MOSI, 1);
  step(10000);
  poke(dut.io.SCLK, 0);
  step(1000);

  // 3
  poke(dut.io.SCLK, 1);
  poke(dut.io.MOSI, 0);
  step(10000);
  poke(dut.io.SCLK, 0);
  step(10000);

  // 4
  poke(dut.io.SCLK, 1);
  step(10000);
  poke(dut.io.SCLK, 0);
  step(10000);
  
  // 5
  poke(dut.io.SCLK, 1);
  step(10000);
  poke(dut.io.SCLK, 1);
  step(10000);

  // 6
  poke(dut.io.SCLK, 1);
  step(10000);
  poke(dut.io.SCLK, 0);
  step(10000);

  // 7
  poke(dut.io.SCLK, 1);
  step(10000);
  poke(dut.io.SCLK, 1);
  step(10000);

  // 8
  poke(dut.io.SCLK, 1);
  step(10000);
  poke(dut.io.SCLK, 1);
  step(10000);

  
  poke(dut.io.SS, 1);
  expect(dut.io.CurrentByte, 67);
}

class SPISlaveFastClockTest(dut: SPISlave) extends PeekPokeTester(dut) {
  println("Starting SPISlave fast clock test")
  poke(dut.io.SCLK, 0);
  poke(dut.io.SS, 1);
  step(1);

  // 1
  poke (dut.io.SS, 0);
  poke(dut.io.SCLK, 1);
  poke(dut.io.MOSI, 0);
  step(2);
  poke(dut.io.SCLK, 0);
  step(2);

  // 2
  poke(dut.io.SCLK, 1);
  poke(dut.io.MOSI, 1);
  step(2);
  poke(dut.io.SCLK, 0);
  step(2);

  // 3
  poke(dut.io.SCLK, 1);
  poke(dut.io.MOSI, 0);
  step(2);
  poke(dut.io.SCLK, 0);
  step(2);

  // 4
  poke(dut.io.SCLK, 1);
  step(2);
  poke(dut.io.SCLK, 0);
  step(2);
  
  // 5
  poke(dut.io.SCLK, 1);
  step(2);
  poke(dut.io.SCLK, 1);
  step(2);

  // 6
  poke(dut.io.SCLK, 1);
  step(2);
  poke(dut.io.SCLK, 0);
  step(2);

  // 7
  poke(dut.io.SCLK, 1);
  step(2);
  poke(dut.io.SCLK, 1);
  step(2);

  // 8
  poke(dut.io.SCLK, 1);
  step(2);
  poke(dut.io.SCLK, 1);
  step(2);

  
  poke(dut.io.SS, 1);
  expect(dut.io.CurrentByte, 67);
}

class SPISlaveDisabledSimpleTest(dut: SPISlave) extends PeekPokeTester(dut) {
  println("Starting SPISlave disabled simple test")
  poke(dut.io.SCLK, 0);
  poke(dut.io.SS, 1);
  step(5);

  // 1
  poke (dut.io.SS, 1);
  poke(dut.io.SCLK, 1);
  poke(dut.io.MOSI, 1);
  step(3); 
  poke(dut.io.SCLK, 0);
  step(3);

  // 2
  poke(dut.io.SCLK, 1);
  poke(dut.io.MOSI, 0);
  step(3);
  poke(dut.io.SCLK, 0);
  step(3);

  // 3
  poke(dut.io.SCLK, 1);
  step(3);
  poke(dut.io.SCLK, 0);
  step(3);

  // 4
  poke(dut.io.SCLK, 1);
  step(3);
  poke(dut.io.SCLK, 0);
  step(3);
  
  // 5
  poke(dut.io.SCLK, 1);
  step(3);
  poke(dut.io.SCLK, 0);
  step(3);

  // 6
  poke(dut.io.SCLK, 1);
  step(3);
  poke(dut.io.SCLK, 0);
  step(3);

  // 7
  poke(dut.io.SCLK, 1);
  step(3);
  poke(dut.io.SCLK, 0);
  step(3);

  // 8
  poke(dut.io.SCLK, 1);
  step(3);
  poke(dut.io.SCLK, 0);
  step(3);

  
  poke(dut.io.SS, 1);
  expect(dut.io.CurrentByte, 0);
}


class SPISlaveTests extends FlatSpec with Matchers {
  "When master is sending 128" should "should output 128" in {
      chisel3.iotesters.Driver (() => new SPISlave) { c =>
      new SPISlaveSimpleTest(c)
    } should be (true)
  }
  "When master is sending 128 but SS is always high" should "not store anything" in {
      chisel3.iotesters.Driver (() => new SPISlave) { c =>
      new SPISlaveDisabledSimpleTest(c)
    } should be (true)
  }
  "When master is sending 67" should "should output 67" in {
      chisel3.iotesters.Driver (() => new SPISlave) { c =>
      new SPISlaveValuesTest(c)
    } should be (true)
  }
  "When master is sending 67, and clock is really slow" should "should still output 67" in {
      chisel3.iotesters.Driver (() => new SPISlave) { c =>
      new SPISlaveSlowClockTest(c)
    } should be (true)
  }
  "When master is sending 67, and clock is as fast as allowed" should "should still output 67" in {
      chisel3.iotesters.Driver (() => new SPISlave) { c =>
      new SPISlaveFastClockTest(c)
    } should be (true)
  }
}

