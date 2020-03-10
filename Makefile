#
# Building Chisel examples without too much sbt/scala/... stuff
#
# sbt looks for default into a folder ./project and . for build.sdt and Build.scala
# sbt creates per default a ./target folder

SBT = sbt -mem 4096

# Generate Verilog code

top:
	$(SBT) "runMain top.TopMain"

top-test:
	$(SBT) "test:runMain top.TopTester --backend-name verilator"

div:
	$(SBT) "runMain multiclock.DivTopMain"

div-test:
	$(SBT) "test:runMain multiclock.DivTopTester --backend-name verilator"

GTKWAVE = /Applications/gtkwave.app/Contents/Resources/bin/gtkwave

view:
	# $(GTKWAVE) ./test_run_dir/multiclock.DivTopTester930458331/DivTop.vcd
	# $(GTKWAVE) ./test_run_dir/multiclock.TopTester522653306/Top.vcd
	$(GTKWAVE) ./test_run_dir/Top.gtkw

# clean everything (including IntelliJ project settings)

clean:
	git clean -fd
