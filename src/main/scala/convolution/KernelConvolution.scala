package morphinator

import chisel3._
import chisel3.util._

class KernelConvolution(val kernelSize: Int, val nModules: Int) extends Module {
    
    val io = IO(
        new Bundle {
            val kernelVal_in  = Input(SInt(5.W))
            val pixelVal_in   = Input(Vec(nModules, UInt(4.W)))
            
            
            val pixelVal_out  = Output(Vec(nModules, SInt(9.W)))
            val valid_out     = Output(Bool())
        }
    )
    
    // Convolution on an area the size of the kernel -> spit out a single rgb pixel (r, g, or b - one of them)
    
    val dotProdCalc   = VecInit(Seq.fill(nModules)(Module(new DotProd(kernelSize * kernelSize)).io))
    
    // init regs and outputs
    /*for(i <- 0 until nModules){
        io.pixelVal_out(i)      := 0.U
        dotProdCalc(i).dataInA  := 0.U
        dotProdCalc(i).dataInB  := 0.S
    }*/
    
    val validOut = RegInit(Bool(), false.B)
    validOut := dotProdCalc(0).outputValid // one represents all
	val pixOut = RegInit(VecInit(List.fill(nModules)(0.S(9.W))))

    for(i <- 0 until nModules){
        dotProdCalc(i).dataInA   := io.pixelVal_in(i)
        dotProdCalc(i).dataInB   := io.kernelVal_in
        pixOut(i)                := dotProdCalc(i).dataOut
        io.pixelVal_out(i)       := pixOut(i)
    }
    io.valid_out             := validOut
}

