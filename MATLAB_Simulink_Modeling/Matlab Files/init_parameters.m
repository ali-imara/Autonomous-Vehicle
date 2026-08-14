clear;
clc;

%% DC Motor Parameters
R  = 4;          % Armature resistance [Ohm]
L  = 2e-3;       % Armature inductance [H]
Kt = 0.02;       % Torque constant [Nm/A]
Ke = 0.02;       % Back-EMF constant [V/(rad/s)]
J  = 2e-5;       % Rotor inertia [kg*m^2]
b  = 2e-5;       % Viscous friction coefficient [N*m*s/rad]

%% Vehicle Parameters
wheelRadius = 0.0325;     % Wheel radius [m]
wheelDistance = 0.14;     % Distance between wheels [m]

%% Voltage
Vmax  = 6;                % Maximum motor voltage [V]
Vbase = 3.5;              % Base driving voltage [V]

%% Line Following Controller
Ky     = 8;                % Lateral error gain
Ktheta = 1.5;              % Heading error gain

%% Initial Conditions
x0 = 0;
y0 = 0.10;                % Vehicle starts 10 cm away from line
theta0 = 0;

%% Obstacle
xObstacle = 2.0;
yObstacle = 0;
obstacleThreshold = 0.30;

%% Simulation
simulationTime = 8;
