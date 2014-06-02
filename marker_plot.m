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

windowSize=get(0,'ScreenSize');
fig=figure('Position',[1 windowSize(4) windowSize(3) windowSize(4)]);

plotColors=['ro';'go';'bo';'ko';'mo'];

% change plot range if too long
if duration>=2000
    for markerNo=1:markerCount
        plot3(markerData(markerNo,1:1000,1),markerData(markerNo,1:1000,2),markerData(markerNo,1:1000,3),plotColors(markerNo,:));
        hold on;
        grid on;
        axis([plotLimitX plotLimitY plotLimitZ]);
    end
else
    for markerNo=1:markerCount
        plot3(markerData(markerNo,:,1),markerData(markerNo,:,2),markerData(markerNo,:,3),plotColors(markerNo,:));
        hold on;
        grid on;
        axis([plotLimitX plotLimitY plotLimitZ]);
    end
end

markerLegeng=['marker 1';'marker 2';'marker 3';'marker 4';'marker 5'];
legend(markerLegeng(1:markerCount,:));
