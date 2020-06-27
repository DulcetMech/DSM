function [f] = IntForcesOfExampleTruss(u)
%INTFORCESOFEXAMPLETRUSS Summary of this function goes here
%   Detailed explanation goes here
f = zeros(1, 3);
f(1)=IntForce2DTwoNodeBar(0,0,10,0,100,1,[1,2,3,4],u); 
f(2)=IntForce2DTwoNodeBar(10,0,10,10,100,1/2,[3,4,5,6],u); 
f(3)=IntForce2DTwoNodeBar(0,0,10,10,100,2*sqrt(2), [1,2,5,6],u);

end

