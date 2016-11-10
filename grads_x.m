clear, echo off, clf
f=inline('(x(1)-x(2)^2)^2+(x(2)-1)^2+10','x');
P0=[10,10];% (fila)
% emplea gradf.m  (fila)
[P0,y0,err]=grads(f,'gradf',P0,500,1e-6,1e-6,1)
x=[0:0.1:2];
y=x;
[X,Y]=meshgrid(x,y);
Z=(X-Y.^2).^2+(Y.^2-1).^2+10;
surfc(X,Y,Z),hold on
% contour(X,Y,Z)