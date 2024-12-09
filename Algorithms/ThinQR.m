function [Q, R] = ThinQR(A)

[m, n] = size(A);
R = A;
Q = eye(m,n);
total=min(m-1,n);
ui=cell(1,total);
%data structure useful to store the u vectors

for k = 1:total
    % invariant: Q*R = A
    [u,s] = householder_vector(R(k:end, k));
    %compute Matrices R
    R(k,k)=s;
    R(k+1:end,k)=0;
    R(k:end,k+1:end) = R(k:end,k+1:end)-2*u*(u'*R(k:end,k+1:end));
    %save the vector u
    ui{k}=u;
end

%truncate the values of R matrix
R=R(1:n,1:n);

% compute matrix Q
for k=total:-1:1
    Q(k:end,k:end)=Q(k:end,k:end)-2*ui{k}*(ui{k}'*Q(k:end,k:end));
end
