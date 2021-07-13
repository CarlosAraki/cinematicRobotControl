function [dy] = PPP (y, A, F)

% y = matriz(4,1)
% y1 = d1 = y(1,1)
% y2 = d1' = y(2,1)
% y3 = d2 = y(3,1)    
% y4 = d2' = y(4,1)
% y5 = d3 = y(5,1)
% y6 = d3' = y(6,1)
% y7 = theta4 = y(7,1)
% y8 = theta4' = y(8,1)

dy=A*y+F;
end