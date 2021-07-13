clc
clear all
close all
hold off
%robo scara

tetalimit1positivo = 2*pi/3; %limitação do teta1
tetalimit1negativo = 0;
tetalimit2positivo = pi/2; % limitação do teta2
tetalimit2negativo = 0;
dteta1 = (tetalimit1positivo+tetalimit1negativo)/1000;
dteta2 = (tetalimit2positivo+tetalimit2negativo)/1000;
teta1=-tetalimit1negativo:dteta1:tetalimit1positivo;
teta2=-tetalimit2negativo:dteta2:tetalimit2positivo;
a1=40; %tamanho do primeiro braçp
a2=40; %tamanho do segundo braço

% for i = 1:length(teta1)-1
%     X(i)  = a2*cos(teta1(i)+teta2(i)) + a1*cos(teta1(i));
%     Y(i)  = a2*sin(teta1(i)+teta2(i)) + a1*sin(teta1(i));
% end

for i = 1:(length(teta1))
        X(i)  = a2*cos(teta1(i)) + a1*cos(teta1(i));
        Y(i)  = a2*sin(teta1(i)) + a1*sin(teta1(i));
end

for i = length(teta1)+1:(length(teta2)+ length(teta1))
        X(i)  = a2*cos(teta2(i-length(teta1))+tetalimit1positivo) + a1*cos(tetalimit1positivo);
        Y(i)  = a2*sin(teta2(i-length(teta1))+tetalimit1positivo) + a1*sin(tetalimit1positivo);
end

% for i = (length(teta2)+ length(teta1))+1:(length(teta2)+ length(teta1)+ length(teta1))
%         X(i)  = a2*cos(tetalimit2positivo+teta1(i-(length(teta2)+ length(teta1)))) + a1*cos(teta1(i-(length(teta2)+ length(teta1))));
%         Y(i)  = a2*sin(tetalimit2positivo+teta1(i-(length(teta2)+ length(teta1)))) + a1*sin(teta1(i-(length(teta2)+ length(teta1))));
% end
i = (length(teta2)+ length(teta1))-1;
j = (tetalimit1positivo-dteta1);
while(Y(i) >= 0)
    i= i+1;
    X(i)  = a2*cos(tetalimit2positivo+j) + a1*cos(j);
    Y(i)  = a2*sin(tetalimit2positivo+j) + a1*sin(j);
    j  = j - dteta1;
end
X = [X X];
Y = [Y -Y];
plot(X,Y);
hold on
plot(0,0,'r+')

plot(50,50,'g+')
plot(50,-50,'g+')
plot(-50,50,'g+')
plot(-50,-50,'g+')
grid on
% f = zeros(length(X));
% plot3(X,Y,f)
% for i = 1:20
%     Z= f+ i;
%     plot3(X,Y,Z)
% end
% XMIN = -4;
% XMAX = 5;
% YMIN = -4;
% YMAX = 5;
% ZMIN = 0;
% ZMAX = 30;
%  
%  [X,Y] = meshgrid(X,Y);
% f = zeros(length(X));
%  mesh(X,Y)
% 
% hold on
% for i = 1:20
%     Z= f+ i;
%     mesh(X,Y,Z)
% end
% axis([XMIN XMAX YMIN YMAX ZMIN ZMAX]);
% grid on 
% hold off
