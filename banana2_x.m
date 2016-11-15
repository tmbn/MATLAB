% banana2_x.m
clear, echo off, clf
% Contornos
% Definimos el área donde plotearemos los contornos
u=[-0.5:0.005:1.5]; v=u;
[X,Y]=meshgrid(u,v);
Z=100*(X-Y.^2).^2+(1-X).^2;
cs=contour(X,Y,Z,[1,0.1,0.01,0.005,0.001]*1e3);
clabel(cs), hold on, axis equal,grid
% Esto dibuja el círculo rojo (restricción)
r=0.5;
t=linspace(0,2*pi,300);
x=r*cos(t)+0.5; y=r*sin(t)+0.5;
plot(x,y,'r','LineWidth',2)
% f=100*(x1-x2.^2).^2+(1-x1).^2;
% h=(x1-0.5).^2+(x2-0.5).^2-0.25;
x=[-0.5,-0.5];
rho=1;
Error=1e3;
while Error>1e-8
    % Esto pone círculos en cada punto calculado
    plot(x(1),x(2),'o','LineWidth',1,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','g',...
               'MarkerSize',6),hold on
    [x,P]=fminsearch(@(x)banana2(x,rho),x)
    rho=10*rho;
    
    fprintf('%8.5f   %8.5f   %6.4e\n',x(1),x(2),Error)
    h=(x(1)-0.5)^2+(x(2)-0.5)^2-0.25;
    Error=norm(h)^2;
    
end