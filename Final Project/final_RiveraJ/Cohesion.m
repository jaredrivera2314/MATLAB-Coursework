function [ v1 ] = Cohesion( Boids,numBoids,Neighbors,Neighborcount,vmax )
%Cohesion etc
%Determine average position
avgpos1(1:numBoids)=struct('pos',[0,0]);
sumneighborsv1(1:numBoids)=struct('pos',[0,0]);

for l=1:numBoids
    for m=1:numBoids
        sumneighborsv1(l).pos=sumneighborsv1(l).pos+Neighbors(l).neighbors(m).pos;
    end
    
    if Neighborcount(l)~=0
        avgpos1(l).pos=sumneighborsv1(l).pos/Neighborcount(l);
    elseif Neighborcount(l)==0
        avgpos1(l).pos=Boids(l).pos;
    end
end

%Create v1 vector component
v1unit(1:numBoids)=struct('vel',[0,0]);
magv1unit=zeros(1,numBoids);
v1(1:numBoids)=struct('vel',[0,0]);
for n=1:numBoids
    v1unit(n).vel=avgpos1(n).pos-Boids(n).pos;
    magv1unit(n)=norm(v1unit(n).vel);
    if magv1unit(n)~=0
        v1(n).vel=vmax*(v1unit(n).vel/magv1unit(n))-Boids(n).vel;
    elseif magv1unit(n)==0
        v1(n).vel=0;
    end
end

end

