function f= fsing(z)
x=(1+tanh(z))/2;
f_x = exp(-x.^2)./sqrt(1-x.^2);%%funcion
dxdz=1./(2*cosh(z).^2);
f= f_x.*dxdz
