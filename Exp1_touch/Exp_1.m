addpath('/Users/timfeirg/Documents/Human Motion Analysis');
addpath('/Users/timfeirg/Documents/Human Motion Analysis/Exp1_touch/');

% import and organize data
clear;
clc;
close;
hugeData=csvread('25b2.csv',44,2);
time=hugeData(:,1);
markerData(3,size(time,1),3)=0;
% assign marker data
markerData(1,:,1:3)=hugeData(:,4:6);
markerData(2,:,1:3)=hugeData(:,8:10);
markerData(3,:,1:3)=hugeData(:,12:14);

% getting plot limits

plot3(markerData(1,:,1),markerData(1,:,2),markerData(1,:,3),'r');
hold on
plot3(markerData(2,:,1),markerData(2,:,2),markerData(2,:,3),'g');
hold on
plot3(markerData(3,:,1),markerData(3,:,2),markerData(3,:,3),'b');

plotLimitX=get(gca,'XLim');
plotLimitY=get(gca,'YLim');
plotLimitZ=get(gca,'ZLim');
close;

windowSize=get(0,'ScreenSize');
fig=figure('Position',[1 windowSize(4) windowSize(3) windowSize(4)]);

% plot animated data in 3D
for n=1:size(time,1)
    plot3(markerData(1,n,1),markerData(1,n,2),markerData(1,n,3),'ro');
    hold on
    plot3(markerData(2,n,1),markerData(2,n,2),markerData(2,n,3),'go');
    hold on
    plot3(markerData(3,n,1),markerData(3,n,2),markerData(3,n,3),'bo');

    axis vis3d;
    axis([plotLimitX plotLimitY plotLimitZ]);
    grid on
    title('haha');
    pause(0.05);
end

