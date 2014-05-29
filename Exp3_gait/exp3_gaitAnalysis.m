% exp3, gait analysis
clear all;clc;

% import data and assign the interested Volt data to allVolts
addpath('/Users/timfeirg/Documents/Human Motion Analysis');
[time, forceTable]=lvmAnalysis_Exp3('exp3_gait/crouch (1)');


% X stands for time and X should be truncate at 201


% plot all data