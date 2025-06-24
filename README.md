# ⏱️ Digital Stopwatch using Verilog on Basys 3 FPGA

A modular Verilog project for building a stopwatch on the Basys 3 board. The design features **start**, **stop**, and **reset** controls using switches and displays the elapsed **minutes and seconds** on a 4-digit **7-segment display**.

---

## 📌 Features

- Counts seconds and minutes using a 1 Hz clock
- 3 input controls: **Start**, **Stop**, **Reset**
- Outputs on 4-digit **common-anode 7-segment display**
- 4 cleanly separated Verilog modules: `clk_divider`, `control_unit`, `time_counter`, `bcd_to_7seg`
- Multiplexing logic to switch between 4 digits

---

## 🔧 Required Hardware

- 🧠 **Basys 3 FPGA Board**
- 🧵 Vivado 2020.2+ or later

---

## 📁 Module Descriptions

| Module         | Function                                                                 |
|----------------|--------------------------------------------------------------------------|
| `clk_divider`  | Converts 100 MHz FPGA clock to 1 Hz for counting time                    |
| `control_unit` | Handles user inputs: start, stop, reset → controls counter enable/reset |
| `time_counter` | Increments seconds and minutes on 1 Hz input when enabled               |
| `bcd_to_7seg`  | Converts 4-bit BCD to 7-segment code (active-low for Basys 3)           |
| `top`          | Combines all submodules, handles digit multiplexing and display         |

---

## 📌 Basys 3 Connections (XDC Mapping)

| **Signal**     | **Port in Code** | **Basys 3 Pin** | **Description**       |
|----------------|------------------|------------------|------------------------|
| Clock          | `clk`            | W5               | 100 MHz system clock   |
| Start Switch   | `sw[0]`          | V17              | Starts the stopwatch   |
| Stop Switch    | `sw[1]`          | V16              | Pauses the stopwatch   |
| Reset Switch   | `sw[2]`          | W16              | Resets stopwatch time  |
| 7-Seg CA       | `seg[0]`         | W7               | Segment A              |
| 7-Seg CB       | `seg[1]`         | W6               | Segment B              |
| 7-Seg CC       | `seg[2]`         | U8               | Segment C              |
| 7-Seg CD       | `seg[3]`         | V8               | Segment D              |
| 7-Seg CE       | `seg[4]`         | U5               | Segment E              |
| 7-Seg CF       | `seg[5]`         | V5               | Segment F              |
| 7-Seg CG       | `seg[6]`         | U7               | Segment G              |
| Digit Select 0 | `an[0]`          | U2               | Rightmost digit        |
| Digit Select 1 | `an[1]`          | U4               |                        |
| Digit Select 2 | `an[2]`          | V4               |                        |
| Digit Select 3 | `an[3]`          | W4               | Leftmost digit         |

✅ All I/O standards are `LVCMOS33`  
---

## 🧠 Block Diagram (Workflow)

```text
        [ sw[0]/[1]/[2] ]
             |
      +------v------+
      | Control Unit| <------ clk
      +-------------+
             | enable/reset
             v
      +-------------+
      | Time Counter| <------ clk1hz
      +-------------+
             |
          min, sec
             |
      +----------------------+
      | Digit Multiplex Logic|
      +----------------------+
             |
        BCD values
             |
      +-----------------+
      | BCD to 7-Segment|
      +-----------------+
             |
      seg[6:0]  an[3:0]
             |
     [ 7-Segment Display ]



### 🎥 Demo Video

[Click here to watch demo](./assets/demo.mp4)
