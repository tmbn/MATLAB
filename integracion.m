%con rango

% d^2y/dt^2+3dy/dt+2y=sint

syms t y
y=dsolve('D2y-3*Dy+2*y=sin(t)','y(0)=1', 'Dy(0)=0');
ezplot(y, [0, 10]), hold on

yp=@(t,y)[y(2); +3*y(2)-2*y(1)+sin(t)];%revisar signos
y0=[1 0];
tspan=[0 10];
[t, y] = ode45(yp, tspan, y0);
plot(t,y(:,1),'r')