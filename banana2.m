function [P] = banana2( x,rho )
x1=x(1); x2=x(2);
f=100*(x1-x2.^2).^2+(1-x1).^2;
h=(x1-0.5).^2+(x2-0.5).^2-0.25;
P=f+rho*norm(h)^2;
end

%UNTITLED Summary of this function goes here
%   Detailed explanation goes here



