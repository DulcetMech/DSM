function [K] = MergeElemIntoMasterStiff(Ke,eftab, Kin)
%MERGEELEMINTOMASTERSTIFF Summary of this function goes here
%   Detailed explanation goes here
K = Kin;

sizeOfK = size(K);


for i=1:4
    ii=eftab(i);
    for j=1:4
        jj=eftab(j);
        K(jj,ii) = K(jj,ii) + Ke(i,j); 
        
    end
end
        
end

