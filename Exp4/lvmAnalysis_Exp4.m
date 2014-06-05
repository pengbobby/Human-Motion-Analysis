function lvmAnalysis_Exp4(filename)
% analysis for exp4

if filename(2)~='.'
    graphName=filename(1:2);
else
    graphName=filename(1);
end

hugeData=lvm_import(filename);
bicepsVolts=hugeData.Segment1.data(:,2);
tricepsVolts=hugeData.Segment1.data(:,3);
forceData=hugeData.Segment1.data(:,4);
time=hugeData.Segment1.data(:,1);

timeGraph=figure(1);
plot(time,hugeData.Segment1.data(:,2:4));
axis tight;
title(strcat(filename,' on time domain'));
legend('Biceps','Triceps','F');

saveas(figure(1),strcat(graphName,'_timeDomain.png'));

% filter all data
bicepsFiltered=determine_and_filter(bicepsVolts);
tricepsFiltered=determine_and_filter(tricepsVolts);
close;
% calculate envelope
bicepsEnv=abs(hilbert(bicepsFiltered));
tricepsEnv=abs(hilbert(tricepsFiltered));

freqGraph=figure(2)
plot(time,[bicepsFiltered tricepsFiltered forceData bicepsEnv tricepsEnv]);
axis tight;
title(strcat(filename,' time domain, filtered'));
legend('Biceps','Triceps','Force Signal','Envelope of Biceps Signals','Envelope of Triceps Signals');
saveas(figure(2),strcat(graphName,'_filtered.png'));

close all;