# Simple Microprocessor Design using ALU and Register File

## Project Overview
This project involves designing and implementing a simplified microprocessor comprising an Arithmetic Logic Unit (ALU) and a register file. The microprocessor executes basic arithmetic and logical operations, synchronized using a clock signal.

## Objectives
- Implement a 32-bit ALU supporting various arithmetic and logical operations.
- Design a register file capable of storing operands and results.
- Integrate ALU and register file to perform sequential instructions.
- Test and validate the functionality through comprehensive simulations.

## ALU Operations Implemented
- Addition (`a + b`)
- Subtraction (`a - b`)
- Absolute value (`|a|`)
- Negation (`-a`)
- Maximum (`max(a, b)`)
- Minimum (`min(a, b)`)
- Average (`avg(a, b)`)
- Logical NOT (`not a`)
- Logical OR (`a or b`)
- Logical AND (`a and b`)
- Logical XOR (`a xor b`)

## Register File
- A 32 x 32-bit storage array.
- Synchronization with a clock signal.
- Uses a valid opcode check to prevent incorrect writes.

## Microprocessor Integration
- Integrated ALU and register file components.
- Included an opcode validation mechanism.
- Designed instructions in 32-bit format (opcode, source registers, destination register).

## Testing and Validation
- Developed a Verilog testbench with multiple instruction sequences.
- Verified instructions over two clock cycles per instruction.
- Tested operations and compared outputs with expected results to ensure accuracy.

## Project Structure
- `alu.v`: Verilog description of the ALU.
- `reg_file.v`: Verilog description of the register file.
- `mp_top.v`: Top-level module integrating ALU and register file.
- `testbench.v`: Simulation testbench containing various instructions and results validation.

## Simulation
- Simulated using Verilog simulation tools (e.g., ModelSim).
- Verified accurate execution of arithmetic and logical instructions.

## How to Run the Project
1. Clone this repository.
2. Load project files into your Verilog simulator.
3. Execute the provided testbench (`testbench.v`) and analyze results.


## University
Birzeit University, Faculty of Engineering and Technology, Department of Electrical and Computer Engineering.

## Date
January 19, 2024

