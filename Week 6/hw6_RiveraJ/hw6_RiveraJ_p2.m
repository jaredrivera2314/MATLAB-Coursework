%Random walker collisions
%Jared Rivera
%804603106
clear all; close all; clc;
rng('shuffle');

%Initializations
NumTrials=5000;
movecount=zeros(1, NumTrials);

%Perform all trials
for k=1:NumTrials
    
    %First walker
    xa=-5;
    ya=0;
    
    %Second walker
    xb=5;
    yb=0;
    
    move=0;
    collision=0;
    
    %Move walkers
    while (move<1000) && collision==0
        
        [xa,ya]=walkitout(xa,ya);
        [xb,yb]=walkitout(xb,yb);
        
        move=move+1;
        
        if xa==xb && ya==yb
            collision=1;
            movecount(k)=move;
        end
    end
    
end

%Calculate and print median
med=ceil(median(movecount));
fprintf('Median = %d\n', med);


