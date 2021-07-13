close all; clc; clear all;

p0=0; p1=6.1709; p2=6.1709; p3=3.2539; p4=3.2539; p5=3.0293; p6=3.0293; p7=0.1123; p8=0.1123; p9=0;
[aux,auxp,auxpp] = calculatrajetoriacompleta (p0,p1,p2,p3,p4,p5,p6,p7,p8,p9);
x= aux; xp= auxp; xpp= auxpp;

% figure
% hold on
% plot(x,'b')
% plot(xp,'r')
% plot(xpp,'g')
% hold off

p0=0; p1=2.0151; p2=2.0151; p3=-2.0151; p4=-2.0151; p5=-4.2681; p6=-4.2681; p7=4.2681; p8=4.2681; p9=0;
[aux,auxp,auxpp] = calculatrajetoriacompleta (p0,p1,p2,p3,p4,p5,p6,p7,p8,p9);
y= aux; yp= auxp; ypp= auxpp;

% figure
% hold on
% plot(y,'b')
% plot(yp,'r')
% plot(ypp,'g')
% hold off

p0=0; p1=0.16; p2=0; p3=0.16; p4=0; p5=0.16; p6=0; p7=0.16; p8=0; p9=0;
[aux,auxp,auxpp] = calculatrajetoriacompleta (p0,p1,p2,p3,p4,p5,p6,p7,p8,p9);
z= aux; zp= auxp; zpp= auxpp;

% figure
% hold on
% plot(z,'b')
% plot(zp,'r')
% plot(zpp,'g')
% hold off
zero = zeros(1,length(x));
q = [
    x
     y
     z
     zero
     ];
 dq = [
     xp
     yp
     zp
     zero
    ];
ddq = [
    xpp
    ypp
    zpp
    zero
    ];


g3 = 9.98;
a1 = .35;
a2 = .30;
m1 = 5.75;
m2 = 12.13;
m3 = 3.12;
m4 = .2;
Iz1 = m1*a1^2/3;
Iz2 = m2*a2^2/3;
Iz3 = m3*.0001;
Iz4 = m4*.0001;

G = [
    0
    0
    -g3*(m3+m4)
    0
    ];
tam = length(x); % tamanho da variavel
i = 1;
esf1 = zero;
esf2 = zero;
esf3 = zero;
esf4 = zero;
while i<tam 
    
    difteta1 = xp(i);
    difteta2 = yp(i);
    teta2 = x(i);

    Cq = [
        -(difteta2*a1*a2*sin(teta2)*(m2+m3+m4)) -(difteta1*a1*a2*sin(teta2)*(m2+m3+m4)) 0 0
        difteta1*a1*a2*sin(teta2)*(m2+m3+m4) 0 0 0
         0 0 0 0
         0 0 0 0
        ];

    VCq = Cq*dq(:,i);
    Dq =[ (6489*cos(teta2))/2000 + 793185265003236902628763/172938225691027046400000, (6489*cos(teta2))/4000 + 101153412881089090397321/57646075230342348800000,     0, -1/500001
    (6489*cos(teta2))/4000 + 101153412881089090397321/57646075230342348800000,                                 98782629766688563319/56294995342131200000,     0, -1/50000
                                                                          0,                                                                         0, 83/25,        0
                                                                   -1/50000,                                                                  -1/50000,     0, -1/50000];
    VDq = Dq*ddq(:,i);
    
    
    esforco = VCq + G + VDq;
    
    esf1(i) = esforco(1,1);
    esf2(i) = esforco(2,1);
    esf3(i) = esforco(3,1);
    esf4(i) = esforco(4,1);
    
    i = i +1;
end
hold on 
plot(esf1)
plot(esf2)
plot(esf3)
hold off



