% ES827 - Robótica Industrial
% Trabalho - 1sem2018

% PPP - Cartesiano

% Iago Agrella Fancio				155746
% Bruna de Andrade Mattos	        157730
% Carlos Vinícius Araki Oliveira	160141
% Xavier Le Gallic					207720

clc; clear all;
close all;

m1 = 5.75;
m2 = 12.13;
m3 = 3.12;
m4 = 0.2;
g = 9.81;
I4 = 1;


% (m1+m2+m3+m4)*d1'' = F1
% (m2+m3+m4)*d2'' = F2
% (m3+m4)*d3'' - g*(m3+m4) = F3
% I4*theta4'' = T4
Ponto1 = [5 5 -16 1];
Ponto2 = [5 95 0];
Ponto3 = [95 5 0];
Ponto4 = [95 95 0];

s = tf('s');

H_Elo1 = 1/((m1+m2+m3+m4)*s^2);
[N1, D1] = tfdata(H_Elo1,'v');
H_Elo2 = 1/((m2+m3+m4)*s^2);
[N2, D2] = tfdata(H_Elo2,'v');
%H_Elo3 = ;




D = [m1+m2+m3+m4     0       0     0;...
         0        m2+m3+m4   0     0;...
         0           0      m3+m4  0;...
         0           0       0     I4];

C = zeros(4);     
     
G = [    0;...
         0;...
      -g*(m3+m4);...
         0];
U = -G;
A = zeros(8);

A(1:4,5:8) = eye(4);

F = zeros(8,1);
% F(5:8,1)=inv(D)*(-G);
F(5:8,1)=D\U;

%sim(simulacaoPPP);