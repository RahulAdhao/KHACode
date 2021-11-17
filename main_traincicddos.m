clc
clear all
close all
warning off;

% read input data
[~,~, alldata] = xlsread('traindatacicddos.xlsx');

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
    if strcmp(ii,'BENIGN')
        tr(i,1) = 1;
    elseif strcmp(ii,'Portmap')
        tr(i,1) = 2;
    end
end

% Adaptive krill herd algorithm
[best] = AKH(matrix_normalized);
load bestcicddos

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

Benign = [];
portmap = [];
% support value based graph
for len = 1 : length(SV)
    if SV(len) < m 
        nor = SV(len);
        Benign = [Benign; nor]; % BENIGN 
    elseif SV(len) > m
        intr = SV(len);
        portmap = [portmap; intr]; % Portmap 
    end
end

% training output
out.Benign = Benign;
out.Portmap = portmap;