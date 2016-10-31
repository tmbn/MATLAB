% d^2y/dx^2+10y=sin(x)   y(0)=2 y'(10)=-1

n=input('Valor n:');
h=10/n;
x= [h:h:10];
A=zeros(n,n);
d1=linspace(1,1,n-1);
d0=linspace(1,1,n)*(10*h^2-2);
d0(n)=10*h^2-1;
b=h^2*sin(x)
b(1)=b(1)-2;
b(n)=b(n)+h;
A=A+diag(d1, -1)+ diag(d0,0)+diag(d1,1);
y=A\b';
% Añadimos pto. adicional
x=[0,x];
y=[2;y];
plot(x,y, 'r') ,hold on

clear y
syms x y;
y=dsolve('D2y+10*y=sin(x)','y(0)=2','Dy(10)=-1', 'x')
pretty(y)
ezplot(y,[0 10])






