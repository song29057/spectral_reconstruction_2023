clear;clc

%% load high raman
data_train = load('D:\Postdoc\Paper 8\FRC_data\Raman_high\data-train.csv');
data_test = load('D:\Postdoc\Paper 8\FRC_data\Raman_high\data-test.csv');

%% load low raman
% data_train = load('D:\Postdoc\Paper 8\FRC_data\Raman_low\data-train.csv');
% data_test = load('D:\Postdoc\Paper 8\FRC_data\Raman_low\data-test.csv');

%% load LIBS
% data_train = load('D:\Postdoc\Paper 8\FRC_data\LIBS\data-train.csv');
% data_test = load('D:\Postdoc\Paper 8\FRC_data\LIBS\data-test.csv');

%% load HSI
% data_train = load('D:\Postdoc\Paper 8\FRC_data\HSI\data-train.csv');
% data_test = load('D:\Postdoc\Paper 8\FRC_data\HSI\data-test.csv');

%% load SVI
% data_train = load('D:\Postdoc\Paper 8\FRC_data\Video\data-train.csv');
% data_test = load('D:\Postdoc\Paper 8\FRC_data\Video\data-test.csv');

%% Indices
Xtrain = data_train(:,1:end-1);Xtest = data_test(:,1:end-1);
Ytrain = data_train(:,end);Ytest = data_test(:,end);

fold = 5;
indices = 1 + rem(0:round(size(Ytrain,1))-1,fold);
% indices = crossvalind('Kfold',ones(size(Ytrain,1),1),fold);

%% K-ELM
C = 1:20;Gamma = 1:20;  
for i = 1:size(C,2)
    for j = 1:size(Gamma,2)
        for k = 1:fold
            test = (indices == k);  train = ~test;
            xtrain = Xtrain(train,:);    xtest = Xtrain(test,:);
            ytrain = Ytrain(train,:);    ytest = Ytrain(test,:);
            train_data = [ytrain xtrain];
            test_data = [ytest xtest];
            [~,~,~,~,ycv] = kernel_elm(train_data,test_data,1,2^C(i),'RBF_kernel',2^Gamma(j));
            [~,ycv] = max(ycv,[],1);
            Ycv(test,:) = ycv';
        end
        correct = find(Ytrain - Ycv == 0);
        acc = size(correct,1)/size(Ytrain,1);
        accuracy_CV_all(i,j) = acc;
    end
    i
end
[a,b] = find(accuracy_CV_all==max(max(accuracy_CV_all)));
opt_para2 = [a b];a = a(end);b = b(end);
for k = 1:fold
    test = (indices == k);  train = ~test;
    xtrain = Xtrain(train,:);    xtest = Xtrain(test,:);
    ytrain = Ytrain(train,:);    ytest = Ytrain(test,:);
    train_data = [ytrain xtrain];
    test_data = [ytest xtest];
    [~,~,~,~,ycv] = kernel_elm(train_data,test_data,1,2^C(a),'RBF_kernel',2^Gamma(b));
    [~,ycv] = max(ycv,[],1);
    Ycv(test,:) = ycv';
end
correct = find(Ytrain - Ycv == 0);
accuracy_CV = size(correct,1)/size(Ytrain,1);

train_data = [Ytrain Xtrain];test_data = [Ytest Xtest];
[~,~,~,~,Yp] = kernel_elm(train_data,test_data,1,2^C(a),'RBF_kernel',2^Gamma(b));
[~,Yp] = max(Yp,[],1);Yp = Yp';
correct = find(Ytest - Yp == 0);
accuracy_predict = size(correct,1)/size(Ytest,1);

Results_KELM = roundn([accuracy_CV accuracy_predict],-4)'
    
