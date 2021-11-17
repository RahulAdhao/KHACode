function final = sv_calc(opt_mat,t,mi,mx)

opt_mat(opt_mat<=0) = 0.01;
for i = 1:size(opt_mat,1)
    otval = opt_mat(i,:);
    sv = sum(otval) / prod(otval);
    SV = abs1(sv,t(i),mx);
    a(i,1) = SV;
    
    % if the SV value is within the range of normal then set final is equal to 1
    if SV >= mi && SV < mx
        final(i,1) = 1;
    
    % if the SV value is within the range of intrusion then set final is equal to 2
    else
        final(i,1) = 2; 
    end 
end