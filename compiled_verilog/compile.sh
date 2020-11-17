#!/bin/bash
rm *.v *.fir *.json
cd ..
sbt "runMain morphinator.ImageProcessingDriver -td compiled_verilog"
sbt "runMain morphinator.FilterDriver -td compiled_verilog"
sbt "runMain morphinator.VideoBufferDriver -td compiled_verilog"
cd compiled_verilog
rm *.fir *.json
