function [E] = bissection(A,a,b,tol)
A = hess(A);
lower =a;
upper= b;
P1=0;
P2=1;
bvalues=0;
wvalues = 0;
E = [];
for k=1:size(A)
    if k==1
        c=0;
    else
        c = A(k,k-1);
    end
    z = (A(k,k)-b)*P2 - (c^2)*P1;
    P1=P2;
    P2=z;
    if sign(z) ~= sign(P1) && z~=0
        bvalues = bvalues +1;
    end
end
P1=0;
P2=1;
avalues=0;
for k=1:size(A)
    if k==1
        c=0;
    else
        c = A(k,k-1);
    end
    z = (A(k,k)-a)*P2 - (c^2)*P1;
    P1=P2;
    P2=z;
    if sign(z) ~= sign(P1) && z~=0
        avalues = avalues +1;
    end
end
values= bvalues-avalues;
n = values
d=0;
uvalues=bvalues;
lvalues=avalues;
while n>0
    while upper-lower>tol 
        wvalues=0;
        d = (upper + lower)/2;
        P1=0;
        P2=1;
        for k=1:size(A)
            if k==1
                c=0;
            else
                c = A(k,k-1);
            end
            z = (A(k,k)-d)*P2 - (c^2)*P1;
            P1=P2;
            P2=z;
            if sign(z) ~= sign(P1) && z~=0
                wvalues = wvalues +1;
            end
        end
        if wvalues<uvalues
            lower = d;
            lvalues = wvalues;
        else
            upper= d;
            uvalues = wvalues;
        end
    end
    E= [E d];
    n = n-(uvalues-lvalues);
    upper=lower;
    uvalues=lvalues;
    lower=a;
    lvalues=avalues;
end

