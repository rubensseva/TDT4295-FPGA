#!/bin/bash
rm *.v *.fir *.json
cd ..
# sbt "run ImageProcessingDriver -td compiled_verilog"
sbt "runMain morphinator.ImageProcessingDriver -td compiled_verilog"
cd compiled_verilog
rm *.fir *.json