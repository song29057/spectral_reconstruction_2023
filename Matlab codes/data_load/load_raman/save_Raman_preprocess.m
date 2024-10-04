
%% save pre-processed portable raman
clear;clc
wav0 = load('D:\Postdoc\Paper 8\FRC_data\Raman_high\wavelength.csv');wav = wav0(56:478);
data = load('D:\Postdoc\Paper 8\FRC_data\Raman_high\raw-data.csv');
X = data(:,56:478);Y = data(:,end);
X = msbackadj(wav,X','WindowSize',21,'StepSize',7,'RegressionMethod','spline','SmoothMethod','lowess');X = X';
X = snv(X);
dlmwrite('D:\Postdoc\Paper 8\FRC_data\Raman_high\data.csv',[X Y])

%% save pre-processed benchtop raman
clear;clc
wav0 = load('D:\Postdoc\Paper 8\FRC_data\Raman_low\wavelength.csv');wav = wav0(143:402);
data = load('D:\Postdoc\Paper 8\FRC_data\Raman_low\raw-data.csv');
X = data(:,143:402);Y = data(:,end);
X = msbackadj(wav,X','WindowSize',20,'StepSize',5,'RegressionMethod','spline','SmoothMethod','lowess');X = X';
X = snv(X);
dlmwrite('D:\Postdoc\Paper 8\FRC_data\Raman_low\data.csv',[X Y])
