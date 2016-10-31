% Este programa llama a Newt_g.m
% Empezamos definiendo una funcion:
mif=inline('x.^2-2','x');
% Ahora invocamos a la funcion Newt_g
disp('x=Newt_g(mif,5,-2,8,100)')
x=Newt_g(mif,5,-2,8,100)
