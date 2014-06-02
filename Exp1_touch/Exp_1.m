clc;close;clear;

% add path and plot data
cd '/Users/timfeirg/Documents/Human Motion Analysis';
addpath('/Users/timfeirg/Documents/Human Motion Analysis/Exp1_touch/');

[time,markerData]=marker_reconstruct('25b1.csv');

% generating velocity of marker 3 across different group
