clear, clc
n=input('Entre valor de n:');
h=10/(n+1);
x=[h:h:10-h];
k2=9;
d1=linspace(1,1,n-1);
d0=linspace(1,1,n)*(9*h^2-2);
A=zeros(n,n);
A=A+diag(d1,1) + diag(d1,-1) +diag(d0,0);
b=h^2*exp(-x)';
y=A\b;
y=[0;y;0]; %anado cond de borde
x=[0,x,10];
plot(x,y, 'r'), hold on


syms x y
y=dsolve('D2y+9*y=exp(-x)','y(0)=0', 'y(10)=0', 'x')
pretty (y)
ezplot(y, [0 10])

