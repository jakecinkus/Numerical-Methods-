function [A] = specialMatrix(n,m)
% This function should return a matrix A as described in the problem statement
% Inputs n is the number of rows, and m the number of columns
n = input('Number of rows?');
m = input('Number of columns?');
% It is recomended to first create the matrxix A of the correct size, filling it with zeros to start with is not a bad choice
A = zeros(n,m);
if nargin >2
    error ('Incorrect amount of arguments')
end

% Now the real challenge is to fill in the correct values of A
for i = 1:n
    for k = 1:m
        if i == 1
            A(i,k) = k;
        elseif k == 1
            A(i,k)=i;
        else
            A(i,k)=A(i-1,k)+A(i,k-1);
        end
    end
end
disp(A)


end
% Things beyond here are outside of your function