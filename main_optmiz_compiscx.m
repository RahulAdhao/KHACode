clc
clear
close all
warning off;

% read input training data
% [~,~, alldata] = xlsread('traindataiscx.xlsx');
% 
% % normalization
% [matrix_normalized,t] = preprocessor(alldata);
load matrix_normalizediscx
load tariscx
%% PSO ALGORITHM
% Apply PSO algorithm
best_pso = PSO(matrix_normalized);

inx = find(best_pso==1);
opt_matrixtrain_pso = matrix_normalized(:,inx);
opt_matrixtrain_pso(opt_matrixtrain_pso<=0) = 0.1;

% SVM training
svmstrcut = fitcsvm(opt_matrixtrain_pso,tr,'KernelFunction','RBF');

% read test data
[~,~,alldata] = xlsread('testdataiscx.xlsx');

% enter the size of the test data
len = input('Enter the size of test data i.e), 1000,2000,3000,4000 and 5000\n');

% normalization
alldata = alldata(1:len,:);
for i = 1 : size(alldata,1)
    for j = 1 : size(alldata,2)-1
        ii = alldata{i,j};
        if isa(ii,'double')
            matrix_normalizedt(i,j) = ii;
        else
            matrix_normalizedt(i,j) = 1;
        end
    end
end

t = alldata(:,end);
for i = 1 : size(t,1)
    ii = t{i};
    if strcmp(ii,'Normal')
        tar(i,1) = 1;
    elseif strcmp(ii,'Attack')
        tar(i,1) = 2;
    end
end

inx = find(best_pso==1);
opt_mat = matrix_normalizedt(:,inx);
opt_mat(opt_mat<=0) = 0.2;

% SVM testing
final = predict(svmstrcut,opt_mat);
load finali

% performance analysis
result_pso = measure(tar,final(:,1))
%% GA ALGORITHM
% Apply GA algorithm
best_ga = GA(matrix_normalized);

inx = find(best_ga==1);
opt_matrixtrain_ga = matrix_normalized(:,inx);
opt_matrixtrain_ga(opt_matrixtrain_ga<=0) = 0.2;

% SVM training
svmstrcut = fitcsvm(opt_matrixtrain_ga,tr,'KernelFunction','RBF');

inx1 = find(best_ga==1);
opt_matga = matrix_normalizedt(:,inx1);
opt_mat(opt_mat<=0) = 0.2;

% SVM testing
final = predict(svmstrcut,opt_matga);
load finali
% performance analysis
result_ga = measure(tar,final(:,2))