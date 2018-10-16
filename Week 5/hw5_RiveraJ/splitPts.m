function [ xs ] = splitPts( x )
%The split function uses the midpoint formula to calculate the midpoint of
%two points in an array, and populates a new array that contains the
%original points and their midpoints, operating under the assumption that
%the array is a circle.

N=2*length(x);

for k=1:2:N
    xs(k)=x((k+1)/2);
end

for k=2:2:N-1
    xs(k)=(xs(k+1)+xs(k-1))/2;
end

xs(N)=(xs(1)+xs(N-1))/2;

end

