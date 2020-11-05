package morphinator

import chisel3._
import chisel3.util._

class VideoBuffer(val imageWidth: Int, val imageHeight: Int, val parallelPixels: Int) extends Module {

    val io = IO(
        new Bundle {
            val pixelVal_in = Input(Vec(3, Vec(parallelPixels, UInt(4.W))))
            val valid_in    = Input(Bool())
			val rowIndex    = Input(UInt(11.W)) // 11 bits => 2048 adresses (2048 pixels should be enough for an image)
			val colIndex    = Input(UInt(11.W))

			val pixelVal_out = Output(Vec(3, UInt(4.W)))
        }
    )

    val imageR = RegInit(VecInit(List.fill(imageWidth * imageHeight)(15.U(4.W)))) // high init for debug
    val imageG = RegInit(VecInit(List.fill(imageWidth * imageHeight)(0.U(4.W))))
    val imageB = RegInit(VecInit(List.fill(imageWidth * imageHeight)(0.U(4.W))))
    val image = List(imageR, imageG, imageB)

	val pixelIndex = RegInit(UInt(32.W), 0.U)
	val pixOut = RegInit(VecInit(List.fill(3)(0.U(4.W))))
    val valid = RegInit(Bool(), false.B)
    valid := io.valid_in

    for (k <- 0 until 3) {
      pixOut(k) := image(k)(io.rowIndex * imageWidth.U + io.colIndex)
	  io.pixelVal_out(k) := pixOut(k) 
    }

      when(valid){
        for (k <- 0 until 3) {
          for(i <- 0 until parallelPixels){
              image(k)(pixelIndex + i.U) := io.pixelVal_in(k)(i)
          }
        }
        pixelIndex := pixelIndex + parallelPixels.U
        when(pixelIndex === imageWidth.U * imageHeight.U){
          pixelIndex := 0.U
        }
    }
}


// main object for compilation 
object VideoBufferDriver extends App {
  val imageWidth = 16 
  val imageHeight = 12 
  val parallelPixels = 8
  chisel3.Driver.execute(args, () => new VideoBuffer(imageWidth, imageHeight, parallelPixels))
}
