package morphinator

import chisel3._
import chisel3.util._

// TODO merge this file with Top.scala 
class ImageProcessing(val imageWidth: Int, val imageHeight: Int, val parallelPixels: Int, val kernelSize: Int) extends Module {
  val io = IO(
    new Bundle {
      // val pixelVal_in       = Input(Vec(3, UInt(4.W))) // TODO from camera
      // from SPI
      val SPI_filterIndex   = Input(UInt(6.W))
      val SPI_invert        = Input(Bool())
      val SPI_distort       = Input(Bool())
      // from VGA/HDMI module
      val rowIndex          = Input(UInt(11.W)) // 11 bits => 2048 adresses (2048 pixels should be enough for an image)
      val colIndex          = Input(UInt(11.W))

      val pixelVal_out      = Output(Vec(3, UInt(4.W)))
    }
  )

  val filter = Module(new Filter(imageWidth, imageHeight, parallelPixels, kernelSize))
  val videoBuffer = Module(new VideoBuffer(imageWidth, imageHeight, parallelPixels))

  videoBuffer.io.rowIndex := io.rowIndex
  videoBuffer.io.colIndex := io.colIndex

  filter.io.SPI_filterIndex := io.SPI_filterIndex 
  filter.io.SPI_invert      := io.SPI_invert
  filter.io.SPI_distort     := io.SPI_distort
  

  val pixIn = VecInit(Seq.fill(3)(RegInit(VecInit(List.fill(parallelPixels)(0.U(4.W))))))
  val pixOut  = RegInit(VecInit(List.fill(3)(0.U(4.W))))
  val valid   = RegInit(Bool(), false.B)

  for (k <- 0 until 3) {
    for(i <- 0 until parallelPixels){
     pixIn(k)(i) := filter.io.pixelVal_out(k)(i)
     videoBuffer.io.pixelVal_in(k)(i) := pixIn(k)(i)

     pixOut(k) := videoBuffer.io.pixelVal_out(k)
     io.pixelVal_out(k) := pixOut(k)
    }
  }
  valid := filter.io.valid_out
  videoBuffer.io.valid_in := valid 
}

// main object for compilation 
object ImageProcessingDriver extends App {
  val imageWidth = 16
  val imageHeight = 12
  // val imageWidth = 32
  // val imageHeight = 18
  val parallelPixels = 8
  val kernelSize = 3
  chisel3.Driver.execute(args, () => new ImageProcessing(imageWidth, imageHeight, parallelPixels, kernelSize))
}
