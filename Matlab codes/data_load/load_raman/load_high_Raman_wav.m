clear;clc
h = 4;
fileFolder=fullfile('D:\Postdoc\Paper 8\FRC_data\Raman_high\yuanyang\1');
dirOutput=dir(fullfile(fileFolder,'*.txt'));
fileNames={dirOutput.name};fileNames = fileNames(1:end);
fileNames=sort_nat(fileNames);
n1 = size(fileNames,2);
for i = 1:1
    path = [fileFolder,'\',cell2mat(fileNames(i))];
    a = fopen(path,'r');
    b = textscan(a,'%s ');
    for j = 814:2620
        c = b{1,1}{j,1};
        d = str2num(c);
        e = d(h);
        X1(i,j-813) = e;
    end
    fclose('all');
end

dlmwrite('D:\Postdoc\Paper 8\FRC_data\Raman_high\wavelength.csv',X1')