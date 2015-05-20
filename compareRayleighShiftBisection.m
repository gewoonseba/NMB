function compareRayleighShiftBisection()
dim = 10;
dims = [];
rayleighTimes = [];
bisectionTimes = [];
for n=1:6
    disp('Matrix');
    disp(n);
    dim = dim*2;
    dims = [dims ; dim];
    A = rand(dim);
    A = A+transpose(A);
    A = hess(A);
    eigenvalues = eigs(A,7,'la')
    upper = eigenvalues(1) + 1
    lower = eigenvalues(7)
    tic;
    Shiftrayleigh2(A);
    rayleighTime = toc;
    rayleighTimes = [rayleighTimes; rayleighTime];
    tic;
    bisectionEigs = bissection(A,lower,upper,1.e-12);
    bisectionTime = toc;
    while size(bisectionEigs) < 7
        disp('lower wordt kleiner gemaakt');
        lower = lower - 0.1;
        tic;
        bisectionEigs = bissection(A,lower,upper,1.e-13);
        bisectionTime = toc;
    end
    bisectionTimes = [bisectionTimes; bisectionTime];
end
pl = newplotlist;
pl = addplotlist(pl,'Rayleigh shift', dims, rayleighTimes,'b');
pl = addplotlist(pl,'Bisection', dims, bisectionTimes,'g');
doplotlist(pl,'plot');        
end