function [Kmod] = ModifiedMasterStiffnessForDBC(pdof, K)
%MODIFIEDMASTERSTIFFNESSFORDBC Summary of this function goes here
%   Detailed explanation goes here
nk = size(K);
np = size(pdof);
Kmod = K;

for k = 1:np(2)
    i = pdof(k);
    for j =1:nk(2)
        Kmod(i, j) = 0;
        Kmod(j, i) = 0;
        Kmod(i, i) = 1;
    end
end
end

