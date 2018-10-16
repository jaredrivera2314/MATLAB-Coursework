function [dfx] = dfx_backward(x, h)
%backward difference method for numerical differentiation

dfx=(fx(x)-(fx(x-h)))/h;

end

