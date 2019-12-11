clc; clear all;
function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%       P = the permutation matrix
L = eye(n);
P = eye(n);
U = A;
[x,y] = siza(A);
if x==y
    error('Matrix dimensions dont agree')
for i=1:x-1
    [~,max_loc] = max(abs(A(i:x,i)));
    for j = i:x
        if(abs(A(s,x)))==max_loc
            PE = s;
            break;
        end
    end
    U([i,PE],i:x) = U([PE,i],i:x);
    L([i,PE],1:i-1) = U([PE,i],1:i-1);
    P([i,PE],:) = P([PE,i],:);
    for s = i+1:x
        L(s,i) = U(s,i)/U(i,i);
        U(s,i:x) = U(s,i:x)-L(s,i)*U(i,i:x);
    end
    

end
end
end


