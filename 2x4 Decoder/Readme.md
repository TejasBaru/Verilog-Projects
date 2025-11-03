# 🔢 2x4 Decoder (Verilog HDL)

## 📘 Overview
This project implements a **2-to-4 Line Decoder** in **Verilog HDL**, along with a **testbench** for simulation and verification.  
A decoder is a **combinational logic circuit** that converts binary-encoded input data into a corresponding one-hot output.  
The design includes an **enable input** (`en`) to control when the decoder is active.

---

## ⚙️ Features
- 2-bit binary input (`a[1:0]`)  
- 4-bit one-hot output (`y[3:0]`)  
- Enable signal (`en`) to control output activation  
- Verified with a testbench  
- Generates `dump.vcd` for waveform analysis  
- Compatible with **Icarus Verilog**, **GTKWave**, and **Xilinx ISim**

---

## 📂 Files
- **Decoder_2x4.v** → RTL code for the 2x4 decoder  
- **Decoder_2x4_tb.v** → Testbench for simulation  

---

## 🧮 Functionality
### 🔹 Inputs:
- `a[1:0]` → 2-bit input (selects which output line is activated)  
- `en` → enable signal (decoder is active only when `en = 1`)  

### 🔹 Outputs:
- `y[3:0]` → 4-bit one-hot encoded output (only one line goes high at a time)  

---

## 🗂 Truth Table

| en | a1 | a0 | y3 | y2 | y1 | y0 |
|----|----|----|----|----|----|----|
| 0  |  X |  X |  0 |  0 |  0 |  0 |
| 1  |  0 |  0 |  0 |  0 |  0 |  1 |
| 1  |  0 |  1 |  0 |  0 |  1 |  0 |
| 1  |  1 |  0 |  0 |  1 |  0 |  0 |
| 1  |  1 |  1 |  1 |  0 |  0 |  0 |

> When `en = 0`, all outputs remain low (`0`).  
> When `en = 1`, one output line corresponding to the binary input combination becomes `1`.

---

## ⚙️ Working Principle
The **decoder** activates a single output line corresponding to the binary input combination:
- The **2-bit input (`a1 a0`)** determines which of the four outputs is high.  
- When **`en = 0`**, the decoder is disabled and all outputs remain `0`.  
- This is commonly used in **memory address decoding**, **data selection**, and **control signal generation**.

---

## 🏗️ Project Structure

├── Decoder_2x4.v # RTL Design (2x4 Decoder)
├── Decoder_2x4_tb.v # Testbench for simulation
├── dump.vcd # Generated waveform file
└── README.md # Documentation


---

## 🔑 Decoder I/O
- **Inputs**
  - `a[1:0]` → 2-bit binary input
  - `en` → Enable control
- **Outputs**
  - `y[3:0]` → One-hot 4-bit output

---

## 🧪 Simulation Procedure

### 🧰 Requirements
Install the following tools:

```bash
sudo apt install iverilog gtkwave

## ▶️ Steps to Simulate

Using Icarus Verilog

iverilog -o dec_sim Decoder_2x4.v Decoder_2x4_tb.v
vvp dec_sim
gtkwave dump.vcd &

---

Using Xilinx ISE (ISim)

Create a new project in Xilinx ISE.

Add Decoder_2x4.v and Decoder_2x4_tb.v to the project.

Set Decoder_2x4_tb.v as the top module.

Run Behavioral Simulation.

## 📊 Example Output (Console Example)

----- 2x4 Decoder Simulation -----
# en=0, a=00 → y=0000
# en=1, a=00 → y=0001
# en=1, a=01 → y=0010
# en=1, a=10 → y=0100
# en=1, a=11 → y=1000

## 🧠 Applications

    Memory address decoding

    Chip enable control

    Instruction decoding in processors

    Signal demultiplexing

    Microcontroller peripheral selection

## ✅ Future Improvements

    Add 3x8 or 4x16 decoder using parameterized design

    Include enable chaining for cascading decoders

    Add test vector automation in the testbench

    Extend for BCD-to-decimal decoding

## 🏁 Conclusion

This project demonstrates the design and verification of a 2x4 Decoder using Verilog HDL.
The decoder converts a 2-bit binary input into one of four unique outputs, ensuring only a single active line at any time.
The design is simple, scalable, and fundamental to digital systems such as memory addressing and control circuits.
