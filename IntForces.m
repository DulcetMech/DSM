function [f] = IntForces(u, elemsTable, elemsProp, nodeTable)
%INTFORCESOFEXAMPLETRUSS Summary of this function goes here
%   Detailed explanation goes here



EmArray = elemsProp(:, 2);
AArray = elemsProp(:, 3);

Node1 = elemsTable(:, 2);
Node2 = elemsTable(:, 3);

NodesIntable = nodeTable(:, 1);
coor1 = nodeTable(:, 2);
coor2 = nodeTable(:, 3);

sizeOfElemArray = size(elemsTable(:, 1), 1);
f = zeros(sizeOfElemArray, 1);

for elem = 1:sizeOfElemArray
    elemIndices = find(elemsTable(:, 1) == elem);
    foundnode1 = Node1(elemIndices);
    foundnode2 = Node2(elemIndices);
    
    nodeIndices = find(NodesIntable(:) == foundnode1);
    x1 = coor1(nodeIndices(1));
    y1 = coor2(nodeIndices(1));
    
    nodeIndices = find(NodesIntable(:) == foundnode2);
    x2 = coor1(nodeIndices(1));
    y2 = coor2(nodeIndices(1));
    
    indicesElemInProp = find(elemsProp(:, 1) == elem);
    Em = EmArray(indicesElemInProp);
    A = AArray(indicesElemInProp);
    
    f(elem)=IntForce2DTwoNodeBar(x1, y1, x2, y2, Em, A,returnNodesforElem(elemsTable, elem),u); 
    
end

end

