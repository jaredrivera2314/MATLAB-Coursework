function [ Boids ] = Kinematics( vmax,amax,Boids,numBoids,Nx,Ny,v1,v2,v3,v4,deltat )
%Using semi-implicit Euler integration and the properties of the periodic
%boundary, update the position of the Boids.

c1=1.3;
c2=1.4;
c3=1.3;
c4=4;

a(1:numBoids)=struct('accel',[0,0]);
for o=1:numBoids
    a(o).accel=(c1*v1(o).vel)+(c2*v2(o).vel)+(c3*v3(o).vel)+(c4*v4(o).vel);
    
    if a(o).accel>amax
        a(o).accel=amax*(a(o).accel/norm(a(o).accel));
    end
end

%Update velocity with semi-implicit Euler
vnew(1:numBoids)=struct('vel',[0,0]);

for p=1:numBoids
    vnew(p).vel=Boids(p).vel+deltat*a(p).accel;
    
    if vnew(p).vel>vmax
        vnew(p).vel=vmax*(vnew(p).vel/norm(vnew(p).vel));
    end
    
    Boids(p).vel=vnew(p).vel;
end

%Update position with semi-implicit Euler
pnew(1:numBoids)=struct('pos',[0,0]);

for q=1:numBoids
    pnew(q).pos=Boids(q).pos+deltat*Boids(q).vel;
    Boids(q).pos=pnew(q).pos;
    
    %Periodic Boundary Condition
    if Boids(q).pos(1)>Nx
        Boids(q).pos(1)=Boids(q).pos(1)-Nx;
    end
    if Boids(q).pos(2)>Ny
        Boids(q).pos(2)=Boids(q).pos(2)-Ny;
    end
    if Boids(q).pos(1)<0
        Boids(q).pos(1)=Boids(q).pos(1)+Nx;
    end
    if Boids(q).pos(2)<0
        Boids(q).pos(2)=Boids(q).pos(2)+Ny;
    end
end

end

