clear, clc
x=[2;2];
error=1e3;
k=0;
while error >=1e-5
    g=[-400*x(1)*(x(2)-x(1)^2)+2*(x(1)-1); 200 *(x(2)-x(1)^2)];
    H(1,1)=1200*x(1)^2-400*x(2)+2;
    H(1,2)=-400*x(1);
    H(2,1)=H(1,2);
    H(2,2)=200;
    d=-H\g;
    [alfa,P]=fminsearch(@(alfa) fnm(alfa,x,d),1);
    error= norm(d);
    x=x+alfa*d;
    k=k+1;
    fprintf('%8.5f %8.5f %6.4e %4i \n',x(1),x(2),error, k);
    
end
    