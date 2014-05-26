function [time,voltsTable]=lvmExtract(filename)

% import data
lvmTable=lvm_import(filename);
lvmTable=lvmTable.Segment1.data;
time=lvmTable(:,1);
voltsTable=lvmTable(:,2:end)*1000/0.950;
clear lvmTable;
% data overview
figure(1);
plot(time)
title('select the point of truncation')
% decide the point from which we'll truncate all data
[x,y]=ginput;
clear y;
close 1;
x=round(x(end));
% truncate
time=time(x:end,:);
voltsTable=voltsTable(x:end,:);

end