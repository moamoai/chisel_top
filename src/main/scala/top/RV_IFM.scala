/*
 * 
 * A simple counter example with configurable bit width and with a test bench.
 * 
 */

package top

import chisel3._
import chisel3.util._

/**
 * A simple, configurable counter that wraps around.
 */
class RV_IFM() extends Module {
  val io = IO(new Bundle {
    val pre_start      = Input (UInt(1.W))
    val pre_inst_valid = Input (UInt(1.W))
    val GPIO_1         = Input (UInt(8.W))
    val start          = Output(UInt(1.W))
    val inst_valid     = Output(UInt(1.W))
    val MONITOR_1      = Output(UInt(8.W))
    val MONITOR_2      = Output(UInt(8.W))
    val MONITOR_3      = Output(UInt(8.W))

    val inst_addr      = Input (UInt(32.W))
    val inst_ready     = Input (UInt(1.W))
    val error          = Input (UInt(1.W))
    // Debug Port
    var info_rf        = Input(Vec(32, UInt(32.W)))
  })
  val pre_start        = Wire   (UInt(1.W))
  val pre_inst_valid   = Wire   (UInt(1.W))
  pre_start            := io.pre_start
  pre_inst_valid       := io.pre_inst_valid

  val r_start      = RegInit(0.U(1.W))
  val r_inst_valid = RegInit(0.U(1.W))
  r_start        := pre_start
  r_inst_valid   := pre_inst_valid

  io.start      := pre_start      & (r_start === 0.U)      // pulse
  io.inst_valid := pre_inst_valid & (r_inst_valid === 0.U) // pulse

  // Monitor
  val reg_sel   = Wire(UInt(5.W))
  val reg_rstrb = Wire(UInt(2.W))

  reg_sel   := io.GPIO_1(4,0)
  reg_rstrb := io.GPIO_1(6,5)
  val reg_data  = Wire(UInt(8.W))
  reg_data := 0.U
  when(reg_rstrb === 0.U){
    reg_data := io.info_rf(reg_sel)(7,0)
  }.elsewhen(reg_rstrb === 1.U){
    reg_data := io.info_rf(reg_sel)(15,8)
  }.elsewhen(reg_rstrb === 2.U){
    reg_data := io.info_rf(reg_sel)(23,16)
  }.elsewhen(reg_rstrb === 3.U){
    reg_data := io.info_rf(reg_sel)(31,24)
  }

  val r_error      = RegInit(0.U(1.W))
  val r_inst_ready = RegInit(0.U(1.W))
  when(io.error === 1.U){
    r_error := 1.U
  }.elsewhen(io.inst_valid === 1.U){
    r_error := 0.U
  }
  when(io.inst_ready === 1.U){
    r_inst_ready := 1.U
  }.elsewhen(io.inst_valid === 1.U){
    r_inst_ready := 0.U
  }

  io.MONITOR_1 := Cat(r_error, r_inst_ready)
  io.MONITOR_2 := io.inst_addr
  io.MONITOR_3 := reg_data
}