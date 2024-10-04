clear;clc

%% load high raman
% data = load('D:\Postdoc\Paper 8\FRC_data\Raman_high\data.csv');
% X = data(:,1:end-1);Y = data(:,end);

%% load low raman
data = load('D:\Postdoc\Paper 8\FRC_data\Raman_low\data.csv');
X = data(:,1:end-1);Y = data(:,end);

%% load LIBS
% data = load('D:\Postdoc\Paper 8\FRC_data\LIBS\data.csv');
% X = data(:,1:end-1);Y = data(:,end);

%% load HSI
% data = load('D:\Postdoc\Paper 8\FRC_data\HSI\data.csv');
% X = data(:,1:end-1);Y = data(:,end);

%% load SVI
% data = load('D:\Postdoc\Paper 8\FRC_data\Video\data.csv');
% X = data(:,1:end-1);Y = data(:,end);

%% projection
% [~,score,~,~,explained,~] = pca(zscore(X));
score = tsne(X);

%% plot
c1 = [0 0.45 0.74];     %blue
c2 = [0.85 0.33 0.1];   %red
c3 = [0.93 0.69 0.13];  %yellow
c4 = [0.49 0.18 0.56];  %purple
c5 = [0.466 0.674 0.188];
c6 = [0.301 0.745 0.933];
c7 = [0.635 0.078 0.184]; 

a1 = find(Y==1);a2 = find(Y==2);a3 = find(Y==3);
a4 = find(Y==4);a5 = find(Y==5);a6 = find(Y==6);
a7 = find(Y==7);

figure

scatter(score(a1,1),score(a1,2),30,'o','MarkerEdgeColor',[0.5 0.5 0.5],'MarkerFaceColor',c1);hold on
scatter(score(a2,1),score(a2,2),30,'s','MarkerEdgeColor',[0.5 0.5 0.5],'MarkerFaceColor',c2);hold on
scatter(score(a3,1),score(a3,2),30,'d','MarkerEdgeColor',[0.5 0.5 0.5],'MarkerFaceColor',c3);hold on
scatter(score(a4,1),score(a4,2),30,'v','MarkerEdgeColor',[0.5 0.5 0.5],'MarkerFaceColor',c4);hold on
scatter(score(a5,1),score(a5,2),30,'^','MarkerEdgeColor',[0.5 0.5 0.5],'MarkerFaceColor',c5);hold on
scatter(score(a6,1),score(a6,2),30,'h','MarkerEdgeColor',[0.5 0.5 0.5],'MarkerFaceColor',c6);hold on
scatter(score(a7,1),score(a7,2),30,'p','MarkerEdgeColor',[0.5 0.5 0.5],'MarkerFaceColor',c7);hold on

% scatter3(score(a1,1),score(a1,2),score(a1,3),30,'o','MarkerEdgeColor',[0.5 0.5 0.5],'MarkerFaceColor',c1);hold on
% scatter3(score(a2,1),score(a2,2),score(a2,3),30,'s','MarkerEdgeColor',[0.5 0.5 0.5],'MarkerFaceColor',c2);hold on
% scatter3(score(a3,1),score(a3,2),score(a3,3),30,'d','MarkerEdgeColor',[0.5 0.5 0.5],'MarkerFaceColor',c3);hold on
% scatter3(score(a4,1),score(a4,2),score(a4,3),30,'v','MarkerEdgeColor',[0.5 0.5 0.5],'MarkerFaceColor',c4);hold on
% scatter3(score(a5,1),score(a5,2),score(a5,3),30,'^','MarkerEdgeColor',[0.5 0.5 0.5],'MarkerFaceColor',c5);hold on
% scatter3(score(a6,1),score(a6,2),score(a6,3),30,'h','MarkerEdgeColor',[0.5 0.5 0.5],'MarkerFaceColor',c6);hold on
% scatter3(score(a7,1),score(a7,2),score(a7,3),30,'p','MarkerEdgeColor',[0.5 0.5 0.5],'MarkerFaceColor',c7);hold on

legend('B-1','B-2','B-3','B-4','B-5','B-6','B-7')
box on
% % confellipse2([score(a,1),score(a,2)],s);hold on