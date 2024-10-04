
%% 1-yuanyang
clear;clc; close all;
fileFolder=fullfile('D:\Postdoc\Paper 8\FRC_data\Port_Raman\yuanyang\');
dirOutput=dir(fullfile(fileFolder));fileNames={dirOutput.name};
fileNames=fileNames(3:end);fileNames=sort_nat(fileNames);
n = size(fileNames,2);X = [];h = 8;
for k = 1:n
    path = [fileFolder,cell2mat(fileNames(k))];
    dirOutput_sub=dir(fullfile(path,'*.txt'));
    fileNames_sub={dirOutput_sub.name};
    fileNames_sub=sort_nat(fileNames_sub);
    n1 = size(fileNames_sub,2);
    for i = 1:n1
        path_sub = [fileFolder,cell2mat(fileNames(k)),'\',cell2mat(fileNames_sub(i))];
        a = fopen(path_sub,'r');
        b = textscan(a,'%s ');
        for j = 814:2620
            c = b{1,1}{j,1};
            d = str2num(c);
            e = d(h);
            x(i,j-813) = e;
        end
        fclose('all');
    end
    X = [X;x];
    clear x;
end
Y = [ones(n1,1);2*ones(n1,1);3*ones(n1,1);4*ones(n1,1);5*ones(n1,1);6*ones(n1,1);7*ones(n1,1)];
dlmwrite('D:\Postdoc\Paper 8\FRC_data\Port_Raman\raw-yuanyang.csv',[X Y])

%% 2-suanhua
clear;clc; close all;
fileFolder=fullfile('D:\Postdoc\Paper 8\FRC_data\Port_Raman\suanhua\');
dirOutput=dir(fullfile(fileFolder));fileNames={dirOutput.name};
fileNames=fileNames(3:end);fileNames=sort_nat(fileNames);
n = size(fileNames,2);X = [];h = 8;
for k = 1:n
    path = [fileFolder,cell2mat(fileNames(k))];
    dirOutput_sub=dir(fullfile(path,'*.txt'));
    fileNames_sub={dirOutput_sub.name};
    fileNames_sub=sort_nat(fileNames_sub);
    n1 = size(fileNames_sub,2);
    for i = 1:n1
        path_sub = [fileFolder,cell2mat(fileNames(k)),'\',cell2mat(fileNames_sub(i))];
        a = fopen(path_sub,'r');
        b = textscan(a,'%s ');
        for j = 814:2620
            c = b{1,1}{j,1};
            d = str2num(c);
            e = d(h);
            x(i,j-813) = e;
        end
        fclose('all');
    end
    X = [X;x];
end
Y = [ones(n1,1);2*ones(n1,1);3*ones(n1,1);4*ones(n1,1);5*ones(n1,1);6*ones(n1,1);7*ones(n1,1)];
dlmwrite('D:\Postdoc\Paper 8\FRC_data\Port_Raman\raw-suanhua.csv',[X Y])

%% 3-shuihua
clear;clc; close all;
fileFolder=fullfile('D:\Postdoc\Paper 8\FRC_data\Port_Raman\shuihua\');
dirOutput=dir(fullfile(fileFolder));fileNames={dirOutput.name};
fileNames=fileNames(3:end);fileNames=sort_nat(fileNames);
n = size(fileNames,2);X = [];h = 8;
for k = 1:n
    path = [fileFolder,cell2mat(fileNames(k))];
    dirOutput_sub=dir(fullfile(path,'*.txt'));
    fileNames_sub={dirOutput_sub.name};
    fileNames_sub=sort_nat(fileNames_sub);
    n1 = size(fileNames_sub,2);
    for i = 1:n1
        path_sub = [fileFolder,cell2mat(fileNames(k)),'\',cell2mat(fileNames_sub(i))];
        a = fopen(path_sub,'r');
        b = textscan(a,'%s ');
        for j = 814:2620
            c = b{1,1}{j,1};
            d = str2num(c);
            e = d(h);
            x(i,j-813) = e;
        end
        fclose('all');
    end
    X = [X;x];
end
Y = [ones(n1,1);2*ones(n1,1);3*ones(n1,1);4*ones(n1,1);5*ones(n1,1);6*ones(n1,1);7*ones(n1,1)];
dlmwrite('D:\Postdoc\Paper 8\FRC_data\Port_Raman\raw-shuihua.csv',[X Y])

%% 4-dongrong
clear;clc; close all;
fileFolder=fullfile('D:\Postdoc\Paper 8\FRC_data\Port_Raman\dongrong\');
dirOutput=dir(fullfile(fileFolder));fileNames={dirOutput.name};
fileNames=fileNames(3:end);fileNames=sort_nat(fileNames);
n = size(fileNames,2);X = [];h = 8;
for k = 1:n
    path = [fileFolder,cell2mat(fileNames(k))];
    dirOutput_sub=dir(fullfile(path,'*.txt'));
    fileNames_sub={dirOutput_sub.name};
    fileNames_sub=sort_nat(fileNames_sub);
    n1 = size(fileNames_sub,2);
    for i = 1:n1
        path_sub = [fileFolder,cell2mat(fileNames(k)),'\',cell2mat(fileNames_sub(i))];
        a = fopen(path_sub,'r');
        b = textscan(a,'%s ');
        for j = 814:2620
            c = b{1,1}{j,1};
            d = str2num(c);
            e = d(h);
            x(i,j-813) = e;
        end
        fclose('all');
    end
    X = [X;x];
end
Y = [ones(n1,1);2*ones(n1,1);3*ones(n1,1);4*ones(n1,1);5*ones(n1,1);6*ones(n1,1);7*ones(n1,1)];
dlmwrite('D:\Postdoc\Paper 8\FRC_data\Port_Raman\raw-dongrong.csv',[X Y])

%% 5-jiare
clear;clc; close all;
fileFolder=fullfile('D:\Postdoc\Paper 8\FRC_data\Port_Raman\jiare\200\');
dirOutput=dir(fullfile(fileFolder));fileNames={dirOutput.name};
fileNames=fileNames(3:end);fileNames=sort_nat(fileNames);
n = size(fileNames,2);X = [];h = 8;
for k = 1:n
    path = [fileFolder,cell2mat(fileNames(k))];
    dirOutput_sub=dir(fullfile(path,'*.txt'));
    fileNames_sub={dirOutput_sub.name};
    fileNames_sub=sort_nat(fileNames_sub);
    n1 = size(fileNames_sub,2);
    for i = 1:n1
        path_sub = [fileFolder,cell2mat(fileNames(k)),'\',cell2mat(fileNames_sub(i))];
        a = fopen(path_sub,'r');
        b = textscan(a,'%s ');
        for j = 814:2620
            c = b{1,1}{j,1};
            d = str2num(c);
            e = d(h);
            x(i,j-813) = e;
        end
        fclose('all');
    end
    X = [X;x];
end
Y = [ones(n1,1);2*ones(n1,1);3*ones(n1,1);4*ones(n1,1);5*ones(n1,1);6*ones(n1,1);7*ones(n1,1)];
dlmwrite('D:\Postdoc\Paper 8\FRC_data\Port_Raman\raw-jiare.csv',[X Y])