%Epidemic
%Jared Rivera 804603106

close all; clear all; clc;
tic
%Set up time variables for loop
deltat=0.005;
tfinal=60;
tstep=(tfinal/deltat);
t=[0:deltat:60];
npoints=length(t);

%Set initial values
iold=0.0000125;
sold=0.9999875;
rold=0;

%Set up arrays
i=zeros(1,npoints);
s=zeros(1,npoints);
r=zeros(1,npoints);

i(1)=iold;
s(1)=sold;
r(1)=rold;


%Start loop to calculate populations
for k=1:tstep
    
    %Initialize constants
    g=0.1;
    tk=k*deltat;
    tvac=28;
    n=5;
    bvac=0.5-(0.4/(1+exp((-10/n)*(tk-tvac-(n/2)))));
    b=bvac;
    
    %Euler forward integration
    snew=sold-deltat*(b*iold*sold);
    inew=iold+deltat*(b*iold*sold-g*iold);
    rnew=rold+deltat*(g*iold);
    
    %Reset variables
    sold=snew;
    iold=inew;
    rold=rnew;
    
    %Update array
    s(k+1)=snew;
    i(k+1)=inew;
    r(k+1)=rnew;
    
    
end

%Plot populations
plot(t,s,'r',t,i,'r',t,r);
legend show;
legend('Susceptible','Infected','Removed');
xlabel('Time');
ylabel('Normalized Population');

%Print results to command window
fprintf('Final Size of Population Groups\n');
fprintf('Susceptible: %0.2f million\n', sold*4);
fprintf('Infected: %0.2f million\n', iold*4);
fprintf('Removed: %0.2f million\n', rold*4);
toc