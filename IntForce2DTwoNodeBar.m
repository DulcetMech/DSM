function [IntForce] = IntForce2DTwoNodeBar(x1, y1, x2, y2, Em, A, eftab, u)
%INTFORCE2DTWONODEBAR Summary of this function goes here
%   Detailed explanation goes here

dx = x2 - x1;
dy = y2 - y1;
L = sqrt(dx^2+dy^2);
c = dx/L;
s = dy/L;

ix = eftab(1);
iy = eftab(2);
jx = eftab(3);
jy = eftab(4);



ubar = [c*u(ix)+s*u(iy) -s*u(ix)+c*u(iy) c*u(jx)+s*u(jy) -s*u(jx)+c*u(jy)];

   e = (ubar(3)-ubar(1))/L;
   
   IntForce = Em*A*e;
end

