clear;clc
%% load high data
data_high_train = load('D:\Postdoc\Paper 8\FRC_data\Raman_high\data-train.csv');
data_high_test = load('D:\Postdoc\Paper 8\FRC_data\Raman_high\data-test.csv');
X_high_train = data_high_train(:,1:end-1);
X_high_test = data_high_test(:,1:end-1);
dlmwrite('D:\Postdoc\Paper 8\FRC_data\Twin data\XTrain-h.csv',X_high_train)

%% load low data
data_low_train = load('D:\Postdoc\Paper 8\FRC_data\Raman_low\data-train.csv');
data_low_test = load('D:\Postdoc\Paper 8\FRC_data\Raman_low\data-test.csv');
X_low_train = data_low_train(:,1:end-1);
X_low_test = data_low_test(:,1:end-1);
dlmwrite('D:\Postdoc\Paper 8\FRC_data\Twin data\XTrain-l.csv',X_low_train)

%% load Y
Ytrain = data_high_train(:,end);
Ytest = data_high_test(:,end);

%% select
list = 1:size(Ytrain,1);
Combination = nchoosek(list,2);
R1 = randperm(size(Combination,1))';
index_random = Combination(R1,:);
index = index_random;
left = index_random(2:2:end,1);
right = index_random(2:2:end,2);
index(2:2:end,1) = right;
index(2:2:end,2) = left;
num = min(2000,size(index_random,1));
index = index(1:num,:);

% dlmwrite('D:\Postdoc\Paper 8\FRC_data\Indices\twin-index.csv',index)

% index = load('D:\Postdoc\Paper 8\FRC_data\Indices\twin-index 50.csv');
% index = load('D:\Postdoc\Paper 8\FRC_data\Indices\twin-index 100.csv');
% index = load('D:\Postdoc\Paper 8\FRC_data\Indices\twin-index 150.csv');
% index = load('D:\Postdoc\Paper 8\FRC_data\Indices\twin-index 200.csv');
% index = load('D:\Postdoc\Paper 8\FRC_data\Indices\twin-index 250.csv');
index = load('D:\Postdoc\Paper 8\FRC_data\Indices\twin-index 300.csv');

YTrain1 = Ytrain(index(:,1));
YTrain2 = Ytrain(index(:,2));
label = YTrain1 - YTrain2;
label(label~=0) = 1;size(find(label==0))
X_high_train1 = X_high_train(index(:,1),:);
X_high_train2 = X_high_train(index(:,2),:);
X_low_train1 = X_low_train(index(:,1),:);
X_low_train2 = X_low_train(index(:,2),:);

%% write data
dlmwrite('D:\Postdoc\Paper 8\FRC_data\Twin data\XTrain-h1.csv',X_high_train1)
dlmwrite('D:\Postdoc\Paper 8\FRC_data\Twin data\XTrain-h2.csv',X_high_train2)
dlmwrite('D:\Postdoc\Paper 8\FRC_data\Twin data\XTrain-l1.csv',X_low_train1)
dlmwrite('D:\Postdoc\Paper 8\FRC_data\Twin data\XTrain-l2.csv',X_low_train2)
dlmwrite('D:\Postdoc\Paper 8\FRC_data\Twin data\XTest-h.csv',X_high_test)
dlmwrite('D:\Postdoc\Paper 8\FRC_data\Twin data\XTest-l.csv',X_low_test)
dlmwrite('D:\Postdoc\Paper 8\FRC_data\Twin data\YTrain1.csv',dummyvar(YTrain1))
dlmwrite('D:\Postdoc\Paper 8\FRC_data\Twin data\YTrain2.csv',dummyvar(YTrain2))
dlmwrite('D:\Postdoc\Paper 8\FRC_data\Twin data\YTrain.csv',dummyvar(Ytrain))
dlmwrite('D:\Postdoc\Paper 8\FRC_data\Twin data\YTest.csv',dummyvar(Ytest))
dlmwrite('D:\Postdoc\Paper 8\FRC_data\Twin data\label.csv',label)
