clear;clc

%% load/save portable raman
wav = load('D:\Postdoc\Paper 8\FRC_data\Raman_high\wavelength.csv');
data1 = load('D:\Postdoc\Paper 8\FRC_data\Raman_high\raw-yuanyang.csv');
data2 = load('D:\Postdoc\Paper 8\FRC_data\Raman_high\raw-suanhua.csv');
data3 = load('D:\Postdoc\Paper 8\FRC_data\Raman_high\raw-shuihua.csv');
data4 = load('D:\Postdoc\Paper 8\FRC_data\Raman_high\raw-dongrong.csv');
data5 = load('D:\Postdoc\Paper 8\FRC_data\Raman_high\raw-jiare.csv');
data = [data1;data2;data3;data4;data5];X = data(:,1:end-1);Y = data(:,end);
dlmwrite('D:\Postdoc\Paper 8\FRC_data\Raman_high\raw-data.csv',[X Y])

%% load benchtop raman
wav = load('D:\Postdoc\Paper 8\FRC_data\Raman_low\wavelength.csv');
data1 = load('D:\Postdoc\Paper 8\FRC_data\Raman_low\raw-yuanyang.csv');
data2 = load('D:\Postdoc\Paper 8\FRC_data\Raman_low\raw-suanhua.csv');
data3 = load('D:\Postdoc\Paper 8\FRC_data\Raman_low\raw-shuihua.csv');
data4 = load('D:\Postdoc\Paper 8\FRC_data\Raman_low\raw-dongrong.csv');
data5 = load('D:\Postdoc\Paper 8\FRC_data\Raman_low\raw-jiare.csv');
data = [data1;data2;data3;data4;data5];X = data(:,1:end-1);Y = data(:,end);
dlmwrite('D:\Postdoc\Paper 8\FRC_data\Raman_low\raw-data.csv',[X Y])