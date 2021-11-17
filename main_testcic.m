clc
clear all
close all
warning off;

% read test data
[~,~,alldata] = xlsread('testdatacicEqual92kDDoSFinal78feature.xlsx');

% enter the size of the test data
%len = input('Enter the size of test data i.e), 1000,2000,3000,4000 and 5000\n');
len=112875;
% normalization
alldata = alldata(1:len,:);
for i = 1 : size(alldata,1)
    for j = 1 : size(alldata,2)-1
        ii = alldata{i,j};
        if isa(ii,'double')
            matrix_normalized(i,j) = ii;
        else
            matrix_normalized(i,j) = 1;
        end
    end
end

t = alldata(:,end);
for i = 1 : size(t,1)
    ii = t{i};
    if strcmp(ii,'BENIGN')
        tar(i,1) = 1;
    elseif strcmp(ii,'ATTACK')
        tar(i,1) = 2;
    end
end

%% PROPOSED
% load best of AKH obtained in training
load bestcic
inx = find(best==1);
opt_mat = matrix_normalized(:,inx);

% load training out
load outcic
normal = out.Normal;
intrusion = out.Intrusion;

% calculate min and max value for BENIGN and DDoS
min_n = min(normal); max_n = max(normal);
min_i = min(intrusion); max_i = max(intrusion);

% SV based classification
final = sv_calc(opt_mat,tar,min_n,max_n);

% performance analysis
result = measure(tar,final)
% 
% % %%% SVM 
% % % load training data and tar
%  load opt_matrixtraincic
% % load tarcic
% % 
% % % SVM training
% opt_matrixtrain(opt_matrixtrain<1) = 0.2;
% opt_mat(opt_mat<1) = 0.2;
% % svmstrcut = fitcsvm(opt_matrixtrain,tr,'KernelFunction','RBF');
% % 
% % % SVM testing
% % final = predict(svmstrcut,opt_mat);
% % load finals
% % % performance analysis
% % result_svm = measure(tar,final(1:len,1))
% % %%%
% %% NAIVE BAYES(NB)
% % NB training
% opt_matrixtrain = opt_matrixtrain/2000;
% Mdl = fitcnb(opt_matrixtrain,tar);
% 
% % NB testing
% final = predict(Mdl,opt_mat);
% load finals
% % performance analysis
% result_nb = measure(tar,final(1:len,2))
% 
% %% RANDOM FOREST(RF)
% % random forest training
% BaggedEnsemble = random_forests(opt_matrixtrain,tr,2,'classification');
% 
% % random forest testing
% predct = predict(BaggedEnsemble,opt_mat);
% a = cell2mat(predct);
% final = double(a)-48;
% load finals
% % performance analysis
% result_rf = measure(tar,final(1:len,3))