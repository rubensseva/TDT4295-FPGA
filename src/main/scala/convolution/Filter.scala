package morphinator

import chisel3._
import chisel3.util._

class Filter(val parallelPixels: Int) extends Module {

    val io = IO(
        new Bundle {
            // input fra SPI
            val SPI_filterIndex = Input(UInt(6.W))
            val SPI_invert      = Input(Bool())
            val SPI_distort     = Input(Bool())
            
            val pixelVal_out    = Output(Vec(parallelPixels, UInt(4.W)))
            val valid_out       = Output(Bool())
        }
    )
    
    val colorInvert = RegInit(Bool(), false.B)
  
    val kernels = VecInit(
        VecInit(
            0.S(5.W), 0.S(5.W), 0.S(5.W),
            0.S(5.W), 1.S(5.W), 0.S(5.W),
            0.S(5.W), 0.S(5.W), 0.S(5.W)
        ),
        VecInit(
            1.S(5.W), 1.S(5.W), 1.S(5.W),
            1.S(5.W), 1.S(5.W), 1.S(5.W),
            1.S(5.W), 1.S(5.W), 1.S(5.W)
        ),
        VecInit(
            1.S(5.W), 0.S(5.W), -1.S(5.W),
            0.S(5.W), 0.S(5.W), 0.S(5.W),
            -1.S(5.W), 0.S(5.W), 1.S(5.W)
        )
    )
    val kernelSums = VecInit(
        RegInit(UInt(8.W), 1.U),
        RegInit(UInt(8.W), 9.U),
        RegInit(UInt(8.W), 1.U)
    )
  
    val image = VecInit(
        15.U(4.W), 8.U(4.W), 0.U(4.W), 7.U(4.W), 0.U(4.W), 0.U(4.W),
        8.U(4.W), 0.U(4.W), 7.U(4.W), 8.U(4.W), 0.U(4.W), 15.U(4.W),
        0.U(4.W), 15.U(4.W), 8.U(4.W), 0.U(4.W), 15.U(4.W), 8.U(4.W),
        15.U(4.W), 8.U(4.W), 0.U(4.W), 15.U(4.W), 8.U(4.W), 0.U(4.W),
        8.U(4.W), 0.U(4.W), 15.U(4.W), 8.U(4.W), 0.U(4.W), 15.U(4.W),
        0.U(4.W), 15.U(4.W), 8.U(4.W), 0.U(4.W), 15.U(4.W), 8.U(4.W)
    )
    
    val kernelSize = 3
    var imageWidth = 6
    var imageHeight = 6

    val kernelConvolution = Module(new KernelConvolution(kernelSize, parallelPixels)).io
    
    val (kernelCounter, kernelCountReset)  = Counter(true.B, kernelSize * kernelSize)
    kernelConvolution.kernelVal_in := kernels(io.SPI_filterIndex)(kernelCounter)
    //printf("Kernelval: %d\n", kernels(io.SPI_filterIndex)(kernelCounter))
    
    val (imageCounterX, imageCounterXReset) = Counter(true.B, kernelSize)
    val (imageCounterY, imageCounterYReset) = Counter(imageCounterXReset, kernelSize)
    val pixelIndex = RegInit(UInt(32.W), 0.U)

    for (i <- 0 until parallelPixels){
        val x = (pixelIndex + i.U) / imageWidth.U + imageCounterX - 1.U
        val y = (pixelIndex + i.U) % imageWidth.U + imageCounterY - 1.U
        when(x < 0.U || x >= imageWidth.U || y < 0.U || y >= imageHeight.U){
            kernelConvolution.pixelVal_in(i) := 0.U
        }.otherwise{
            kernelConvolution.pixelVal_in(i) := image(y * imageWidth.U + x)
        }
    }
    
    for(i <- 0 until parallelPixels){
        when(colorInvert){
            io.pixelVal_out(i) := 15.U - kernelConvolution.pixelVal_out(i) / kernelSums(io.SPI_filterIndex)
        }.otherwise{
            io.pixelVal_out(i) := kernelConvolution.pixelVal_out(i) / kernelSums(io.SPI_filterIndex)
        }
    }
    
    io.valid_out := kernelConvolution.valid_out 
    
    when(kernelCountReset){
        pixelIndex := pixelIndex + parallelPixels.U
        when(pixelIndex === imageWidth.U * imageHeight.U){
            pixelIndex := 0.U
        }
    }
}
