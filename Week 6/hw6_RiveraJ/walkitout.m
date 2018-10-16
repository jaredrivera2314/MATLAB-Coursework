function [ x,y ] = walkitout( x,y)
%Takes in the position of a particle and moves it randomly by a unit length
%in one of four directions, accounting for the presence of a wall.

wall=5;

    r=rand;
    
    if r<=0.25
        %Move north
        if y~=wall
            y=y+1;
        end
    elseif r<=0.5
        %Move south
        if y~=-wall
            y=y-1;
        end
    elseif r<=0.75
        %Move east
        if x~=wall
            x=x+1;
        end
    else
        %Move west
        if x~=-wall
            x=x-1;
        end
    end
   

end

