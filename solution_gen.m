function xn = solution_gen(n,var)

for z1 = 1 : n
    r = round(rand(1,var));
    xn(z1,:) = r;
end