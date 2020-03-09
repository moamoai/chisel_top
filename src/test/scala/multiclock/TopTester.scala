/*
 * A simple counter example with configurable bit width and with a test bench.
 * 
 */

package multiclock

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
  step(20)
}


/**
 * Create a counter and a tester.
 */
object TopTester extends App {

  iotesters.Driver.execute(Array[String]("--generate-vcd-output", "on",
                        "--fint-write-vcd", "--wave-form-file-name", "test_run_dir/div.vcd"),
                        () => new Top()) {
    dut => new TopTester(dut)
  }
}