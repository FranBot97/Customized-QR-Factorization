function [u,s] = householder_vector(x)

% returns the vector u (already normalized so that ||u||=1) such that
% H*x is amultiple of e_1 (first vector of canonical basis
s=norm(x);
%Solve the problem of numerical stability
if x(1) >=0
    s=-s;
end
v=x;
v(1)=v(1)-s;
u=v/norm(v);
end
