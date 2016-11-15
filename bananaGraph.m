clf
f=@(x) 100*(x(2)-x(1)^2)^2+(1-x(1))^2;
x = [-3:0.1:3];
y=x;
[X,Y]=meshgrid (x,y);
F=100*(Y-X.^2).^2+(1-X).^2;
cs=contour (X,Y,F,[1,0.5,0.2,0.1,0.01,0.001]*1e3); hold on
clabel(cs)