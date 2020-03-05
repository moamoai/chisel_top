/*
 * A simple counter example with configurable bit width and with a test bench.
 * 
 */

package simple

import chisel3._
import chisel3.iotesters.PeekPokeTester

/**
 * Test the counter by printing out the value at each clock cycle.
 */
class TopTester(dut: Top) extends PeekPokeTester(dut) {

  for (i <- 0 until 5) {
    println(i.toString + ": " + peek(dut.io.out).toString())
    step(1)
  }
}

/**
 * Create a counter and a tester.
 */
object TopTester extends App {

  iotesters.Driver.execute(Array[String]("--generate-vcd-output", "on",
                        "--fint-write-vcd", "--wave-form-file-name", "test_run_dir/Top.vcd"),
                        () => new Top(2)) {
    dut => new TopTester(dut)
  }
}
