MATLAB/Simulink Modeling

This folder contains the MATLAB/Simulink extension of the autonomous line-following and obstacle-avoidance vehicle project.

The current model includes a physical DC motor model based on the electrical and mechanical motor equations. The model was implemented in Simulink and tested using a step-voltage input to analyze motor current, torque, and angular velocity.

The simulation was validated by comparing the results with the expected theoretical behavior, including:

1- High initial current at motor startup
2- Decreasing current as back EMF increases
3- Torque proportional to motor current
4- Motor speed converging toward a steady-state value
