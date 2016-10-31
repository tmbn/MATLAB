 
function[S, E, G]=golden(f,a,b,delta,epsilon) 
% [S, E, G]=golden(f,a,b,delta,epsilon)
% Input - f es la función objeto, que se suministra como una cadena ’’ 
% - a y b son los puntos finales del intervalo 
% - delta es la tolerancia para las abscisas 
% - epsilon es la tolerancia para las ordenadas 
% Output - S.(p,yp) contiene la abscisa p y la ordenada yp del mínimo 
% -E.(dp,dy) contiene los límites de error de p y de yp 
% - G es una matriz de nx4: la fila k contiene [ak ck dk bk]; los 
% - valores de a, c, d y b en la iteración k. 
r1=(sqrt(5)-1)/2; 
r2=r1^2; 
h=b-a; 
ya=feval(f,a); 
yb=feval(f,b); 
c=a+r2*h; 
d=a+r1*h; 
yc=feval(f,c); 
yd=feval(f,d); 
k=1; 
A(k)=a;B(k)=b;C(k)=c;D(k)=d; 
while(abs(yb-ya)>epsilon)|(h>delta) 
k=k+1; 
if(yc<yd) 
b=d; 
yb=yd; 
d=c; 
yd=yc; 
h=b-a; 
c=a+r2*h; 
yc=feval(f,c); 
else 
a=c; 
ya=yc; 
c=d; 
yc=yd; 
h=b-a; 
d=a+r1*h; 
yd=feval(f,d); 
end 
A(k)=a;B(k)=b;C(k)=c;D(k)=d; 
end 
dp=abs(b-a); 
dy=abs(yb-ya) 
p=a; 
yp=ya; 
if(yb<ya) 
p=b; 
yp=yb; 

end 
G=[A' C' D' B']; 
S=[p yp]; 
E=[dp dy]; 



