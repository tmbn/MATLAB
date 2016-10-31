% dy/dt(1)=-1 si la condicion dice eso, hay que poner el valor e ir
% probando hasta tinarlo.
% d^2y/dx^2+10y=sin(x)   y(0)=2 y'(10)=-1



xspam=[0 10];
yp=@(x,y)[y(2); -10*y(1)+sin(x)];
y0=[2,0.52]; %condicion inicial y(0)=2 va al primero y como y'=10 tnemos  que sacar el numero que produzca el y'(10)=-1 tanteando.
% !!!! Como es y', tomar valor de derecha
[x,y]= ode45(yp,xspam,y0)
plot(x,y(:,1), 'r'), hold on
 
 clear y
 syms x y;
 y=dsolve('D2y+10*y=sin(x)','y(0)=2','Dy(10)=-1', 'x')
 ezplot(y,[0 10])