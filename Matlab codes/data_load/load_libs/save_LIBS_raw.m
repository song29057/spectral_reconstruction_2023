%% load/save portable raman
clear;clc
data1 = load('D:\Postdoc\Paper 8\FRC_data\LIBS\raw-yuanyang.csv');
data2 = load('D:\Postdoc\Paper 8\FRC_data\LIBS\raw-suanhua.csv');
data3 = load('D:\Postdoc\Paper 8\FRC_data\LIBS\raw-shuihua.csv');
data4 = load('D:\Postdoc\Paper 8\FRC_data\LIBS\raw-dongrong.csv');
data5 = load('D:\Postdoc\Paper 8\FRC_data\LIBS\raw-200.csv');
data = [data1;data2;data3;data4;data5];
dlmwrite('D:\Postdoc\Paper 8\FRC_data\LIBS\raw-data.csv',data)