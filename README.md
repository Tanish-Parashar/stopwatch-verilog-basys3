# stopwatch-verilog-basys3
A simple stopwatch built in Verilog for the Basys 3 FPGA board with start, stop, reset, and LED blink functionality. This stopwatch is a component of a larger digital clock system project.

---

## 📜 Module Descriptions

### 🔹 `clk_divider.v`
Generates a 1 Hz clock signal from the 100 MHz onboard Basys 3 system clock. This slower clock drives the stopwatch to count seconds in real time. It works using a simple counter-based frequency divider.

### 🔹 `time_counter.v`
Responsible for counting seconds and minutes. When seconds reach 59, it resets to 0 and increments the minute count. Also supports reset input to clear time to 00:00.

### 🔹 `control_unit.v`
Handles user inputs: start, stop, and reset. Based on these inputs, it generates enable/reset signals for the time counter and LED logic.

### 🔹 `bcd_segment.v`
Converts 4-bit BCD input values (0–9) into appropriate 7-segment display codes. Each bit (a–g) maps to a segment to form the correct number shape.

### 🔹 `top_module.v`
The main integration module that connects and manages all submodules. It ensures synchronization between input controls, clocking, time counting, and display output.

---

## 📟 Basys 3 Display Usage

The stopwatch output is displayed using a **4-digit common-anode 7-segment display** on the Basys 3. Only one digit is activated at a time using anode control lines, and **multiplexing** is used to display all digits in rapid succession, making them appear continuously lit.

---

## 🎥 Demo Video

> 👉 [Watch the working demo here](https://your-video-link.com)  
*(Replace this link with your YouTube or Google Drive video)*

---

## 🧪 Testbench

A Verilog testbench (`stopwatch_tb.v`) is included to simulate and verify the core stopwatch functionality such as timing, resets, and LED behavior.

---

## 📌 Requirements
- Basys 3 FPGA board (Artix-7)
- Vivado Design Suite
- 100 MHz system clock
- 7-segment display and LED outputs

---

## 🧑‍💻 Author

**Tanish Parashar**  
3rd-year Electronics & Instrumentation Engineering  
Passionate about digital design, FPGA development, and embedded systems.

---

## 🗂️ License

This project is open-source and free to use under the [MIT License](LICENSE).

