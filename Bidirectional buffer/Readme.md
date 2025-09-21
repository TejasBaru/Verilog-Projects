
# 🔀 Bidirectional Buffer – Verilog RTL

## 📌 Aim

To design and verify a **Bidirectional Buffer** in Verilog using RTL modeling and testbench simulation.

---

## 📖 Theory

A **bidirectional buffer** allows signals to flow in **both directions**, but only one direction at a time, controlled by an **enable/control signal**.

* When `control = 1` → Data flows from **A → B**.
* When `control = 0` → Data flows from **B → A**.

Bidirectional buffers are commonly used in **data buses** where multiple devices need to communicate without causing conflicts.

In Verilog, this is implemented using **`bufif1`** and **`bufif0`** primitives:

* `bufif1` → Passes signal when control = 1, otherwise high impedance (`z`).
* `bufif0` → Passes signal when control = 0, otherwise high impedance (`z`).

---

## ⚡ RTL Code

```verilog
module bidbuffer (
    input  control,
    inout  a,
    inout  b
);
    bufif1 b1 (b, a, control);   // a → b when control=1
    bufif0 b2 (a, b, control);   // b → a when control=0
endmodule
```

---

## 🧪 Testbench

```verilog
`timescale 1ns/1ps
module bidbuffer_tb;
    wire a, b;
    reg control;
    reg tempa, tempb;

    // DUT instantiation
    bidbuffer dut (.control(control), .a(a), .b(b));

    // Conditional driving
    assign b = (control==0) ? tempb : 1'bz;
    assign a = (control==1) ? tempa : 1'bz;

    initial begin
        {tempa, tempb, control} = 0;
        $dumpfile("bidbuffer_tb.vcd");
        $dumpvars(0, bidbuffer_tb);
        #200 $finish;
    end

    always #10 tempa   = ~tempa;
    always #20 tempb   = ~tempb;
    always #40 control = ~control;

    initial $monitor("t=%0t | a=%b b=%b control=%b", $time, a, b, control);
endmodule
```

---

## ▶️ Simulation Steps

1. Compile the design and testbench:

   ```bash
   iverilog -o bidbuffer_tb.vvp bidbuffer.v bidbuffer_tb.v
   ```
2. Run the simulation:

   ```bash
   vvp bidbuffer_tb.vvp
   ```
3. View waveforms in GTKWave:

   ```bash
   gtkwave bidbuffer_tb.vcd
   ```

---

## 📊 Expected Output

* When `control = 1` → `a` drives `b`.
* When `control = 0` → `b` drives `a`.
* High-impedance (`z`) state occurs when a line is not driving.

Waveform should clearly show direction switching with control signal.

---

## 📝 Applications

* Used in **microprocessor data buses**.
* Avoids **bus contention** when multiple devices share the same line.
* Common in **I²C, memory systems, and bidirectional I/O pins**.


📊 Waveform
!Waveform[Waveform.png]


