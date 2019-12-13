function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
l = length(x);
k = l-1;
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated
%error
if length(x) ~= length(y)
    error('non matching lenghts')
end
c = linspace(x(1),x(l),l);
if isequal(x,c) == 0
    error ('non linear spacing')
end
if mod(k,2) == 0 
    b = 3; I1 = 0;
    while b<= k-1
       I1 = I1+y(b);
        b = b+2;
    end
    j = (x(l)-x(1))/(l-1);
    I = j*(y(1)+(4+i2)+(2*i1)+y(l))/3
else
    I1 = 0
    b = 3
    while b <= k-2
        I1 = I1+y(b);
        b = b+2;
    end
    d = 2;
    I2 = 0
    while d <= k-1;
        I2 = i2+y(d)
        d = d+2;
    end
    i3 = (x(l)-x(l-1))*(y(l)+y(l-1))/2;
    j = (x(l-1)-x(1))/(k-1);
    I = (j*(y(1)+(4*i2)+(2*i1)+y(l-1))/3)+i3;
end
end