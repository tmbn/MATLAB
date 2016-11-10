clear, clc
f=@(x) 100*(x(2)-x(1)^2)^2+(1-x(1))^2;
g=@(x)[-400*x(1)*(x(2)-x(1)^2)+2*(x(1)-1);200*(x(2)-x(1)^2)];
H=@(x) [1200*x(1)^2-400*x(2)+2,-400*x(1); -400 *x(1),200];
x=[2;2];%valor inicial
error=1e3;
while error>1e-5
    gv=g(x); Hm=H(x);
    d=-gv
    alfa=-gv'*d/(d'*Hm*d);
    x=x+alfa*d;
    gv=g(x);
    
    beta=gv'*Hm*d/(d'*Hm*d);
    d=-gv+beta*d;
    error=norm(gv);
    fprintf('%8.5f %8.5f %6.4e\n', x(1), x(2), error);
end
    
    