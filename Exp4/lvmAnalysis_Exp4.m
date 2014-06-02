function lvmAnalysis_Exp4(filename)
% analysis for exp4

hugeData=lvm_import('Exp4/1.lvm');
bicepsVolts=hugeData.Segment1.data(:,2);
tricepsVolts=hugeData.Segment1.data(:,3);
forceData=hugeData.Segment1.data(:,4);
time=hugeData.Segment1.data(:,1);
clear hugeData

plot(bicepsVolts);