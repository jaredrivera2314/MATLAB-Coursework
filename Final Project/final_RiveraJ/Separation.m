function [ v3 ] = Separation( Boids,numBoids,vmax,rSep )
%Separation etc

%Determine Nosey Neighbors
noseyNeighbors(1:numBoids)=struct('neighbors', Boids(1:numBoids));
noseyNeighborcount=zeros(1,numBoids);
for k=1:numBoids
    for j=1:numBoids
        dist=norm(Boids(k).pos-Boids(j).pos);
        if dist<=rSep
            if k~=j
                noseyNeighbors(k).neighbors(j)=Boids(j);
                noseyNeighborcount(k)=noseyNeighborcount(k)+1;
            end
        else
            noseyNeighbors(k).neighbors(j)=makeBoid([0,0],[0,0]);
        end
    end
end

%Determine separation
avgsep(1:numBoids)=struct('pos',[0,0]);
sumneighborsv3(1:numBoids)=struct('pos',[0,0]);

for l=1:numBoids
    for m=1:numBoids
        sumneighborsv3(l).pos=sumneighborsv3(l).pos+Boids(l).pos-noseyNeighbors(l).neighbors(m).pos;
        sumneighborsv3(l).pos=sumneighborsv3(l).pos/(norm(sumneighborsv3(l).pos)^2);
    end
    if noseyNeighborcount(l)~=0
        avgsep(l).pos=sumneighborsv3(l).pos/noseyNeighborcount(l);
    elseif noseyNeighborcount(l)==0
        avgsep(l).pos=Boids(l).pos;
    end
end

%Create v3 vector component
v3unit(1:numBoids)=struct('vel',[0,0]);
magv3unit=zeros(1,numBoids);
v3(1:numBoids)=struct('vel',[0,0]);
for n=1:numBoids
    v3unit(n).vel=avgsep(n).pos-Boids(n).pos;
    magv3unit(n)=norm(v3unit(n).vel);
    if magv3unit(n)~=0
        v3(n).vel=vmax*(v3unit(n).vel/magv3unit(n))-Boids(n).vel;
    elseif magv3unit(n)==0
        v3(n).vel=0;
    end
end

end

