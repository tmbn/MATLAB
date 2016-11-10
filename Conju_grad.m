clear,echo off
% Minimize:  f dada en fg33_g.m
% la gradiente es: g 
% La matriz Hesiana es: a
%n=input('Enter N: ');
n=3;
for i=1:n
   disp('  ')
   x(i)=input(strcat('x(',num2str(i),')= '));
end
tic
u=[x(1) x(2) x(3)];% guardamos valores iniciales de x
[y,gf,a]=fg33_g(u);
go=gf;
g=go;
h=-go;
iter=0;
Error=1e3;% Inicializamos
fprintf('      x1           x2            x3           f         #iter)\n')
while Error > 1e-6 
   denom1=h'*a*h+eps;
     alfa=-g'*h./denom1;
     x=x+alfa*h';
    [y, gf,a]=fg33_g(x);
  g=gf;
  go=g;
  beta=g'*a*h./denom1; %CGM
  h=-g+beta*h;
 iter=iter+1;
Error=gf'*gf;
     fprintf(' %8.4f      %8.4f       %8.4f       %8.4f    %3i\n',x(1),x(2),x(3),y,iter)
end
toc
tic
 disp('***********Usando fminsearch:***************')
 disp('  ')
 f=@(x)8*(x(1)-1)^2+2*x(2)^2+3*((x(3)-3)^2)*(x(1)-2)^2;

 [x,fm]=fminsearch(f,u)
 toc
 disp('  ')
 disp('************Con Hooke&Jeeves*****************')

  x0=u;h=abs(u)./10;tol=1e-8; n=3;
 [x,minf,nit]=hookejeeves(n,h,f,x0,tol)
 