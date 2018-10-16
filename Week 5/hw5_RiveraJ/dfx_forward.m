function [dfx] = dfx_forward( x,h )
%forward difference method for numerical differentiation

dfx=(fx(x+h)-(fx(x)))/h;

end

