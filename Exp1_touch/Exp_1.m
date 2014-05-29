clc;close;clear;

% add path and plot data
addpath('/Users/timfeirg/Documents/Human Motion Analysis');
addpath('/Users/timfeirg/Documents/Human Motion Analysis/Exp1_touch/');
addpath('/Users/timfeirg/Documents/Human Motion Analysis/Exp2/');

[time,markerData]=marker_reconstruct('Exp2/0.5.csv');
marker_plot(markerData);
[v,avg]=marker_velocity(time,markerData);

