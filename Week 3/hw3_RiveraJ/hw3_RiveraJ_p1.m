%The Three Species Problem
%Jared Rivera 804603106
clear all; clc;
tic
%Assign initial populations
xold=2;    
yold=2.5;  
zold=3;    

%Set step size
tfinal=10;
deltat=0.01;
tstep=ceil(tfinal/deltat);

fprintf('Time\tX\t\tY\t\tZ\n');
fprintf('0.0\t\t%.2f\t%.2f\t%.2f\n',xold,yold,zold);

%Perform loop to track populations over time
for k=1:tstep
    xnew=xold+deltat*(1.2*xold*(1-(xold/4))-1.3*xold*yold-0.7*xold*zold);
    ynew=yold+deltat*(yold*(1-(yold/5))-0.8*xold*yold-1.2*yold*zold);
    znew=zold+deltat*(0.8*zold*(1-(zold/6))-1.1*xold*zold-0.9*yold*zold);
    
    xold=xnew;
    yold=ynew;
    zold=znew;
    
    if mod(k,50)==0&&k~=1000
        fprintf('%.1f\t\t%.2f\t%.2f\t%.2f\n',(k/100),xold,yold,zold);
    elseif k==1000
        fprintf('%.0f\t\t%.2f\t%.2f\t%.2f\n',(k/100),xold,yold,zold);
    end
end

toc





