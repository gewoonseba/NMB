function  drawRes( A )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
pl = newplotlist;
x = 1:size(A,2);
y = A(x);
res_transp = transpose(A);
iterations = transpose(x);
input.data = [iterations res_transp];
input.tableColLabels = {'Iterations','Residual'};
input.tableColumnAlignment = 'c';
input.tableBorders = 1;
input.tableCaption = 'My Table';
input.tableLabel = 'MyLabel';
input.dataFormat = {'%i',1,'%.2s',1};
latex = latexTable(input);
pl = addplotlist(pl, 'een', x, y, 'b');
figure(1)
doplotlist(pl, 'semilogy');
end

