% caja1_x

clear, echo off, clf
global rho beta
x=[2,0.8];
rho=1;
error=1e3;
while error>1e-3
     [u,minf,nit]=hookejeeves(2,x/10,'caja1',x,1e-5);
  % [u,fm]=fminsearch('caja1',x);
rho=10*rho;
error=norm(u-x);
x=u;
fprintf('x1=%8.5f   x2=%8.5f   error=%6.4e\n',x(1),x(2),error)
end
Area=2*(x(1)*x(2)+1/x(1)+1/x(2));
x3=1/(x(1)*x(2));
fprintf('Area=%8.5f   x3=%8.5f\n',Area,x3)
clear
x=[1:0.05:2];
y=[0:0.05:1];
[X,Y]=meshgrid(x,y);
Z=2*(X.*Y+1./X+1./Y);
contour(X,Y,Z,[6.2324,7,8,10]),hold on
line([1.5,1.5],[0,1]),teta=linspace(0,2*pi,180);
x=0.01*cos(teta)+1.5;y=0.01*sin(teta)+0.8165;
plot(x,y,'r','LineWidth',2), text(1.2,0.73,'Area=6.2324')
text(1.2,0.53,'Area=7'),text(1.2,0.4,'Area=8'),text(1.2,0.29,'Area=10')
xlabel('x1'), ylabel('x2')
