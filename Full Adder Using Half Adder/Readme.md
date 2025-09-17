# Full Adder using Half Adder

This project implements a **1-bit Full Adder** by combining two **Half Adders** and an OR gate.  
It demonstrates hierarchical design: building a complex circuit using smaller building blocks.

---

## 📂 Files
- **half_adder.v** → RTL code for 1-bit Half Adder  
- **full_adder.v** → RTL code for Full Adder (constructed using two Half Adders and an OR gate)  
- **fa_tb.v** → Testbench for simulation  

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
1. First half adder: adds inputs `a` and `b`.  
   - Produces intermediate sum `s1` and carry `c1`.  
2. Second half adder: adds `s1` and `cin`.  
   - Produces final `sum` and carry `c2`.  
3. Final carry = `c1 OR c2`.  

This approach shows how modular design can be used to implement larger circuits.

---

## ▶️ How to Simulate

### Using Icarus Verilog
```bash
iverilog -o fa_ha_sim half_adder.v full_adder.v fa_tb.v
vvp fa_ha_sim
gtkwave dump.vcd &

Using Xilinx ISE (ISim)

    Create a new project.

    Add half_adder.v, full_adder.v, and fa_tb.v.

    Set fa_tb.v as the top module.

    Run behavioral simulation.

📈 Waveform

![Waveform](waveform.png)
