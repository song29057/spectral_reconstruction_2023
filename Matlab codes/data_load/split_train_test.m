clear;clc

%%%%% order = randperm(385);
%%%%% dlmwrite('D:\Postdoc\Paper 8\FRC_data\Indices\order.csv',order)

order = load('D:\Postdoc\Paper 8\FRC_data\Indices\order.csv');
train = order(1:50);test = order(301:end);

%% load high raman
data = load('D:\Postdoc\Paper 8\FRC_data\Raman_high\data.csv');
X = data(:,1:end-1);Y = data(:,end);
Xtrain = X(train,:);Xtest = X(test,:);
Ytrain = Y(train,:);Ytest = Y(test,:);
dlmwrite('D:\Postdoc\Paper 8\FRC_data\Raman_high\data-train.csv',[Xtrain Ytrain])
dlmwrite('D:\Postdoc\Paper 8\FRC_data\Raman_high\data-test.csv',[Xtest Ytest])

%% load low raman
data = load('D:\Postdoc\Paper 8\FRC_data\Raman_low\data.csv');
X = data(:,1:end-1);Y = data(:,end);
Xtrain = X(train,:);Xtest = X(test,:);
Ytrain = Y(train,:);Ytest = Y(test,:);
dlmwrite('D:\Postdoc\Paper 8\FRC_data\Raman_low\data-train.csv',[Xtrain Ytrain])
dlmwrite('D:\Postdoc\Paper 8\FRC_data\Raman_low\data-test.csv',[Xtest Ytest])
dlmwrite('D:\Postdoc\Paper 8\FRC_data\Raman_low\dummy-ytrain.csv',dummyvar(Ytrain))
dlmwrite('D:\Postdoc\Paper 8\FRC_data\Raman_low\dummy-ytest.csv',dummyvar(Ytest))

%% load HSI
data = load('D:\Postdoc\Paper 8\FRC_data\HSI\data.csv');
X = data(:,1:end-1);Y = data(:,end);
Xtrain = X(train,:);Xtest = X(test,:);
Ytrain = Y(train,:);Ytest = Y(test,:);
dlmwrite('D:\Postdoc\Paper 8\FRC_data\HSI\data-train.csv',[Xtrain Ytrain])
dlmwrite('D:\Postdoc\Paper 8\FRC_data\HSI\data-test.csv',[Xtest Ytest])
dlmwrite('D:\Postdoc\Paper 8\FRC_data\HSI\dummy-ytrain.csv',dummyvar(Ytrain))
dlmwrite('D:\Postdoc\Paper 8\FRC_data\HSI\dummy-ytest.csv',dummyvar(Ytest))

%% load SVI
data = load('D:\Postdoc\Paper 8\FRC_data\Video\data.csv');
X = data(:,1:end-1);Y = data(:,end);
Xtrain = X(train,:);Xtest = X(test,:);
Ytrain = Y(train,:);Ytest = Y(test,:);
dlmwrite('D:\Postdoc\Paper 8\FRC_data\Video\data-train.csv',[Xtrain Ytrain])
dlmwrite('D:\Postdoc\Paper 8\FRC_data\Video\data-test.csv',[Xtest Ytest])
dlmwrite('D:\Postdoc\Paper 8\FRC_data\Video\dummy-ytrain.csv',dummyvar(Ytrain))
dlmwrite('D:\Postdoc\Paper 8\FRC_data\Video\dummy-ytest.csv',dummyvar(Ytest))

%% load LIBS
data = load('D:\Postdoc\Paper 8\FRC_data\LIBS\data.csv');
X = data(:,1:end-1);Y = data(:,end);
Xtrain = X(train,:);Xtest = X(test,:);
Ytrain = Y(train,:);Ytest = Y(test,:);
dlmwrite('D:\Postdoc\Paper 8\FRC_data\LIBS\data-train.csv',[Xtrain Ytrain])
dlmwrite('D:\Postdoc\Paper 8\FRC_data\LIBS\data-test.csv',[Xtest Ytest])
dlmwrite('D:\Postdoc\Paper 8\FRC_data\LIBS\dummy-ytrain.csv',dummyvar(Ytrain))
dlmwrite('D:\Postdoc\Paper 8\FRC_data\LIBS\dummy-ytest.csv',dummyvar(Ytest))

%% load NIRS
data = load('D:\Postdoc\Paper 8\FRC_data\NIRS\data.csv');
X = data(:,1:end-1);Y = data(:,end);
Xtrain = X(train,:);Xtest = X(test,:);
Ytrain = Y(train,:);Ytest = Y(test,:);
dlmwrite('D:\Postdoc\Paper 8\FRC_data\NIRS\data-train.csv',[Xtrain Ytrain])
dlmwrite('D:\Postdoc\Paper 8\FRC_data\NIRS\data-test.csv',[Xtest Ytest])
dlmwrite('D:\Postdoc\Paper 8\FRC_data\NIRS\dummy-ytrain.csv',dummyvar(Ytrain))
dlmwrite('D:\Postdoc\Paper 8\FRC_data\NIRS\dummy-ytest.csv',dummyvar(Ytest))