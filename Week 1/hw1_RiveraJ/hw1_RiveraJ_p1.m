%Problem 1 Polyhedron Properties 
clear;clc;
%Dimensions for tetrahedron in unit sphere
Rt=1; 
Et=4/sqrt(6);
rt=1/3;

%Dimensions for cube in tetrahedron
Rc=rt;
Ec=2/(3*sqrt(3));
rc=1/(3*sqrt(3));

%Dimensions for octahedron in cube
Ro=rc;
Eo=2/(3*sqrt(6));
ro=1/9;

%Dimensions for dodecahedron in octahedron
Rd=ro;
Ed=4/(9*(sqrt(15)+sqrt(3)));
rd=(sqrt(250+110*sqrt(5)))/20*Ed;

%Dimensions for icosahedron in dodecahedron
Ri=rd;
Ei=(Ri*4)/(sqrt(10+2*sqrt(5)));
ri=(sqrt(42+18*sqrt(5)))/12*Ei;

%Print out the table
fprintf('\t\t\tDimensions of Platonic solids\n');
fprintf('Solid\t\tInradius\t\tOutradius\t\tEdge length\n');
fprintf('T\t\t\t%.6f\t\t%.6f\t\t%.6f\n',rt,Rt,Et);
fprintf('C\t\t\t%.6f\t\t%.6f\t\t%.6f\n',rc,Rc,Ec);
fprintf('O\t\t\t%.6f\t\t%.6f\t\t%.6f\n',ro,Ro,Eo);
fprintf('D\t\t\t%.6f\t\t%.6f\t\t%.6f\n',rd,Rd,Ed);
fprintf('I\t\t\t%.6f\t\t%.6f\t\t%.6f\n',ri,Ri,Ei);





