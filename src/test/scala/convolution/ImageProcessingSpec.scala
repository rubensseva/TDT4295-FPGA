package morphinator

import chisel3._
import chisel3.iotesters.PeekPokeTester
import chisel3.iotesters
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}
import org.scalatest._

class ImageProcessingSpec extends FlatSpec with Matchers {
  import ImageProcessingTests._

  val imageWidth = 16 
  val imageHeight = 12 
  val parallelPixels = 8
  val kernelSize = 3

  behavior of "ImageProcessing"
  it should "just generate files" in {
    chisel3.iotesters.Driver.execute(Array("--generate-vcd-output", "on", "--backend-name", "verilator"), () => new ImageProcessing(imageWidth, imageHeight, parallelPixels, kernelSize)) { c =>
        new FakeTest(c)
      } should be(true)
  }


object ImageProcessingTests {

  class FakeTest(c: ImageProcessing) extends PeekPokeTester(c) {

    println("running fake test...................")
  }
}
}
