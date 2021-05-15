%VALIVETI MANIKANTA BHUVANESH
%19BCD7088
%NewtonRaphsonMethod
clc;
clear all;
syms x;
f=(x^2)+(54/x)
g=diff(f)
r=diff(f,2)
e=0.0005;
x0=1;
RUN=true;
while(RUN)
    f0=subs(g,x,x0);
    f1=subs(r,x,x0);
    x1=x0-(f0/f1);
    o=abs(subs(g,x,x1));
    if(o<e)
        RUN=false;
    end
    x0=x1;
end
disp(vpa(x1))
