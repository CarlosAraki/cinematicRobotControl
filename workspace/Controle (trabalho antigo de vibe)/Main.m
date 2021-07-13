close all
clc

mA=1; mB=1; m1=3; m2=9;
a=1; b=1; l=1; cT=3; kT=3;
g=9.81;

y0=[pi/4 pi/2 pi/4 pi/2]';

% y1 = teta1
% y2 = teta1'
% y2'= teta1'' 
% y3 = teta2    
% y4 = teta2'
% y4'= teta2''

% Análise 1:
%  
% a = 1 m
% b = 1 m
% l = 1 m
% m_{A} = 1 kg
% m_{B} = 1 kg
% m_{1} = 3 kg
% m_{2} = 3 kg
% c_{T} = 3 N.m.s/rad
% k_{T} = 3 N.m/rad

% Análise 2:
% 
% a = 0.5 m
% b = 1 m
% l = 0.5 m
% m_{A} = 1 kg
% m_{B} = 1 kg
% m_{1} = 3 kg
% m_{2} = 3 kg
% c_{T} = 3 N.m.s/rad
% k_{T} = 3 N.m/rad

% Análise 3:
%
% a = 1 m
% b = 1 m
% l = 1 m
% m_{A} = 1 kg
% m_{B} = 1 kg
% m_{1} = 3 kg
% m_{2} = 9 kg
% c_{T} = 3 N.m.s/rad
% k_{T} = 3 N.m/rad

[Tlinear,Ylinear] = ode45( @PPP , [0 30], y0, [], mA, mB, m1, m2, a, b, l, cT, kT, g);

figure;
subplot(2,1,1);
title('Deslocamentos Angulares: Sistema Linear');
hold on;
plot (Tlinear, Ylinear(:,1), 'r'); % teta1
plot (Tlinear, Ylinear(:,2), 'b'); % teta2
legend ('{\theta}_{1}', '{\theta}_{2}','interpreter','latex');
xlabel ('Tempo(s)','interpreter','latex');
ylabel ('${\theta}(rad)$','interpreter','latex');
hold off;
subplot (2,1,2);
title('Velocidades Angulares: Sistema Linear');
hold on;
plot (Tlinear, Ylinear(:,3), 'r'); % teta1'
plot (Tlinear, Ylinear(:,4), 'b'); % teta2'
h = legend ('$\dot{\theta}_{1}$', '$\dot{\theta}_{2}$','interpreter','latex');
set(h,'Interpreter','latex')
xlabel ('Tempo(s)','interpreter','latex');
ylabel ('$\dot{\theta}(rad/s)$','interpreter','latex');

hold off; 

[Tnao,Ynao] = ode45( @NAOLinearVariavelEstado , [0 30], y0, [], mA, mB, m1, m2, a, b, l, cT, kT, g);

figure;
subplot(2,1,1);
title('Deslocamentos Angulares: Sistema Não Linear');
hold on;
plot (Tnao, Ynao(:,1), 'r'); % teta1
plot (Tnao, Ynao(:,2), 'b'); % teta2
legend ('{\theta}_{1}', '{\theta}_{2}','interpreter','latex');
xlabel ('Tempo(s)','interpreter','latex');
ylabel ('${\theta}(rad)$','interpreter','latex');
hold off;
subplot (2,1,2);
title('Velocidades Angulares: Sistema Não Linear');
hold on;
plot (Tnao, Ynao(:,3), 'r'); % teta1'
plot (Tnao, Ynao(:,4), 'b'); % teta2'
h = legend ('$\dot{\theta}_{1}$', '$\dot{\theta}_{2}$','interpreter','latex');
set(h,'Interpreter','latex')
xlabel ('Tempo(s)','interpreter','latex');
ylabel ('$\dot{\theta}(rad/s)$','interpreter','latex');
