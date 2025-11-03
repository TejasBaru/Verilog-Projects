# 🎚️ 4x1 Multiplexer using 2x4 Decoder and Tri-State Buffers (Verilog HDL)

## 📘 Overview
This project implements a **4-to-1 Multiplexer** using a **2-to-4 Decoder** and **Tri-State Buffers** in **Verilog HDL**.  
It demonstrates how tri-state logic can be used to build bus-based multiplexing circuits without directly using logic gates.  

---

## ⚙️ Features
- 4 input lines (`I0–I3`) with a single output (`Y`)  
- 2-bit select lines (`sel[1:0]`) determine which input is active  
- **Enable control (`en`)** to activate or disable the entire circuit  
- Tri-state buffers ensure only one input drives the output at a time  
- Generates `dump.vcd` for waveform analysis  
- Fully compatible with **Icarus Verilog**, **GTKWave**, and **Xilinx ISim**

---

## 📂 Files
- **tristatebuffer.v** → RTL for tri-state buffer  
- **decoder2x4.v** → RTL for 2x4 decoder  
- **mux_41.v** → RTL for 4x1 multiplexer (decoder + tri-state integration)  
- **mux_41_tb.v** → Testbench for functional verification  
- **dump.vcd** → Simulation waveform file  
- **README.md** → Project documentation  

---

## 🧮 Functionality
### 🔹 Inputs:
- `I[3:0]` → Four data inputs (I0, I1, I2, I3)  
- `sel[1:0]` → 2-bit select signal to choose the active input  
- `en` → Enable signal to activate the multiplexer  

### 🔹 Output:
- `Y` → Output of the selected input (or `Z` when disabled)  

---

## 🗂 Truth Table

| en | sel[1] | sel[0] | Output (Y) |
|----|--------|--------|-------------|
| 0  |   X    |   X    | High-Z (Z)  |
| 1  |   0    |   0    | I0          |
| 1  |   0    |   1    | I1          |
| 1  |   1    |   0    | I2          |
| 1  |   1    |   1    | I3          |

> When `en = 0`, all tri-state buffers are disabled and output `Y` goes to **high impedance (Z)**.

---

## ⚙️ Working Principle
1. The **2x4 Decoder** decodes the 2-bit `sel` input into four **one-hot outputs**.  
2. Each decoder output enables **one tri-state buffer**, connected to a corresponding input line.  
3. Only one tri-state buffer is active at any time, connecting its input to the shared output `Y`.  
4. When `en = 0`, all tri-state buffers remain in high-impedance, ensuring `Y` floats (no active driver).  

This approach provides an efficient bus-based MUX design, avoiding logic gate interference.

---

## 🧪 Simulation Procedure

### 🧰 Requirements
Install the following tools:
```bash
sudo apt install iverilog gtkwave
```
### ▶️ Using Icarus Verilog
```bash
iverilog -o mux41_dec_sim tristatebuffer.v decoder2x4.v mux_41.v mux_41_tb.v
vvp mux41_dec_sim
gtkwave dump.vcd &
```
### ▶️ Using Xilinx ISE (ISim)
1. Create a new project in Xilinx ISE.
2. Add tristatebuffer.v, decoder2x4.v, mux_41.v, and mux_41_tb.v.
3. Set mux_41_tb.v as the top module.
4. Run Behavioral Simulation to verify the circuit operation.

## 📊 Example Output (Console)
```bash
----- 4x1 MUX using Decoder and Tri-State Buffers -----
# en=0 → Y=Z
# en=1, sel=00 → Y=I0
# en=1, sel=01 → Y=I1
# en=1, sel=10 → Y=I2
# en=1, sel=11 → Y=I3
```
## 📈 Waveform

![Waveform](Waveform.png)

The waveform confirms:
1. Only one input drives the output at a time.
2. When en=0, the output Y remains in high-impedance (Z).
3. Correct one-hot selection according to decoder output.

## 🧠 Applications
1. Bus-based multiplexing in microprocessors
2. Shared data lines in memory systems
3. I/O port selection and data routing
4. Tri-state buffer logic demonstration circuits

## ✅ Future Improvements

1. Add cascading for 8x1 or 16x1 multiplexers
2. Parameterize the design for scalability
3. Add enable chaining for hierarchical control
4. Automate testbench with dynamic stimulus generation

## 🏁 Conclusion

This project showcases the design of a 4x1 Multiplexer using a 2x4 Decoder and Tri-State Buffers in Verilog HDL.
It highlights the concept of tri-state bus control and hierarchical hardware design, making it ideal for digital design learning and practical lab implementations.
