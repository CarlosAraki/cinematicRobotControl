syms m1 m2 m3 m4 I1 I2 I4
g = 9.81;
zero = [0;0;0];
Jv1 = [cross(Z0,(O1-O0)) zero zero zero]
Jv2 = [cross(Z0,(O2-O0)) cross(Z1,(O2-O1)) zero zero]
Jv3 = [cross(Z0,(O3-O0)) cross(Z1,(O3-O1)) Z2 zero]
Jw1 = [Z0 O0 O0 O0]
Jw2 = [Z0 Z1 O0 O0]
Jw3 = [Z0 Z1 O0 O0]
D1 = m1*Jv1'*Jv1 + I1*Jw1'*H01(1:3,1:3)*H01(1:3,1:3)'*Jw1
D2 = m2*Jv2'*Jv2 + I2*Jw2'*H02(1:3,1:3)*H02(1:3,1:3)'*Jw2
D3 = m3*Jv3'*Jv3 
D4 = m4*Jv'*Jv + I4*Jw'*H04(1:3,1:3)*H04(1:3,1:3)'*Jw
D = D1 + D2 + D3 + D4