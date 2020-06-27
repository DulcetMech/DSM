function [dofs] = returnNodesforElem(table, elem)
%RETURNNODESFORELEM Summary of this function goes here
%   Detailed explanation goes here

nodes = table(elem);
dofs = zeros(1, 4);

indicesElem = find(table(:, 1) == elem);

dofs(1) = table(indicesElem, 2)*2 -1; 
dofs(2) = table(indicesElem, 2)*2;
dofs(3) = table(indicesElem, 3)*2 -1;
dofs(4) = table(indicesElem, 3)*2;

end

