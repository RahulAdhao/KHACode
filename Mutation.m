function CC = Mutation(CC,mr)
for t1  = 1 : size(CC,1)
    R = randi([1 size(CC,2)],[1 mr]);
    for t2 = 1 : length(R)
        CC(t1,R(t2)) = randi([0 1],1);
    end
end
