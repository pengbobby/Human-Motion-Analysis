clc;close;clear;

% add path and plot data
addpath('/Users/timfeirg/Documents/Human Motion Analysis');
addpath('/Users/timfeirg/Documents/Human Motion Analysis/Exp1_touch/');
addpath('/Users/timfeirg/Documents/Human Motion Analysis/Exp2/');

[time,markerData]=marker_reconstruct('Exp2/0.5.csv');
[v,avg]=marker_velocity(time,markerData);
figure(1)
plot(avg(:,1))
figure(2)
plot(v(:,1))
