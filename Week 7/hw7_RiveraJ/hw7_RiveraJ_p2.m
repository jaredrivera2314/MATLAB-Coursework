%Jared Rivera
%804603106
%Euler-Bernoulli Beam Bending

clear all; clc;

b=0.03;
h=0.06;
I=(1/12)*b*h^3;
E=70*10^9;
P=500;
d=0.7;
L=1;

N=20;
x=linspace(0,L,N);
dx=x(2)-x(1);

A=zeros(N,N);
A(1,1)=1;
A(N,N)=1;

for k=1:N-2
  A(k+1,k)=1;
  A(k+1, k+1)=-2;
  A(k+1, k+2)=1;
end

b=zeros(N,1);

for j=2:N-1
    
    if x(j-1)<=d
        M=(-P*(L-d)*x(j-1))/L;
    else
        M=(-P*(L-x(j-1))*d)/L;
    end
    
    b(j)=((dx^2)*M)/(E*I);
    
end

y=A\b;

c=min(d,L-d);
ymax_theory=(P*c*(L^2-c^2)^1.5)/(9*sqrt(3)*E*I*L);
ymax_calc=max(y);
error=(abs(ymax_calc-ymax_theory)/ymax_theory);

plot(x,y, '-o');
xlabel('x-position (m)');
ylabel('Deflection (m)');

fprintf('The calculated and theoretical values differ by %.2f percent\n', error*100);


