function result = measure(actual,predict)
% intialize this parameter as 0
tp = 0;
tn = 0;
fp = 0;
fn = 0;

for i = 1 : size(actual,1)
    if actual(i) == 1 && predict(i) == 1 % correctly identified
        tp = tp + 1;
    elseif actual(i) == 1 && predict(i) == 2 % incorrectly identified
        fp = fp + 1;
    elseif actual(i) == 2 && predict(i) == 2 % correctly rejected
        tn = tn + 1;
    elseif actual(i) == 2 && predict(i) == 1 % incorrectly rejected
        fn = fn + 1;
    end
end

acc = (tp + tn) / (tp + fp + tn + fn); % accuracy
sen = tp / (tp + fn); % sensitivity
spec = tn / (tn + fp); % specificity
precision = tp / (tp+fp); % precision
recall = tp / (tp+fn); % recall
fmeasure = 2*precision*recall / (precision + recall); % fmeasure
FPR = fp / (tn + fp); % false positive rate
FNR = fn / (tp + fn); % false negative rate
py = ((tp+fp)/(tp+fp+fn+tn)) * ((tp+tn)/(tp+fp+fn+tn));
po = (tp+tn)/(tp+fp+fn+tn);
pn = ((tn+fn)/(tp+fp+fn+tn)) * ((fp+fn)/(tp+fp+fn+tn));
pe = py + pn;
kappa = abs(po-pe)/(1-pe);
RS = ranksum(actual,predict);
result.accuracy = acc;
result.sensitivity = sen;
result.specificity = spec;
result.precision = precision;
result.recall = recall;
result.fmeasure = fmeasure;
result.FPR = FPR;
result.FNR = FNR;
result.kappa = kappa;
result.RS = RS;