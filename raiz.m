clear, echo off
f=@(x)sin(x);
fplot(f,[-2*pi/2 2*pi/2]),hold on
x=linspace(-2*pi/2, 2*pi/2, 9);
y=sin(x);
plot(x,y,'r')
grid
% ptos de intercepccion
g=@(x)sin(5*x^2/4+2)*exp(-0.2*x)
xs=0.2; xi=0;
k=0;
xr(1)=0;
while xs<=10
     xi=xs;xs=xs+0.2;
    fi=g(xi); fs=g(xs);
    if fi*fs<0
        k=k+1;
        x0=(xs+xi)/2;
        xr(k)=fzero(g,x0);        
    end
end
//xr descomentar

