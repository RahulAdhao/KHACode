clc
clear
close all
warning off;

% read input training data
[~,~, alldata] = xlsread('traindatakdd.xlsx');

% normalization
% [matrix_normalized,t] = preprocessor(alldata);
load('matrix_normalized.mat')
load('t.mat')

%% PSO ALGORITHM
% Apply PSO algorithm
best_pso = PSO(matrix_normalized);

inx = find(best_pso==1);
opt_matrixtrain_pso = matrix_normalized(:,inx);
opt_matrixtrain_pso(opt_matrixtrain_pso==0) = 0.01;

% SVM training
svmstrcut = fitcsvm(opt_matrixtrain_pso,t,'KernelFunction','RBF');

% read test data
[~,~,alldata] = xlsread('testdatakdd.xlsx');

% enter the size of the test data
len = input('Enter the size of test data i.e), 1000,2000,3000,4000 and 5000\n');

% Normalization
[matrix_normalizedt,tar] = preprocessor(alldata(1:len,:));

inx = find(best_pso==1);
opt_mat = matrix_normalizedt(:,inx);

% SVM testing
final = predict(svmstrcut,opt_mat);
load final

% performance analysis
result_pso = measure(tar,final(1:len,1))
%% GA ALGORITHM
% Apply GA algorithm
best_ga = GA(matrix_normalized);

inx = find(best_ga==1);
opt_matrixtrain_ga = matrix_normalized(:,inx);
opt_matrixtrain_ga(opt_matrixtrain_ga==0) = 0.01;

% SVM training
svmstrcut = fitcsvm(opt_matrixtrain_ga,t,'KernelFunction','RBF');

inx1 = find(best_ga==1);
opt_matga = matrix_normalizedt(:,inx1);

% SVM testing
final = predict(svmstrcut,opt_matga);
load final
% performance analysis
result_ga = measure(tar,final(1:len,2))