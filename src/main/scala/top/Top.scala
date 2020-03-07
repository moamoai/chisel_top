/*
 * 
 * A simple counter example with configurable bit width and with a test bench.
 * 
 */

package top

import chisel3._
import uart.Uart

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

  val uart = Module(new Uart(TIME_BAUD))
  uart.io.SW_IN := io.SW_IN
  uart.io.RD    := io.RD
  io.GPIO       := uart.io.GPIO
  io.TD         := uart.io.TD

//  val r1 = RegInit(0.U(size.W))
//  r1 := r1 + 1.U
//
//  io.out := r1
}

object TopMain extends App {
  println("Generating the Top hardware")
  chisel3.Driver.execute(Array("--target-dir", "generated"), () => new Top())
}
