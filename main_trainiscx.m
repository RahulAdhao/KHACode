clc
clear all
close all
warning off;

% read input data
[~,~, alldata] = xlsread('traindataiscx.xlsx');

% normalization
for i = 1 : size(alldata,1)
    for j = 1 : size(alldata,2)-1
        ii = alldata{i,j};
        if isnan(ii)
            matrix_normalized(i,j) = 1;
        elseif isa(ii,'char')
            matrix_normalized(i,j) = mean(double(ii));
        elseif isa(ii,'double')
            matrix_normalized(i,j) = ii;
        end
    end
end

t = alldata(:,end);
for i = 1 : size(t,1)
    ii = t{i};
    if strcmp(ii,'Normal')
        tr(i,1) = 1;
    elseif strcmp(ii,'Attack')
        tr(i,1) = 2;
    end
end

% Adaptive krill herd algorithm
[best] = AKH(matrix_normalized);
load bestiscx

% Support value calculation
inx = find(best==1);
opt_matrixtrain = matrix_normalized(:,inx);
opt_matrixtrain(opt_matrixtrain<=0) = 0.1;
for i = 1:size(opt_matrixtrain,1)
    otval = opt_matrixtrain(i,:);
    SV(i,1) = sum(otval) / prod(otval);
end

% calculate mean value for SV
m = median(SV);

normal = [];
intrusion = [];
% support value based graph
for len = 1 : length(SV)
    if SV(len) < m 
        nor = SV(len);
        normal = [normal; nor]; % normal 
    elseif SV(len) > m
        intr = SV(len);
        intrusion = [intrusion; intr]; % Attack 
    end
end

% training output
out.Normal = normal;
out.Intrusion = intrusion;