clear;clc
wav = load('D:\Postdoc\Paper 8\FRC_data\HSI\wavelength.csv');
data = load('D:\Postdoc\Paper 8\FRC_data\HSI\raw-data.csv');
X = data(:,1:end-1);Y = data(:,end);

X = snv(X);

dlmwrite('D:\Postdoc\Paper 8\FRC_data\HSI\data.csv',[X Y])