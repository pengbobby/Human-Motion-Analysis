addpath('/Users/timfeirg/Documents/Human Motion Analysis');
addpath('/Users/timfeirg/Documents/Human Motion Analysis/Exp1_touch/');

% import and organize data
clear;
clc;
close;
hugeData=csvread('25b1.csv',44,2);
time=hugeData(:,1);
markerData(3,size(time,1),3)=0;
% assign marker data
markerData(1,:,1:3)=hugeData(:,4:6);
markerData(2,:,1:3)=hugeData(:,8:10);
markerData(3,:,1:3)=hugeData(:,12:14);

% plot animated data in 3D
figure

for n=1:size(time,1)
    plot3(...
        markerData(1,n,1),...
        markerData(1,n,2),...
        markerData(1,n,3),...
        'r');
    hold on
    plot3(markerData(2,n,1),markerData(2,n,2),markerData(2,n,3),'g');
    hold on
    plot3(markerData(3,n,1),markerData(3,n,2),markerData(3,n,3),'b');
    hold on
    axis equal;
%     axix([max])
    title('haha');
    M(n)=getframe;
end
movie(M,5,10)