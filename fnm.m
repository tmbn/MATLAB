function [P]= fnm(alpha,x,d);
    %newton mejorado
    x=x+alpha*d;
    P=100*(x(2)-x(1)^2)^2+(1-x(1))^2;
end