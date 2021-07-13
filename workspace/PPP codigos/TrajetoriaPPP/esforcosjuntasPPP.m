close all; clc; clear all;

p0=0; p1=0.05; p2=0.05; p3=0.05; p4=0.05; p5=0.95; p6=0.95; p7=0.95; p8=0.95; p9=0;
[aux,auxp,auxpp] = calculatrajetoriacompleta (p0,p1,p2,p3,p4,p5,p6,p7,p8,p9);
x= aux; xp= auxp; xpp= auxpp;
% 
% figure
% hold on
% plot(x,'b')
% plot(xp,'r')
% plot(xpp,'g')
% hold off

p0=0; p1=0.05; p2=0.05; p3=0.95; p4=0.95; p5=0.05; p6=0.05; p7=0.95; p8=0.95; p9=0;
[aux,auxp,auxpp] = calculatrajetoriacompleta (p0,p1,p2,p3,p4,p5,p6,p7,p8,p9);
y= aux; yp= auxp; ypp= auxpp;
% 
% figure
% hold on
% plot(y,'b')
% plot(yp,'r')
% plot(ypp,'g')
% hold off


p0=0.1; p1=0; p2=0.1; p3=0; p4=0.1; p5=0; p6=0.1; p7=0; p8=0.1; p9=0.1;
[aux,auxp,auxpp] = calculatrajetoriacompleta (p0,p1,p2,p3,p4,p5,p6,p7,p8,p9);
z= aux; zp= auxp; zpp= auxpp;
% 
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
    

%     Cq = [
%          0 0 0 0
%          0 0 0 0
%          0 0 0 0
%          0 0 0 0
%         ];
% 
%     VCq = Cq*dq(:,i);

    VDq = [
        (m1+m2+m3+m4)*xpp(i)
        (m2+m3+m4)*ypp(i)
        (m3 + m4)*zpp(i)
        0
        ];
    
    
    esforco = G + VDq;
    
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

