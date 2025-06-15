# 🚦 Traffic Controller for T-Intersection (Verilog)

A fully functional **finite state machine (FSM)**-based traffic signal controller for a **T-Intersection**, implemented in **Verilog** and simulated in **Vivado**.

---

## 📌 Overview

This project simulates intelligent traffic management at a T-intersection using FSM principles. It handles real-world traffic flow scenarios with **multiple timing conditions**, **priority rules**, and **state transitions** for efficient and conflict-free light switching.

---

## 🧠 Logic & Design

- Designed using a **Mealy state machine** for faster output transitions.
- Inputs represent traffic sensor triggers for each road.
- Outputs control the **Red**, **Yellow**, and **Green** lights for all three roads.
- Implements **priority-based control**:
  - Straight-through roads get higher priority during simultaneous requests.
  - Efficient timing to avoid traffic starvation.

---

## 📁 Files Included

### 🔧 Source & Simulation

- `traffic_control_verilog.v` – Main FSM-based Verilog module.
- `traffic_control_testbench.v` – Custom testbench for simulating multiple traffic scenarios.
- `project_2/` – Full Vivado project folder with simulation setup and constraints.

### 📑 Documentation

- `Traff_controller_state.pdf` – Includes:
  - State table
  - State diagrams
  - Different intersection scenarios with transitions

---

## 🧪 Simulation

- Simulated using **Vivado** with behavioral and post-synthesis testbenches.
- Waveform outputs validate:
  - Correct sequencing of traffic lights
  - Proper reset and idle state behavior
  - Handling of edge cases like simultaneous or no input

---

## 🛠️ Tools & Technologies

- **Verilog HDL**
- **Vivado Design Suite**
- **Finite State Machine (FSM) Design**
- **Traffic System Modeling**

---

## 🚀 Key Features

- ✅ Real-time simulation of traffic lights based on live sensor-like inputs
- ✅ Clean state transitions and modular FSM architecture
- ✅ Easy-to-read waveform analysis
- ✅ Detailed documentation for educational or project reference

---

# Traffic_control_t_intersection
