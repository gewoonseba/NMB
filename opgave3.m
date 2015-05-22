function opgave3()
clf reset
X=[5;10;20;40;80;160];
t = [];
for i = 0:(2*pi)/100:2*pi-0.00001
    t = [t;i];
end
y=[];
for i = 1:size(t,1)
        y=[y;sin(t(i))+(cos(4*t(i))/2)];
end
maxss =[];
for k=1:6
    f =[];
    x =[];
    for i=0:2*pi/X(k):2*pi
        x= [x;i];
        f=[f;sin(i)+(cos(4*i)/2)];
    end
    
    spl = periospline(x,f,t);
    ydspl = abs(y-spl);
    maxss=[maxss;max(ydspl)];
    figure
    plot(transpose(t),transpose(ydspl),'-');
end
figure
semilogy(transpose(X),transpose(maxss),'-h');


