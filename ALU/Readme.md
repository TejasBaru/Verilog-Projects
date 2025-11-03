# 🔀 Bidirectional Buffer – Verilog RTL

## 📘 Overview
This project implements a **Bidirectional Buffer** in **Verilog RTL** and verifies its operation through a **testbench simulation**.  
A bidirectional buffer allows signals to flow **in both directions**—but **only one direction at a time**, controlled by an **enable/control signal**.

---

## 🧠 Theory
The **Bidirectional Buffer** is widely used in shared bus systems where multiple devices communicate over the same data lines.  
Depending on the control signal:

- When `control = 1` → data flows **from A → B**.  
- When `control = 0` → data flows **from B → A**.  

To implement this in Verilog, the design uses built-in primitives:

- `bufif1` → passes the input signal when control = 1 (otherwise outputs high-impedance `Z`).  
- `bufif0` → passes the input signal when control = 0 (otherwise outputs high-impedance `Z`).  

This ensures **only one direction is active** at a time and prevents **bus contention**.

---

## 📂 Files
- **bidirectional_buffer.v** → RTL code for Bidirectional Buffer  
- **bidirectional_buffer_tb.v** → Testbench for verification  

---

## ⚙️ Functionality

| Control | Data Direction | Active Buffer | Description |
|----------|----------------|----------------|--------------|
| 1 | A → B | bufif1 | A drives B |
| 0 | B → A | bufif0 | B drives A |

When one buffer is active, the other output remains in high-impedance (`Z`), allowing safe bidirectional communication.

---

## ▶️ How to Simulate

### Using Icarus Verilog
```bash
iverilog -o bidbuffer_sim bidirectional_buffer.v bidirectional_buffer_tb.v
vvp bidbuffer_sim
gtkwave dump.vcd &
```
### Using Xilinx ISE (ISim)
```
    Create a new project in Xilinx ISE.

    Add bidirectional_buffer.v and bidirectional_buffer_tb.v.

    Set bidirectional_buffer_tb.v as the top module.

    Run Behavioral Simulation and view the results.
```
## 📊 Expected Output
```
    When control = 1 → A drives B.

    When control = 0 → B drives A.

    High-impedance (Z) appears on the inactive line.
```
---
## 📈 Waveform

![Waveform](Waveform.png)
---
```Waveform Behavior:
The simulation waveform shows alternating drive directions as the control signal toggles.
```
## 🧰 Applications
```
    Used in microprocessor data buses.

    Prevents bus contention in shared communication lines.

    Commonly found in I²C, memory systems, and bidirectional I/O ports.
```


✅ This project demonstrates bidirectional data control using Verilog primitives, showing how signal direction can be efficiently managed using bufif1 and bufif0.
