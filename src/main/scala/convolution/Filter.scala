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
        VecInit( // Identity
            0.S(5.W), 0.S(5.W), 0.S(5.W),
            0.S(5.W), 1.S(5.W), 0.S(5.W),
            0.S(5.W), 0.S(5.W), 0.S(5.W)
        ),
        VecInit( // Box blur
            1.S(5.W), 1.S(5.W), 1.S(5.W),
            1.S(5.W), 1.S(5.W), 1.S(5.W),
            1.S(5.W), 1.S(5.W), 1.S(5.W)
        ),
        VecInit( // Gaussian blur
            1.S(5.W), 2.S(5.W), 1.S(5.W),
            2.S(5.W), 4.S(5.W), 2.S(5.W),
            1.S(5.W), 2.S(5.W), 1.S(5.W)
        ),
        VecInit( // Edge detector
            0.S(5.W), -1.S(5.W), 0.S(5.W),
            -1.S(5.W), 4.S(5.W), -1.S(5.W),
            0.S(5.W), -1.S(5.W), 0.S(5.W)
        ),
        VecInit( // Edge detector
            -1.S(5.W), -1.S(5.W), -1.S(5.W),
            -1.S(5.W), 8.S(5.W), -1.S(5.W),
            -1.S(5.W), -1.S(5.W), -1.S(5.W)
        ),
        VecInit( // Sharpening
            0.S(5.W), -1.S(5.W), 0.S(5.W),
            -1.S(5.W), 5.S(5.W), -1.S(5.W),
            0.S(5.W), -1.S(5.W), 0.S(5.W)
        )
    )
    val kernelSums = VecInit(
        RegInit(SInt(8.W), 1.S),
        RegInit(SInt(8.W), 9.S),
        RegInit(SInt(8.W), 16.S),
        RegInit(SInt(8.W), 1.S),
        RegInit(SInt(8.W), 1.S),
        RegInit(SInt(8.W), 1.S)
    )
  
    val image = VecInit(
        0.U(4.W), 0.U(4.W), 0.U(4.W), 0.U(4.W), 0.U(4.W), 0.U(4.W), 0.U(4.W), 0.U(4.W),
        0.U(4.W), 0.U(4.W), 0.U(4.W), 0.U(4.W), 0.U(4.W), 0.U(4.W), 0.U(4.W), 0.U(4.W),
        0.U(4.W), 0.U(4.W), 15.U(4.W), 15.U(4.W), 15.U(4.W), 0.U(4.W), 0.U(4.W), 0.U(4.W),
        0.U(4.W), 0.U(4.W), 15.U(4.W), 15.U(4.W), 15.U(4.W), 0.U(4.W), 0.U(4.W), 0.U(4.W),
        0.U(4.W), 0.U(4.W), 15.U(4.W), 15.U(4.W), 15.U(4.W), 0.U(4.W), 0.U(4.W), 0.U(4.W),
        0.U(4.W), 0.U(4.W), 0.U(4.W), 0.U(4.W), 0.U(4.W), 0.U(4.W), 0.U(4.W), 0.U(4.W)
    )
    
    val kernelSize = 3
    var imageWidth = 8
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
        val normVal = kernelSums(io.SPI_filterIndex)
        val pixOutRaw = kernelConvolution.pixelVal_out(i)
        when (pixOutRaw < 0.S) {  // normalize (clip hi/lo and scale rest)
          // val pixOut = (~pixOutRaw + 1.S).asUInt // abs
          val pixOut = 0.U 
        } elsewen(pixOutRaw > 15.S) {
          val pixOut = 15.U 
        } .otherwise {
          val pixOut = (pixOutRaw / normVal).asUInt
        }
        when(colorInvert){
            io.pixelVal_out(i) := 15.U - pixOut 
        }.otherwise{
            io.pixelVal_out(i) := pixOut
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
