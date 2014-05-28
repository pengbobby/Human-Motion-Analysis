function [velocity, averageV]=marker_velocity(time,markerData)

% This function calculates the velocity of each marker

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
marker_position_change=markerData(