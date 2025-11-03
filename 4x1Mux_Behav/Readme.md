# 🎚️ 4x1 Multiplexer using Behavioral Modeling (Verilog HDL)

## 📘 Overview
This project implements a **4-to-1 Multiplexer (MUX)** using **behavioral modeling** in **Verilog HDL**.  
A multiplexer is a **combinational circuit** that selects one input from multiple data inputs based on select lines and forwards it to the output.  
This design uses a **`case` statement** to describe the selection logic.

---

## ⚙️ Features
- Implements a **4:1 MUX** using behavioral modeling (`always` + `case`)  
- Two select lines choose one of four input signals  
- Includes a comprehensive **testbench** with initialization and stimulus tasks  
- Generates `dump.vcd` for waveform analysis  
- Compatible with **Icarus Verilog**, **GTKWave**, and **Xilinx ISim**

---

## 📂 Files
- **mux4_1.v** → RTL code for 4x1 MUX  
- **mux4_1_tb.v** → Testbench for simulation  
- **dump.vcd** → Generated waveform file  
- **README.md** → Project documentation  

---

## 🧮 Functionality
### 🔹 Inputs:
- `data_in[3:0]` → 4-bit input lines (D0, D1, D2, D3)  
- `sel_in[1:0]` → 2-bit select input to choose which input is passed to output  

### 🔹 Output:
- `y` → Output signal (corresponds to the selected input line)  

---

## 🗂 Truth Table

| sel_in[1] | sel_in[0] | Selected Input | Output (y) |
|------------|------------|----------------|-------------|
|     0      |     0      | data_in[0]     | data_in[0]  |
|     0      |     1      | data_in[1]     | data_in[1]  |
|     1      |     0      | data_in[2]     | data_in[2]  |
|     1      |     1      | data_in[3]     | data_in[3]  |

> If no valid select line is provided, the output `y` is set to high impedance (`Z`).

---

## ⚙️ Working Principle
1. The **`sel_in`** input determines which of the four data inputs is connected to the output.  
2. A **`case` statement** inside an `always @(*)` block models the selection logic behaviorally.  
3. For each combination of `sel_in`, the corresponding data input is assigned to `y`.  
4. The output `y` reflects the chosen data input immediately (combinational behavior).  

This approach is efficient and ideal for higher-level modeling or synthesis targeting FPGAs and ASICs.

---

## 🧪 Simulation Procedure

### 🧰 Requirements
Install the following tools:
```bash
sudo apt install iverilog gtkwave
```
### ▶️ Using Icarus Verilog
```bash
iverilog -o mux4_1_sim mux4_1.v mux4_1_tb.v
vvp mux4_1_sim
gtkwave dump.vcd &
```
### ▶️ Using Xilinx ISE (ISim)

1.  Create a new project in Xilinx ISE.
2.  Add mux4_1.v and mux4_1_tb.v to the project.
3.  Set mux4_1_tb.v as the top module.
4.  Run Behavioral Simulation to view output and verify timing.

### 📊 Example Output (Console)

----- 4:1 MUX using Behavioral abstraction -----
# sel_in=00 → y=data_in[0]
# sel_in=01 → y=data_in[1]
# sel_in=10 → y=data_in[2]
# sel_in=11 → y=data_in[3]

---

## 🧠 Applications

1. Data routing and signal selection
2. Communication system design
3. ALU input selection in processors
4. Control signal multiplexing
5. Digital system buses

---

## ✅ Future Improvements

1. Extend to 8x1 and 16x1 multiplexers using parameterized design
2. Add enable input for output control
3. Implement hierarchical MUX structure using smaller submodules
4. Include automated random test vectors in testbench

---

## 🏁 Conclusion

This project demonstrates the behavioral modeling of a 4x1 Multiplexer using Verilog HDL.
It highlights the use of case statements to simplify combinational logic design, making the circuit both efficient and synthesis-friendly.
The project provides a clear understanding of how multiplexers function in digital systems.
