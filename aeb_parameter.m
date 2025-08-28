%% AEB Project - Parameters

%% 1: Vehicle  Environment

g = 9.81;                       % gravitational acceleration [m/s^2]
m = 2000;                       % ego vehicle mass [kg]
rho_air = 1.2;                  % air density [kg/m^3]
CdA = 0.65;                     % aerodynamic drag coefficient*area [m^2]
Crr = 0.020;                    % rolling resistance coefficient [-]

%% 2: Tyre/Road Surface Conditions (Friction Coefficient mu)

mu_dry = 0.9;                    % dry asphalt
mu_wet = 0.7;                    % wet asphalt
mu_ice = 0.15;                   % ice and snow

%% 3: Maximum Braking Force [N] available (limited by tyre road friction)

F_b_max_dry = mu_dry*m*g;        
F_b_max_wet = mu_wet*m*g;        
F_b_max_ice = mu_ice*m*g;   

%% 4: Maximum achievable deceleration [m/s^2]

a_max_dry = mu_dry*g;      
a_max_wet = mu_wet*g;
a_max_ice = mu_ice*g;

%% 5: Brake Actuator dynamics

tau_brk = 0.08;                   % Brake system lag [s] - Delay between command and actual force
a_cmd_max = 9;                    % max commanded deceleration [m/s^2]
jerk_lim = 20;                    % jerk limit [m/s^3] (rate of change of acceleration.) (comfort filter)

%% 6: Initial Conditions (scenario setup)

ego_v0 = 27.77;                   % ego speed = 100 km/h [m/s]
ego_x0 = 0.0;                     % ego start position [m]

tgt_v0 = 20.83;                   % target vehicle speed = 75 km/h [m/s]
tgt_x0 = 45;                      % target initial position [m]
tgt_a = -4;                       % target deceleration [m/s^2]

range0 = tgt_x0 - ego_x0;         % intial gap [m]

%% 7: Simulation Setup

Ts = 0.01;                        % sample time [s]
t_end = 20.0;                      % sim duration [s]
R_safe = 2.0;                     % standstill buffer distance [m] (don't stop at exact zero range)
eps_R = 0.1;                      % small range guard [m]
eps_v = 0.05;                     % small speed guard [m/s]

%% 8: AEB logic threshold (decision logic)

TTClow = 2.6;                     % TTC threshold for stage 1 [s]
TTCbrk = 1.8;                     % TTC threshold for stage 2 [s]
TTCfull = 1.2;                    % TTC threshold for full break [s]
bias_TTC = 0.05;                   % safety margin [s]

%% 9: AEB Levels (longitudinal deceleration targets)

ax_partial = 0.45*g;                % partial braking (= 3 m/s^2), comfort-oriented
ax_moderate = 0.70*g;               % moderate braking (= 6 m/s^2), strong intervention
ax_emergency = 0.90*g;              % emergency braking (= 9m/s^2), near tyre limit

%% 10: Road case selection (for variants/batch runs)

mu_case = 'ice';                  % 'dry' |'wet' |'ice'
mu = struct('dry',mu_dry,'wet',mu_wet,'ice',mu_ice).(mu_case);

%% 11: Flags/Logging

AEB_enable = true;                % master enable
log_kpis = true;                  % KPI logging toggle
rng_noise_std = 0.0;              % range noise [m]
rr_noise_std = 0.0;               % range-rate noise [m/s]






