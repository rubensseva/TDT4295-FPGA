package morphinator

import chisel3._
import chisel3.iotesters.PeekPokeTester
import chisel3.iotesters
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}
import org.scalatest._

class VideoBufferSpec extends FlatSpec with Matchers {
  import VideoBufferTests._

  val imageWidth = 16 
  val imageHeight = 12 
  val parallelPixels = 8

  behavior of "VideoBuffer"
  it should "just generate files" in {
    chisel3.iotesters.Driver.execute(Array("--generate-vcd-output", "on", "--backend-name", "verilator"), () => new VideoBuffer(imageWidth, imageHeight, parallelPixels)) { c =>
        new FakeTest(c)
      } should be(true)
  }

  it should "update vals" in {
    chisel3.iotesters.Driver.execute(Array("--generate-vcd-output", "on", "--backend-name", "treadle"), () => new VideoBuffer(imageWidth, imageHeight, parallelPixels)) { c =>
        new RealTest(c)
      } should be(true)
  }
}

object VideoBufferTests {

  class FakeTest(c: VideoBuffer) extends PeekPokeTester(c) {

    println("running fake test...................")
  }

  class RealTest(c: VideoBuffer) extends PeekPokeTester(c) {

    println("running real test...................")

    val image: List[UInt] = List(
        0.U(4.W),0.U(4.W),0.U(4.W),0.U(4.W),0.U(4.W),0.U(4.W),0.U(4.W),0.U(4.W),4.U(4.W),4.U(4.W),4.U(4.W),4.U(4.W),4.U(4.W),4.U(4.W),4.U(4.W),4.U(4.W),
        0.U(4.W),0.U(4.W),0.U(4.W),0.U(4.W),0.U(4.W),0.U(4.W),0.U(4.W),0.U(4.W),4.U(4.W),4.U(4.W),4.U(4.W),4.U(4.W),4.U(4.W),4.U(4.W),4.U(4.W),4.U(4.W),
        0.U(4.W),0.U(4.W),0.U(4.W),0.U(4.W),0.U(4.W),0.U(4.W),0.U(4.W),0.U(4.W),4.U(4.W),4.U(4.W),4.U(4.W),4.U(4.W),4.U(4.W),4.U(4.W),4.U(4.W),4.U(4.W),
        0.U(4.W),0.U(4.W),0.U(4.W),0.U(4.W),0.U(4.W),0.U(4.W),0.U(4.W),0.U(4.W),4.U(4.W),4.U(4.W),4.U(4.W),4.U(4.W),4.U(4.W),4.U(4.W),4.U(4.W),4.U(4.W),
        0.U(4.W),0.U(4.W),0.U(4.W),0.U(4.W),0.U(4.W),0.U(4.W),0.U(4.W),0.U(4.W),4.U(4.W),4.U(4.W),4.U(4.W),4.U(4.W),4.U(4.W),4.U(4.W),4.U(4.W),4.U(4.W),
        0.U(4.W),0.U(4.W),0.U(4.W),0.U(4.W),0.U(4.W),0.U(4.W),0.U(4.W),0.U(4.W),4.U(4.W),4.U(4.W),4.U(4.W),4.U(4.W),4.U(4.W),4.U(4.W),4.U(4.W),4.U(4.W),
        8.U(4.W),8.U(4.W),8.U(4.W),8.U(4.W),8.U(4.W),8.U(4.W),8.U(4.W),8.U(4.W),15.U(4.W),15.U(4.W),15.U(4.W),15.U(4.W),15.U(4.W),15.U(4.W),15.U(4.W),15.U(4.W),
        8.U(4.W),8.U(4.W),8.U(4.W),8.U(4.W),8.U(4.W),8.U(4.W),8.U(4.W),8.U(4.W),15.U(4.W),15.U(4.W),15.U(4.W),15.U(4.W),15.U(4.W),15.U(4.W),15.U(4.W),15.U(4.W),
        8.U(4.W),8.U(4.W),8.U(4.W),8.U(4.W),8.U(4.W),8.U(4.W),8.U(4.W),8.U(4.W),15.U(4.W),15.U(4.W),15.U(4.W),15.U(4.W),15.U(4.W),15.U(4.W),15.U(4.W),15.U(4.W),
        8.U(4.W),8.U(4.W),8.U(4.W),8.U(4.W),8.U(4.W),8.U(4.W),8.U(4.W),8.U(4.W),15.U(4.W),15.U(4.W),15.U(4.W),15.U(4.W),15.U(4.W),15.U(4.W),15.U(4.W),15.U(4.W),
        8.U(4.W),8.U(4.W),8.U(4.W),8.U(4.W),8.U(4.W),8.U(4.W),8.U(4.W),8.U(4.W),15.U(4.W),15.U(4.W),15.U(4.W),15.U(4.W),15.U(4.W),15.U(4.W),15.U(4.W),15.U(4.W),
        8.U(4.W),8.U(4.W),8.U(4.W),8.U(4.W),8.U(4.W),8.U(4.W),8.U(4.W),8.U(4.W),15.U(4.W),15.U(4.W),15.U(4.W),15.U(4.W),15.U(4.W),15.U(4.W),15.U(4.W),15.U(4.W),
    )

    // write
    poke(c.io.rowIndex, 0.U)
    poke(c.io.colIndex, 0.U)
    for(i <- 0 until c.parallelPixels) {
      poke(c.io.pixelVal_in(i), image(i))
    }

    // flush
    poke(c.io.valid_in, true.B)
    step(1)
    poke(c.io.valid_in, false.B)
    step(1)

    // read
    for(i <- 0 until c.parallelPixels){
      poke(c.io.rowIndex, 0.U)
      poke(c.io.colIndex, i.U)
      expect(c.io.pixelVal_out, image(i))
    }
  }
}
