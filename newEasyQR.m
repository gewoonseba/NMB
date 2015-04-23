function [x] = newEasyQR(K,c)
persistent R b
if exist('R') == 0,
    b = [];
    R = [];
end
A = [R;K]
b = [b;c]
m = size(A,1);
n = size(A,2);
I = eye(m,n);
for k = 1:n
    x = A(k:m,k);
    v = sign(x(1))*norm(x)*I(k:m,k)+x;
    v = v/norm(v);
    A(k:m,k:n) = A(k:m,k:n) - 2*v*(transpose(v)*A(k:m,k:n));
    b(k:m) = b(k:m) - 2*v*(transpose(v)*b(k:m));
end
R = A;
x = R\b;
end