[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/pelSJLGu)
# Catalog of Verilog Components to Build and Simulate a MIPS-based RISC.

Design Explanation:
- ALU Operand Size is 16 bits.
- Instruction width is 16 bits.
- Support 12 ALU operations: add, subtract, shift left, shift right, and, or, not, set less than
- The Operational Code (OpCode) is 3 bits.
- 8 registers for the programs (3 bits for register addressing).
- n=16 bits and r=3 bits. n is the operand bit size and r represents the number of bits to address registers.
- 3 types of instruction format: Register (R), Immediate (I), & Jump (J)
- Datapath and Control Unit similar to MIPs, with changes we deemed necessary
- Single-cycle instruction execution
Verilog components include: Adder, Alu, AluDecoder, Clock, Computer, Controller, Cpu, D-Flip Flops, Datapath, Dmem, FullAdder, Imem, MainDecoder, Mux (2:1), RegisterFile, SignExtender, and Sl2 (Shift left 2)

ISA:
![image](https://github.com/cooper-union-ece-251-marano/final-project-ece-251-spring-2024-next_apple/assets/112995348/1b40db5d-909f-4101-b09d-d42b77590393)

Instruction Format:
![image](https://github.com/cooper-union-ece-251-marano/final-project-ece-251-spring-2024-next_apple/assets/112995348/93fed2ea-7a2c-4ffc-9896-36a0dce05360)

Diagram:
![Image (3)](https://github.com/cooper-union-ece-251-marano/final-project-ece-251-spring-2024-next_apple/assets/112995348/36b7977e-6171-4903-a78c-42cc3e6d8a93)



