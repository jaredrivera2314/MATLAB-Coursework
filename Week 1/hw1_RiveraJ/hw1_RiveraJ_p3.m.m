%Problem 3 Cubic Roots 
clear;clc;
%prompt user for input of coefficient values
a=input('Enter coefficient a: ');
b=input('Enter coefficient b: ');
c=input('Enter coefficient c: ');
d=input('Enter coefficient d: ');
clc%clear screan for formatting

%assign values to p and q based on a through d
p=(3*a*c-b^2)/(3*a^2);
q=(2*b^3-9*a*b*c+27*a^2*d)/(27*a^3);

%breaks up the root equation into components
rf=2*sqrt(-p/3);                        %Front of equation
rmm=(3*q)/(2*p)*sqrt(-3/p);             %Middle of middle of equation
rm0=cos((1/3)*acos(rmm));               %Middle of equation for k=0
rm1=cos((1/3)*acos(rmm)-1*2*pi/3);      %Middle of equation for k=1
rm2=cos((1/3)*acos(rmm)-2*2*pi/3);      %Middle of equation for k=2
rb=b/(3*a);                             %Back of equation

%solves for roots
r0=rf*rm0-rb;
r1=rf*rm1-rb;
r2=rf*rm2-rb;

%prints roots in desired format
fprintf(['a=%10.2f\nb=%10.2f\nc=%10.2f\nd=%10.2f\n',...
    '\nr0=%10.5f\nr1=%10.5f\nr2=%10.5f\n'],a,b,c,d,r0,r1,r2);


