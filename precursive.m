function [z]=precursive(A,k)
syms x;
if k==-1
    z=0;
elseif k==0
    z=1;
else 
    if k==1
        b=0;
    else
        b = A(k,k-1);
    end
    z = (A(k,k)-x)*precursive(A,k-1) - (b^2)*precursive(A,k-2);
end
