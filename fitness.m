function [o] = fitness(p,x)
ff = p>0;
x1 = x(:,ff);
dim = size(x,2);
o = -20 * exp(-.2*sqrt(sum(x.^2)/dim)) - exp(sum(cos(2*pi.*x)) / dim) + 20 + exp(1);
o = sum(1./o);
end