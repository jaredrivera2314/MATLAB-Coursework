function  [f]  = fx(x)
%Evaluates the function from the problem statement at x

f=exp((-x.^2)/5).*cos(5*x);

end

