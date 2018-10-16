function [ v2 ] = Alignment( Boids,numBoids,Neighbors,Neighborcount,vmax )
%Alignment etc

%Determine average velocity
avgvel(1:numBoids)=struct('vel',[0,0]);
sumneighborsv2(1:numBoids)=struct('vel',[0,0]);

for l=1:numBoids
    for m=1:numBoids
        sumneighborsv2(l).vel=sumneighborsv2(l).vel+Neighbors(l).neighbors(m).vel;
    end
    if Neighborcount(l)~=0
        avgvel(l).vel=sumneighborsv2(l).vel/Neighborcount(l);
    elseif Neighborcount(l)==0
        avgvel(l).vel=Boids(l).vel;
    end
end

%Create v2 vector component
v2unit(1:numBoids)=struct('vel',[0,0]);
magv2unit=zeros(1,numBoids);
v2(1:numBoids)=struct('vel',[0,0]);
for n=1:numBoids
    v2unit(n).vel=avgvel(n).vel-Boids(n).vel;
    magv2unit(n)=norm(v2unit(n).vel);
    if magv2unit(n)~=0
        v2(n).vel=vmax*(v2unit(n).vel/magv2unit(n))-Boids(n).vel;
    elseif magv2unit(n)==0
        v2(n).vel=0;
    end
end


end

