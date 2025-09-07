# vhdl-dsp-building-blocks


![Language](https://img.shields.io/badge/language-VHDL-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![Simulator](https://img.shields.io/badge/simulator-GHDL-orange)
![Release](https://img.shields.io/github/v/release/AlbertoMarquillas/vhdl-dsp-building-blocks)


A collection of **VHDL digital design building blocks** implemented as part of a learning project in digital systems and hardware description. This repository includes **12 exercises** covering a wide range of digital design concepts: from basic combinational logic to sequential circuits, filters, and the integration of IP cores.


---

## 📚 Overview
This project re-structures coursework exercises into a professional-grade repository. Each exercise is modular and self-contained, with a source file under `src/` and a corresponding testbench under `tb/`.

### Exercises included
1. **Direct signal assignment** — simple combinational assignment.
2. **Half Adder (if-then-else)** — single-bit sum and carry.
3. **Combinational logic with internal variable** — `(A or B) and C`.
4. **2-to-4 Decoder (case)** — one-hot output logic.
5. **1-to-4 Demultiplexer** — signal routing with `when ... else`.
6. **9-bit Counter with reset** — sequential process.
7. **9-bit Counter + Comparator** — modular design with two entities.
8. **Integration of Counter + Comparator** — hierarchical VHDL design.
9. **8-bit Serializer FSM** — finite state machine for serial transmission.
10. **128×16 Shift Register** — storage and data delay.
11. **4-tap FIR Filter** — digital filtering with fixed coefficients.
12. **DDS/NCO (Vivado IP)** — sine/cosine generator using Xilinx DDS Compiler.

---

## ⚙️ Tools & Workflow
- **Vivado Design Suite**: development, synthesis, and IP integration.
- **GHDL**: open-source simulator for compiling and running testbenches.
- **GTKWave**: waveform viewer for `.vcd` outputs.
- **MATLAB**: used in some exercises for data visualization (e.g., DDS outputs).

---

## 📂 Repository structure
```
vhdl-dsp-building-blocks/
├─ src/                       # Source code for each exercise
│  ├─ ex01_signal_assignment/
│  ├─ ex02_half_adder/
│  ├─ ex03_comb_logic/
│  ├─ ex04_decoder_2to4/
│  ├─ ex05_demux_1to4/
│  ├─ ex06_counter_9bit/
│  ├─ ex07_counter_comparator/
│  ├─ ex08_counter_integration/
│  ├─ ex09_serializer_fsm/
│  ├─ ex10_shift_register/
│  ├─ ex11_fir_filter/
│  └─ ex12_dds_nco/            # IP-based, documented only
├─ tb/                        # Testbenches (VHDL)
├─ docs/                      # Documentation (PDFs, diagrams)
├─ sim/                       # Simulation outputs (VCD, logs)
└─ README.md
```

---

## 🧪 How to simulate
Example (Windows PowerShell, using GHDL):
```powershell
# Exercise 2: Half Adder
ghdl -a src\ex02_half_adder\ex02_half_adder.vhd tb\tb_ex02_half_adder.vhd
ghdl -e tb_ex02_half_adder
ghdl -r tb_ex02_half_adder --vcd=sim\ex02.vcd

# View the waveform
gtkwave sim\ex02.vcd
```

---

## 📖 Documentation
- `docs/exercices_report.pdf` — original report describing all 12 exercises.
- `src/ex12_dds_nco/README.md` — notes about the Vivado DDS Compiler IP.

---

## 💡 What I learned
Working on these exercises provided practical experience with:
- Fundamental **VHDL constructs** (entities, architectures, processes, signals).
- **Combinational and sequential logic** design.
- **Finite State Machines (FSMs)** for control logic.
- **Hierarchical design** with modular entities and component instantiation.
- Building **counters, decoders, multiplexers/demux, serializers**.
- Implementing and testing a **FIR filter**.
- Integrating **IP cores** (DDS Compiler) in Vivado and combining them with handwritten VHDL.
- Documenting and refactoring coursework into a **professional open-source repository**.

---

## 📜 License
MIT License — see [LICENSE](LICENSE).

---

## 🙋 About
This repository collects a series of VHDL exercises from the course *Software Radio 2024–2025*, restructured for clarity, modularity, and public sharing. It demonstrates a progression from simple logic gates to more complex DSP building blocks and integration of IP cores.
