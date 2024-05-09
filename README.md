[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/pelSJLGu)
# Next Apple 16-bit RISC Processor.

Design Explanation:
- ALU Operand Size is 16 bits.
- Instruction width is 16 bits.
- Instruction set is based on a subset of the MIPS instruction set, which includes arithmetic, logical, load word /store word, branch, and jump instructions.
- Word-addressable memory
- 32 memory locations
- Supports 8 ALU operations: add, subtract, shift left, shift right, and, or, not, set less than
- The Operational Code (OpCode) is 3 bits.
- 8 registers for the programs (3 bits for register addressing).
- n=16 bits and r=3 bits. n is the operand bit size and r represents the number of bits to address registers.
- 3 types of instruction format: Register (R), Immediate (I), & Jump (J)
- Datapath and Control Unit similar to MIPs, with changes we deemed necessary
- Single-cycle instruction execution
Verilog components include: Adder, Alu, AluDecoder, Clock, Computer, Controller, Cpu, D-Flip Flops, Datapath, Dmem, FullAdder, Imem, MainDecoder, Mux (2:1), RegisterFile, SignExtender, and Sl2 (Shift left 1)

Modifying a 32-bit processor to be a 16-bit processor:

We modified sl2 into sl1, because our instruction word size is 2 bytes instead of 4 bytes. This means that to be word-aligned, the byte addresses should be shifted left by 1. Generally, we had to decrease the bit size of each field for all instruction types. We reduced the instruction set to 6 op codes, which can be represented by 3 bits. We allocated 8 registers for the regfile, so 3 bits of the instruction are needed to address every register used in the instruction. Additionally, we changed the program counter to increment by 1 (pcplus1) instead of 4 (pcplus4), given that our memory is word-addressable. 

ISA:
![image](https://github.com/cooper-union-ece-251-marano/final-project-ece-251-spring-2024-next_apple/assets/112995348/1b40db5d-909f-4101-b09d-d42b77590393)

Instruction Format:
![image](https://github.com/cooper-union-ece-251-marano/final-project-ece-251-spring-2024-next_apple/assets/112995348/93fed2ea-7a2c-4ffc-9896-36a0dce05360)

Diagram:
![Image (3)](https://github.com/cooper-union-ece-251-marano/final-project-ece-251-spring-2024-next_apple/assets/112995348/36b7977e-6171-4903-a78c-42cc3e6d8a93)

Discussion:
Although our project ultimately was not able to compile and run, we learned a lot in getting to this point. We created test benches for each module and ensured that each module works, excluding the datapath. After days of troubleshooting and debugging, we understood that there is a problem in how the modules are instantiated and connected together.
Despite these shortcomings, we learned a lot about how a CPU and processor is built from simple digital components, and we are excited to see where this knowledge will take us in future classes.
