%% MAE 
clear;clc

% data_test = load('D:\Postdoc\Paper 8\FRC_data\Raman_high\data-test.csv');
% recons_50 = load('D:\Postdoc\Paper 8\FRC_data\Reconstructed RS\reconstructed-test 50.csv');
% recons_100 = load('D:\Postdoc\Paper 8\FRC_data\Reconstructed RS\reconstructed-test 100.csv');
% recons_150 = load('D:\Postdoc\Paper 8\FRC_data\Reconstructed RS\reconstructed-test 150.csv');
% recons_200 = load('D:\Postdoc\Paper 8\FRC_data\Reconstructed RS\reconstructed-test 200.csv');
% recons_250 = load('D:\Postdoc\Paper 8\FRC_data\Reconstructed RS\reconstructed-test 250.csv');
% recons_300 = load('D:\Postdoc\Paper 8\FRC_data\Reconstructed RS\reconstructed-test 300.csv');

data_test = load('D:\Postdoc\Paper 8\FRC_data\LIBS\data-test.csv');
recons_50 = load('D:\Postdoc\Paper 8\FRC_data\Reconstructed LIBS\reconstructed-test 50.csv');
recons_100 = load('D:\Postdoc\Paper 8\FRC_data\Reconstructed LIBS\reconstructed-test 100.csv');
recons_150 = load('D:\Postdoc\Paper 8\FRC_data\Reconstructed LIBS\reconstructed-test 150.csv');
recons_200 = load('D:\Postdoc\Paper 8\FRC_data\Reconstructed LIBS\reconstructed-test 200.csv');
recons_250 = load('D:\Postdoc\Paper 8\FRC_data\Reconstructed LIBS\reconstructed-test 250.csv');
recons_300 = load('D:\Postdoc\Paper 8\FRC_data\Reconstructed LIBS\reconstructed-test 300.csv');


Xtest = data_test(:,1:end-1);
perf1 = mae(Xtest - recons_50);
perf2 = mae(Xtest - recons_100);
perf3 = mae(Xtest - recons_150);
perf4 = mae(Xtest - recons_200);
perf5 = mae(Xtest - recons_250);
perf6 = mae(Xtest - recons_300);

perf = [perf1 perf2 perf3 perf4 perf5 perf6];

[m,n] = size(Xtest);
recons_50 = reshape(recons_50,m*n,1);
recons_100 = reshape(recons_100,m*n,1);
recons_150 = reshape(recons_150,m*n,1);
recons_200 = reshape(recons_200,m*n,1);
recons_250 = reshape(recons_250,m*n,1);
recons_300 = reshape(recons_300,m*n,1);
Xtest = reshape(Xtest,m*n,1);

[RMSE1,MAE1,R21] = regress_results1(Xtest,recons_50);
[RMSE2,MAE2,R22] = regress_results1(Xtest,recons_100);
[RMSE3,MAE3,R23] = regress_results1(Xtest,recons_150);
[RMSE4,MAE4,R24] = regress_results1(Xtest,recons_200);
[RMSE5,MAE5,R25] = regress_results1(Xtest,recons_250);
[RMSE6,MAE6,R26] = regress_results1(Xtest,recons_300);

perf_mae = [MAE1 MAE2 MAE3 MAE4 MAE5 MAE6]';
