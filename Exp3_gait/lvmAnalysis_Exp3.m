function [time, forceTable]=lvmAnalysis_Exp3(filename)

coefficient(2,:)=[1.957,1.963,1.961,1.952,0.954,0.958,0.952,0.952];
coefficient(1,:)=[1.958,1.968,1.971,1.945,0.950,0.952,0.944,0.945];
a=210;
b=260;
az0=41;

% import data
lvmTable=lvm_import(filename);
lvmTable=lvmTable.Segment1.data;
time=lvmTable(:,1);
duration=size(time,1);
voltsTable=lvmTable(:,2:end);
clear lvmTable;

% calculate force according to the formular F=u*
forceTable(2,:,1:8)=voltsTable(:,9:16).*repmat(coefficient(2,:),duration,1);
forceTable(1,:,1:8)=voltsTable(:,1:8).*repmat(coefficient(1,:),duration,1);

Fx(2,duration)=0;
Fy(2,duration)=0;
Fz(2,duration)=0;
Mx(2,duration)=0;
My(2,duration)=0;
Mz(2,duration)=0;
ax(2,duration)=0;
ay(2,duration)=0;
Tz(2,duration)=0;

for i=[2 1]
    Fx(i,:)=sum(forceTable(i,:,1:2),3); % fx12+fx34
    Fy(i,:)=sum(forceTable(i,:,3:4),3); % fy14+fy23
    Fz(i,:)=sum(forceTable(i,:,5:8),3);
    Mx(i,:)=b*(sum(forceTable(i,:,5:6),3)-sum(forceTable(i,:,7:8),3));
    My(i,:)=a*(sum(forceTable(i,:,6:7),3)-sum(forceTable(i,:,[5 8]),3));
    Mz(i,:)=b*(-forceTable(i,:,1)+forceTable(i,:,2))+a*(forceTable(i,:,3)-forceTable(i,:,4));
    ax(i,:)=(Fx(i,:)*az0+My(i,:))./Fz(i,:);
    ay(i,:)=(Fy(i,:)*az0+Mx(i,:))./Fz(i,:);
    Tz(i,:)=Mz(i,:)-Fy(i,:).*ax(i,:)+Fx(i,:).*ay(i,:);
    
end
% plot COP in slow-mo
for i=1:duration
    plot(ax(1,i),ay(1,i));
    pause(0.01);
end