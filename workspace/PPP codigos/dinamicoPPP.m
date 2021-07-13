syms m1 m2 m3 m4 I4
g = 9.81;
zero = [0;0;0];
Jv1 = [Z0 zero zero zero]
Jv2 = [Z0 Z1 zero zero]
Jv3 = [Z0 Z1 Z2 zero]
Jw1 = [zero zero zero zero];
Jw2 = [zero zero zero zero];
Jw3 = [zero zero zero zero];
D1 = m1*Jv1'*Jv1
D2 = m2*Jv2'*Jv3
D3 = m3*Jv3'*Jv3
D4 = m4*Jv'*Jv + I4*Jw'*H04(1:3,1:3)*H04(1:3,1:3)'*Jw
D = D1 + D2 + D3 + D4
potencial = [g*(m1 + m2 + m3);0;0]