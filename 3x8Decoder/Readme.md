
# 🔢 3x8 Decoder (Verilog HDL)

## 📘 Overview
This project implements a **3-to-8 Line Decoder** in **Verilog HDL**, along with a **testbench** for simulation and verification.  
A decoder is a **combinational logic circuit** that converts binary-encoded input data into a corresponding one-hot output.  
The design includes an **enable input** (`en`) to control when the decoder is active.

---

## ⚙️ Features
- 3-bit binary input (`A[2:0]`)  
- 8-bit one-hot output (`Y[7:0]`)  
- Enable signal (`en`) to control output activation  
- Verified with a testbench  
- Generates `dump.vcd` for waveform analysis  
- Compatible with **Icarus Verilog**, **GTKWave**, and **Xilinx ISim**

---

## 📂 Files
- **decoder3_8.v** → RTL code for the 3x8 decoder  
- **decoder3_8_tb.v** → Testbench for simulation  

---

## 🧮 Functionality
### 🔹 Inputs:
- `A[2:0]` → 3-bit input (selects which output line is activated)  
- `en` → enable signal (decoder is active only when `en = 1`)  

### 🔹 Outputs:
- `Y[7:0]` → 8-bit one-hot encoded output (only one line goes high at a time)  

---

## 🗂 Truth Table

| en | A2 | A1 | A0 | Y7 | Y6 | Y5 | Y4 | Y3 | Y2 | Y1 | Y0 |
|----|----|----|----|----|----|----|----|----|----|----|----|
| 0  |  X |  X |  X |  0 |  0 |  0 |  0 |  0 |  0 |  0 |  0 |
| 1  |  0 |  0 |  0 |  0 |  0 |  0 |  0 |  0 |  0 |  0 |  1 |
| 1  |  0 |  0 |  1 |  0 |  0 |  0 |  0 |  0 |  0 |  1 |  0 |
| 1  |  0 |  1 |  0 |  0 |  0 |  0 |  0 |  0 |  1 |  0 |  0 |
| 1  |  0 |  1 |  1 |  0 |  0 |  0 |  0 |  1 |  0 |  0 |  0 |
| 1  |  1 |  0 |  0 |  0 |  0 |  0 |  1 |  0 |  0 |  0 |  0 |
| 1  |  1 |  0 |  1 |  0 |  0 |  1 |  0 |  0 |  0 |  0 |  0 |
| 1  |  1 |  1 |  0 |  0 |  1 |  0 |  0 |  0 |  0 |  0 |  0 |
| 1  |  1 |  1 |  1 |  1 |  0 |  0 |  0 |  0 |  0 |  0 |  0 |

> When `en = 0`, all outputs remain low (`0`).  
> When `en = 1`, one output line corresponding to the binary input combination becomes `1`.

---

## ⚙️ Working Principle
The **decoder** activates a single output line corresponding to the binary input combination:
- The **3-bit input (`A2 A1 A0`)** determines which of the eight outputs is high.  
- When **`en = 0`**, the decoder is disabled and all outputs remain `0`.  
- This is commonly used in **memory address decoding**, **data selection**, and **control signal generation**.

---

## 🏗️ Project Structure
```
├── decoder3_8.v # RTL Design (3x8 Decoder)
├── decoder3_8_tb.v # Testbench for simulation
├── dump.vcd # Generated waveform file
└── README.md # Documentation
```
---

## 🔑 Decoder I/O
- **Inputs**
  - `A[2:0]` → 3-bit binary input
  - `en` → Enable control
- **Outputs**
  - `Y[7:0]` → One-hot 8-bit output

---

## 🧪 Simulation Procedure

### 🧰 Requirements
Install the following tools:

```bash
sudo apt install iverilog gtkwave
```
## ▶️ Steps to Simulate
```bash
Using Icarus Verilog

iverilog -o dec3_8_sim decoder3_8.v decoder3_8_tb.v
vvp dec3_8_sim
gtkwave dump.vcd &
```
---
```bash
Using Xilinx ISE (ISim)

Create a new project in Xilinx ISE.

Add decoder3_8.v and decoder3_8_tb.v to the project.

Set decoder3_8_tb.v as the top module.

Run Behavioral Simulation.
```
## 📊 Example Output (Console Example)

----- 3x8 Decoder Simulation -----
# en=0, A=000 → Y=00000000
# en=1, A=000 → Y=00000001
# en=1, A=001 → Y=00000010
# en=1, A=010 → Y=00000100
# en=1, A=011 → Y=00001000
# en=1, A=100 → Y=00010000
# en=1, A=101 → Y=00100000
# en=1, A=110 → Y=01000000
# en=1, A=111 → Y=10000000

## 🧠 Applications

Memory address decoding

Chip enable control

Instruction decoding in processors

Signal demultiplexing

Microcontroller peripheral selection

## ✅ Future Improvements

Add 4x16 decoder using parameterized design

Include enable chaining for cascading decoders

Add test vector automation in the testbench

Extend for BCD-to-decimal decoding

## 🏁 Conclusion

This project demonstrates the design and verification of a 3x8 Decoder using Verilog HDL.
The decoder converts a 3-bit binary input into one of eight unique outputs, ensuring only a single active line at any time.
The design is simple, scalable, and fundamental to digital systems such as memory addressing and control circuits.
