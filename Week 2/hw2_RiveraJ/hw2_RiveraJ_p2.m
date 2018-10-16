%WORKS WELL

clear all; clc;

%Prompt for A
A_in=input('Input an integer value between 0 and 7: ');
if A_in<0 || A_in>7 || mod(A_in,1)~=0
    error('Please follow the instructions more carefully!');
end

%Prompt for B
B_in=input('Input an integer value between 0 and 7: ');
if B_in<0 || B_in>7 || mod(B_in,1)~=0
    error('Please follow the instructions more carefully!');
end
clc;
%Convert into binary
A2=floor(A_in/4);
A1=floor(mod(A_in/2,2)); 
A0=mod(A_in,2);

B2=floor(B_in/4);
B1=floor(mod(B_in/2,2)); 
B0=mod(B_in,2);


%Perform addition
C0=0;
S0=xor(xor(A0,B0),C0);
C1=and(A0,B0) || and(A0,C0) || and(B0,C0);
S1=xor(xor(A1,B1),C1);
C2=and(A1,B1) || and(A1,C1) || and(B1,C1);
S2=xor(xor(A2,B2),C2);
C3=and(A2,B2) || and(A2,C2) || and(B2,C2);
S3=C3;

%Convert to decimal
DEC=8*S3+4*S2+2*S1+1*S0;

%Print solutions
fprintf('The decimals provided are A=%i and B=%i\n',A_in,B_in);
fprintf('The conversion of A to binary: %i%i%i\n',A2,A1,A0);
fprintf('The conversion of B to binary: %i%i%i\n',B2,B1,B0);
fprintf('A plus B in binary is: %i%i%i%i\n',S3,S2,S1,S0);
fprintf('A plus B in decimal is: %i\n',DEC);

