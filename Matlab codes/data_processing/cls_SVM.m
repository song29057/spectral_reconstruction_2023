clear;clc

%% load high raman
% data_train = load('D:\Postdoc\Paper 8\FRC_data\Raman_high\data-train.csv');
% data_test = load('D:\Postdoc\Paper 8\FRC_data\Raman_high\data-test.csv');

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

%% load NIRS
data_train = load('D:\Postdoc\Paper 8\FRC_data\NIRS\data-train.csv');
data_test = load('D:\Postdoc\Paper 8\FRC_data\NIRS\data-test.csv');

%% Indices
Xtrain = data_train(:,1:end-1);Xtest = data_test(:,1:end-1);
Ytrain = data_train(:,end);Ytest = data_test(:,end);

fold = 5;
indices = 1 + rem(0:round(size(Ytrain,1))-1,fold);
% indices = crossvalind('Kfold',ones(size(Ytrain,1),1),fold);

%% SVM
C = 1:20;G = -20:-1;  
for i = 1:size(C,2)
    for j = 1:size(G,2)
        c = 2^C(i);g = 2^G(j);
        libsvm_options = ['-t 2 ','-c',' ',num2str(c),' ','-g',' ', num2str(g)];
        for k = 1:fold
            test = (indices == k);  train = ~test;
            xtrain = Xtrain(train,:);    xtest = Xtrain(test,:);                                                                             
            ytrain = Ytrain(train,:);    ytest = Ytrain(test,:);                         
            model = svmtrain(ytrain,xtrain,libsvm_options);
            [ycv,~,~] = svmpredict(ytest,xtest,model,'-b 0');                       
            Ycv(test,:) = ycv;
        end        
        correct = find(Ytrain - Ycv == 0);
        acc = size(correct,1)/size(Ytrain,1);
        accuracy_CV_all(i,j) = acc;
    end
    i
end
[a,b] = find(accuracy_CV_all==max(max(accuracy_CV_all)));
opt_para = [a b];
r = randperm(size(opt_para,1));
a = a(r(1));b = b(r(1));

% s = [16,1;17,1;18,1;19,1;20,1;15,2;16,2;17,2;18,2;19,2;20,2;14,3;15,3;16,3;17,3;18,3;19,3;20,3;13,4;14,4;15,4;16,4;17,4;18,4;19,4;20,4;12,5;13,5;14,5;15,5;16,5;17,5;18,5;19,5;20,5;11,6;12,6;13,6;14,6;15,6;16,6;17,6;18,6;19,6;20,6;10,7;11,7;12,7;13,7;14,7;15,7;16,7;17,7;18,7;19,7;20,7;9,8;10,8;11,8;12,8;13,8;14,8;15,8;16,8;17,8;18,8;19,8;20,8;8,9;9,9;10,9;11,9;12,9;13,9;14,9;15,9;16,9;17,9;18,9;19,9;20,9;7,10;8,10;9,10;10,10;11,10;12,10;13,10;14,10;15,10;16,10;17,10;18,10;19,10;20,10;6,11;7,11;8,11;9,11;10,11;11,11;12,11;13,11;14,11;15,11;16,11;17,11;18,11;19,11;20,11;5,12;6,12;7,12;8,12;9,12;10,12;11,12;12,12;13,12;14,12;15,12;16,12;17,12;18,12;19,12;20,12;4,13;5,13;6,13;7,13;8,13;9,13;10,13;11,13;12,13;13,13;14,13;15,13;16,13;17,13;18,13;19,13;20,13;3,14;4,14;5,14;6,14;7,14;8,14;9,14;10,14;11,14;12,14;13,14;14,14;15,14;16,14;17,14;18,14;19,14;20,14;2,15;3,15;4,15;5,15;6,15;7,15;8,15;9,15;10,15;11,15;12,15;13,15;14,15;15,15;16,15;17,15;18,15;19,15;20,15;1,16;2,16;3,16;4,16;5,16;6,16;7,16;8,16;9,16;10,16;11,16;12,16;13,16;14,16;15,16;16,16;17,16;18,16;19,16;20,16];
% h = 140;
% a = s(h,1);b = s(h,2);

for k = 1:fold
    c = 2^C(a);g = 2^G(b);
    libsvm_options = ['-t 2 ','-c',' ',num2str(c),' ','-g',' ', num2str(g)];
    test = (indices == k);  train = ~test; 
    xtrain = Xtrain(train,:);    xtest = Xtrain(test,:);                                                                             
    ytrain = Ytrain(train,:);    ytest = Ytrain(test,:);                   
    model = svmtrain(ytrain,xtrain,libsvm_options);
    [ycv,~,~] = svmpredict(ytest,xtest,model,'-b 0');       
    Ycv(test,:) = ycv;                      
end
correct = find(Ytrain - Ycv == 0);
accuracy_CV = size(correct,1)/size(Ytrain,1);

model = svmtrain(Ytrain,Xtrain,libsvm_options);
[Yp,~,~] = svmpredict(Ytest,Xtest,model,'-b 0');

correct = find(Ytest - Yp == 0);
accuracy_predict = size(correct,1)/size(Ytest,1);
Results_SVM = roundn([accuracy_CV accuracy_predict],-4)'