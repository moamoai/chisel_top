/*
 * 
 * A simple counter example with configurable bit width and with a test bench.
 * 
 */

package top

import chisel3._
import chisel3.util._
import uart.Uart
import riscv.RiscV

import multiclock.Divider

// class Top(TIME_BAUD:UInt = 1085.U(16.W)) extends Module { // 125MHz/115200bps
class Top(TIME_BAUD:UInt = 542.U(16.W)) extends Module {
  val io = IO(new Bundle {
    val SW_IN  = Input(UInt(4.W))
    val RD     = Input(UInt(1.W))
    val TD     = Output(UInt(1.W))
    val GPIO   = Output(UInt(8.W))
  })

  val clk_div2 = Wire(Clock())
  val i_div2 = Module(new Divider)
  clk_div2 := i_div2.io.clock

withClock (clk_div2) {
  val i_uart = Module(new Uart(TIME_BAUD, 32, 32))
  i_uart.io.RD := io.RD
  io.TD        := i_uart.io.TD

  i_uart.io.MONITOR(0) := io.SW_IN
  io.GPIO := Cat(i_uart.io.GPIO(0)(7,1), i_uart.io.idle)

  val i_rv_ifm  = Module(new RV_IFM)
  i_rv_ifm.io.pre_start      := i_uart.io.GPIO(0)(1)
  i_rv_ifm.io.pre_inst_valid := i_uart.io.GPIO(0)(2)
  i_rv_ifm.io.GPIO_1         := i_uart.io.GPIO(1)

  val i_riscv  = Module(new RiscV)
  i_riscv.io.if_mem_bd.bd_en := i_uart.io.GPIO(0)(0) // 1.U
  i_riscv.io.start           := i_rv_ifm.io.start
  i_riscv.io.inst_valid      := i_rv_ifm.io.inst_valid
  i_uart.io.rdata            := i_riscv.io.if_mem_bd.rdata
  i_riscv.io.if_mem_bd.we    := i_uart.io.we
  i_riscv.io.if_mem_bd.addr  := i_uart.io.addr
  i_riscv.io.if_mem_bd.wdata := i_uart.io.wdata

  i_rv_ifm.io.inst_addr  := i_riscv.io.inst_addr
  i_rv_ifm.io.inst_ready := i_riscv.io.inst_ready
  i_rv_ifm.io.error      := i_riscv.io.error
  i_rv_ifm.io.info_rf    := i_riscv.io.info_rf

  i_uart.io.MONITOR(1) := i_rv_ifm.io.MONITOR_1
  i_uart.io.MONITOR(2) := i_rv_ifm.io.MONITOR_2
  i_uart.io.MONITOR(3) := i_rv_ifm.io.MONITOR_3
}
}

object TopMain extends App {
  println("Generating the Top hardware")
  chisel3.Driver.execute(Array("--target-dir", "generated"), () => new Top())
}
