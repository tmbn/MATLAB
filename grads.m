function[P0,y0,err]=grads(F,G,P0,max1,delta,epsilon,show)
% Input:  - F es la función objeto de entrada como cadena 'F'
%         - G = -(1/norm(grad F)*grad F; la dirección de búsqueda
%               de entrada como cadena 'G'
%         - P0 es el punto inicial 
%         - max1 es el máximo número de ieraciones
%         - delta es la tolerancia para hmin en la minimización en una variable
%           (parámetro) en la dirección de búsqueda
%         - epsilon es la tolerancia para el error en y0
%         - show;  si show ==1 las iteraciones son desplegadas
% Output: - P0 es el punto del mínimo
%         - y0 es el valor de la función F(P0)
%         - err es el límite de error para y0
%         - P es el vector que contiene las iteraciones

if nargin==5, show=0;end
[mm n]=size(P0)
maxj=10;big=1e8;h=1;
P=zeros(maxj,n+1);
len=norm(P0);
y0=feval(F,P0);
if (len>1e4), h=len/1e4;end
err=1;cnt=0;cond=0;
P(cnt+1,:)=[P0 y0];
while(cnt<max1&cond~=5&(h>delta|err>epsilon))
   % Calcule la dirección de búsqueda
   S=feval(G,P0);
   % Empiece minimización cuadrática de un sólo parámetro
   P1=P0+h*S;
   P2=P0+2*h*S;
   y1=feval(F,P1);
   y2=feval(F,P2);
   cond=0;j=0;
   while(j<maxj&cond==0)
      len=norm(P0);
      if (y0<y1)
         P2=P1;
         y2=y1;
         h=h/2;
         P1=P0+h*S;
         y1=feval(F,P1);
      else
         if(y2<y1)
            P1=P2;
            y1=y2;
            h=2*h;
            P2=P0+2*h*S;
            y2=feval(F,P2);
         else
            cond=-1;
         end
      end
      j=j+1;
      if(h<delta), cond=1;end
      if(abs(h)>big|len>big),cond=5;end
   end
   if(cond==5)
      Pmin=P1;
      ymin=y1;
   else
      d=4*y1-2*y0-2*y2;
      if(d<0)
         hmin=h*(4*y1-3*y0-y2)/d;
      else
         cond=4;
         hmin=h/3;
      end
      % Construya siguiente punto
      Pmin=P0+hmin*S;
      ymin=feval(F,Pmin);
      % Determine magnitud de h
      h0=abs(hmin);
      h1=abs(hmin-h);
      h2=abs(hmin-2*h);
      if(h0<h),h=h0;end
      if(h1<h),h=h1;end
      if(h2<h),h=h2;end
      if(h==0),h=hmin;end
      if(h<delta),cond=1;end
      % Test de terminación para la minimización
      e0=abs(y0-ymin);
      e1=abs(y1-ymin);
      e2=abs(y2-ymin);
      if(e0~=0&e0<err),err=e0;end
      if(e1~=0&e1<err),err=e1;end
      if(e2~=0&e2<err),err=e2;end
      if(e0==0&e1==0&e2==0),err=0;end
      if(err<epsilon),cond=2;end
      if(cond==2&h<delta),cond=3;end
   end
   cnt=cnt+1;
   P(cnt+1,:)=[Pmin ymin];
   P0=Pmin;
   y0=ymin;
end
if(show==1)
   disp(P);
   end
      