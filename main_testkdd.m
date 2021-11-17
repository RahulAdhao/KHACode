clc
clear all
close all
warning off;

% read test data
[~,~,alldata] = xlsread('traindatakddFULL.xlsx');

% enter the size of the test data
%len = input('Enter the size of test data i.e), 1000,2000,3000,4000 and 5000\n');
len=22543;
% Normalization
[matrix_normalized,tar] = preprocessor(alldata(1:len,:));

%% PROPOSED
% load best of AKH obtained in training
load bestkdd
inx = find(best==1);
opt_mat = matrix_normalized(:,inx);

% load training out
load outkdd
normal = out.Normal;
intrusion = out.Intrusion;

% calculate min and max value for normal and intrusion
min_n = min(normal); max_n = max(normal);
min_i = min(intrusion); max_i = max(intrusion);

% SV based classification
final = sv_calc(opt_mat,tar,min_n,max_n);

% performance analysis
result = measure(tar,final)

% %% SVM 
% % load training data and tar
% load opt_matrixtrainkdd
% load t
% 
% % SVM training
% svmstrcut = fitcsvm(opt_matrixtrain,t,'KernelFunction','RBF');
% 
% % SVM testing
% final = predict(svmstrcut,opt_mat);
% load finalk
% 
% % performance analysis
% result_svm = measure(tar,final(1:len,1))
% %% NAIVE BAYES(NB)
% % NB training
% Mdl = fitcnb(opt_matrixtrain,t);
% 
% % NB testing
% final = predict(Mdl,opt_mat);
% load finalk
% % performance analysis
% result_nb = measure(tar,final(1:len,2))
% 
% %% RANDOM FOREST(RF)
% % random forest training
% BaggedEnsemble = random_forests(opt_matrixtrain,t,2,'classification');
% 
% % random forest testing
% predct = predict(BaggedEnsemble,opt_mat);
% a = cell2mat(predct);
% final = double(a)-48;
% load finalk
% % performance analysis
% result_rf = measure(tar,final(1:len,3))