
function [x] = Untitled(K,c)
persistent R b
if exist('R') == 0,
    b = [];
    R = [];
end
[Q,R] = qr([R;K],0);
b = transpose(Q)*[b;c];
x = R \ b;
end

