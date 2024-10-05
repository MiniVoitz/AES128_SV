# Project : AES 128

## Overview

This repository contains all the necessary files to run simulations and tests for our SystemVerilog project. The project includes the following directories:

- `DO/`: Contains `.do` script files used to add signals during ModelSim simulations.
- `RTL/`: Contains the main code written in SystemVerilog.
- `testbench/`: Contains testbenches for each part of the code to verify its functionality.

## Directory Structure

├── DO/
│   └── *.do      # ModelSim scripts for adding signals
├── RTL/
│   └── *.sv      # Main SystemVerilog source code
├── testbench/
│   └── *.sv      # Testbenches for verifying individual modules
└──  project_report.pdf   # Final project report


## Running Simulations

1. Navigate to the `DO/` folder.
2. Run the `.do` files in ModelSim to add signals and initiate the simulation process:
   ```bash
   vsim -do <filename>.do

