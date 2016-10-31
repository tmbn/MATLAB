function I=Q_Romb(func,a,b,nr,eps)
% I=Q_Romb(func,a,b,nr,eps)
% nr = Número de iteraciones de Romberg
% eps = error máximo
%
h=b-a;
R=zeros(nr,nr);
R(1,1)=0.5*h*(feval(func,a)+feval(func,b));
for i=2:nr
   sum=0;
   for ii=1:2^(i-2)
      sum=sum+feval(func,a+h*(ii-0.5));
   end
   R(i,1)=0.5*(R(i-1,1)+h*sum);
      h=0.5*h;
      for j=2:i
         R(i,j)=(2^(2*(j-1))*R(i,j-1)-R(i-1,j-1))/(2^(2*(j-1))-1);
      end
      if i~=2 
         if abs(R(i,j)-R(i-1,i-1))<eps 
            I=R(i,i);
         end
      end
   end
   R
   if abs(R(nr,nr)-R(nr-1,nr-1))>eps
      disp('No hay Solución para eps pedido')
      end
  