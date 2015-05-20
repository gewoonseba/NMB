function [a,b,c,d,e,f] = cirkel(x,y)
%function that returnes an elllips approximating the given (x,y) points
%given by the vectors x and y.

A=[];
B=zeros(size(x));
size(x,1)
for i=1:size(x,1)
    
    B(i)= -(x(i)^2+y(i)^2);
    F= [x(i) y(i) 1];
    A=[A;F];
end
[Q,R] = qr(A,0);

Z = R\(transpose(Q)*B);
b = 0;
c = 1;
d = Z(1);
e = Z(2);
f = Z(3);
a = 1;
hold on
fh = @(xi,yi) a*xi^2 + 2*b*xi*yi + c*yi^2 + d*xi + e*yi +f;
ezplot(fh)
plot(transpose(x),transpose(y),'o')
hold off