function  drawmatriX( A )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
for z=1:5
pl = newplotlist;

x = 1:size(A,2);

    y = abs(A(z,x));
    pl = addplotlist(pl, 'een', x, y, 'b');

figure(z)
doplotlist(pl, 'semilogy');
end
end


