%Numerical differentiation
%Jared Rivera
%804603106
clear all; close all; clc;

%set x-domain
x=linspace(-5,5,100);
domainlength=length(x);

%set h-domain
harray=logspace(-15,-1,50);
harraylength=length(harray);

exactd=dfx_exact(x);

%Set up error arrays
errorforward=zeros(1, harraylength);
errorbackward=zeros(1, harraylength);
errorcentral=zeros(1, harraylength);

%Populate error array for forward method
for k=1:harraylength
approxdforward=dfx_forward(x,harray(k));

errorforward(k)=mean(abs(approxdforward-exactd));
end

%Populate error array for backward method
for k=1:harraylength
approxdbackward=dfx_backward(x,harray(k));

errorbackward(k)=mean(abs(approxdbackward-exactd));
end

%Populate error array for central method
for k=1:harraylength
approxdcentral=dfx_central(x,harray(k));

errorcentral(k)=mean(abs(approxdcentral-exactd));
end

loglog(harray,errorforward, harray,errorbackward, harray,errorcentral);
legend show;
legend('Forward','Backward','Central');
xlabel('h');
ylabel('Average Error');





