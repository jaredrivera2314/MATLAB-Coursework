%Final Project
%Jared Rivera
%804603106
%All units standard metric

clear all; close all; clc; rng('shuffle');

%Initailize domain
deltat=0.1;
maxTime=10;
timeSteps=(maxTime/deltat);
numBoids=10;
g=1;

Ny=15;
Nx=15;

vidHandle=VideoWriter('Boids.mp4','MPEG-4');
vidHandle.FrameRate = 30;
vidHandle.Quality = 100;
open(vidHandle);

%Inititalize Boids
for k=1:numBoids
    r=rand;
    pos_initial=[k*9*r-5,15*r^2-200*r];
    vel_initial=[13*r,9*r];
    Boids(k)=makeBoid(pos_initial,vel_initial);
end

%Initialize predator
%Charlotte is the name of my buddy's Harris's Hawk
Charlotte=struct('pos',[Nx/2,Ny/2],'vel',[r*20,r*10]);

%Initialize plot
axis([0,Nx,0,Ny]);
hold on
for z=1:numBoids
    plot_Boids(z)=plot(Boids(z).pos(1),Boids(z).pos(2),'.','MarkerSize',20,'Color',[.8,.6,.4]);
end

plot_Charlotte=plot(Charlotte.pos(1),Charlotte.pos(2),'.','MarkerSize',30,'Color',[.7,.7,.7]);

%START MAIN LOOP
for g=1:timeSteps
    %Determine Neighbors
    rNearby=4;
    rSep=2.5;
    Neighbors(1:numBoids)=struct('neighbors', Boids(1:numBoids));
    Neighborcount=zeros(1,numBoids);
    for k=1:numBoids
        for j=1:numBoids
            dist=norm(Boids(k).pos-Boids(j).pos);
            if dist<=rNearby
                if k~=j
                    Neighbors(k).neighbors(j)=Boids(j);
                    Neighborcount(k)=Neighborcount(k)+1;
                end
            else
                Neighbors(k).neighbors(j)=makeBoid([0,0],[0,0]);
            end
        end
    end
    
    %Determine changes in velocity
    %vmax=the average air-speed velocity of an unladen swallow (African)
    vmax=3;
    
    %v1 cohesion
    v1=Cohesion(Boids,numBoids,Neighbors,Neighborcount,vmax);
    
    %v2 alignment
    v2=Alignment(Boids,numBoids,Neighbors,Neighborcount,vmax);
    
    %v3 separation
    v3=Separation(Boids,numBoids,vmax,rSep);
    
    %v4 predator avoidance
    v4=Predator_avoidance(Boids,numBoids,Charlotte,rNearby,vmax);
    
    
    %Kinematic updates
    %amax=the average g's the swallow takes
    amax=1;
  
    Boids=Kinematics(vmax,amax,Boids,numBoids,Nx,Ny,v1,v2,v3,v4,deltat);
    
    %Output data to movie
    for y=1:numBoids
        plot_Boids(y).XData=Boids(y).pos(1);
        plot_Boids(y).YData=Boids(y).pos(2);
    end
    
    plot_Charlotte.XData=Boids(k).pos(1);
    plot_Charlotte.YData=Boids(k).pos(2);
    drawnow
    writeVideo(vidHandle, getframe(gcf));
end

close(vidHandle);

