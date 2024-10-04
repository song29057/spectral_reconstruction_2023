clear;clc

%% load label
data_train = load('D:\Postdoc\Paper 8\FRC_data\Raman_high\data-train.csv');
data_test = load('D:\Postdoc\Paper 8\FRC_data\Raman_high\data-test.csv');
Ytrain = data_train(:,end);Ytest = data_test(:,end);

%% load reconstructed raman
Xtrain = load('D:\Postdoc\Paper 8\FRC_data\Raman_low\reconstructed-train.csv');
Xtest = load('D:\Postdoc\Paper 8\FRC_data\Raman_low\reconstructed-test.csv');

%% load reconstructed SVI
% Xtrain = load('D:\Postdoc\Paper 8\FRC_data\Video\reconstructed-train.csv');
% Xtest = load('D:\Postdoc\Paper 8\FRC_data\Video\reconstructed-test.csv');

%% Indices
fold = 5;indices = 1 + rem(0:round(size(Ytrain,1))-1,fold); %% num for plot

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
[results_CV,~] = max(results_CV_all);
b = find(results_CV_all == results_CV);b = b(3);
[~,~,~,~,beta] = plsregress(Xtrain,Ytrain,b);
beta = abs(beta(2:end));
[score,accuracy,Yp] = fast_PLSDA(Xtrain,Ytrain,Xtest,Ytest,b);
results_predict = accuracy(b);
Results_PLS = roundn([results_CV results_predict],-4)'

%% compare spectra
wav0 = load('D:\Postdoc\Paper 8\FRC_data\Raman_high\wavelength.csv');wav = wav0(56:478);
figure
c1 = [0.0000  0.4470  0.7410];  %% blue
c2 = [0.8500  0.3250  0.0980];  %% red
c3 = [0.9290  0.6940  0.1250];  %% yellow
c4 = [0.4940  0.1840  0.5560];  %% purple
c5 = [0.4660  0.6740  0.1880];  %% green
c6 = [0.3010  0.7450  0.9330];  %% blue
c7 = [0.6350  0.0780  0.1840];  %% red
% plot(wav,Xtest(num,:),'color',c2);hold on
% plot(wav,data_test(num,1:end-1),'color',c6);hold on

cls = 1;
plot(wav,mean(Xtest(Ytest==cls,:),1),'color',c2);hold on
plot(wav,mean(data_test(Ytest==cls,1:end-1),1),'color',c6);hold on

xlabel('Raman shift (cm^-^1)');ylabel('Intensity');
xlim([300 1200]);
set(gca,'xtick',300:100:1200);
legend('Reconstructed','Original','location','best')
