clc
clear all
close all
warning off;

% read input data
[~,~, alldata] = xlsread('testdatakddFULL.xlsx');
%testdatakddFULL
% normalization
[matrix_normalized,t] = preprocessor(alldata);

% Adaptive krill herd algorithm
[best] = AKH(matrix_normalized);
load bestkdd

% Support value calculation
inx = find(best==1);
opt_matrixtrain = matrix_normalized(:,inx);
opt_matrixtrain(opt_matrixtrain==0) = 0.01;
for i = 1:size(opt_matrixtrain,1)
    otval = opt_matrixtrain(i,:);
    SV(i,1) = sum(otval) / prod(otval);
end

% calculate mean value for SV
m = mean(SV);

normal = [];
intrusion = [];
% support value based graph
for len = 1 : length(SV)
    if SV(len) < m 
        nor = SV(len);
        normal = [normal; nor]; % normal 
    elseif SV(len) > m
        intr = SV(len);
        intrusion = [intrusion; intr]; % intrusion 
    end
end

% training output
out.Normal = normal;
out.Intrusion = intrusion;