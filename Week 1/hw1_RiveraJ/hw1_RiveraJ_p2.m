%Problem 2 Ellipse Calculations 
clear;clc;
%prompt user to input values of a and b
a=input('Inpit value of a: ');
b=input('Inpit value of b: ');
clc
%assign value to h for any a and b
h=((a-b)/(a+b))^2;

%run through different ways to calculate perimeter
p1=pi*(a+b);
p2=pi*sqrt(2*(a+b));
p3=pi*sqrt(2*(a+b)-((a-b)^2/2));
p4=p1*(1+(h/8))^2;   %started using p1 here to speed up the typing process
p5=p1*(1+(3*h/(10+sqrt(4-3*h))));
p6=p1*((64-3*h^2)/(64-16*h));
p7=p1*((256-48*h-21*h^2)/(256-112*h+3*h^2));
p8=p1*((3-sqrt(1-h))/2);

%display each value to 5 decimal precision on a new line then displays h
fprintf(['The eight methods of calculating perimeter yield\n',...
    'P1=%10.8f\nP2=%10.8f\nP3=%10.8f\nP4=%10.8f\nP5=%10.8f\n',...
    'P6=%10.8f\nP7=%10.8f\nP8=%10.8f\n\n',...
    'h=%10.3f\n,'],p1,p2,p3,p4,p5,p6,p7,p8,h);



