function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
%falsePosition finds the root of a function using false position method
%inputs: 
%func - function name
%maxit - max number of iterations
%es - relative error we want
%varargin - any extra paramaters
%xl - lower guess
%xu - upper guess
%outputs:
%root - the estimated root location
%fx - the function evaluated at the root location
%ea - the approximate relative error (%)
%iter - how many iterations were performed
if nargin < 3
    error('Not enough input arguments')
end
test = func(xl,varargin{:})*func(xu,varargin{:}));
if test > 0
    error('sign does not change')
end
if nargin < 4 || isempty(es)
    es = 0.0001;
end
if nargin < 5 || isempty(maxit)
    maxit = 200;
end
ea = 100;
xr = xl;
iter = 0;
while (1)
    xrold = xr;
    xr = xu-((fun(xu)*(xl-xu))/(func(xl)-fun(xu)));
    iter = iter + 1;
    if xr ~= 0 
        ea = abs((xr-xrold)/xr)*100;
    end
    test = func(xl,varargin{:})*func(xr,varargin{:});
    if test < 0 
        xu = xr;
    elseif test > 0 
        xl = xr;
    else ea = 0; 
    end 
    if ea <= es || iter >= maxit
        break
    end
end
root = xr;
fx = func(xr,varargin{:});

end

