# ➕ 4-bit Ripple Carry Adder (Verilog HDL)

## 📘 Overview
A **Ripple Carry Adder (RCA)** is a digital circuit that performs binary addition by cascading multiple **1-bit full adders**.  
Each full adder’s carry output connects to the next stage’s carry input, allowing the carry to **“ripple”** through all stages sequentially.  
This design demonstrates a **4-bit RCA** implemented in Verilog HDL and verified through simulation.

---

## ⚙️ Features
- 4-bit binary addition using 1-bit full adder modules  
- Propagation of carry from least to most significant bit  
- Produces 4-bit sum and final carry output (`Cout`)  
- Verified using a comprehensive testbench  
- Generates `dump.vcd` for waveform visualization  
- Compatible with **Icarus Verilog**, **GTKWave**, and **Xilinx ISim**

---

## 📂 Files
- **rca_1bit.v** → RTL for 1-bit Full Adder  
- **rca_4bit.v** → RTL for 4-bit Ripple Carry Adder  
- **rca_4bit_tb.v** → Testbench for simulation  
- **dump.vcd** → Waveform file generated after simulation  
- **README.md** → Project documentation  

---

## 🧮 Functionality
### 🔹 Inputs:
- `A[3:0]` → 4-bit input operand  
- `B[3:0]` → 4-bit input operand  
- `Cin` → Initial carry input  

### 🔹 Outputs:
- `Sum[3:0]` → 4-bit sum output  
- `Cout` → Final carry output  

---

## ⚙️ Working Principle
The **Ripple Carry Adder** operates by connecting four 1-bit full adders in series:
1. **Stage 1 (LSB):** Computes `Sum[0]` and generates carry `C1`.  
2. **Stage 2:** Takes `C1` as input, produces `Sum[1]` and `C2`.  
3. **Stage 3:** Uses `C2` to compute `Sum[2]`, generates `C3`.  
4. **Stage 4 (MSB):** Uses `C3` to compute `Sum[3]`, generates final carry `Cout`.  

Each carry propagates to the next stage, making the design simple yet slower for larger bit-widths due to carry delay.

---

## 🧪 Simulation Procedure

### 🧰 Requirements
Install the following tools:
```bash
sudo apt install iverilog gtkwave
```
### ▶️ Using Icarus Verilog
```bash
iverilog -o rca_sim rca_1bit.v rca_4bit.v rca_4bit_tb.v
vvp rca_sim
gtkwave dump.vcd &
```
### ▶️ Using Xilinx ISE (ISim)

1. Create a new project in Xilinx ISE.
2. Add rca_1bit.v, rca_4bit.v, and rca_4bit_tb.v.
3. Set rca_4bit_tb.v as the top module.
4. Run Behavioral Simulation to observe waveform results.

### 📊 Example Output (Console)
```bash
----- 4-bit Ripple Carry Adder Simulation -----
# A=0001, B=0010, Cin=0 → Sum=0011, Cout=0
# A=0111, B=0001, Cin=0 → Sum=1000, Cout=0
# A=1111, B=0001, Cin=0 → Sum=0000, Cout=1
```
## 🧠 Applications

    Arithmetic Logic Units (ALUs)

    Binary counters and accumulators

    Digital signal processors

    Address generation units

## ✅ Future Improvements

    Implement Carry Look-Ahead Adder (CLA) for faster performance

    Extend to 8-bit or 16-bit RCA using parameterized modules

    Add automated testbench with randomized input generation

## 🏁 Conclusion

This project demonstrates the design and verification of a 4-bit Ripple Carry Adder in Verilog HDL.
It performs accurate binary addition by cascading 1-bit full adders, producing both sum and carry outputs.
The RCA serves as a foundational component for more complex arithmetic circuits such as ALUs and accumulators.
