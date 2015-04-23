function compareRayleighShiftBisection()
dim = 10;
dims = [];
rayleighTimes = [];
bisectionTimes = [];
for n=1:6
    dim = dim*2;
    dims = [dims ; dim];
    diag = rand(1,dim);
    sDiag = rand(1,dim-1);
    A = full(gallery('tridiag',dim,sDiag,diag,sDiag));
    tic;
    qr_shiftRayleigh(A);
    rayleighTime = toc;
    rayleighTimes = [rayleighTimes; rayleighTime];
    tic;
    bissection(A);
    bisectionTime = toc;
    bisectionTimes = [bisectionTimes; bisectionTime];
end
pl = newplostlist();
pl = addplotlist(pl,'Rayleigh shift', dims, rayleighTimes,'b');
pl = addplotlist(pl,'Bisection', dims, bisectionTimes,'g');
doplotlist(pl,'plot');        
end