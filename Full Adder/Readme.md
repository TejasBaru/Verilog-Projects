#  Full Adder

A **Full Adder** is a combinational circuit that performs the arithmetic sum of three input bits (two significant bits and a carry-in).  
It produces a sum and a carry-out as outputs.

---

## 📂 Files
- **fa.v** → RTL code for 1-bit Full Adder  
- **fa_tb.v** → Testbench for Full Adder  

---

## 🧮 Functionality
- **Inputs:**
  - `a` → first input bit  
  - `b` → second input bit  
  - `cin` → carry input  

- **Outputs:**
  - `sum` → result of (a ⊕ b ⊕ cin)  
  - `carry` → carry output from addition  

---

## 🗂 Truth Table

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

---

## ⚙️ Working Principle
- `sum = a ⊕ b ⊕ cin`  
- `carry = (a & b) | (b & cin) | (a & cin)`  

The sum is calculated using XOR gates, while the carry is derived from majority logic.

---

## ▶️ How to Simulate

### Using Icarus Verilog
```bash
iverilog -o fa_sim fa.v fa_tb.v
vvp fa_sim
gtkwave dump.vcd &

Using Xilinx ISE (ISim)

    Create a new project.

    Add fa.v and fa_tb.v.

    Set fa_tb.v as the top module.

    Run behavioral simulation.

📈 Waveform

![Waveform](waveform.png)


The waveform will confirm:

    Correct sum and carry outputs according to the truth table.

