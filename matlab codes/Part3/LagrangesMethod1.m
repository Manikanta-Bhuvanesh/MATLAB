%VALIVETI MANIKANTA BHUVANESH
%19BCD7088
%LagrangesMethod
clc
clear all
syms x y lam
a=x*y
b=x^3+y^4-1
L=a + lam *b
dx=diff(L,x)==0
dy=diff(L,y)==0
dlam=diff(L,lam)==0
[x,y,lam]=solve(dx,dy,dlam,x,y,lam,'Real',true);
vpa(x)
vpa(y)
vpa(lam)
