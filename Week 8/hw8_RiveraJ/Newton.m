function [xc, fEvals] = Newton(f, x0, delta, fEvalMax)
% f is a HANDLE to a continuous function, f(x), of a single variable.
% x0 is an initial guess to a root of f.
% delta is a positive real number.
% fEvalsMax is a positive integer >= 2 that indicates the maximum
% number of f-evaluations allowed.
%
% Newton's method is repeatedly applied until the current iterate, xc,
% has the property that |f(xc)| <= delta. If that is not the case
% after fEvalsMax function evaluations, then xc is the current iterate.
%
% This routine computes the derivative of f at each iterate xc by
% using a central difference approximation with small perturbation size.
%
% fEvals is the number of f-evaluations required to obtain xc.

count=0;

while (abs(equation(x0))>delta) && (count<fEvalMax)
    
    
    xc=x0-(equation(x0)/df_central(@equation,x0));
    
    count=count+1;
    x0=xc;
    
end

fEvals=count;

end

