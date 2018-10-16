function [ v4 ] = Predator_avoidance( Boids,numBoids,Charlotte,rNearby,vmax )
%Predator Avoidance etc

%Determine neighbors of Charlotte
CharlotteNeighbors(1:numBoids)=struct('neighbors', Boids(1:numBoids));
CharlotteNeighborcount=zeros(1,numBoids);
for j=1:numBoids
    dist=norm(Charlotte.pos-Boids(j).pos);
    if dist<=10*rNearby
        CharlotteNeighbors(j).neighbors(j)=Boids(j);
        CharlotteNeighborcount(j)=CharlotteNeighborcount(j)+1;
    else
        CharlotteNeighbors(j).neighbors(j)=makeBoid([0,0],[0,0]);
    end
end

%Determine how much to flee from the predator
avgrun(1:numBoids)=struct('pos',[0,0]);
sumneighborsv4(1:numBoids)=struct('pos',[0,0]);

for l=1:numBoids
    for m=1:numBoids
        if norm(sumneighborsv4(l).pos)~=0
            sumneighborsv4(l).pos=sumneighborsv4(l).pos+Boids(l).pos-CharlotteNeighbors(l).neighbors(m).pos;
            sumneighborsv4(l).pos=sumneighborsv4(l).pos/(norm(sumneighborsv4(l).pos)^3);
        elseif norm(sumneighborsv4(l).pos)==0
            sumneighborsv4(l).pos=0;
        end
    end
    if CharlotteNeighborcount(l)~=0
        avgrun(l).pos=sumneighborsv4(l).pos/CharlotteNeighborcount(l);
    elseif CharlotteNeighborcount(l)==0
        avgrun(l).pos=Boids(l).pos;
    end
end

%Create v4 vector component
v4unit(1:numBoids)=struct('vel',[0,0]);
magv4unit=zeros(1,numBoids);
v4(1:numBoids)=struct('vel',[0,0]);
for n=1:numBoids
    v4unit(n).vel=avgrun(n).pos-Boids(n).pos;
    magv4unit(n)=norm(v4unit(n).vel);
    if magv4unit(n)~=0
        v4(n).vel=vmax*(v4unit(n).vel/magv4unit(n))-Boids(n).vel;
    elseif magv4unit(n)==0
        v4(n).vel=0;
    end
end

end

