function [x]=explore(h,n,f,x0)
% Se usa con hookejeeves.m
% global p m M phi i2
x = x0; f0 = feval(f,x);
for i=1:n
  x(i) = x(i) + h(i);  ff = feval(f,x);
  if ff < f0,    f0 = ff;   else
    x(i) = x0(i) - h(i);   ff = feval(f,x);
    if ff < f0,   f0 = ff;   else,   x(i) = x0(i);   end
  end
end
