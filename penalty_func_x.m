clear, echo off
global rho beta
x=[10,10];
error=1e3;
rho=1;
while error >1e-6
[u,fm]=fminsearch('penalty_func',x);
error=norm(u-x);
x=u;
fprintf('x1=%8.5f   x2=%8.5f   error=%6.4e\n',x(1),x(2),error)
rho=10*rho;
end