function [time,markerData]=marker_reconstruct(filename)

% This function extract marker data from csv files in exp_1, exp_2
% marker_reconstruct('Exp_2/somefile.csv')

clf;close;
% import data
hugeData=csvread(filename,44,2);
time=hugeData(:,1);
duration=size(time,1);
hugeDataCol=size(hugeData,2);

% determine the number of markers
markerCount=hugeData(1,3);
% preallocation
markerData(markerCount,duration,3)=0;

% assign marker data to a 3xNx3 matrix
markerNo=1; % there'll be 3 markers in exp_1, and 5 in exp_5
for i=4:hugeDataCol
    if hugeData(1,i)==0
        markerData(markerNo,:,1:3)=hugeData(:,i-3:i-1);
        markerNo=markerNo+1;
    end
end

if markerNo-1~=markerCount
    error('check num of markers!')
end

% analysis part, for convenience' sake I wrapped them in the very same
% function
marker_plot(markerData);
title(filename);
saveas(gca,strcat(filename,'.png'));

% % reserved for debug
% marker_velocity(time,markerData);
% title(strcat(filename,': Velocity'));
% saveas(gca,strcat(filename,'_velocity.png'));