package morphinator

import chisel3._
import chisel3.iotesters.PeekPokeTester
import chisel3.iotesters
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}
import org.scalatest._

class FilterSpec extends FlatSpec with Matchers {
  import FilterTests._

  val parallelPixels = 8

  behavior of "FilterSpec"
  it should "Filter" in {
    chisel3.iotesters.Driver.execute(Array("--generate-vcd-output", "on", "--backend-name", "verilator"), () => new Filter(parallelPixels)) { c =>
        new IdentityTest(c)
      } should be(true)
  }
}

// normal:
    // chisel3.iotesters.Driver (() => new Filter(parallelPixels)) { c =>
// waveform output :
    // chisel3.iotesters.Driver.execute(Array("--generate-vcd-output", "on", "--backend-name", "treadle"), () => new Filter(parallelPixels)) { c =>
// verilog and waveform:
    // chisel3.iotesters.Driver.execute(Array("--generate-vcd-output", "on", "--backend-name", "verilator"), () => new Filter(parallelPixels)) { c =>
    
// can also run a main function:
//
//   object Filter extends App {
//      chisel3.Driver.execute(args, () => new Filter)
//   }
//
// then in sbt:
//   run --backend-name verilator

object FilterTests {

  class IdentityTest(c: Filter) extends PeekPokeTester(c) {

    val kernelSize = 3

    val imageWidth = 64
    val imageHeight = 48

    /*poke(c.io.SPI_filterIndex, 0.U)

    val image: List[UInt] = List( 
        0.U(4.W), 0.U(4.W), 0.U(4.W), 0.U(4.W), 0.U(4.W), 0.U(4.W),
        0.U(4.W), 0.U(4.W), 0.U(4.W), 0.U(4.W), 0.U(4.W), 0.U(4.W),
        0.U(4.W), 0.U(4.W), 15.U(4.W), 15.U(4.W), 15.U(4.W), 0.U(4.W),
        0.U(4.W), 0.U(4.W), 15.U(4.W), 15.U(4.W), 15.U(4.W), 0.U(4.W),
        0.U(4.W), 0.U(4.W), 15.U(4.W), 15.U(4.W), 15.U(4.W), 0.U(4.W),
        0.U(4.W), 0.U(4.W), 0.U(4.W), 0.U(4.W), 0.U(4.W), 0.U(4.W)
    )*/

    /*poke(c.io.SPI_filterIndex, 1.U)

    val image: List[UInt] = List( 
        0.U(4.W), 0.U(4.W), 0.U(4.W), 0.U(4.W), 0.U(4.W), 0.U(4.W),
        0.U(4.W), 1.U(4.W), 3.U(4.W), 5.U(4.W), 3.U(4.W), 1.U(4.W),
        0.U(4.W), 3.U(4.W), 6.U(4.W), 10.U(4.W), 6.U(4.W), 3.U(4.W),
        0.U(4.W), 5.U(4.W), 10.U(4.W), 15.U(4.W), 10.U(4.W), 5.U(4.W),
        0.U(4.W), 3.U(4.W), 6.U(4.W), 10.U(4.W), 6.U(4.W), 3.U(4.W),
        0.U(4.W), 1.U(4.W), 3.U(4.W), 5.U(4.W), 3.U(4.W), 1.U(4.W)
    )*/

    /*poke(c.io.SPI_filterIndex, 3.U)

    val image: List[UInt] = List( 
        0.U(4.W), 0.U(4.W), 0.U(4.W), 0.U(4.W), 0.U(4.W), 0.U(4.W),
        0.U(4.W), 0.U(4.W), 0.U(4.W), 0.U(4.W), 0.U(4.W), 0.U(4.W),
        0.U(4.W), 0.U(4.W), 15.U(4.W), 15.U(4.W), 15.U(4.W), 0.U(4.W),
        0.U(4.W), 0.U(4.W), 15.U(4.W), 15.U(4.W), 15.U(4.W), 0.U(4.W),
        0.U(4.W), 0.U(4.W), 15.U(4.W), 15.U(4.W), 15.U(4.W), 0.U(4.W),
        0.U(4.W), 0.U(4.W), 0.U(4.W), 0.U(4.W), 0.U(4.W), 0.U(4.W)
    )*/

    poke(c.io.SPI_invert, false.B)
    poke(c.io.SPI_distort, false.B)

    /*println("running filter...................")
    step(kernelSize * kernelSize - 1)
    for(i <- 0 until c.parallelPixels){
      expect(c.io.pixelVal_out(i), image(i))
    }
    for(j <- 1 until imageWidth * imageHeight / c.parallelPixels){
      step(kernelSize * kernelSize)
      for(i <- 0 until c.parallelPixels){
        expect(c.io.pixelVal_out(i), image(c.parallelPixels * j + i))
      }
    }*/
  }
}
