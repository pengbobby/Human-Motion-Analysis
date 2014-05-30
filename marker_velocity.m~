function [velocity, averageV]=marker_velocity(time,markerData)

% This function calculates the velocity of each marker
duration=size(time,1);
markerCount=size(markerData,1);
% duration=size(time,1);
delta_time=diff(time);


% Calculate delta_markerData and caculate velocity
delta_markerData=sqrt(...
    sum(...
    diff(...
    markerData,1,2).^2,3));
delta_time_rep=repmat(delta_time,1,markerCount);

velocity=delta_markerData'./delta_time_rep;

% Calculate average velocity
markerOrigin=repmat(markerData(1:markerCount,1,:),1,duration);
markerDataDelta_abs=markerData-markerOrigin;
delta_markerData_abs=sqrt(...
    sum(...
    markerDataDelta_abs.^2,3 ...
));
averageV=delta_markerData_abs'./repmat(time-time(1,1),1,markerCount);
velocity_graph=figure;
plot(time(2:end),velocity);

markerLegeng=['marker 1';'marker 2';'marker 3';'marker 4';'marker 5'];
legend(markerLegeng(1:markerCount,:));
