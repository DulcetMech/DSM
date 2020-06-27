function [K] = AssembleMasterStiffOfExampleTruss(nodes, elemProps, elemtable, Nodetable)
%ASSEMBLEMASTERSTIFFOFEXAMPLETRUSS Summary of this function goes here
%   Detailed explanation goes here
% Case 2
K = zeros(nodes*2, nodes*2);
%ElemsInProp = elemProps(:, 1);
EmArray = elemProps(:, 2);
AArray = elemProps(:, 3);

Node1 = elemtable(:, 2);
Node2 = elemtable(:, 3);

NodesIntable = Nodetable(:, 1);
coor1 = Nodetable(:, 2);
coor2 = Nodetable(:, 3);

elemtableArray = size(elemtable(:, 1));
sizeOfElemArray = elemtableArray(1)

for elem = 1:sizeOfElemArray
    elemIndices = find(elemtable(:, 1) == elem);
    foundnode1 = Node1(elemIndices);
    foundnode2 = Node2(elemIndices);
    
    nodeIndices = find(NodesIntable(:) == foundnode1);
    x1 = coor1(nodeIndices(1));
    y1 = coor2(nodeIndices(1));
    
    nodeIndices = find(NodesIntable(:) == foundnode2);
    x2 = coor1(nodeIndices(1));
    y2 = coor2(nodeIndices(1));
    
    indicesElemInProp = find(elemProps(:, 1) == elem);
    Em = EmArray(indicesElemInProp);
    A = AArray(indicesElemInProp);
    
    Ke = ElemStiff2DTwoNodeBar(x1, y1, x2, y2, Em, A);
    K = MergeElemIntoMasterStiff(Ke, returnNodesforElem(elemtable, elem), K);
end

%Ke = ElemStiff2DTwoNodeBar(0, 0, 10, 0, 100, 1)
%K = MergeElemIntoMasterStiff(Ke, [1, 2, 3, 4], K)
%Ke = ElemStiff2DTwoNodeBar(10, 0, 10, 10, 100, 0.5)
%K = MergeElemIntoMasterStiff(Ke, [3, 4, 5, 6], K)
%Ke = ElemStiff2DTwoNodeBar(0, 0, 10, 10, 100, 2*sqrt(2))
%K = MergeElemIntoMasterStiff(Ke, [1, 2, 5, 6], K)

end

