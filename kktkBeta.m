f=@(x) (x(1)+2*x(2))^2-3*x(1)*x(2)+2*x(1)^2-3*x(1)-6*x(2)+5;
[x,fm]=fminsearch(f,[2,2])