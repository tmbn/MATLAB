function [P ] = caja1( x )
% para ser usada con caja1_x
global rho beta
g1=1.5-x(1);
f=2*(x(1)*x(2)+1/x(1)+1/x(2));
rho=1e4;
if g1>0
    beta=rho;
else
    beta=0;
end
P=f+beta*g1^2;
end

