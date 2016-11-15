function [x,minf,nit]=hookejeeves(n,h,f,x0,toll)
% 
% x y H son vectores y H puede empezar como un décimo del valo original
% [x,minf,nit]=hookejeeves(n,h,f,x0,toll)
% n: Número de variables
% h: Step size
% Por ej.  La función,  'Colville'
% toll: Tolerancia, i.e. 1e-8
% Usa función: explore.m
%
x = x0; minf = feval(f,x); nit = 0;
while max(h) > toll
  [y] = explore(h,n,f,x);
  if y == x,  h = h/2; else
    x = 2*y-x;     [z] = explore(h,n,f,x);
    if z == x,   x = y;  else,   x = z;  end
  end
  nit = nit +1;
  if nit >1500
      break
  end
end
minf = feval(f,x);
return