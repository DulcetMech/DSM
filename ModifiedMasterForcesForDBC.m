function [fmod] = ModifiedMasterForcesForDBC(pdof, f)
%MODIFIEDMASTERFORCESFORDBC Summary of this function goes here
%   Detailed explanation goes here
np = size(pdof);
fmod = f;

for k = 1:np
    i = pdof(k);
    fmod(i) = 0;
end
end

