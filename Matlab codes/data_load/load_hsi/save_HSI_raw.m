clear;clc

%% save HSI raman
data1 = load('D:\Postdoc\Paper 8\FRC_data\HSI\raw-yuanyang.csv');
data2 = load('D:\Postdoc\Paper 8\FRC_data\HSI\raw-suanhua.csv');
data3 = load('D:\Postdoc\Paper 8\FRC_data\HSI\raw-shuihua.csv');
data4 = load('D:\Postdoc\Paper 8\FRC_data\HSI\raw-dongrong.csv');
data5 = load('D:\Postdoc\Paper 8\FRC_data\HSI\raw-jiare.csv');
data = [data1;data2;data3;data4;data5];
X = data(:,1:end-1);
Y = data(:,end);
dlmwrite('D:\Postdoc\Paper 8\FRC_data\HSI\raw-data.csv',[X Y])
