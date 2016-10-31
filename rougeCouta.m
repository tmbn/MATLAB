% d2y/dt^2 + 5dg/dt + y= exp(t)
% d^2g/dt^2 + 4g - 5dy/dt= sin(t)


yp=@(t ,y)[y(2);-5*y(4)-y(1)+exp(-t); y(4);-4*y(3)+5*y(2)+sin(t)]
tspam=[0 10];
y0=[0 2 -1 1];
[t,y]=ode45(yp, tspam,y0)%rougeCouta ode45
plot(t,y(:,1),t,y(:,3),'r')
