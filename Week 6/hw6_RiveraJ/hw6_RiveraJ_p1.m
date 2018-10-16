%The chords of a circle paradox
%Jared Rivera
%804603106
clear all; clc;
rng('shuffle');


%Initialize variables
r=1;

anglechordlengths=zeros(1,10^6);
radiuschordlengths=zeros(1,10^6);

thetacount=0;
dcount=0;

%Random angle
for k=1:10^6
    
    theta=rand*2*pi;
    ltheta=2*r*sin(theta/2);
    anglechordlengths(k)=ltheta;
    
    if ltheta>1
        thetacount=thetacount+1;
    end
    
end


%Random radius
for k=1:10^6
    
    d=rand;
    ld=2*sqrt(r^2-d^2);
    radiuschordlengths(k)=ld;
    
    if ld>1
        dcount=dcount+1;
    end
    
end

%Calulate percentages
percenttheta=(thetacount/10^6)*100;
percentd=(dcount/10^6)*100;

%Print results
fprintf('Random Angle: %.2f percent\n', percenttheta);
fprintf('Random Radius: %.2f percent\n', percentd);

%Make histograms
histogram(anglechordlengths);
title('Random Angle Method');
xlabel('Chord Length');
ylabel('Number of Chords');

figure();
histogram(radiuschordlengths);
title('Random Radius Method');
xlabel('Chord Length');
ylabel('Number of Chords');




