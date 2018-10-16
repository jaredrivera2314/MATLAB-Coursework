%Nested Radicals
%Jared Rivera 804603106

clear all; clc;

%Prompt user for the input of an integere to put into the function
m=input('input a positive integer, m: ');

%Check to see if the input is valid
if mod(m,1)~=0 || m<=0
    fprintf('Please input positive integer.');
end

%Calculate all values needed prior to starting the loop
t1=sqrt(m);
t2=sqrt(m-sqrt(m));
todd=t1;
teven=t2;

%Begin to print values and up the step counter 
fprintf('m=%d\n',m);
t=1;
fprintf('t%d=%.12f\n',t,todd);
t=t+1;
fprintf('t%d=%.12f\n',t,todd);


%set while loop to run while the values aren't within the error bound
while abs(teven-todd)>(10^-12)
    %Calculate the odd and even values separately to save time
    todd=sqrt(m-sqrt(t1));
    t1=todd;
    teven=sqrt(m-sqrt(t2));
    t2=teven;
    
    %Update t values and print values
    t=t+1;
    fprintf('t%d=%.12f\n',t,todd);
    t=t+1;
    fprintf('t%d=%.12f\n',t,teven);
end
