function I = Q_Monte(f_name,a1,b1)
%  I = Q_Monte(f_name,a1,b1) a1 y a2 limites de integracion y f_name
%  formula (( Q_Monte(f=@(x)cos(x),-pi/2,pi/2)  )))
%  Integración Montecarlo 
echo off
% generamos # aleatorios entre 0 y 1
for i=1:10
a(:,1)=rand(16000,1);
b(:,1)=rand(16000,1);
c(:,1)=rand(16000,1);
d(:,1)=rand(16000,1);
e(:,1)=rand(16000,1);
f(:,1)=rand(16000,1);
g(:,1)=rand(16000,1);
h(:,1)=rand(16000,1);
k(:,1)=rand(16000,1);
l(:,1)=rand(16000,1);
% escalamos estos numeros en [0,1] a [a1, b1]
A(:,1)=a1+a(:,1).*(b1-a1);
B(:,1)=a1+b(:,1).*(b1-a1);
C(:,1)=a1+c(:,1).*(b1-a1);
D(:,1)=a1+d(:,1).*(b1-a1);
E(:,1)=a1+e(:,1).*(b1-a1);
F(:,1)=a1+f(:,1).*(b1-a1);
G(:,1)=a1+g(:,1).*(b1-a1);
H(:,1)=a1+h(:,1).*(b1-a1);
K(:,1)=a1+k(:,1).*(b1-a1);
L(:,1)=a1+l(:,1).*(b1-a1);
% Sumamos la funcion
s=sum(feval(f_name,A(:,1))+feval(f_name,B(:,1))+feval(f_name,C(:,1))+feval(f_name,D(:,1))+...
   feval(f_name,E(:,1))+feval(f_name,F(:,1))+feval(f_name,G(:,1))+feval(f_name,H(:,1))+...
   feval(f_name,K(:,1))+feval(f_name,L(:,1)));
I1(i)=(b1-a1)*s/160000;
end
I=sum(I1)/10;
