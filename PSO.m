function [out,wei] = PSO(Inp)

% initialization
c1 = 0.1;
c2 = 0.12;
w = 0.2;

n = 20; % number of generations
dim = size(Inp,2);

R1 = rand(n,dim);
R2 = rand(n,dim);
wei = rand(1,dim); % weight value

% Initialize the positions of search agents
Positions = solution_gen(n,dim);

% Initializing swarm and velocities and position
current_position = Positions(1:n,:);
velocity = .3*randn(n,dim);
local_best_position  = current_position ;

% Evaluate initial population
for i = 1:n
    current_fitness(i) = fitness(Positions(i,:),Inp);
end

local_best_fitness = current_fitness;
[global_best_fitness,g] = min(local_best_fitness);

for i = 1 : n
    global_best_position(i,:) = local_best_position(g,:);
end

% velocity update
velocity = w *velocity + c1*(R1.*(local_best_position - current_position)) + c2*(R2.*(global_best_position - current_position));

% swarm update
current_position = current_position + round(velocity);

% Main Loop
iter = 0 ;
while  ( iter < 10 )
    iter = iter + 1;
    for i = 1:n
        current_fitness(i) = fitness(Positions(i,:),Inp);
    end
    
    for i = 1 : n
        if current_fitness(i) < local_best_fitness(i)
            local_best_fitness(i)  = current_fitness(i);
            local_best_position(i,:) = current_position(i,:);
        end
    end
    [current_global_best_fitness,g] = max(local_best_fitness);
    
    if current_global_best_fitness < global_best_fitness
        global_best_fitness = current_global_best_fitness;
        for i = 1 : n
            global_best_position(i,:) = local_best_position(g,:);
        end
    end
    velocity = w * velocity + c1 * (R1.*(local_best_position-current_position)) + c2*(R2.*(global_best_position-current_position));
    current_position = current_position + round(velocity);
    Cc(iter) = global_best_fitness;
end
out = [global_best_position(1,:)];