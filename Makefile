#
# Building Chisel examples without too much sbt/scala/... stuff
#
# sbt looks for default into a folder ./project and . for build.sdt and Build.scala
# sbt creates per default a ./target folder

SBT = sbt -mem 4096

# Generate Verilog code

top:
	$(SBT) "runMain simple.TopMain"

top-test:
	$(SBT) "test:runMain simple.TopTester --backend-name verilator"

GTKWAVE = /Applications/gtkwave.app/Contents/Resources/bin/gtkwave

view:
	$(GTKWAVE) ./test_run_dir/simple.TopTester1534458474/Top.gtkw

# clean everything (including IntelliJ project settings)

clean:
	git clean -fd
