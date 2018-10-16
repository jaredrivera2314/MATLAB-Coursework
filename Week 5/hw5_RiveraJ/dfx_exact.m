function [df] = dfx_exact( x )
%Exact derivative of f

df=(-2*x/5).*exp((-x.^2)/5).*cos(5*x)-5*exp((-x.^2)/5).*sin(5*x);

end

