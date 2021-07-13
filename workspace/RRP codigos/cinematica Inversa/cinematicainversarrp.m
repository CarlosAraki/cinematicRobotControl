clear all
close all
clc


syms d1 d2 d3 d4 d5 d6  Q1 Q2 Q3 Q4 Q5 Q6 a1 a2 a3 a4 a5 a6 alfa1 alfa2 alfa3 alfa4 alfa5 alfa6
ORI = [0
    0
    0]

    A = [
        cos(Q1+Q2) sin(Q1+Q2) 0 a2*cos(Q1+Q2)+a1*cos(Q1)
        sin(Q1+Q2) cos(Q1+Q2) 0 a2*sin(Q1+Q2)+a2*sin(Q1)
        0 0 -1 d1-d3-d4
        0 0 0 1]
    XYZ =  A(1:3,4)

    
  XYZp= [ 0 a1*cos(Q1) a2*cos(Q1+Q2)+a1*cos(Q1) a2*cos(Q1+Q2)+a1*cos(Q1)
    0 a1*sin(Q1) a2*sin(Q1+Q2)+a1*sin(Q1) a2*sin(Q1+Q2)+a1*sin(Q1)
    0 d1 d1 d1-d3-d4];

% return
X= XYZ(1,1)
Y= XYZ(2,1)
Z= XYZ(3,1)

J = [diff(X,Q1)   diff(X,Q2) diff(X,d3)
    diff(Y,Q1)   diff(Y,Q2)  diff(Y,d3)
    diff(Z,Q1)   diff(Z,Q2)  diff(Z,d3)]

Jinv =simplify(inv(J));

clear d1 d2 d3 d4 d5 d6  Q1 Q2 Q3 Q4 Q5 Q6 a1 a2 a3 a4 a5 a6 alfa1 alfa2 alfa3 alfa4 alfa5 alfa6

Q1 = transteta(.30);
Q2 = transteta(.9);
a1 = 40;
a2 = 40;
d1 = 3;
d3 = 1;
d4 = 1;


XYZo= [45,45,0]';%valor de inicio quadrante1 

XYZP = eval(XYZp);

figure1 = figure('Color',[1 1 1], 'position',[800 150 800 500]);
axes1 = axes('Parent',figure1,'Layer','top','XAxisLocation','bottom','FontSize',12,'FontName','Times New Roman');
box(axes1,'on');
hold(axes1,'all');
hold on
box on
grid on
xlabel('[M]','FontSize',12);
ylabel('[M]','FontSize',12);
XYZi = [eval(X)
        eval(Y)
        eval(Z)];
ERRO = XYZo-XYZi;
%Caso queira posição inicial    
% plot3 (XYZP(1,:),XYZP(2,:),XYZP(3,:) ,'b','linewidth',2);
% plot3 (XYZP(1,:),XYZP(2,:),XYZP(3,:) ,'.y','linewidth',2,'MarkerSize',10,'Marker','*');
% plot3 (XYZo(1,1),XYZo(2,1),XYZo(3,1) ,'r','MarkerSize',15,'Marker','+','linewidth',3);
view(axes1,[45 45]);
i=0;
nn = 0.00001; % tamanho do erro
while(max(abs(ERRO))>nn)
    
    XYZP = eval(XYZp);
    XYZi = [eval(X)
        eval(Y)
        eval(Z)];
    
    Jn = eval(J);
    Jinv = Jn'*inv(Jn*Jn');
    ERRO = XYZo-XYZi;
    Qi = [Q1;Q2;d3] + Jinv*ERRO;
    Q1= transteta(Qi(1,1));
    Q2= transteta(Qi(2,1));
    d3= Qi(3,1);
    

    i = i+1;
