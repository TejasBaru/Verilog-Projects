# Verilog ALU Project

## 📌 Overview
This project implements an **Arithmetic and Logic Unit (ALU)** in Verilog.  
The ALU is capable of performing multiple arithmetic, logical, and shift operations based on a control input (`command`).  
The design has been verified using a Verilog testbench and simulated using **ISim**.

---

## ⚙️ Features
The ALU supports the following operations (depending on the `command` signal):

- **Arithmetic Operations**
  - Addition
  - Subtraction
  - Multiplication
  - Division
  - Increment
  - Decrement

- **Shift Operations**
  - Logical Shift Left
  - Logical Shift Right
  - Arithmetic Shift Right

- **Logic Gates**
  - AND
  - OR
  - XOR
  - NOR
  - NAND
  - XNOR
  - NOT
  - Buffer

---

## 🏗️ Project Structure

├── alu.v # Main ALU module
├── alu_tb.v # Testbench for ALU
├── waveform.wcfg # ISim waveform configuration
├── README.md # Project documentation


---

## 🔑 ALU I/O
- **Inputs**
  - `a` : First operand (8-bit)
  - `b` : Second operand (8-bit)
  - `command` : Control signal to select operation

- **Output**
  - `out` : Result of operation (16-bit for multiplication, otherwise 8-bit)

---

## ▶️ Simulation
1. Compile the design:
   ```bash
   iverilog -o alu_tb alu.v alu_tb.v
   vvp alu_tb
   gtkwave alu_tb.vcd
📊 Example Output (Console Log)
time=960000 | a=0 | b=6 | out=6
time=970000 | a=0 | b=6 | out=10
time=980000 | a=0 | b=6 | out=-6
time=990000 | a=0 | b=6 | out=0
✅ Future Improvements

Add support for signed operations

Overflow detection

Extend to 16-bit / 32-bit operands

🧑‍💻 Author

Developed as part of Verilog Lab Project

Language: Verilog HDL

Tools: ISim / Icarus Verilog / GTKWave

▶️ How to Simulate
    Using Icarus Verilog
       iverilog -o alu_sim alu.v alu_tb.v
       vvp alu_sim
       gtkwave alu_tb.vcd &

Using Xilinx ISE (ISim)

    Create a new project.

    Add alu.v and alu_tb.v.

   Set alu_tb.v as the top module.

   Run Behavioral Simulation.
   
📈 Waveform
![Waveform](Waveform.png)

The waveform will confirm:

Correct arithmetic operations (ADD, SUB, MUL, DIV, INC, DEC, SHL, SHR).

Correct logical operations (AND, OR, INV).

Correct bitwise operations (NAND, NOR, XOR, XNOR, BUF).

High-impedance output when oe = 0.
