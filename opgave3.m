function opgave3()
clf reset
X=[5;10;20;40;80;160];
t=[0;0.8;1.3;1.9;2.4;3;4.1;4.2;5.05;5.6;6;6.28315];
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
    plot(transpose(t),transpose(ydspl),'-h');
end
figure
semilogy(transpose(X),transpose(maxss),'-h');


