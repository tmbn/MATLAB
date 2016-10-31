% y'=5exp(5t)(y-t)^2+1; 0<t<1 ; y@=-1
% Resultado real
syms t y 
y=dsolve('Dy=5*exp(5*t)*(y-t)^2+1','y(0)=-1')
ezplot(y,[0 10]), hold on

% Resultado con odes
clear y t
yp=@(t, y) 5*exp(5*t)*(y-t)^2+1;
tspam=[0 10];
y0=[-1];
% [t,y]=ode45(yp,tspam,y0); FALLA!!
[t,y]=ode23s(yp,tspam,y0); %EXITO

plot (t,y,'r')