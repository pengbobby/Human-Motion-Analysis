function marker_plot(markerData)

% This function simply plot all marker tracks
% marker_plot(markerData)

% getting plot limits
markerCount=size(markerData,1);
duration=size(markerData,2);

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
    pause(0.01);
end