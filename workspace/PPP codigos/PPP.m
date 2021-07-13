% ES827 - Robótica Industrial
% Trabalho - 1sem2018

% PPP - Cartesiano

% Iago Agrella Fancio				155746
% Bruna de Andrade Mattos	        157730
% Carlos Vinícius Araki Oliveira	160141
% Xavier Le Gallic					207720

clc; clear all;
close all;

% ---------------------- MATRIZES HOMOGÊNEAS ---------------------------- %

syms d1v d2v d3v d4 th4
syms uth ud
H01 = [1 0 0 0; 0 0 1 0; 0 -1 0 d1v; 0 0 0 1];
H12 = [ 0 0 -1 0; 1 0 0 0; 0 -1 0 d2v; 0 0 0 1];
H23 = [ 1 0 0 0; 0 1 0 0; 0 0 1 d3v; 0 0 0 1];
H34 = [cos(th4) -sin(th4) 0 0; sin(th4) cos(th4) 0 0; 0 0 1 d4; 0 0 0 1];
H02= H01*H12;
H03 = H02*H23;
H04 = H03*H34;

% ------------------------ SINGULARIDADE -------------------------------- %

Z0 = [ 0;0;1];
O0 = [0;0;0];
Z1 = H01(1:3,3);
Z2 = H02(1:3,3);
Z3 = H03(1:3,3);
O1 = H01(1:3,4);
O2 = H02(1:3,4);
O3 = H03(1:3,4);
O4 = H04(1:3,4);
Jv = [Z0 Z1 Z2 cross(Z3,(O4-O3))];
Jw = [O0 O0 O0 Z3];
J = [Jv;Jw];
J11=det(J(1:3,1:3));

% --------------------------- INCERTEZAS -------------------------------- %

% POE AQUI IAGO!!!!!

% ----------------------------- ÁREA ------------------------------------ %
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

% ---------------------- CINEMÁTICA INVERSA ----------------------------- %

syms d1 d2 d3 d4 r1; % distâncias e rotações

% Coordenadas

O = [0 0 1]';
P1 =[5 0 1]';
P11 =[5 5 1]';
P111 =[5 5 0]';
P2 =[5 0 1]';
P22 = [5 95 1]';
P222 = [5 95 0]';
P3 =[95 0 1]';
P33 = [95 5 1]';
P333 = [95 5 0]';
P4 =[95 0 1]';
P44 = [95 95 1]';
P444 = [95 95 0]';

XYZP1 =  [O P1 P11 P111];
XYZP2 =  [O P2 P22 P222];
XYZP3 =  [O P3 P33 P333];
XYZP4 =  [O P4 P44 P444];

% Configurando plot

figure1 = figure('Color',[1 1 1], 'position',[800 150 800 500]);
axes1 = axes('Parent',figure1,'Layer','top','XAxisLocation','bottom','FontSize',12,'FontName','Arial');
box(axes1,'on');
hold(axes1,'all');
hold on
box on
grid on
xlabel('[M]','FontSize',12);
ylabel('[M]','FontSize',12);
plot3 (XYZP1(1,:),XYZP1(2,:),XYZP1(3,:) ,'b','linewidth',2);
plot3 (XYZP1(1,:),XYZP1(2,:),XYZP1(3,:) ,'.y','linewidth',2,'MarkerSize',10,'Marker','*');

plot3 (XYZP2(1,:),XYZP2(2,:),XYZP2(3,:) ,'r','linewidth',2);
plot3 (XYZP2(1,:),XYZP2(2,:),XYZP2(3,:) ,'.y','linewidth',2,'MarkerSize',10,'Marker','*');

plot3 (XYZP3(1,:),XYZP3(2,:),XYZP3(3,:) ,'g','linewidth',2);
plot3 (XYZP3(1,:),XYZP3(2,:),XYZP3(3,:) ,'.y','linewidth',2,'MarkerSize',10,'Marker','*');

plot3 (XYZP4(1,:),XYZP4(2,:),XYZP4(3,:) ,'k','linewidth',2);
plot3 (XYZP4(1,:),XYZP4(2,:),XYZP4(3,:) ,'.y','linewidth',2,'MarkerSize',10,'Marker','*');

hold off

% ------------------------ MODELO DINÂMICO ------------------------------ %

% FALTANDO COISA!!!!!!!!

% ENERGIA CINÉTICA
% ENERGIA POTENCIAL
% EQUAÇÃO DE MOVIMENTO
% SÍMBOLOS DE CHRISTOFFEL

syms m1 m2 m3 m4 I4
g = 9.81;
zero = [0;0;0];
Jv1 = [Z0 zero zero zero];
Jv2 = [Z0 Z1 zero zero];
Jv3 = [Z0 Z1 Z2 zero];
Jw1 = [zero zero zero zero];
Jw2 = [zero zero zero zero];
Jw3 = [zero zero zero zero];
D1 = m1*Jv1'*Jv1;
D2 = m2*Jv2'*Jv3;
D3 = m3*Jv3'*Jv3;
D4 = m4*Jv'*Jv + I4*Jw'*H04(1:3,1:3)*H04(1:3,1:3)'*Jw;
D = D1 + D2 + D3 + D4;
potencial = [g*(m1 + m2 + m3);0;0];

% ----------------------- CONTROLE DE MOVIMENTO ------------------------- %