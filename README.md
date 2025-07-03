# 🚀 2D Rocket Landing Simulation with PID Control (MATLAB)

This project simulates a vertical rocket landing using a PID controller in MATLAB. Designed as a first-principles approach to guidance and control systems, it models thrust-controlled descent from 100 meters to a smooth, zero-velocity touchdown. 

The controller dynamically adjusts thrust to counteract gravity and velocity using real-time feedback — demonstrating key concepts used in real-world GNC systems like those on Falcon 9 or Blue Origin's New Shepard.

---

## 📌 Key Features

- 🧠 **Closed-loop PID Control**  
  Controls descent with real-time altitude and velocity feedback.

- 📉 **Realistic Physics Modeling**  
  Incorporates gravity, dynamic acceleration, velocity, and position updates.

- 🎯 **Smooth, Precision Landing**  
  Velocity and thrust taper off naturally without forced termination.

- 🧰 **Fully Tunable**  
  PID gains can be adjusted to test aggressiveness, overshoot, and stability.

---

## 📂 Files

- `PIDLandingSim.m` — Main MATLAB simulation file  
- `README.md` — You're reading it!

---

## 🧪 Example Output

Three subplots:
1. **Altitude** — Descends from 100 m to 0 m smoothly  
2. **Velocity** — Controlled approach to 0 m/s  
3. **Thrust** — Rises to decelerate, then gently decreases until reaching hover thrust to 

<p align="center">
  <img src="https://github.com/user-attachments/assets/277ee1fc-db81-4d1a-8e22-703a6f591c9a" 
       alt="Rocket Landing Simulation Output Graph" 
       width="600"/>
  <img src="https://github.com/user-attachments/assets/c7f9d94b-2370-4ef6-a70f-4a6590e19504" 
       alt="Rocket Landing Simulation Output Graph" 
       width="600"/>
</p>

---

## 💡 Why This Matters

This project demonstrates core skills relevant to roles in:

- 🚀 **Guidance, Navigation, and Control (GNC)**
- 🛬 **Autonomous Vehicle Landing / Precision Descent**
- 🧪 **Control Systems Design and Tuning**
