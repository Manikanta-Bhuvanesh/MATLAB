%VALIVETI MANIKANTA BHUVANESH
%19BCD7088
%Game theroy
clc
clear all
A=[1 3 1;0 -4 -3;1 5 -1]
maxi=max(A)
maxmin=min(maxi)
mini=min(A,[],2)
minmax=max(mini)
if(minmax==maxmin)
    r=find(mini==minmax)
    c=find(maxi==maxmin)
    fprintf("Saddel point is available")
    fprintf("A is giving " )
    disp(r)
    fprintf("B is giving ")
    disp(c)
    fprintf("Value of thr game is " + minmax)
end
