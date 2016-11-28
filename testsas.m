
% 
% n=input('Entre valor de n: ');
% h=5/(n+1);
% x=[h:h:5-h];
% d0=h^2*x-2;
% d1=linspace(1,1,n-1);
% b=h^2./(1+x); % fila
% b(1)=b(1)-1;
% A=zeros(n,n);
% A=A+diag(d0,0)+diag(d1,-1)+diag(d1,1);
% y=A\b';
% x=[0,x,5];
% y=[1;y;0];
% figure(2)
% plot(x,y),grid
% disp('Pulse una tecla para continuar')
% pause
% clear
% xs=[0 10];
% y0 = [1/2;4.7655]; % para y(10)=0

y=dsolve('D2y+3*y=exp(-x)','y(0)=2','Dy(10)=-1', 'x')
% pretty(y)
ezplot(y,[0 10])