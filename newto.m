disp('Prob. #2 ')
% x^2+3*y*x-z*x-6=0
% 3*x*y^2+3x*z-7=0
% 8*x*y*z-3*x*z^2-10=0
% syms x y z
% f=[x^2+3*y*x-z*x-6;3*x*y^2+3*x*z-7;8*x*y*z-3*x*z^2-10]
% J=jacobian(f,[x,y,z])
% pause
clear all
x=[-10;10]; error=1e3;
fprintf(' x           y        error\n')

while error>1e-5
J(1,1)=6*x(1) - 3*x(2) ;     J(1,2)=10*x(2) - 3*x(2);
J(2,1)=x(2)^2 - 6*x(1)*x(2); J(2,2)=- 3*x(1)^2 + 2*x(2)*x(1) + 2*x(2);
f=[3*x(1)^2-3*x(1)*x(2)+5*x(2)^2-5; x(1)*x(2)^2-3*x(1)^2*x(2)+x(2)^2-2];
del=-J\f;
x=x+del;
error=norm(del);

fprintf(' %8.4f  %8.4f   %8.4e\n',x(1),x(2),error)
end
% disp(' Con fsolve: ')
% g=@(x)[x(1)^2+3*x(2)*x(1)-x(3)*x(1)-6;3*x(1)*x(2)^2+3*x(1)*x(3)-7;...
%     8*x(1)*x(2)*x(3)-3*x(1)*x(3)^2-10];
% [x0,fm]=fsolve(g,[4,-1,-0.31])