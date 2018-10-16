function [dfx] = dfx_central( x, h )
%Central difference method for numercial differentiation

dfx=(fx(x+h)-(fx(x-h)))/(2*h);

end

