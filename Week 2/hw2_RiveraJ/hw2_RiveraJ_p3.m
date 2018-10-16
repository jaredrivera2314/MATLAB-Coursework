clear all; clc;

%Prompt user for coefficients
a=input('Input coefficient "a": ');
b=input('Input coefficient "b": ');
c=input('Input coefficient "c": ');
d=input('Input coefficient "d": ');
clc;

%Print formatted input values
fprintf('a = %10.6f\n',a);
fprintf('b = %10.6f\n',b);
fprintf('c = %10.6f\n',c);
fprintf('d = %10.6f\n\n',d);

%Assign r values from derivative
r1=(-b+sqrt(b^2-3*a*c))/(3*a);
r2=(-b-sqrt(b^2-3*a*c))/(3*a);

%Plug back into the cubic
qr1=a*r1^3+b*r1^2+c*r1+d;
qr2=a*r2^3+b*r2^2+c*r2+d;

%Check to see if monotone
discrim=4*(b^2-3*a*c);

%CLEAN THIS UP A LOT DUDE 

if discrim <0
    fprintf('Monotone\n');
end

if discrim >=0
fprintf('r1 = %10.6f\n', r1);
fprintf('q(r1) = %10.6f\n', qr1);
fprintf('r2 = %10.6f\n', r2);
fprintf('q(r2) = %10.6f\n', qr2);
end

if qr1*qr2 < 0 && discrim >=0
    fprintf('Function q is simple.\n');
    
elseif discrim >=0
    fprintf('Function q is NOT simple.\n');
  
end



