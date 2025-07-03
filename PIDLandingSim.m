%% Copyright Sunay Neelimathara 2025
clear;
clc;
close all;

% Parameters
g = 9.81;
m = 1.0;
y_initial = 100;
v_initial = -10;
dt = 0.01;
t_f = 20;

% Rocket Physical Considerations
max_thrust = 30*m*g;
min_thrust = 0;

% PID Gains
Kp = 15;
Ki = 0.5;
Kd = 8;

% Landing Targets
target_altitude = 0;
target_velocity = 0;
landing_tolerance = 0.01;

% Definitions
t= 0:dt:t_f;
N = length(t);
y = zeros(1,N);
y(1)=y_initial;
v = zeros(1,N);
v(1)=v_initial;
a = zeros(1,N);
thrust = zeros(1,N);

error_integral = 0;
prev_error = 0;

% Loop
for i=1:N-1
    if y(i) <= target_altitude && abs(v(i)) <= landing_tolerance
        y(i) = target_altitude;
        v(i) = target_velocity;
        a(i) = 0;
        thrust(i) = m * g;
        break;
    end
    altitude_error = target_altitude - y(i);
    velocity_error = target_velocity - v(i);
    error_integral = error_integral + altitude_error*dt;
    
    if thrust(i) >= max_thrust || thrust(i) <= min_thrust
        error_integral = error_integral - altitude_error * dt;
    end

    T = Kp*altitude_error + Ki*error_integral + Kd*velocity_error;
    T = max(min_thrust, min(T, max_thrust));

    % Physics
    a(i) = T/m - g;
    v(i+1) = v(i) + a(i) * dt;
    y(i+1) = y(i) + v(i) * dt + 0.5 * a(i) * dt^2;
    thrust(i+1) = T;

    prev_error = altitude_error;

end

t = t(1:i);
y = y(1:i);
v = v(1:i);
a = a(1:i);
thrust = thrust(1:i);

figure;

% Altitude plot
subplot(4,1,1);
plot(t, y, 'b', 'LineWidth', 2); 
grid on; hold on;
plot([t(1) t(end)], [target_altitude target_altitude], 'k--');
ylabel('Altitude (m)');
title('2D Rocket Landing with PID Control');

% Velocity plot
subplot(4,1,2);
plot(t, v, 'r', 'LineWidth', 2); 
grid on; hold on;
plot([t(1) t(end)], [target_velocity target_velocity], 'k--');
ylabel('Velocity (m/s)');

% Acceleration plot
subplot(4,1,3);
plot(t, a, 'm', 'LineWidth', 2); 
grid on;
ylabel('Acceleration (m/s^2)');

% Thrust plot
subplot(4,1,4);
plot(t, thrust, 'g', 'LineWidth', 2); 
grid on; hold on;
plot([t(1) t(end)], [max(thrust) max(thrust)], 'k--');
plot([t(1) t(end)], [m*g m*g], 'k:');
ylabel('Thrust (N)');
xlabel('Time (s)');
legend('Actual Thrust', 'Max Thrust', 'Hover Thrust');

% Display landing performance metrics
landing_time = t(end);
final_velocity = v(end);
fprintf('Landing Stats:\n');
fprintf('  Time of Landing: %.2f seconds\n', landing_time);
fprintf('  Final velocity: %.4f m/s\n', final_velocity);
fprintf('  Maximum thrust: %.2f N (%.1f g)\n', max(thrust), max(thrust)/m/g);