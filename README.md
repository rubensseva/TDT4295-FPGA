# Chisel SPI Slave

Simple chisel project that implements an SPI slave

Made from [chisel-template](https://github.com/freechipsproject/chisel-template)

# How to run

## Run and output verilog
1. `$ sbt`
2. `$ run`

## Running tests
Waveforms can be found under the `test_run_dir/` directory after running the test
### Run all tests
1. `$ sbt`
2. `$ test`

### Run specific test SPISlaveTests
1. `$ sbt`
2. `$ testOnly spi.SPISlaveTests`
(You can press tab after `spi` to see other tests available)

