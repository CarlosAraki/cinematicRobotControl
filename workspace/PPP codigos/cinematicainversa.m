clear all;
close all;
clc;

syms d1 d2 d3 d4 r1; % distancias e rotações


%coordenadas

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

XYZP1 =  [O P1 P11 P111]
XYZP2 =  [O P2 P22 P222]
XYZP3 =  [O P3 P33 P333]
XYZP4 =  [O P4 P44 P444]
%configurando plot


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



