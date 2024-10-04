clear;clc
wav = load('D:\Postdoc\Paper 8\FRC_data\LIBS\wavelength.csv');
data = load('D:\Postdoc\Paper 8\FRC_data\LIBS\raw-data.csv');
X = data(:,1:end-1);Y = data(:,end);
index = [1 1948 3788 5510 7384 9185 11046;...
        1947 3787 5509 7383 9184 11045 12990];  

%% Plan-A
% num = 500;minH = 0.05;minDiff = 0.95;pixel = 15;
% x = X;
% % x = mapminmax(x,0,1);
% % x = normaliz(x);
% % x = snv(x);
% spectra = [wav x'];
% [nmMaxLoc,pixMaxLoc,nmPeakRange,pixPeakRange] = peakFind([wav x'],num,minH,minDiff,pixel,0,0);
% [peakIntensity] = peakCalculate(wav,spectra(:,2:end),pixPeakRange);
% Xnew = peakIntensity';
% Wavnew = nmMaxLoc;
% [Wavnew,I] = sort(Wavnew,'ascend');
% Xnew = Xnew(:,I);
% Xnew = snv(Xnew);
% disp(num2str(nmMaxLoc(min(peakIntensity,[],2)<0)));

%% Plan-B
para = [100, 0.05, 0.95, 3;...
        100, 0.05, 0.95, 3;...
        100, 0.05, 0.95, 3;...
        100, 0.05, 0.95, 3;...
        100, 0.05, 0.95, 3;...
        100, 0.05, 0.95, 3;...
        100, 0.05, 0.95, 3];
Wavnew = [];Xnew = [];
for i = 1:7
    num = para(i,1);
    minH = para(i,2);
    minDiff = para(i,3);
    pixel = para(i,4);
    x = X(:,index(1,i):index(2,i));  
    w = wav(index(1,i):index(2,i));
    spectra = [w x'];
    [nmMaxLoc,pixMaxLoc,nmPeakRange,pixPeakRange] = peakFind([w x'],num,minH,minDiff,pixel,0,0);
    [peakIntensity] = peakCalculate(w,spectra(:,2:end), pixPeakRange); 
    if min(min(peakIntensity))<0
        disp(num2str(nmMaxLoc(min(peakIntensity,[],2)<0)));
    end
    if i==1
    else
        pixMaxLoc = pixMaxLoc + index(2,i-1);
    end
    wavnew = [nmMaxLoc,pixMaxLoc,nmPeakRange];
    xnew = peakIntensity';
    [~,I] = sort(wavnew(:,2),'ascend');
    wavnew = wavnew(I,:);
    xnew = xnew(:,I);
    Wavnew = [Wavnew;wavnew];
    Xnew = [Xnew xnew];
end

Xnew = snv(Xnew);

dlmwrite('D:\Postdoc\Paper 8\FRC_data\LIBS\wav-preprocess.csv',Wavnew)
dlmwrite('D:\Postdoc\Paper 8\FRC_data\LIBS\data.csv',[Xnew Y])