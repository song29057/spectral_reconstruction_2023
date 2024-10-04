%% 1-yuanyang
clear;clc;
fileFolder=fullfile('D:\Postdoc\Paper 8\FRC_data\LIBS\yuanyang');
dirOutput=dir(fullfile(fileFolder,'*.csv'));
fileNames={dirOutput.name};
n = size(fileNames,2);X = [];
index = [1 10:19 2 20 3:9];
[~,I] = sort(index,'ascend');
for i = 1:n
    path = [fileFolder,'\',cell2mat(fileNames(i))];
    S = load(path);
    data = S(:,2:end)';
    m = size(data,1);
    x = zeros(m/16,12990);
    for j = 1:m/16
        r = (j-1)*16+1:j*16;
        A = data(r,:);
        B = sum(A,2);
        C = mean(B,1);
        D = pdist2(B,C,'euclidean');
        [~,TFrm] = rmoutliers(D,"mean");
        A(TFrm,:) = [];size(A,1)
        x(j,:) = mean(A,1);
    end
    x = x(I,:);
    X = [X;x];
    i
end
Y = repmat(1:1:7,20,1);Y = reshape(Y,20*7,1);
dlmwrite('D:\Postdoc\Paper 8\FRC_data\LIBS\raw-yuanyang.csv',[X Y])

%% 2-suanhua
clear;clc;
fileFolder=fullfile('D:\Postdoc\Paper 8\FRC_data\LIBS\suanhua');
dirOutput=dir(fullfile(fileFolder,'*.csv'));
fileNames={dirOutput.name};
n = size(fileNames,2);X = [];
index = [1 10 2:9];
[~,I] = sort(index,'ascend');
for i = 1:n
    path = [fileFolder,'\',cell2mat(fileNames(i))];
    S = load(path);
    data = S(:,2:end)';
    m = size(data,1);
    x = zeros(m/16,12990);
    for j = 1:m/16
        r = (j-1)*16+1:j*16;
        A = data(r,:);
        B = sum(A,2);
        C = mean(B,1);
        D = pdist2(B,C,'euclidean');
        [~,TFrm] = rmoutliers(D,"mean");
        A(TFrm,:) = [];size(A,1)
        x(j,:) = mean(A,1);
    end
    x = x(I,:);
    X = [X;x];
    i
end
Y = repmat(1:1:7,10,1);Y = reshape(Y,10*7,1);
dlmwrite('D:\Postdoc\Paper 8\FRC_data\LIBS\raw-suanhua.csv',[X Y])

%% 3-shuihua
clear;clc;
fileFolder=fullfile('D:\Postdoc\Paper 8\FRC_data\LIBS\shuihua');
dirOutput=dir(fullfile(fileFolder,'*.csv'));
fileNames={dirOutput.name};
n = size(fileNames,2);X = [];
index = [1 10 2:9];
[~,I] = sort(index,'ascend');
for i = 1:n
    path = [fileFolder,'\',cell2mat(fileNames(i))];
    S = load(path);
    data = S(:,2:end)';
    m = size(data,1);
    x = zeros(m/16,12990);
    for j = 1:m/16
        r = (j-1)*16+1:j*16;
        A = data(r,:);
        B = sum(A,2);
        C = mean(B,1);
        D = pdist2(B,C,'euclidean');
        [~,TFrm] = rmoutliers(D,"mean");
        A(TFrm,:) = [];size(A,1)
        x(j,:) = mean(A,1);
    end
    x = x(I,:);
    X = [X;x];
    i
end
Y = repmat(1:1:7,10,1);Y = reshape(Y,10*7,1);
dlmwrite('D:\Postdoc\Paper 8\FRC_data\LIBS\raw-shuihua.csv',[X Y])

%% 4-dongrong
clear;clc;
fileFolder=fullfile('D:\Postdoc\Paper 8\FRC_data\LIBS\dongrong');
dirOutput=dir(fullfile(fileFolder,'*.csv'));
fileNames={dirOutput.name};
n = size(fileNames,2);X = [];
index = [1 10 2:9];
[~,I] = sort(index,'ascend');
for i = 1:n
    path = [fileFolder,'\',cell2mat(fileNames(i))];
    S = load(path);
    data = S(:,2:end)';
    m = size(data,1);
    x = zeros(m/16,12990);
    for j = 1:m/16
        r = (j-1)*16+1:j*16;
        A = data(r,:);
        B = sum(A,2);
        C = mean(B,1);
        D = pdist2(B,C,'euclidean');
        [~,TFrm] = rmoutliers(D,"mean");
        A(TFrm,:) = [];size(A,1)
        x(j,:) = mean(A,1);
    end
    x = x(I,:);
    X = [X;x];
    i
end
Y = repmat(1:1:7,10,1);Y = reshape(Y,10*7,1);
dlmwrite('D:\Postdoc\Paper 8\FRC_data\LIBS\raw-dongrong.csv',[X Y])

%% 5-200 C
clear;clc;
fileFolder=fullfile('D:\Postdoc\Paper 8\FRC_data\LIBS\200');
dirOutput=dir(fullfile(fileFolder,'*.csv'));
fileNames={dirOutput.name};
n = size(fileNames,2);X = [];
for i = 1:n
    path = [fileFolder,'\',cell2mat(fileNames(i))];
    S = load(path);
    data = S(:,2:end)';
    m = size(data,1);
    x = zeros(m/16,12990);
    for j = 1:m/16
        r = (j-1)*16+1:j*16;
        A = data(r,:);
        B = sum(A,2);
        C = mean(B,1);
        D = pdist2(B,C,'euclidean');
        [~,TFrm] = rmoutliers(D,"mean");
        A(TFrm,:) = [];size(A,1)
        x(j,:) = mean(A,1);
    end
    X = [X;x];
    i
end
Y = repmat(1:1:7,5,1);Y = reshape(Y,5*7,1);
dlmwrite('D:\Postdoc\Paper 8\FRC_data\LIBS\raw-200.csv',[X Y])