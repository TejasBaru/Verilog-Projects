# Full Adder


## 📂 Files
- **fa.v** → RTL code for Full Adder  
- **fa_tb.v** → Testbench for Full Adder  

---

## 🧮 Functionality
- **Inputs:** a, b, cin  
- **Outputs:** sum, carry  
- Performs binary addition of three 1-bit inputs.  

Truth table:

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

## ▶️ How to Simulate
Icarus Verilog:
```bash
iverilog -o fa_sim full_adder.v fa_tb.v
vvp fa_sim
gtkwave dump.vcd &
