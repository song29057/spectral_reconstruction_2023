clear;clc
data_train = load('D:\Postdoc\Paper 8\FRC_data\Video\data-train.csv');
data_test = load('D:\Postdoc\Paper 8\FRC_data\Video\data-test.csv');

Xtrain = data_train(:,1:end-1);Xtest = data_test(:,1:end-1);
Ytrain = data_train(:,end);Ytest = data_test(:,end);

mu_train = mean(Xtrain);
sigma_train = std(Xtrain);

Xtrain_norm = (Xtrain - mu_train) ./ sigma_train;
Xtest_norm = (Xtest - mu_train) ./ sigma_train;

[coeff, score_train, latent] = pca(Xtrain_norm);
score_test = Xtest_norm * coeff(:, 1 : 2); 

a1 = find(Ytest==1);
a2 = find(Ytest==2);
a3 = find(Ytest==3);
a4 = find(Ytest==4);
a5 = find(Ytest==5);
a6 = find(Ytest==6);
a7 = find(Ytest==7);

c1 = [0.0000  0.4470  0.7410];  %% blue
c2 = [0.8500  0.3250  0.0980];  %% red
c3 = [0.9290  0.6940  0.1250];  %% yellow
c4 = [0.4940  0.1840  0.5560];  %% purple
c5 = [0.4660  0.6740  0.1880];  %% green
c6 = [0.3010  0.7450  0.9330];  %% blue
c7 = [0.6350  0.0780  0.1840];  %% red

figure
scatter(score_test(a1,1),score_test(a1,2),30,c1);hold on
scatter(score_test(a2,1),score_test(a2,2),30,c2);hold on
scatter(score_test(a3,1),score_test(a3,2),30,c3);hold on
scatter(score_test(a4,1),score_test(a4,2),30,c4);hold on
scatter(score_test(a5,1),score_test(a5,2),30,c5);hold on
scatter(score_test(a6,1),score_test(a6,2),30,c6);hold on
scatter(score_test(a7,1),score_test(a7,2),30,c7);hold on