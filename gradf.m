function g=gradf(x)
gradf=[2*(x(1)-x(2)^2),-4*x(2)*(x(1)-x(2)^2)+2*(x(2)-1)];
ng=norm(gradf);
g=-gradf/ng;
