clear;clc

%% load label
data_train = load('D:\Postdoc\Paper 8\FRC_data\LIBS\data-train.csv');
data_test = load('D:\Postdoc\Paper 8\FRC_data\LIBS\data-test.csv');
Ytrain = data_train(:,end);Ytest = data_test(:,end);

%% load reconstructed raman
Xtrain = load('D:\Postdoc\Paper 8\FRC_data\Reconstructed LIBS\reconstructed-train.csv');
Xtest = load('D:\Postdoc\Paper 8\FRC_data\Reconstructed LIBS\reconstructed-test.csv');

%% fusion
data_train = load('D:\Postdoc\Paper 8\FRC_data\Raman_low\data-train.csv');
data_test = load('D:\Postdoc\Paper 8\FRC_data\Raman_low\data-test.csv');
Xtrain = [Xtrain data_train(:,1:end-1)];
Xtest = [Xtest data_test(:,1:end-1)];

%% Indices
fold = 5;indices = 1 + rem(0:round(size(Ytrain,1))-1,fold);

%% SVM
C = 1:20;G = -20:-1;  
% for i = 1:size(C,2)
%     for j = 1:size(G,2)
%         c = 2^C(i);g = 2^G(j);
%         libsvm_options = ['-t 2 ','-c',' ',num2str(c),' ','-g',' ', num2str(g)];
%         for k = 1:fold
%             test = (indices == k);  train = ~test;
%             xtrain = Xtrain(train,:);    xtest = Xtrain(test,:);                                                                             
%             ytrain = Ytrain(train,:);    ytest = Ytrain(test,:);                     
%             model = svmtrain(ytrain,xtrain,libsvm_options);
%             [ycv,~,~] = svmpredict(ytest,xtest,model,'-b 0');
%             Ycv(test,:) = ycv;
%         end        
%         correct = find(Ytrain - Ycv == 0);
%         acc = size(correct,1)/size(Ytrain,1);
%         accuracy_CV_all(i,j) = acc;
%     end
%     i
% end
% [a,b] = find(accuracy_CV_all==max(max(accuracy_CV_all)));
% opt_para = [a b];
% r = randperm(size(opt_para,1));
% a = a(r(1));b = b(r(1));

s = [19,1;18,2;19,2;17,3;16,4;15,5;14,6;13,7;12,8;8,13;7,14];
h = 10;
a = s(h,1);b = s(h,2);

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

%% compare spectra 
% wav0 = load('D:\Postdoc\Paper 8\FRC_data\Raman_high\wavelength.csv');wav = wav0(56:478);
% figure
% c1 = [0.0000  0.4470  0.7410];  %% blue
% c2 = [0.8500  0.3250  0.0980];  %% red
% c3 = [0.9290  0.6940  0.1250];  %% yellow
% c4 = [0.4940  0.1840  0.5560];  %% purple
% c5 = [0.4660  0.6740  0.1880];  %% green
% c6 = [0.3010  0.7450  0.9330];  %% blue
% c7 = [0.6350  0.0780  0.1840];  %% red
% % plot(wav,Xtest(num,:),'color',c2);hold on
% % plot(wav,data_test(num,1:end-1),'color',c6);hold on
% 
% cls = 3;
% plot(wav,mean(Xtest(Ytest==cls,:),1),'color',c2);hold on
% plot(wav,mean(data_test(Ytest==cls,1:end-1),1),'color',c6);hold on
% 
% xlabel('Raman shift (cm^-^1)');ylabel('Normalized intensity');
% xlim([300 1200]);
% set(gca,'xtick',300:100:1200);
% legend('Reconstructed','Original','location','best')
