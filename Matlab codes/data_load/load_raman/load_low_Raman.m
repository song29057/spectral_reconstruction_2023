
%% 1-yuanyang
clear; clc; close all;
folderPath = 'D:\Postdoc\Paper 8\FRC_data\Raman_low\yuanyang';
X = [];
for i = 1:7
    fileList = dir(fullfile(folderPath, num2str(i),'*.txt'));
    n = size(fileList,1);
    for j = 1:numel(fileList)
        filePath = fullfile(folderPath,num2str(i), fileList(j).name);
        fileContent = str2num(fileread(filePath));
        fileContent = mean(fileContent(:,2:6),2);
        x(j,:) = fileContent';
    end
    X = [X;x];
    clear x;
end
Y = [ones(n,1);2*ones(n,1);3*ones(n,1);4*ones(n,1);5*ones(n,1);6*ones(n,1);7*ones(n,1)];
dlmwrite('D:\Postdoc\Paper 8\FRC_data\Raman_low\raw-yuanyang.csv',[X Y])

%% 2-suanhua
clear; clc; close all;
folderPath = 'D:\Postdoc\Paper 8\FRC_data\Raman_low\suanhua';
X = [];
for i = 1:7
    fileList = dir(fullfile(folderPath, num2str(i),'*.txt'));
    n = size(fileList,1);
    for j = 1:numel(fileList)
        filePath = fullfile(folderPath,num2str(i), fileList(j).name);
        fileContent = str2num(fileread(filePath));
        fileContent = mean(fileContent(:,2:6),2);
        x(j,:) = fileContent';
    end
    X = [X;x];
    clear x;
end
Y = [ones(n,1);2*ones(n,1);3*ones(n,1);4*ones(n,1);5*ones(n,1);6*ones(n,1);7*ones(n,1)];
dlmwrite('D:\Postdoc\Paper 8\FRC_data\Raman_low\raw-suanhua.csv',[X Y])

%% 3-shuihua
clear; clc; close all;
folderPath = 'D:\Postdoc\Paper 8\FRC_data\Raman_low\shuihua';
X = [];
for i = 1:7
    fileList = dir(fullfile(folderPath, num2str(i),'*.txt'));
    n = size(fileList,1);
    for j = 1:numel(fileList)
        filePath = fullfile(folderPath,num2str(i), fileList(j).name);
        fileContent = str2num(fileread(filePath));
        fileContent = mean(fileContent(:,2:6),2);
        x(j,:) = fileContent';
    end
    X = [X;x];
    clear x;
end
Y = [ones(n,1);2*ones(n,1);3*ones(n,1);4*ones(n,1);5*ones(n,1);6*ones(n,1);7*ones(n,1)];
dlmwrite('D:\Postdoc\Paper 8\FRC_data\Raman_low\raw-shuihua.csv',[X Y])

%% 4-dongrong
clear; clc; close all;
folderPath = 'D:\Postdoc\Paper 8\FRC_data\Raman_low\dongrong';
X = [];
for i = 1:7
    fileList = dir(fullfile(folderPath, num2str(i),'*.txt'));
    n = size(fileList,1);
    for j = 1:numel(fileList)
        filePath = fullfile(folderPath,num2str(i), fileList(j).name);
        fileContent = str2num(fileread(filePath));
        fileContent = mean(fileContent(:,2:6),2);
        x(j,:) = fileContent';
    end
    X = [X;x];
    clear x;
end
Y = [ones(n,1);2*ones(n,1);3*ones(n,1);4*ones(n,1);5*ones(n,1);6*ones(n,1);7*ones(n,1)];
dlmwrite('D:\Postdoc\Paper 8\FRC_data\Raman_low\raw-dongrong.csv',[X Y])

%% 5-jiare
clear; clc; close all;
folderPath = 'D:\Postdoc\Paper 8\FRC_data\Raman_low\jiare\200';
X = [];
for i = 1:7
    fileList = dir(fullfile(folderPath, num2str(i),'*.txt'));
    n = size(fileList,1);
    for j = 1:numel(fileList)
        filePath = fullfile(folderPath,num2str(i), fileList(j).name);
        fileContent = str2num(fileread(filePath));
        fileContent = mean(fileContent(:,2:6),2);
        x(j,:) = fileContent';
    end
    X = [X;x];
    clear x;
end
Y = [ones(n,1);2*ones(n,1);3*ones(n,1);4*ones(n,1);5*ones(n,1);6*ones(n,1);7*ones(n,1)];
dlmwrite('D:\Postdoc\Paper 8\FRC_data\Raman_low\raw-jiare.csv',[X Y])

