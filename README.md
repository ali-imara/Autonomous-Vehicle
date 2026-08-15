# Autonomous Vechile

![Project Overview](Prototype/Real%20Life%20Assembly/Reallife_Assembly.jpeg)

## Project Overview
This repository contains the engineering documentation, 3D mechanical designs, and control software for an autonomous prototype vehicle developed by Team D5. 

The primary focus of this project was to design, construct, and program a smart car capable of independent navigation and dynamic obstacle handling. The development process required the seamless integration of mechanical engineering, electronic hardware, and intelligent control algorithms using a comprehensive systems engineering methodology.

## Core Capabilities
The vehicle is designed to achieve the following autonomous objectives:
*   **Autonomous Navigation:** Follows a predefined track autonomously by utilizing dual infrared (IR) sensors to track the surrounding white surface and re-center on the black line.
*   **Early Obstacle Detection:** Recognizes obstructions in its path early by employing dual front-facing ultrasonic sensors.
*   **Dynamic Avoidance and Recovery:** Upon detecting an obstacle (≤ 18 cm), the vehicle executes an arc-based avoidance maneuver, safely bypasses the object, actively recovers the black line, and continues its route without manual intervention.
*   **Dual-Obstacle Handling:** As a special bonus objective, the system utilizes a persistent counter to track consecutive obstacles, triggering an automatic 180-degree spin to reverse course if the path is heavily blocked.

## Repository Structure
This repository is organized into the following directories to reflect the mechatronic development process:

*   📂 **`Arduino Code/`** 
    Contains the object-oriented C++ software, the finite state machine (FSM) control logic, and a technical README detailing the specific hardware pinouts and class architecture. 
*   📂 **`3D Design Parts/`** 
    Contains the SolidWorks part files and STEP files for the custom-designed chassis mounts, adjustable IR sensor slider, and component holders.
*   📂 **`Documentation/`**
    Contains the final engineering report, the project presentation, and task division documents.
*   📂 **`Prototype/`**
    Contains media and models from the physical build process, including the Tinkercad circuit simulation, circuit layouts, and real-life assembly photos.
*   📂 **`SYSML Diagrams/`**
    Contains the system modeling diagrams (Requirements, Activity, Sequence, etc.) used to map interactions between the sensors, Arduino, and motors prior to implementation.

## Project Team
**Team Members:**
*   Mohamed Awis (Team Leader)
*   Ali Abdelkhalek
*   Yassin Elhalawany

**Supervisors:** 
*   Prof. Dr. Stefan Henkler
*   Prof. Dr. Faezeh Pasandideh
