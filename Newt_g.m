function x= Newt_g(f_nombre, x0, xmin, xmax, n_puntos)
% x0 aproximación inicial
% xmin, xmax eje x para el gráfico
% n_puntos  para el gráfico, n_puntos >=100
disp('')
clf, hold off
% Metodo de Newton con ilustracion grafica
del_x=0.0001;
wid_x= xmax-xmin;
dx=(xmax-xmin)/n_puntos;
xp=xmin:dx:xmax;
yp=feval(f_nombre,xp);
plot(xp,yp), xlabel('x'), ylabel('f(x)'), title('Iteracion de Newton'),hold on
ymin=min(yp);
ymax=max(yp);
wid_y=ymax-ymin;
yp=0.*xp;
plot(xp,yp)
x=x0;
xb=x+999;
n=0;
while abs(x-xb) >0.000001
   if n>300 break;end
   y=feval(f_nombre,x);
   plot([x,x],[y,0]);
   plot(x,0,'o')
   fprintf('  n=%3.0f, x=%12.5e, y=%12.5e\n',n,x,y);
   xsc=(x-xmin)/wid_x;
   if n>4, text(x,wid_y/20, [num2str(n)]),end
   y_deriv= (feval(f_nombre,x+del_x)-y)/del_x;
   xb=x;
   x = xb-y/y_deriv;
   n=n+1;
   plot([xb,x],[y,0])
end
plot([x,x],[0.05*wid_y 0.2*wid_y])
text(x,0.2*wid_y, 'Solucion final')
plot([x (x-wid_x*0.004)],[0.01*wid_y 0.09*wid_y])
plot([x (x+wid_x*0.004)],[0.01*wid_y 0.09*wid_y])
   
   

