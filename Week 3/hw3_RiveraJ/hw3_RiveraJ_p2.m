%The Pocket Change Problem
%Jared Rivera 804603106

clear all; clc;

%Initialize coin values
quarter=25;
dime=10;
nickel=5;
penny=1;

%Set the number of coins to zero
coincount=0;

%Start the loop for all possible cent values
for k=0:99
    %Set the amount of change equal to the count variable
    change=k;  
    
    %Set the first while loop to run as long as there is change
    while change>0
        
        %Set up loops to deduct change value and up the coin count
        while change>=quarter
            change=change-quarter;
            coincount=coincount+1;
        end
        while change>=dime
            change=change-dime;
            coincount=coincount+1;
        end
        while change>=nickel
            change=change-nickel;
            coincount=coincount+1;
        end
        while change>=penny
            change=change-penny;
            coincount=coincount+1;
        end
    end
end

%Take the average number of coins across the interval
avgcoincount=coincount/100;

%print value to screen
fprintf('Average Number of Coins: %.2f\n',avgcoincount);

