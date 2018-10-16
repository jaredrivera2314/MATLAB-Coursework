function [ xa ] = averagePts( xs, w )
%The average funtion uses a weight vector, w, to determine how to compute
%the average of the points in the split array. This is done using a
%predetermined algorithm.
d=sum(w);
M=length(xs);

if d==0
    error('The weight vector must have a nonzero sum.');
end
    
w1=w(1)/d;
w2=w(2)/d;
w3=w(3)/d;

for k=2:M-1
    
xa(k)=w1*(xs(k-1))+w2*(xs(k))+w3*(xs(k+1));

end

xa(1)=w1*(xs(M))+w2*(xs(1))+w3*(xs(2));
xa(M)=w1*(xs(M-1))+w2*(xs(M))+w3*(xs(1));

end