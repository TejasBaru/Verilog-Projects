# 4-bit Ripple Carry Adder

A **Ripple Carry Adder (RCA)** is a digital circuit that adds two multi-bit binary numbers by cascading several **1-bit full adders**.  
The carry output of each full adder is connected to the carry input of the next stage, causing the carry to "ripple" through the adder chain.

---

## 📂 Files
- **rca_1bit.v** → RTL code for 1-bit full adder (basic building block)  
- **rca_4bit.v** → RTL code for 4-bit Ripple Carry Adder (built from 1-bit adders)  
- **rca_4bit_tb.v** → Testbench for simulation  

---

## 🧮 Functionality
- **Inputs:**
  - `A[3:0]` → 4-bit input operand  
  - `B[3:0]` → 4-bit input operand  
  - `Cin` → carry input  

- **Outputs:**
  - `Sum[3:0]` → 4-bit sum result  
  - `Cout` → final carry output  

---

## 🗂 Truth Table (1-bit Adder Basis)

For each bit adder:

| a | b | cin | sum | carry |
|---|---|-----|-----|-------|
| 0 | 0 | 0   |  0  |   0   |
| 0 | 0 | 1   |  1  |   0   |
| 0 | 1 | 0   |  1  |   0   |
| 0 | 1 | 1   |  0  |   1   |
| 1 | 0 | 0   |  1  |   0   |
| 1 | 0 | 1   |  0  |   1   |
| 1 | 1 | 0   |  0  |   1   |
| 1 | 1 | 1   |  1  |   1   |

The 4-bit RCA applies this logic bit by bit, with carries propagating forward.

---

## ⚙️ Working Principle
1. **Stage 1:** LSB adder computes `Sum[0]` and generates carry `C1`.  
2. **Stage 2:** Uses `C1` as input to compute `Sum[1]`, generates `C2`.  
3. **Stage 3:** Uses `C2` to compute `Sum[2]`, generates `C3`.  
4. **Stage 4:** Uses `C3` to compute `Sum[3]`, produces final `Cout`.  

Thus, the carry propagates through each stage, making the design simple but slower for large bit-widths.

---

## ▶️ How to Simulate

### Using Icarus Verilog
```bash
iverilog -o rca_sim rca_1bit.v rca_4bit.v rca_4bit_tb.v
vvp rca_sim
gtkwave dump.vcd &

Using Xilinx ISE (ISim)

    Create a new project.

    Add rca_1bit.v, rca_4bit.v, and rca_4bit_tb.v.

    Set rca_4bit_tb.v as the top module.

    Run behavioral simulation.

📈 Waveform

![Waveform](waveform.png)
