%Jared Rivera
%804603106
%Game of life
clear all; close all; clc;
rng('shuffle');

%Initialize variables
Ny=150;
Nx=200;
A=rand(Ny,Nx);
A_new=zeros(Ny,Nx);

%Randomly select living cells
for k=1:Ny
    for j=1:Nx
        if A(k,j)<=0.1
            A(k,j)=1;
        else
            A(k,j)=0;
        end
    end
end


%Set number of generations and iterate through
X=300;
count=zeros(1,X);
for generation=1:X
    
    %Determine the status of neighbors
    for row=1:Ny
        for column=1:Nx
            North=row-1;
            if North==0
                North=Ny;
            end
            
            South=row+1;
            if South==Ny+1
                South=1;
            end
            
            East=column+1;
            if East==Nx+1
                East=1;
            end
            
            West=column-1;
            if West==0
                West=Nx;
            end
            
           %Determine how many total neighbors are alive
            neighbors=A(North,West)+A(North,column)+A(North,East)+A(row,West)+A(row,East)+A(South,West)+A(South,column)+A(South,East);
            
            %Set life criteria
            %For living cell
            if A(row,column)==1
                if (neighbors<2 || neighbors>3)
                    A_new(row,column)=0;
                elseif (neighbors==2 || neighbors==3)
                    A_new(row,column)=1;
                end
            end
            %For dead cell
            if A(row,column)==0
                if neighbors==3
                    A_new(row,column)=1;
                end
            end
            
        end
    end
    
    %Generate animation
    A=A_new;
    imagesc(A);
    drawnow;
    
    %Sum the total number of living cells
    for q=1:Ny
        for r=1:Nx
            count(generation)=count(generation)+A(q,r);
        end
    end
end

plot(linspace(0,X,X),count, '-');
xlabel('Generation');
ylabel('Number of Living Cells');





