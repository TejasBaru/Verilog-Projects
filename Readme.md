# 🧠 8-to-3 Priority Encoder (Verilog HDL)

## 📘 Overview
This project implements an **8-to-3 Priority Encoder** in **Verilog HDL**, along with its **testbench** for functional simulation and waveform verification.  
The design determines the binary code of the **highest-priority active input** among eight possible input lines.

---

## ⚙️ Features
- 8-bit input (`D[7:0]`)  
- 3-bit encoded output (`Y[2:0]`)  
- `valid` output signal to indicate at least one active input  
- Fully verified with a testbench  
- Waveform generation using `dump.vcd`  
- Works seamlessly with **Icarus Verilog** and **GTKWave**

---

## 🧩 Theory: Priority Encoder

A **priority encoder** is a combinational circuit that compresses multiple active inputs into a smaller number of output bits.  
If multiple inputs are active (`1`), the **highest-priority input (most significant bit)** takes precedence.

### 🧮 Truth Table

| Input (D7..D0) | Output (Y2 Y1 Y0) | Valid |
|-----------------|-------------------|--------|
| 00000000        | XXX               | 0 |
| 00000001        | 000               | 1 |
| 0000001X        | 001               | 1 |
| 000001XX        | 010               | 1 |
| 00001XXX        | 011               | 1 |
| 0001XXXX        | 100               | 1 |
| 001XXXXX        | 101               | 1 |
| 01XXXXXX        | 110               | 1 |
| 1XXXXXXX        | 111               | 1 |

> When multiple inputs are high, **the leftmost ‘1’ (highest index)** decides the output.

---

## 🧠 Design Explanation

### 🔹 RTL Module: `priority83.v`
Implements the **8-to-3 priority encoding logic** using a `casex` statement inside an `always` block.  
The `valid` output indicates whether any bit in the input is active.

### 🔹 Testbench: `priority83_tb.v`
The **testbench** applies multiple input combinations to verify:
- Single active input  
- Multiple active inputs  
- No active input  

It also generates the **`dump.vcd`** file for waveform visualization in **GTKWave**.

---

## 🏗️ Project Structure

├── priority83.v # RTL Design (8:3 Priority Encoder)
├── priority83_tb.v # Testbench
├── dump.vcd # Waveform file (generated after simulation)
└── README.md # Documentation


---

## 🔑 Encoder I/O
- **Inputs**
  - `D[7:0]` : 8-bit input lines where D7 has the highest priority
- **Outputs**
  - `Y[2:0]` : 3-bit encoded output
  - `valid` : Indicates if any input is active

---

## 🧪 Simulation Procedure

### 🧰 Requirements
Install the following tools:

```bash
sudo apt install iverilog gtkwave

▶️ Steps to Simulate

    Compile the Design and Testbench

iverilog -o priority83_sim priority83.v priority83_tb.v

Run the Simulation

vvp priority83_sim

View the Waveform (optional)

    gtkwave dump.vcd &

📊 Example Output (Console Example)

----- 8:3 Priority Encoder Simulation -----
# Time inputs: D=00000000 | valid=0 | Y=xxx
# Time inputs: D=00000001 | valid=1 | Y=000
# Time inputs: D=00000010 | valid=1 | Y=001
# Time inputs: D=00000100 | valid=1 | Y=010
# Time inputs: D=00001000 | valid=1 | Y=011
# Time inputs: D=00010000 | valid=1 | Y=100
# Time inputs: D=00100000 | valid=1 | Y=101
# Time inputs: D=01000000 | valid=1 | Y=110
# Time inputs: D=10000000 | valid=1 | Y=111
# Time inputs: D=10101010 | valid=1 | Y=111
# Time inputs: D=01010101 | valid=1 | Y=110
# Time inputs: D=00110011 | valid=1 | Y=101
# Time inputs: D=11001100 | valid=1 | Y=111
# Time inputs: D=00010001 | valid=1 | Y=100

🧠 Applications

    Interrupt handling systems – to identify the highest-priority interrupt

    Bus arbitration – to grant access based on priority

    Resource allocation in multi-core systems

    Control systems and encoders in digital electronics

✅ Future Improvements

    Add support for parameterized input width (e.g., 16:4 or 32:5 encoder)

    Include enable and group signal for cascading multiple encoders

    Implement pipelined version for high-speed applications

    Integrate with interrupt controller module as a subsystem

▶️ How to Simulate

Using Icarus Verilog

iverilog -o priority83_sim priority83.v priority83_tb.v
vvp priority83_sim
gtkwave dump.vcd &

Using Xilinx ISE (ISim)

    Create a new project in ISE.

    Add priority83.v and priority83_tb.v to the project.

    Set priority83_tb.v as the top module.

    Run Behavioral Simulation to view outputs.

🏁 Conclusion

This project demonstrates the design and verification of an 8:3 Priority Encoder using Verilog HDL.
The implementation efficiently identifies the highest-priority active input and produces its corresponding binary output, verified through simulation and testbench validation.
