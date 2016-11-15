function [A ] = caja( x )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    A=2*(x(1)*x(2)+1/x(2)+1/x(1));
    if x(1)< 1.5
A=1e6;
end
end
