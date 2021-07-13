function [dy] = LinearVariavelEstado (~, y, mA, mB, m1, m2, a, b, l, cT, kT, g)

% y = matriz(4,1)
% y1 = teta1 = y(1,1)
% y2 = teta1' = y(2,1)
% y3 = teta2 = y(3,1)    
% y4 = teta2' = y(4,1)  

D = zeros(2);
C = zeros(2);
G = zeros(2);

D = [b*l/2*(2*m2+mB)                        l^2*(m2+mB/3); ...
     m1*a^2+mA/3*((a-b)^2+a*b)+b^2*(m2+mB)  b*l/2*(2*m2+mB)];

G = [0                                  g*l/2*(2*m2+mB);...
     kT+g*(-m1*a+mA*(b-a)/2+b*(m2+mB))   0]; %MUDEI AQUI, REFAZER TESTES

A = zeros(4);

A21=-inv(D)*G;
A22=-inv(D)*C;

A(1:2,3:4) = eye(2);
A(3:4, 1:2)= A21;
A(3:4, 3:4)= A22;

% ddteta = M\(-K*[y(1,1) y(3,1)]'-C*[y(2,1) y(4,1)]');
% 
% ddteta1 = ddteta(1,1);
% ddteta2 = ddteta(2,1);

dy=A*y;
end