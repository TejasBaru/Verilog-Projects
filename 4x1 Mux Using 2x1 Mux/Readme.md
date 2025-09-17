




# 4x1 Multiplexer using 2x1 Multiplexers

Implements a 4-to-1 multiplexer using 2-to-1 multiplexers hierarchically.

---

## 📂 Files
- **mux_21.v** → RTL code for 2x1 Mux  
- **mux_41.v** → RTL code for 4x1 Mux (built from 2x1 Muxes)  
- **mux_41_tb.v** → Testbench for 4x1 Mux  

---

## 🧮 Functionality
- **Inputs:** I[3:0], sel[1:0]  
- **Output:** Y  
- Selects one of 4 inputs based on select lines.  

---

## ▶️ How to Simulate
Icarus Verilog:
```bash
iverilog -o mux_sim mux_21.v mux_41.v mux_41_tb.v
vvp mux_sim
gtkwave dump.vcd &
