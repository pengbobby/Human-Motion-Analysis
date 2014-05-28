function marker_reconstruct(filename)
% import csv data from exp 1,2 and plot
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

clear hugeData;

% getting plot limits

for markerNo=1:markerCount
    plot3(markerData(markerNo,:,1),markerData(markerNo,:,2),markerData(markerNo,:,3));
    hold on;
    grid on;
end
plotLimitX=get(gca,'XLim');
plotLimitY=get(gca,'YLim');
plotLimitZ=get(gca,'ZLim');
close;

% plot in slow-mo

windowSize=get(0,'ScreenSize');
fig=figure('Position',[1 windowSize(4) windowSize(3) windowSize(4)]);

plotColors=['ro';'go';'bo';'ko';'mo'];
for i=1:duration
    for markerNo=1:markerCount
        plot3(markerData(markerNo,i,1),markerData(markerNo,i,2),markerData(markerNo,i,3),plotColors(markerNo,:));
        hold on;
        grid on;
        axis([plotLimitX plotLimitY plotLimitZ]);
    end
    pause(0.05);
end

end