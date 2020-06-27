clc;
clear all;

NodeTable = [1 0 2;
             2 1 2;
             3 1 1;
             4 2 2;
             5 2 1;
             6 3 4;
             7 3 3;
             8 3 2;
             9 3 0;
             10 4 4;
             11 4 3;
             12 5 3;
             13 5 2]

%               Elem Node1 Node2
Elemtable = [1 1 3;
             2 1 2;
             3 2 3;
             4 2 4;
             5 3 4;
             6 3 5;
             7 4 5;
             8 4 7;
             9 4 8;
             10 5 8;
             11 5 9;
             12 6 7;
             13 7 8;
             14 8 9;
             15 6 10;
             16 7 10;
             17 7 11;
             18 8 11;
             19 10 11;
             20 10 12;
             21 11 12;
             22 11 13;
             23 12 13]

%            Elem x1 y1 x2 y2 Em L
ElemProps = [1 100 1;
             2 100 1;
             3 100 1;
             4 100 1;
             5 100 1;
             6 100 1;
             7 100 1;
             8 100 1;
             9 100 1;
             10 100 1;
             11 100 1;
             12 100 1;
             13 100 1;
             14 100 1;
             15 100 1;
             16 100 1;
             17 100 1;
             18 100 1;
             19 100 1;
             20 100 1;
             21 100 1;
             22 100 1;
             23 100 1]
             

heightOfElemtable = size(Elemtable, 1);
heightOfElemProps = size(ElemProps, 1);

if(heightOfElemtable ~= heightOfElemProps )
    disp('Not equal');
    return;
end

         
BC = [2 17 18]
f = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3]'


nodeArray = size(NodeTable);
Nodes = nodeArray(1);
K = AssembleMasterStiffOfExampleTruss(Nodes, ElemProps, Elemtable, NodeTable);
Kmod = ModifiedMasterStiffnessForDBC(BC, K)
fmod = ModifiedMasterForcesForDBC(BC, f)
u = Kmod\fmod
f = K*u
p = IntForcesOfExampleTruss(u)


