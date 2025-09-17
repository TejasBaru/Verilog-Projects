# 4x1 Multiplexer using 2x1 Multiplexers

A **multiplexer (MUX)** is a combinational circuit that selects one input line from multiple inputs and forwards it to a single output line based on the value of select inputs.  
This project implements a **4-to-1 multiplexer** using three **2-to-1 multiplexers**.

---

## 📂 Files
- **mux_21.v** → RTL code for 2x1 MUX  
- **mux_41.v** → RTL code for 4x1 MUX (built from 2x1 MUXes)  
- **mux_41_tb.v** → Testbench for 4x1 MUX  

---

## 🧮 Functionality
- **Inputs:**
  - `I[3:0]` → 4-bit input lines (I0, I1, I2, I3)  
  - `sel[1:0]` → 2-bit select input  

- **Output:**
  - `Y` → selected output line  

---

## 🗂 Truth Table

| sel[1] | sel[0] | Selected Input | Y   |
|--------|--------|----------------|-----|
|   0    |   0    | I0             | I0  |
|   0    |   1    | I1             | I1  |
|   1    |   0    | I2             | I2  |
|   1    |   1    | I3             | I3  |

---

## ⚙️ Working Principle
- `u1` → selects between I0 and I1 using sel[0].  
- `u2` → selects between I2 and I3 using sel[0].  
- `u3` → selects between outputs of u1 and u2 using sel[1].  

Thus, a **tree of 2x1 MUXes** is used to build a 4x1 MUX.

---

## ▶️ How to Simulate

### Using Icarus Verilog
```bash
iverilog -o mux_sim mux_21.v mux_41.v mux_41_tb.v
vvp mux_sim
gtkwave dump.vcd &

Using Xilinx ISE (ISim)

    Create a new project.

    Add mux_21.v, mux_41.v, and mux_41_tb.v.

    Set mux_41_tb.v as the top module.

    Run behavioral simulation.

📈 Waveform

![Waveform](waveform.png)

The waveform should show that:

    When sel = 00, Y follows I0.

    When sel = 01, Y follows I1.

    When sel = 10, Y follows I2.

    When sel = 11, Y follows I3.
