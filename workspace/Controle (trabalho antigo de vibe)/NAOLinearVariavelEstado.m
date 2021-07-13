function [dy] = NAOLinearVariavelEstado (t, y, mA, mB, m1, m2, a, b, l, cT, kT, g)

% y = matriz(4,1)
% y1 = teta1 = y(1,1)
% y2 = teta1' = y(2,1)
% y3 = teta2 = y(3,1)    
% y4 = teta2' = y(4,1)

y1 = y(1,1);
y2 = y(2,1);
y3 = y(3,1);    
y4 = y(4,1);  

M = zeros(2);
C = zeros(2);
K = zeros(2);
Fx = zeros(2,1);

M(1,1) = b*l/2*(2*m2+mB)*cos(y3-y1);
M(1,2) = l^2*(m2+mB/3);
M(2,1) = m1*a^2 + mA/3*((a-b)^2+a*b) + b^2*(m2+mB)*cos(2*(y3-y1));
M(2,2) = b*l/2*(2*m2+mB)*cos(y3-y1);

C(1,1) = y2*b*l/2*(2*m2+mB)*sin(y3-y1);
C(2,1) = cT;
C(2,2) = -y4*b*l/2*(2*m2+mB)*sin(y3-y1);

K(2,1) = kT;

% U(1,1) = -(y2'*cos(y3-y1)+y2^2*sin(y3-y1)-g*sin(y3)/b)*(b*l/2*(2*m2+mB))+...
%          - y4'*(l^2*(m2+mB/3));
% 
% U(2,1) = - y2'*(b^2*(m2+mB)*cos(2*(y3-y1))) + ...
%          - y4'*(b*cos(y3-y1)*l/2*(2*m2+mB)) + ...
%          + sin(y1)*g*(m1*a-mA*(b-a)/2-b*(m2+mB)) + ...
%          + y4^2*b*l/2*(2*m2+mB)*sin(y3-y1); 

Fx(1,1) = -g*sin(y3)*l/2*(2*m2+mB);
Fx(2,1) = sin(y1)*g*(m1*a-mA*(b-a)/2-b*(m2+mB));

A = zeros(4);

A21=-inv(M)*K;
A22=-inv(M)*C;

A(1:2,3:4) = eye(2);
A(3:4, 1:2)= A21;
A(3:4, 3:4)= A22;

F = zeros(4,1);

F(3:4,1) = M\Fx;    %inv(A)*B = A\B

%display(A);
%display (Fx);

dy=A*y + F;
end