# Full Adder using Half Adder

This project implements a **1-bit Full Adder** using two **Half Adders**.

---

## 📂 Files
- **half_adder.v** → RTL code for Half Adder  
- **full_adder.v** → RTL code for Full Adder (using two Half Adders)  
- **fa_tb.v** → Testbench for verifying the Full Adder  

---

## 🧮 Functionality
- **Inputs:** a, b, cin  
- **Outputs:** sum, carry  
- The full adder is constructed from two half adders and an OR gate.  

---

## ▶️ How to Simulate
Using Icarus Verilog:
```bash
iverilog -o fa_sim half_adder.v full_adder.v fa_tb.v
vvp fa_sim
gtkwave dump.vcd &
