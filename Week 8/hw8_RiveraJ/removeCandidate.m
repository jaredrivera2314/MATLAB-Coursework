function [ votes ] = removeCandidate( votes, losingCandidate )
%Removes the lowest ranked candidate and resets the voting
voters=length(votes);
Size=size(votes);
NumCandidates=Size(2);
votesnew=zeros(voters,(NumCandidates-1));

for k=1:NumCandidates-1
    for j=1:voters
        if votes(j,k)==losingCandidate
            for l=k:NumCandidates-1
                votesnew(j,l)=votes(j,l+1);
            end
        elseif votesnew(j,k)==0
            votesnew(j,k)=votes(j,k);
        end
    end
end

votes=votesnew;

end

