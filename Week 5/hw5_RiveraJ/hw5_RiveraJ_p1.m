%The split and average problem
%Jared Rivera
%804603106
clear all; close all; clc;

%Initialize the arrays and parameters
x=[1, 2, 4, 7];
y=[1, 5, 2, 5];
w=[-1,2,1];
N=2*length(x);
xs=zeros(1,N);
xa=zeros(1,N);
ys=zeros(1,N);
ya=zeros(1,N);
M=length(xs);
node_displacement=100;

plot(x,y,'.');

%Perform the split and average
while max(node_displacement)>10^-3
xs=splitPts(x);
ys=splitPts(y);

xa=averagePts(xs,w);
ya=averagePts(ys,w);

deltx=xa-xs;
delty=ya-ys;

node_displacement=sqrt(deltx.^2+delty.^2);

x=xa;
y=ya;
end

figure();
plot(x,y, '.');

