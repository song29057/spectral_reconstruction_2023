
%% 1-yuanyang
clear; clc; close all;
fileFolder=fullfile('D:\Postdoc\Paper 8\FRC_data\HSI\yuanyang\');
dirOutput=dir(fullfile(fileFolder));fileNames={dirOutput.name};
fileNames=fileNames(3:end);fileNames=sort_nat(fileNames);
n = size(fileNames,2);X = [];
for k = 1:n
    path = [fileFolder,cell2mat(fileNames(k))];
    dirOutput_sub=dir(fullfile(path,'*.txt'));
    fileNames_sub={dirOutput_sub.name};
    fileNames_sub=sort_nat(fileNames_sub);
    n1 = size(fileNames_sub,2);
    for i = 1:n1
        path_sub = [fileFolder,cell2mat(fileNames(k)),'\',cell2mat(fileNames_sub(i))];
        fileContent = str2num(fileread(path_sub));
        x = fileContent(:,2)';
        fclose('all');
        X = [X;x];
    end
end
Y = [ones(n1,1);2*ones(n1,1);3*ones(n1,1);4*ones(n1,1);5*ones(n1,1);6*ones(n1,1);7*ones(n1,1)];
dlmwrite('D:\Postdoc\Paper 8\FRC_data\HSI\raw-yuanyang.csv',[X Y])

%% 2-suanhua
clear; clc; close all;
fileFolder=fullfile('D:\Postdoc\Paper 8\FRC_data\HSI\suanhua\');
dirOutput=dir(fullfile(fileFolder));fileNames={dirOutput.name};
fileNames=fileNames(3:end);fileNames=sort_nat(fileNames);
n = size(fileNames,2);X = [];
for k = 1:n
    path = [fileFolder,cell2mat(fileNames(k))];
    dirOutput_sub=dir(fullfile(path,'*.txt'));
    fileNames_sub={dirOutput_sub.name};
    fileNames_sub=sort_nat(fileNames_sub);
    n1 = size(fileNames_sub,2);
    for i = 1:n1
        path_sub = [fileFolder,cell2mat(fileNames(k)),'\',cell2mat(fileNames_sub(i))];
        fileContent = str2num(fileread(path_sub));
        x = fileContent(:,2)';
        fclose('all');
        X = [X;x];
    end
end
Y = [ones(n1,1);2*ones(n1,1);3*ones(n1,1);4*ones(n1,1);5*ones(n1,1);6*ones(n1,1);7*ones(n1,1)];
dlmwrite('D:\Postdoc\Paper 8\FRC_data\HSI\raw-suanhua.csv',[X Y])

%% 3-shuihua
clear; clc; close all;
fileFolder=fullfile('D:\Postdoc\Paper 8\FRC_data\HSI\shuihua\');
dirOutput=dir(fullfile(fileFolder));fileNames={dirOutput.name};
fileNames=fileNames(3:end);fileNames=sort_nat(fileNames);
n = size(fileNames,2);X = [];
for k = 1:n
    path = [fileFolder,cell2mat(fileNames(k))];
    dirOutput_sub=dir(fullfile(path,'*.txt'));
    fileNames_sub={dirOutput_sub.name};
    fileNames_sub=sort_nat(fileNames_sub);
    n1 = size(fileNames_sub,2);
    for i = 1:n1
        path_sub = [fileFolder,cell2mat(fileNames(k)),'\',cell2mat(fileNames_sub(i))];
        fileContent = str2num(fileread(path_sub));
        x = fileContent(:,2)';
        fclose('all');
        X = [X;x];
    end
end
Y = [ones(n1,1);2*ones(n1,1);3*ones(n1,1);4*ones(n1,1);5*ones(n1,1);6*ones(n1,1);7*ones(n1,1)];
dlmwrite('D:\Postdoc\Paper 8\FRC_data\HSI\raw-shuihua.csv',[X Y])

%% 4-dongrong
clear; clc; close all;
fileFolder=fullfile('D:\Postdoc\Paper 8\FRC_data\HSI\dongrong\');
dirOutput=dir(fullfile(fileFolder));fileNames={dirOutput.name};
fileNames=fileNames(3:end);fileNames=sort_nat(fileNames);
n = size(fileNames,2);X = [];
for k = 1:n
    path = [fileFolder,cell2mat(fileNames(k))];
    dirOutput_sub=dir(fullfile(path,'*.txt'));
    fileNames_sub={dirOutput_sub.name};
    fileNames_sub=sort_nat(fileNames_sub);
    n1 = size(fileNames_sub,2);
    for i = 1:n1
        path_sub = [fileFolder,cell2mat(fileNames(k)),'\',cell2mat(fileNames_sub(i))];
        fileContent = str2num(fileread(path_sub));
        x = fileContent(:,2)';
        fclose('all');
        X = [X;x];
    end
end
Y = [ones(n1,1);2*ones(n1,1);3*ones(n1,1);4*ones(n1,1);5*ones(n1,1);6*ones(n1,1);7*ones(n1,1)];
dlmwrite('D:\Postdoc\Paper 8\FRC_data\HSI\raw-dongrong.csv',[X Y])

%% 5-jiare
fileFolder=fullfile('D:\Postdoc\Paper 8\FRC_data\HSI\jiare\200\');
dirOutput=dir(fullfile(fileFolder));fileNames={dirOutput.name};
fileNames=fileNames(3:end);fileNames=sort_nat(fileNames);
n = size(fileNames,2);X = [];
for k = 1:n
    path = [fileFolder,cell2mat(fileNames(k))];
    dirOutput_sub=dir(fullfile(path,'*.txt'));
    fileNames_sub={dirOutput_sub.name};
    fileNames_sub=sort_nat(fileNames_sub);
    n1 = size(fileNames_sub,2);
    for i = 1:n1
        path_sub = [fileFolder,cell2mat(fileNames(k)),'\',cell2mat(fileNames_sub(i))];
        fileContent = str2num(fileread(path_sub));
        x = fileContent(:,2)';
        fclose('all');
        X = [X;x];
    end
end
Y = [ones(n1,1);2*ones(n1,1);3*ones(n1,1);4*ones(n1,1);5*ones(n1,1);6*ones(n1,1);7*ones(n1,1)];
dlmwrite('D:\Postdoc\Paper 8\FRC_data\HSI\raw-jiare.csv',[X Y])

dlmwrite('D:\Postdoc\Paper 8\FRC_data\HSI\wavelength.csv',fileContent(:,1))
