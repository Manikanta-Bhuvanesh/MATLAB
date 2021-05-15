%VALIVETI MANIKANTA BHUVANESH
%GOLDEN SECTION SEARCH METHOD
clear
clear all
syms x x1 x2 y
f(x)=(x^2)+(54/x)
a=0;
b=5;
e=0.1;
y=(x*(b-a))+a
f(x)=f(y)
a=0;
b=1;
interval=[a,b]
diff=abs(a-b);
while(diff>e)
    x2=interval(1)+(0.618*diff);
    x1=interval(2)-(0.618*diff);
    p=vpa(f(x1));
    q=vpa(f(x2));
    if (p>q);
    interval=[x1,interval(2)];
    else(p<q);
    interval=[interval(1),x2];
    end
    diff=abs(interval(1)-interval(2));
end
fprintf("Minimum lies in between")
disp(interval)