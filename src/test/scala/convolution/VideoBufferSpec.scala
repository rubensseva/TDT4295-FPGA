package morphinator

import chisel3._
import chisel3.iotesters.PeekPokeTester
import chisel3.iotesters
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}
import org.scalatest._

class VideoBufferSpec extends FlatSpec with Matchers {
  import VideoBufferTests._

  val kernelSize = 3
  val imageWidth = 8
  val imageHeight = 6
  val parallelPixels = 8

  behavior of "VideoBufferSpec"
  it should "just generate files" in {
    chisel3.iotesters.Driver.execute(Array("--generate-vcd-output", "on", "--backend-name", "verilator"), () => new VideoBuffer(imageWidth, imageHeight, parallelPixels)) { c =>
        new FakeTest(c)
      } should be(true)
  }
}

object VideoBufferTests {

  class FakeTest(c: VideoBuffer) extends PeekPokeTester(c) {

    println("running fake test...................")
  }
}
