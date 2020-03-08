/*
 * 
 * A simple counter example with configurable bit width and with a test bench.
 * 
 */

package top

import chisel3._
import chisel3.util._
import uart.Uart
// import uart.Memory
// import riscv.Memory_BD
import riscv.Memory
// import riscv.RiscV

/**
 * A simple, configurable counter that wraps around.
 */
class Top(TIME_BAUD:UInt = 1085.U(16.W)) extends Module {
  val io = IO(new Bundle {
    val SW_IN  = Input(UInt(4.W))
    val RD     = Input(UInt(1.W))
    val TD     = Output(UInt(1.W))
    val GPIO   = Output(UInt(8.W))
  })

  // val i_uart = Module(new Uart(TIME_BAUD, 32, 32))
  val i_uart = Module(new Uart(TIME_BAUD, 8, 8))
  i_uart.io.RD := io.RD
  io.TD        := i_uart.io.TD

  i_uart.io.MONITOR(0) := io.SW_IN
  i_uart.io.MONITOR(1) := i_uart.io.GPIO(1)
  i_uart.io.MONITOR(2) := i_uart.io.GPIO(2)
  i_uart.io.MONITOR(3) := i_uart.io.GPIO(3)
  io.GPIO := Cat(i_uart.io.GPIO(0)(7,1), i_uart.io.idle)

  val i_mem  = Module(new Memory)
  i_uart.io.rdata := i_mem.io.rdata
  i_mem.io.we     := i_uart.io.we
  i_mem.io.addr   := i_uart.io.addr
  i_mem.io.wdata  := i_uart.io.wdata
  i_mem.io.addr2  := 0.U

//  val i_mem  = Module(new Memory_BD)
//  i_mem.io.if_mem_bd.bd_en := 1.U
//  i_uart.io.rdata          := i_mem.io.if_mem_bd.rdata
//  i_mem.io.if_mem_bd.we    := i_uart.io.we
//  i_mem.io.if_mem_bd.addr  := i_uart.io.addr
//  i_mem.io.if_mem_bd.wdata := i_uart.io.wdata
//  i_mem.io.we    := 0.U
//  i_mem.io.addr  := 0.U
//  i_mem.io.addr2 := 0.U
//  i_mem.io.wdata := 0.U

//  val pre_start    = Wire   (UInt(1.W))
//  val start        = Wire   (UInt(1.W))
//  val r_start      = RegInit(0.U(1.W))
//  val pre_inst_valid = Wire   (UInt(1.W))
//  val inst_valid     = Wire   (UInt(1.W))
//  val r_inst_valid   = RegInit(0.U(1.W))
//  pre_start      := i_uart.io.GPIO(0)(1) // 0.U
//  r_start        := pre_start
//  pre_inst_valid := i_uart.io.GPIO(0)(2) // 0.U
//  r_inst_valid   := pre_inst_valid
//
//  start      := pre_start      & (r_start === 0.U)      // pulse
//  inst_valid := pre_inst_valid & (r_inst_valid === 0.U) // pulse
//
//  val i_riscv  = Module(new RiscV)
//  i_riscv.io.if_mem_bd.bd_en := i_uart.io.GPIO(0)(0) // 1.U
//  i_riscv.io.start           := start
//  i_riscv.io.inst_valid      := inst_valid
//  i_uart.io.rdata            := i_riscv.io.if_mem_bd.rdata
//  i_riscv.io.if_mem_bd.we    := i_uart.io.we
//  i_riscv.io.if_mem_bd.addr  := i_uart.io.addr
//  i_riscv.io.if_mem_bd.wdata := i_uart.io.wdata

//  // Monitor
//  val reg_sel   = Wire(UInt(5.W))
//  val reg_rstrb = Wire(UInt(2.W))
//  reg_sel   := i_uart.io.GPIO(1)(4,0)
//  reg_rstrb := i_uart.io.GPIO(1)(6,5)
//  val reg_data  = Wire(UInt(8.W))
//  reg_data := 0.U
//  when(reg_rstrb === 0.U){
//    reg_data := i_riscv.io.info_rf(reg_sel)(7,0)
//  }.elsewhen(reg_rstrb === 1.U){
//    reg_data := i_riscv.io.info_rf(reg_sel)(15,8)
//  }.elsewhen(reg_rstrb === 2.U){
//    reg_data := i_riscv.io.info_rf(reg_sel)(23,16)
//  }.elsewhen(reg_rstrb === 3.U){
//    reg_data := i_riscv.io.info_rf(reg_sel)(31,24)
//  }
//
//  val r_error      = RegInit(0.U(1.W))
//  val r_inst_ready = RegInit(0.U(1.W))
//  when(i_riscv.io.error === 1.U){
//    r_error := 1.U
//  }.elsewhen(inst_valid === 1.U){
//    r_error := 0.U
//  }
//  when(i_riscv.io.inst_ready === 1.U){
//    r_inst_ready := 1.U
//  }.elsewhen(inst_valid === 1.U){
//    r_inst_ready := 0.U
//  }
//
//  i_uart.io.MONITOR(1) := Cat(r_error, r_inst_ready)
//  i_uart.io.MONITOR(2) := i_riscv.io.inst_addr
//  i_uart.io.MONITOR(3) := reg_data
}

object TopMain extends App {
  println("Generating the Top hardware")
  chisel3.Driver.execute(Array("--target-dir", "generated"), () => new Top())
}
