function [Ke] = ElemStiff2DTwoNodeBar(x1, y1, x2, y2, Em, A)
%ELEMSTIFF2DTWONODEBAR Summary of this function goes here
%   Detailed explanation goes here
dx = x2 - x1;
dy = y2 - y1;
L = sqrt(dx^2+dy^2);
c = dx/L;
s = dy/L;
Ke=(Em*A/L)* [ c^2, c*s, -c^2, -c*s;  c*s, s^2,-s*c,-s^2; -c^2,-s*c, c^2, s*c; -s*c,-s^2, s*c, s^2];
end

