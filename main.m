clear; close all; clc;

% Inertia Coordinate (SystemI)
x_i = [1; 0; 0];
y_i = [0; 1; 0];
z_i = [0; 0; 1];
Sys_i = [x_i y_i z_i];

r_i = [0.2; 0.8; 0.6];
roll0  =  90;
pitch0 = 180;
yaw0   =  45; %[deg]

roll  = pi/180 * roll0; %[rad]
pitch = pi/180 * pitch0; %[rad]
yaw   = pi/180 * yaw0; %[rad]
M_i2s_roll  = [          1         0          0;
                         0 cos(roll) -sin(roll);
                         0 sin(roll)  cos(roll)];
M_i2s_pitch = [ cos(pitch)         0 sin(pitch);
                         0         1          0;
               -sin(pitch)         0 cos(pitch)];
M_i2s_yaw   = [   cos(yaw) -sin(yaw)          0;
                  sin(yaw)  cos(yaw)          0;
                         0         0          1];

% 1-2-3回転
Sys_s = M_i2s_yaw * M_i2s_pitch * M_i2s_roll * Sys_i;
r_s   = transpose(M_i2s_roll) * transpose(M_i2s_pitch) * transpose(M_i2s_yaw) * r_i;

figure
xi = quiver3(0, 0, 0, x_i(1), x_i(2), x_i(3), 0, 'Color', 'r');
hold on
yi = quiver3(0, 0, 0, y_i(1), y_i(2), y_i(3), 0, 'Color', 'g');
zi = quiver3(0, 0, 0, z_i(1), z_i(2), z_i(3), 0, 'Color', 'b');

xs = quiver3(0, 0, 0, Sys_s(1,1), Sys_s(2,1), Sys_s(3,1), 0, 'Color', 'r', 'LineStyle', '--');
ys = quiver3(0, 0, 0, Sys_s(1,2), Sys_s(2,2), Sys_s(3,2), 0, 'Color', 'g', 'LineStyle', '--');
zs = quiver3(0, 0, 0, Sys_s(1,3), Sys_s(2,3), Sys_s(3,3), 0, 'Color', 'b', 'LineStyle', '--');

rocation = plot3(r_i(1), r_i(2), r_i(3), 'o');
hold off
grid on
axis equal
xlabel('x_{Inertia}')
ylabel('y_{Inertia}')
zlabel('z_{Inertia}')
axis equal

fprintf("Position Vector on Inertia Coordinate \n");
fprintf(" r_i = (%f, %f, %f)^T \n", r_i(1), r_i(2), r_i(3));
fprintf("Position Vector on Spacecraft fixed Coordinate \n")
fprintf(" r_s = (%f, %f, %f)^T \n", r_s(1), r_s(2), r_s(3));
