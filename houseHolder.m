function [R] = houseHolder(A)
m = size(A,1);
n = size(A,2);
I = eye(n);
for k = 1:n
    x = A(k:m,k);
    v = sign(x(1))*norm(x)*I(k:n,k)+x;
    v = v/norm(v);
    A(k:m,k:n) = A(k:m,k:n) - 2*v*(transpose(v)*A(k:m,k:n));
end
R = A;
end