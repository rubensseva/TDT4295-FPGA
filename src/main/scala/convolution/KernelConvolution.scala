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
    
    for(i <- 0 until nModules){
        dotProdCalc(i).dataInA   := io.pixelVal_in(i)
        dotProdCalc(i).dataInB   := io.kernelVal_in
        io.pixelVal_out(i)       := dotProdCalc(i).dataOut
    }
    io.valid_out             := dotProdCalc(0).outputValid // one represents all
}

