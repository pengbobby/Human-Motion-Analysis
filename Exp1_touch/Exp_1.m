clc;close;clear;

% add path and plot data
cd '/Users/timfeirg/Documents/Human Motion Analysis';
addpath('/Users/timfeirg/Documents/Human Motion Analysis/Exp1_touch/');
addpath('/Users/timfeirg/Documents/Human Motion Analysis/Exp2/');

[time,markerData]=marker_reconstruct('Exp1_touch/25b1.csv');
