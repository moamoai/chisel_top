/*
 * 
 * A simple counter example with configurable bit width and with a test bench.
 * 
 */

package multiclock

import chisel3._
import chisel3.util._


class DivTop() extends Module{
  val io = IO(new Bundle {
    val out = Output(UInt(4.W))
  })

  val clk_div2 = Wire(Clock())
//  val clk_div4 = Wire(Clock())
//  val clk_div8 = Wire(Clock())
//
  val i_div2 = Module(new Divider)
  clk_div2 := i_div2.io.clock
//
//  withClock (clk_div2) {
//    val i_div4 = Module(new Divider)
//    clk_div4 := i_div4.io.clock
//  }
//
//  withClock (clk_div4) {
//    val i_div8 = Module(new Divider)
//    clk_div8 := i_div8.io.clock
//  }

  withClock (clk_div2) {
    val r_cnt = RegInit(0.U(4.W))
    r_cnt := r_cnt + 1.U
    io.out := r_cnt
  }


}
// div=1: 1/2, 2: 1/4
class Divider(div: Int=1) extends Module {
  val io = IO(new Bundle {
    val clock = Output(Clock())
  })

  val r_cnt   = RegInit(1.U(div.W))
  val r_clock = RegInit(false.B)
  // when(io.rst===1.U){
  //   r_cnt := 0.U
  // }.otherwise{
  //   r_cnt := r_cnt + 1.U
  // }
  r_cnt   := r_cnt - 1.U
  r_clock := r_cnt(0)
  io.clock := r_clock.asClock
}

// class Counter(size: Int) extends Module {
//   val io = IO(new Bundle {
//     val en  = Input (UInt(1.W))
//     val rst = Input (UInt(1.W))
//     val out = Output(UInt(size.W))
//   })
// 
//   val r_cnt = RegInit(0.U(size.W))
//   when(io.rst===1.U){
//     r_cnt := 0.U
//   }.elsewhen(io.en===1.U){
//     r_cnt := r_cnt + 1.U
//   }.otherwise{
//     r_cnt := r_cnt
//   }
//   io.out := r_cnt
// }

object DividerMain extends App {
  println("Generating the Divider hardware")
  chisel3.Driver.execute(Array("--target-dir", "generated"), () => new Divider())
}

object DivTopMain extends App {
  println("Generating the DivTop hardware")
  chisel3.Driver.execute(Array("--target-dir", "generated"), () => new DivTop())
}

