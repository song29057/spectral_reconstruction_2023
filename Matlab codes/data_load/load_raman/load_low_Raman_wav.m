clear; clc; close all;
folderPath = 'D:\Postdoc\Paper 8\FRC_data\Raman_low\yuanyang';
f = [];
for i = 1
fileList = dir(fullfile(folderPath, num2str(i),'*.txt'));
for j = 1:numel(fileList)
    filePath = fullfile(folderPath,num2str(i), fileList(j).name);
    fileContent = str2num(fileread(filePath));
    fileContent = fileContent(:,1);
end
end
dlmwrite('D:\Postdoc\Paper 8\FRC_data\Raman_low\wavelength.csv',fileContent)