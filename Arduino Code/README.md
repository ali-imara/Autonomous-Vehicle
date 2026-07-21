# D5 Autonomous Prototype Car Control Software
**Team D5 | Hochschule Hamm-Lippstadt**

## Overview
This folder contains the object-oriented C++ control software for the Team D5 autonomous prototype vehicle. The codebase allows the car to autonomously follow a track using infrared (IR) sensors, detect path obstructions early via dual ultrasonic sensors, and execute dynamic, arc-based avoidance maneuvers without manual intervention.

## Hardware Configuration
The vehicle is driven by an Arduino microcontroller and an L293D motor driver. The hardware pinout is defined in the code as follows:

| Component | Arduino Pin | Description |
| :--- | :--- | :--- |
| **Left Motor** | 9 (EN), 4 (IN1), 5 (IN2) | PWM speed control on pin 9 |
| **Right Motor** | 10 (EN), 6 (IN1), 7 (IN2) | PWM speed control on pin 10 |
| **Left IR Sensor** | 2 | Digital Input (LOW = White surface / HIGH = Black line) |
| **Right IR Sensor** | 3 | Digital Input (LOW = White surface / HIGH = Black line) |
| **Right Ultrasonic** | 8 (Trig), 11 (Echo) | Distance measurement |
| **Left Ultrasonic** | 12 (Trig), 13 (Echo) | Distance measurement |

## Software Architecture
The software is built using an Object-Oriented Programming (OOP) architecture to ensure modularity and readable control logic:
*   **Hardware Abstraction:** Custom `Motor`, `IRSensor`, and `UltrasonicSensor` classes abstract the low-level digital and analog pin manipulations.
*   **Core Controller (`Car`):** Manages the primary autonomous driving loop. It utilizes non-blocking timers (`millis()`) to continuously poll the ultrasonic sensors every 30 milliseconds without interrupting real-time line-following adjustments.
*   **Finite State Machine (FSM):** Obstacle avoidance is managed by the `AvoidState` enumeration. Upon detecting an object within the 18 cm threshold, the FSM transitions the vehicle through a sequence of specific states (`STOP_BEFORE_OBSTACLE`, `LEFT_ARC_AROUND`, `RIGHT_ARC_BACK`, `RECOVER_LINE`) to navigate safely.

## Key Features
*   **Surface-Based Line Following:** The vehicle continuously reads the white track surface. If either IR sensor detects the black line, the software instantly adjusts the differential motor speeds to re-center the vehicle.
*   **Smooth Arc Avoidance:** Instead of sharp, blocky turns, the vehicle bypasses obstacles using a calculated left arc, followed by a wider right arc to smoothly sweep back toward the original path.
*   **Dynamic Collision Prevention:** During an avoidance maneuver, if the lateral distance to an obstacle drops below 10 cm, the system dynamically sharpens the turning radius to prevent side-swiping.
*   **Bonus Objective (180-Degree Turn):** The system tracks consecutive obstacle detections. If a second obstacle is detected within a two-second cooldown window, the FSM triggers a `TURN_180` state. This bypasses standard avoidance, spins the vehicle completely around, and automatically recovers the line in the opposite direction. 

> **Safety Note:** Place the vehicle on the track prior to powering it on. The `setup()` function features a built-in 2-second delay (`while (millis() - startTime < 2000)`) to allow the user to clear their hands away before the drive motors engage.
