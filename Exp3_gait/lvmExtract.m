function [time,forceTable]=lvmExtract(filename)

coefficient=[1.958,1.968,1.971,1.945,0.950,0.952,0.944,0.945];

% import data
lvmTable=lvm_import(filename);
lvmTable=lvmTable.Segment1.data;
time=lvmTable(:,1);
voltsTable=lvmTable(:,2:end);
clear lvmTable
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

% apply to the formular
forceTable(size(voltsTable,1),8)=0; % preallocation
for i=1:size(voltsTable,2)
    forceTable(:,i)=voltsTable(:,i)*coefficient(i);
end
clear voltsTable

end