% d^2y/dx^2 + 5dy/dt +y = exp(-x)    y(0)=3   y(10)=5
% Como y(10) no esta con ' ver columna izquierda
xspan=[0 10];
yp=@(x,y)[y(2);-5*y(2)-y(1)+exp(-x)];
y0=[3,169];
[x,y] = ode45 (yp, xspan, y0)
plot (x,y(:,1),'r'), hold on
syms x y
y=dsolve ('D2y+5*Dy+y=exp(-x)','y(0)=3', 'y(10)=5', 'x')
pretty(y)
ezplot(y, [0 10])