%Newton's Method
%Jared Rivera
%804603106
clear all; clc;

NumSteps=(1.71-1.43)/0.01;
x=linspace(1.43, 1.71, NumSteps);
fEvalMax=50;
delta=10^-6;

for k=1:NumSteps
    
    x0=x(k);
    [xc, fEvals] = Newton(@equation, x0, delta, fEvalMax);
    
    fprintf('x0=%f , evals=%i, xc=%f\n',x0,fEvals,xc')
    
end