package morphinator

import chisel3._
import chisel3.util._

class ImageProcessing(val imageWidth: Int, val imageHeight: Int, val parallelPixels: Int, val kernelSize: Int) extends Module {
  val io = IO(
    new Bundle {
      val rowIndex          = Input(UInt(11.W)) // 11 bits => 2048 adresses (2048 pixels should be enough for an image)
      val colIndex          = Input(UInt(11.W))
      val SPI_filterIndex   = Input(UInt(6.W))
      val SPI_invert        = Input(Bool())
      val SPI_distort       = Input(Bool())

      val pixelVal_out      = Output(UInt(4.W))
    }
  )

  val filter = Module(new Filter(imageWidth, imageHeight, parallelPixels, kernelSize))
  val videoBuffer = Module(new VideoBuffer(imageWidth, imageHeight, parallelPixels))

  videoBuffer.io.rowIndex := io.rowIndex
  videoBuffer.io.colIndex := io.colIndex

  filter.io.SPI_filterIndex := io.SPI_filterIndex 
  filter.io.SPI_invert      := io.SPI_invert
  filter.io.SPI_distort     := io.SPI_distort
  
  for(i <- 0 until parallelPixels){
   videoBuffer.io.pixelVal_in(i) := filter.io.pixelVal_out(i)
  }

  videoBuffer.io.valid_in := filter.io.valid_out
  io.pixelVal_out := videoBuffer.io.pixelVal_out
}
