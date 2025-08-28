# MATLAB/Simulink-based Automatic Emergency Braking (AEB) system with TTC-based decision logic and virtual testing on dry, wet, and icy roads

**Authors:** Akash Amdavadi,  Pratik Lande



## Problem
Rear-end collisions remain one of the most frequent types of accidents, especially during sudden decelerations and low-friction conditions.  
Automatic Emergency Braking (AEB) systems can mitigate or avoid such collisions, but their effectiveness depends on **decision logic**, **actuator dynamics**, and **road friction**.

## Objective
Design and simulate a **longitudinal AEB controller** in MATLAB/Simulink that:
1. Estimates collision risk using **time-to-collision (TTC)** and required deceleration.  
2. Triggers **graded automatic braking** (partial, moderate, emergency).  
3. Is virtually tested across three surface frictions: **dry, wet, and icy roads**.

## Scope
- Straight road, single-lane scenario.  
- Ego vehicle vs. lead object (no lateral maneuvers).  
- Idealized **range and range-rate sensing**.  
- Longitudinal vehicle dynamics with **brake actuator lag** and **friction limits**.  

## Project Structure
- `aeb_parameter.m` → Parameter file (vehicle dynamics, friction coefficients, thresholds).  
- `aeb_sim.slx` → Simulink model implementing ego vehicle, target, collision risk assessment, and AEB control logic.  

## Key Features
- **Collision detection and TTC-based risk estimation**  
- **Three-level braking strategy** (partial, moderate, emergency)  
- **Virtual testing** under dry, wet, and icy road conditions  
- **Stop/collision indication logic** with lamp outputs  

## Results
- Reliable stop vs. collision outcome visualization.  
- Demonstrated how road friction impacts AEB performance.  

---

### How to Run
1. Open MATLAB/Simulink.  
2. Load parameters:  
   ```matlab
   run('aeb_parameter.m')
