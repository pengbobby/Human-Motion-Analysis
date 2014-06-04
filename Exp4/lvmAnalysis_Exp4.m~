function lvmAnalysis_Exp4(filename)
% analysis for exp4

hugeData=lvm_import(filename);
bicepsVolts=hugeData.Segment1.data(:,2);
tricepsVolts=hugeData.Segment1.data(:,3);
forceData=hugeData.Segment1.data(:,4);
time=hugeData.Segment1.data(:,1);

timeGraph=figure;
plot(time,hugeData.Segment1.data(:,2:4));
axis tight;
title(strcat(filename,' on time domain'));
legend('Biceps','Triceps','F');
% saveas(timeGraph,strcat(filename,'.png'));

% filter all data
bicepsFiltered=determine_and_filter(bicepsVolts);
tricepsFiltered=determine_and_filter(tricepsVolts);

plot(time,[bicepsFiltered tricepsFiltered]);
axis tight;
title(strcat(filename,' time domain, filtered'));
legend('Biceps','Triceps');