function  drawRes( A )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
pl = newplotlist;
x = 1:size(A,2);
y = A(x);
pl = addplotlist(pl, 'een', x, y, 'b');
figure(1)
doplotlist(pl, 'semilogy');
end

