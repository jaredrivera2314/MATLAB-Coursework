function [df] = df_central( equation, x0 )
%Central difference method for numercial differentiation

h=10^-6;
df=(equation(x0+h)-(equation(x0-h)))/(2*h);

end

