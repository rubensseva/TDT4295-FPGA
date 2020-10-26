package morphinator

import chisel3._
import chisel3.iotesters.PeekPokeTester
import chisel3.iotesters
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}
import org.scalatest._

class FilterSpec extends FlatSpec with Matchers {
  import FilterTests._

  val parallelPixels = 18

  behavior of "FilterSpec"
  it should "Filter" in {
    chisel3.iotesters.Driver (() => new Filter(parallelPixels)) { c =>
        new IdentityTest(c)
      } should be(true)
  }
}

// waveform output 
// trying to produce vcd as per example above
// replace:
// chisel3.iotesters.Driver(() => new MatMul(rowDims, colDims)) { c =>
  // with:
// chisel3.iotesters.Driver.execute(Array("--generate-vcd-output", "on", "--backend-name", "treadle"), () => new KernelConvolution(kernelSize)) { c =>

object FilterTests {

  class IdentityTest(c: Filter) extends PeekPokeTester(c) {

    val kernelSize = 3

    val imageWidth = 6
    val imageHeight = 6

    //poke(c.io.SPI_filterIndex, 0.U)

    /*val image: List[UInt] = List( 
        200.U(16.W), 100.U(16.W), 50.U(16.W), 200.U(16.W), 100.U(16.W), 50.U(16.W),
        100.U(16.W), 50.U(16.W), 200.U(16.W), 100.U(16.W), 50.U(16.W), 200.U(16.W),
        50.U(16.W), 200.U(16.W), 100.U(16.W), 50.U(16.W), 200.U(16.W), 100.U(16.W),
        200.U(16.W), 100.U(16.W), 50.U(16.W), 200.U(16.W), 100.U(16.W), 50.U(16.W),
        100.U(16.W), 50.U(16.W), 200.U(16.W), 100.U(16.W), 50.U(16.W), 200.U(16.W),
        50.U(16.W), 200.U(16.W), 100.U(16.W), 50.U(16.W), 200.U(16.W), 100.U(16.W)
    )*/

    poke(c.io.SPI_filterIndex, 1.U)

    val image: List[UInt] = List( 
        50.U(16.W), 77.U(16.W), 77.U(16.W), 77.U(16.W), 77.U(16.W), 44.U(16.W),
        77.U(16.W), 116.U(16.W), 116.U(16.W), 116.U(16.W), 116.U(16.W), 77.U(16.W),
        77.U(16.W), 116.U(16.W), 116.U(16.W), 116.U(16.W), 116.U(16.W), 77.U(16.W),
        77.U(16.W), 116.U(16.W), 116.U(16.W), 116.U(16.W), 116.U(16.W), 77.U(16.W),
        77.U(16.W), 116.U(16.W), 116.U(16.W), 116.U(16.W), 116.U(16.W), 77.U(16.W),
        44.U(16.W), 77.U(16.W), 77.U(16.W), 77.U(16.W), 77.U(16.W), 61.U(16.W)
    )

    poke(c.io.SPI_invert, false.B)
    poke(c.io.SPI_distort, false.B)

    println("running filter...................")
    step(kernelSize * kernelSize - 1)
    for(i <- 0 until c.parallelPixels){
      expect(c.io.pixelVal_out(i), image(i))
    }
    for(j <- 1 until imageWidth * imageHeight / c.parallelPixels){
      step(kernelSize * kernelSize)
      for(i <- 0 until c.parallelPixels){
        expect(c.io.pixelVal_out(i), image(c.parallelPixels * j + i))
      }
    }
  }
}
