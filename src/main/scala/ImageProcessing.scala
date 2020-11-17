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
  
  for (k <- 0 until 3) {
    for(i <- 0 until parallelPixels){
     videoBuffer.io.pixelVal_in(k)(i) := filter.io.pixelVal_out(k)(i)
     io.pixelVal_out(k) := videoBuffer.io.pixelVal_out(k)
    }
  }
  videoBuffer.io.valid_in := filter.io.valid_out
}

// main object for compilation 
object ImageProcessingDriver extends App {
  val imageWidth = 32 // krabbe
  val imageHeight = 18
  // val imageWidth = 16 // squares
  // val imageHeight = 12
  val parallelPixels = 8
  val kernelSize = 3
  chisel3.Driver.execute(args, () => new ImageProcessing(imageWidth, imageHeight, parallelPixels, kernelSize))
}
