package spi

import chisel3._
import chisel3.util._


class ShiftRegister extends Module { 
  val io = new Bundle { 
    val in  = UInt(INPUT, 1) 
    val out = UInt(OUTPUT, 1) 
  } 
  val r0 = Reg(next = io.in) 
  val r1 = Reg(next = r0) 
  val r2 = Reg(next = r1)
  val r3 = Reg(next = r2)  
  val r4 = Reg(next = r3) 
  val r5 = Reg(next = r4) 
  val r6 = Reg(next = r5) 
  val r7 = Reg(next = r6) 
  io.out := r7
}