end
ERRO
i
var1 = [Q1,Q2,d3]
    plot3 (XYZP(1,:),XYZP(2,:),XYZP(3,:) ,'b','linewidth',2);
    plot3 (XYZP(1,:),XYZP(2,:),XYZP(3,:) ,'.y','linewidth',2,'MarkerSize',10,'Marker','*');
    plot3 (XYZo(1,1),XYZo(2,1),XYZo(3,1) ,'r','MarkerSize',15,'Marker','+','linewidth',3);

    figure(1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
Q1 = 2.8372;
Q2 = 6.2473;
XYZo = [-45,45,0]'; %segundo ponto quadrante 2
i = 0;
XYZi = [eval(X)
        eval(Y)
        eval(Z)];
ERRO = XYZo-XYZi;
while(max(abs(ERRO))>nn)
    
    
    XYZP = eval(XYZp);
    XYZi = [eval(X)
        eval(Y)
        eval(Z)];
    
    Jn = eval(J);
    Jinv = Jn'*inv(Jn*Jn');
    
    ERRO = XYZo-XYZi;
    Qi = [Q1;Q2;d3] + Jinv*ERRO;
    Q1= transteta(Qi(1,1));
    Q2= transteta(Qi(2,1));
    d3= Qi(3,1);
    

   
    i = i+1;
end
ERRO
    plot3 (XYZP(1,:),XYZP(2,:),XYZP(3,:) ,'k','linewidth',2);
    plot3 (XYZP(1,:),XYZP(2,:),XYZP(3,:) ,'.y','linewidth',2,'MarkerSize',10,'Marker','*');
    plot3 (XYZo(1,1),XYZo(2,1),XYZo(3,1) ,'r','MarkerSize',15,'Marker','+','linewidth',3);

     figure(1)
i=0;
var2 = [Q1,Q2,d3]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Q1 = 4.36332;
Q2 = .9;

XYZo = [-45,-45,0]';%terceiro ponto quadrante 3
XYZi = [eval(X)
        eval(Y)
        eval(Z)];
ERRO = XYZo-XYZi;
while(max(abs(ERRO))>nn)
    
    XYZP = eval(XYZp);
    XYZi = [eval(X)
        eval(Y)
        eval(Z)];
    
    Jn = eval(J);
    Jinv = Jn'*inv(Jn*Jn');
    
    ERRO = XYZo-XYZi;
    Qi = [Q1;Q2;d3] + Jinv*ERRO;
    Q1= transteta(Qi(1,1));
    Q2= transteta(Qi(2,1));
    d3= Qi(3,1);


    i = i+1;
end

    ERRO
    plot3 (XYZP(1,:),XYZP(2,:),XYZP(3,:) ,'g','linewidth',2);
    plot3 (XYZP(1,:),XYZP(2,:),XYZP(3,:) ,'.y','linewidth',2,'MarkerSize',10,'Marker','*');
    plot3 (XYZo(1,1),XYZo(2,1),XYZo(3,1) ,'r','MarkerSize',15,'Marker','+','linewidth',3);

    var3 = [Q1,Q2,d3]
    figure(1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Q1 = 5.9;
Q2 = .9;
i=0;
XYZo = [45,-45,0]'; %4 ponto quadrante 4
XYZi = [eval(X)
        eval(Y)
        eval(Z)];
ERRO = XYZo-XYZi;
while(max(abs(ERRO))>nn)
    XYZP = eval(XYZp);
    XYZi = [eval(X)
        eval(Y)
        eval(Z)];
    
    Jn = eval(J);
    Jinv = Jn'*inv(Jn*Jn');
    
    ERRO = XYZo-XYZi;
    Qi = [Q1;Q2;d3] + Jinv*ERRO;
    Q1= transteta(Qi(1,1));
    Q2= transteta(Qi(2,1));
    d3= Qi(3,1);
   
  
    i = i+1;
end

    var4 = [Q1,Q2,d3]
    ERRO

    plot3 (XYZP(1,:),XYZP(2,:),XYZP(3,:) ,'r','linewidth',2);
    plot3 (XYZP(1,:),XYZP(2,:),XYZP(3,:) ,'.y','linewidth',2,'MarkerSize',10,'Marker','*');
    plot3 (XYZo(1,1),XYZo(2,1),XYZo(3,1) ,'r','MarkerSize',15,'Marker','+','linewidth',3);

    figure(1)
    %resutado final tetajunta1 tetajunta2 distancia3 para cada quadrante(tetas em rad)
    var1
    var2
    var2
    var4