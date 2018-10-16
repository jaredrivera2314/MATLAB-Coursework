%The Ranked-Choice Vote
%Jared Rivera
%804603106
clear all; clc;

load('votes1.mat');
voters=length(votes);
NumCandidates=8;
VoteCount=zeros(1,NumCandidates);
printmatrix=zeros(6,8);
count=0;

while max(VoteCount)<=(sum(VoteCount)/2)
    count=count+1;
    Size=size(votes);
    NumCandidates=Size(2);
    VoteCount=zeros(1,NumCandidates);
    
    for k=1:voters
        for j=1:NumCandidates
            if votes(k,1)==j
                VoteCount(j)=VoteCount(j)+1;
            end
        end
    end
    
    [Y,I]=sort(VoteCount);
    winningCandidate=I(NumCandidates);
    losingCandidate=I(1);
    
    printmatrix(count,1:Size(2))=VoteCount;
    
    votes=removeCandidate(votes,losingCandidate);
    
end

fprintf('\t\t\t\t\t1\t2\t3\t4\t5\t6\t7\t8\n');
fprintf('Round 1 Totals: %i %i %i %i %i %i %i %i \n',printmatrix(1,1),printmatrix(1,2),printmatrix(1,3),printmatrix(1,4),printmatrix(1,5),printmatrix(1,6),printmatrix(1,7),printmatrix(1,8));
fprintf('Round 2 Totals: %i %i %i %i %i %i %i %i \n',printmatrix(2,1),printmatrix(2,2),printmatrix(2,3),printmatrix(2,4),printmatrix(2,5),printmatrix(2,6),printmatrix(2,7),printmatrix(2,8));
fprintf('Round 3 Totals: %i %i %i %i %i %i %i %i \n',printmatrix(3,1),printmatrix(3,2),printmatrix(3,3),printmatrix(3,4),printmatrix(3,5),printmatrix(3,6),printmatrix(3,7),printmatrix(3,8));
fprintf('Round 4 Totals: %i %i %i %i %i %i %i %i \n',printmatrix(4,1),printmatrix(4,2),printmatrix(4,3),printmatrix(4,4),printmatrix(4,5),printmatrix(4,6),printmatrix(4,7),printmatrix(4,8));
fprintf('Round 5 Totals: %i %i %i %i %i %i %i %i \n',printmatrix(5,1),printmatrix(5,2),printmatrix(5,3),printmatrix(5,4),printmatrix(5,5),printmatrix(5,6),printmatrix(5,7),printmatrix(5,8));
fprintf('Round 6 Totals: %i %i %i %i %i %i %i %i \n\n',printmatrix(6,1),printmatrix(6,2),printmatrix(6,3),printmatrix(6,4),printmatrix(6,5),printmatrix(6,6),printmatrix(6,7),printmatrix(6,8));
fprintf('Winning Candidate: %i\n', winningCandidate);




