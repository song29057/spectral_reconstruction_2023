clear;clc

%% load high raman
% data_train = load('D:\Postdoc\Paper 8\FRC_data\Raman_high\data-train.csv');
% data_test = load('D:\Postdoc\Paper 8\FRC_data\Raman_high\data-test.csv');

%% load low raman
data_train = load('D:\Postdoc\Paper 8\FRC_data\Raman_low\data-train.csv');
data_test = load('D:\Postdoc\Paper 8\FRC_data\Raman_low\data-test.csv');

%% load LIBS
% data_train = load('D:\Postdoc\Paper 8\FRC_data\LIBS\data-train.csv');
% data_test = load('D:\Postdoc\Paper 8\FRC_data\LIBS\data-test.csv');

%% load HSI
% data_train = load('D:\Postdoc\Paper 8\FRC_data\HSI\data-train.csv');
% data_test = load('D:\Postdoc\Paper 8\FRC_data\HSI\data-test.csv');

%% load SVI
% data_train = load('D:\Postdoc\Paper 8\FRC_data\Video\data-train.csv');
% data_test = load('D:\Postdoc\Paper 8\FRC_data\Video\data-test.csv');

%% load NIRS
% data_train = load('D:\Postdoc\Paper 8\FRC_data\NIRS\data-train.csv');
% data_test = load('D:\Postdoc\Paper 8\FRC_data\NIRS\data-test.csv');

%% Indices
Xtrain = data_train(:,1:end-1);Xtest = data_test(:,1:end-1);
Ytrain = data_train(:,end);Ytest = data_test(:,end);

Xtrain = savgol(Xtrain,25,2,1);
Xtest = savgol(Xtest,25,2,1);

fold = 5;
indices = 1 + rem(0:round(size(Ytrain,1))-1,fold);
% indices = crossvalind('Kfold',ones(size(Ytrain,1),1),fold);

%% PLS-DA
LV = 15;
for k = 1:fold
    test = (indices == k);  train = ~test;
    xtrain = Xtrain(train,:);    xtest = Xtrain(test,:);
    ytrain = Ytrain(train,:);    ytest = Ytrain(test,:);
    [~,~,ycv] = fast_PLSDA(xtrain,ytrain,xtest,ytest,LV);
    Ycv(test,:) = ycv;
end
for i = 1:LV
    correct = find(Ytrain - Ycv(:,i) == 0);
    acc = size(correct,1)/size(Ytrain,1);
    results_CV_all(i,:) = acc;
end
[results_CV,para] = max(results_CV_all);
b = find(results_CV_all == results_CV);b = b(1); %b = 15
[~,~,~,~,beta] = plsregress(Xtrain,Ytrain,b);
beta = abs(beta(2:end));
[score,accuracy,Yp] = fast_PLSDA(Xtrain,Ytrain,Xtest,Ytest,b);
results_predict = accuracy(b);
Results_PLS = roundn([results_CV results_predict],-4)'
