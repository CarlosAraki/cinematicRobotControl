clc
clear all
close all
%robo cartesiano
XMIN = 0;
XMAX = 120;
YMIN = 0;
YMAX = 120;
ZMIN = 0;
ZMAX = 50;
 
x = 1:100;
[X,Y] = meshgrid(x);
f = zeros(length(X));
 mesh(X,Y,f)

hold on
for i = 1:20
    Z= f+ i;
    mesh(X,Y,Z)
end
axis([XMIN XMAX YMIN YMAX ZMIN ZMAX]);
grid on 
hold off

