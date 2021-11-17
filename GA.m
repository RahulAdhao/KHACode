function [Best_Weight,Acc] = GA(Inp)

n = 20;
dim = size(Inp,2);

iter = 1;

% Initialize the positions of search agents
Positions = solution_gen(n,dim);

while iter <= 10
    
    %% Fitness
    for i = 1 : size(Positions,1)
        fitval(i) = fitness(Positions(i,:),Inp);
    end
    
    [val ind] = sort(fitval);
    for t1 = 1 : floor(size(Positions,1)/2)
        Newchrom(t1,:) = Positions(ind(t1),:);
    end
    if iter == 1
        best = fitval(ind(1));
        bestinx = Positions(ind(1),:);
    else
        if  fitval(ind(1)) < best
            best = fitval(ind(1));
            bestinx = Positions(ind(1),:);
        else
            best = best;
        end
    end
    
    Acc(iter,1) = best;
    
    %% Crossover and Mutation
    
    P1 = floor(size(Newchrom,2)*0.1);
    CC = Crossover(Newchrom,P1);
    CC1 = Mutation(CC,P1);
    Inp = [];
    Inp = [ CC1 ;CC];
    iter = iter + 1;
end

Best_Weight = bestinx;