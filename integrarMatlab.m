%integrar con matlab 2 variables
g=@(x,y) sin(2*x+3*y);
I=integral2(g,0,pi/4,pi/4,pi/2)
O=dblquad(g,0,pi/4,pi/4,pi/2)
A=I-O

