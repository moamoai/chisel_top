/*
 * A simple counter example with configurable bit width and with a test bench.
 * 
 */

package top

import chisel3._
import chisel3.iotesters.PeekPokeTester

object OBJ_TEST {
  val TIME_BAUD  = 16
}

/**
 * Test the counter by printing out the value at each clock cycle.
 */
// class TopTester(dut: Top) extends UartTester(dut) {
class TopTester(dut: Top) extends PeekPokeTester(dut) {
  val TIME_BAUD = OBJ_TEST.TIME_BAUD
  def send_uart(TDATA:Int=0x00, SKIP:Int=0x00){
    poke(dut.io.RD, 1.U)
    step(TIME_BAUD)
    poke(dut.io.RD, 1.U)
    step(TIME_BAUD)
    poke(dut.io.RD, 0.U) // Start bit
    step(TIME_BAUD)
    for (i <- 0 until 8) {
      var td = (TDATA>>i) & 0x01
      poke(dut.io.RD, td) // Data bit
      step(TIME_BAUD)
    }
    poke(dut.io.RD, 1.U) //

    if(SKIP!=1){
      poke(dut.io.RD, 0.U) // Parity bit
      step(TIME_BAUD)
      poke(dut.io.RD, 1.U) // Stop bit
      step(TIME_BAUD)
      poke(dut.io.RD, 1.U) // Stop bit
      step(TIME_BAUD)
    }
  }

  def receive_data() : BigInt = {
    var rdata = BigInt(0)
    var td    = peek(dut.io.TD)
    while(td == 1){   // Start wait
      step(1)
      td = peek(dut.io.TD)
    }
    step(TIME_BAUD) // Stop
    step(TIME_BAUD/2) // D0 1/2
    for (i <- 0 until 8) {
      rdata = rdata + (peek(dut.io.TD)<<i)
      step(TIME_BAUD)
    }
    step(TIME_BAUD) // Parity
    step(TIME_BAUD) // STOP
    step(TIME_BAUD) // STOP
    println(f"# Received Data[$rdata%02x]")
    return rdata
  }

  // Loop back test
  var L_CHAR    = 0x6C // l(0x6C)
  var TEST_DATA = 0x5A
  send_uart(L_CHAR)
  send_uart(TEST_DATA)
  send_uart(0x0, 1)
  var rdata = receive_data()
  if(rdata !=TEST_DATA){
    println("#[NG] Error TEST_DATA:" + TEST_DATA.toString)
  }
  // Switch Test
  var S_CHAR    = 0x73
  var SW_IN = 5
  poke(dut.io.SW_IN, SW_IN.U)
  send_uart(S_CHAR)
  send_uart(0x0)
  send_uart(0x0, 1)
  rdata = receive_data()
  if(rdata !=SW_IN){
    println("#[NG] Error rdata=" + rdata.toString)
  }

  // bd_en=1
  var o_CHAR    = 0x6F
  send_uart(o_CHAR)
  send_uart(0x0) 
  send_uart(0x1)

  // Memory Write/Read

  var W_CHAR    = 0x77
  var M_CHAR    = 0x6D
  var ADDR  = 0x04
  var WDATA = 0x5A
  send_uart(W_CHAR)
  send_uart(ADDR) 
  send_uart(WDATA)
  send_uart(M_CHAR)
  send_uart(ADDR)
  send_uart(0x0, 1)
  rdata = receive_data()
  if(rdata !=WDATA){
    println("#[NG] Error rdata=" + rdata.toString)
  }

  // 4B Memory Write/Read
  var a_CHAR  = 0x61
  // 01f00293 05 0000001f 8000007c 80000080 // li t0, 31
  var INST = 0x01f00293
  for (i <- 0 until 2) {
    ADDR  = 4*i
    WDATA = INST + (i*0x11111111)
    send_uart(a_CHAR)
    send_uart(ADDR) 
    // send_uart(0x93)
    // send_uart(0x00)
    // send_uart(0xf0)
    // send_uart(0x01)
    var send_data = 0
    for (i <- 0 until 4) {
      send_data = (WDATA >>> (i*8))&0xFF
      // println(f"send_data [0x$send_data%08x]") 
      // send_uart(WDATA + i)
      send_uart(send_data) // unsigned shift
    }
    for (i <- 0 until 4) {
      send_uart(M_CHAR)
      send_uart(ADDR)
      send_uart(i, 1)
      rdata = receive_data()
      send_data = (WDATA >>> (i*8))&0xFF
      if(rdata !=send_data){
        println("#[NG] Error 4B Write rdata=" + rdata.toString)
     }
    }
  }

  // Inst ready
  o_CHAR    = 0x6F
  send_uart(o_CHAR)
  send_uart(0x0) 
  send_uart(0x2) // start = 1

  send_uart(o_CHAR)
  send_uart(0x0) 
  send_uart(0x4) // inst_valid = 1

  send_uart(S_CHAR)
  send_uart(0x1) // Vec(1)
  send_uart(0x0, 1)
  rdata = receive_data()

  send_uart(o_CHAR)
  send_uart(0x0) 
  send_uart(0x0) // inst_valid = 0

  send_uart(o_CHAR)
  send_uart(0x0) 
  send_uart(0x4) // inst_valid = 1

  send_uart(S_CHAR)
  send_uart(0x1) // Vec(1)
  send_uart(0x0, 1)
  rdata = receive_data()
//  if(rdata !=SW_IN){
//    println("#[NG] Error rdata=" + rdata.toString)
//  }
}


/**
 * Create a counter and a tester.
 */
object TopTester extends App {

  iotesters.Driver.execute(Array[String]("--generate-vcd-output", "on",
                        "--fint-write-vcd", "--wave-form-file-name", "test_run_dir/Top.vcd"),
                        () => new Top(OBJ_TEST.TIME_BAUD.U)) {
    dut => new TopTester(dut)
  }
}