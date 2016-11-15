function P = penalty_func(x)
global rho beta


f=2*x(1)^2+x(1)*x(2)+2*x(2)^2-6*x(1)-6*x(2)+15;
g1=x(1)+2*x(2)-5;
g2=4*x(1)-7;
g3=x(2)-2;
h=-2*x(1)+2*x(2)+1;

    if g1<=0
        beta(1)=0;
    else
        beta(1)=rho;
    end
    if g2<=0
        beta(2)=0;
    else
        beta(2)=rho;
    end
    if g3<=0
        beta(3)=0;
    else
        beta(3)=rho;
    end

    P=f+rho*h^2+beta(1)*g1^2+beta(2)*g2^2+beta(3)*g3^2;
    