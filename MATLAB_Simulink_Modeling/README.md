# MATLAB/Simulink Vehicle Modeling

This folder contains a MATLAB/Simulink extension of an autonomous
line-following vehicle project.

The simulation combines physical DC motor dynamics, differential-drive
vehicle kinematics, and a closed-loop line-following controller.

## DC Motor Model

The electrical motor dynamics are modeled as:

di/dt = (V - Ri - Keω) / L

The mechanical dynamics are:

dω/dt = (Kt i - bω - TL) / J

Motor torque is calculated using:

Tm = Kt i

Two motor models are used to represent the left and right drive wheels.

## Vehicle Model

Wheel angular velocities are converted into linear wheel velocities.

The differential-drive equations are:

v = (vR + vL) / 2

θ_dot = (vR - vL) / wheelDistance

Vehicle position is obtained from:

x_dot = v cos(θ)

y_dot = v sin(θ)

## Line-Following Controller

The lateral position reference is defined as:

y_ref = 0

The lateral error is:

e_y = y_ref - y

A feedback controller calculates the steering correction:

u = Ky e_y - Ktheta θ

The resulting motor voltage commands are:

V_R = Vbase + u

V_L = Vbase - u

Voltage saturation limits the motor commands to the available supply range.

## Validation

The DC motor model was first validated independently by comparing the
simulated current, torque, and angular velocity with analytical
steady-state and startup calculations.

The complete vehicle model was then tested with an initial lateral
offset. The controller successfully reduced the lateral position error
and drove the vehicle toward the reference line.
