# 3x3 Image Filtering Operation in VHDL

## Overview
This project implements a 3x3 image filtering operation on a 64x64 grayscale image using VHDL. The goal is to perform real-time image filtering by applying a 3x3 convolution kernel to the input image, followed by normalization of the output pixel values.

## Project Components
1. **Memory Elements:**
   - **RAM:** Stores the input image.
   - **ROM:** Holds the convolution kernel values.
   - **Registers:** Used for intermediate storage during computation.

2. **Compute Unit:**
   - Performs the 3x3 convolution operation.
   - Handles the accumulation of the filtered values.

3. **Normalization Unit:**
   - Ensures the output pixel values fit within the 0-255 range.

## Implementation Details
### Convolution Operation
The convolution operation is performed using a 3x3 kernel, where each pixel value of the output image is computed as the weighted sum of the corresponding 3x3 neighborhood in the input image.

### Memory Layout
- **Input Image:** Stored in RAM as a 64x64 array of 8-bit grayscale values.
- **Kernel:** Stored in ROM as a 3x3 array of signed integers.

### Normalization
After convolution, the resulting pixel values are normalized to ensure they fall within the 0-255 range. This is done by scaling the values appropriately.

## Usage
### Simulation
To simulate the design, use a VHDL simulator (e.g., ModelSim, GHDL). Load the testbench file and run the simulation to verify the functionality of the image filtering operation.

### Synthesis
To synthesize the design for implementation on an FPGA, use a synthesis tool (e.g., Xilinx Vivado, Altera Quartus). Ensure that all VHDL files are included in the project and generate the necessary bitstream for programming the FPGA.

## Requirements
- VHDL Simulator (e.g., ModelSim, GHDL)
- FPGA Synthesis Tool (e.g., Xilinx Vivado, Altera Quartus)

