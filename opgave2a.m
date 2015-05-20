function [y,spl,poly,ydspl,ydpoly] = opgave2a(x,t,bool)
f =[];
y=[];
if bool==0
    for i = 1:size(x,1)
        f=[f;cos(x(i))];
    end
    for i = 1:size(t,1)
        y=[y;cos(t(i))];
    end
else
    for i = 1:size(x,1)
        f=[f;1/(1+6*x(i)^2)];
    end
    for i = 1:size(t,1)
        y=[y;1/(1+6*t(i)^2)];
    end
end
spl = naturalspline(x,f,t);
poly = transpose(lagrangepoly(transpose(x),transpose(f),transpose(t)));
ydspl = y-spl;
ydpoly = y - poly;