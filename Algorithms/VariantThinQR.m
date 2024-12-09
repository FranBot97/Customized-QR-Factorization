function [Q, R] = VariantThinQR(A)
[m, n] = size(A);
R = A;
Q = eye(m,n);
total=min(m-1,n);

%data structure useful to store the u vectors
ui=cell(1,total);

%The element on the diagonal
diag=(m-n);
for k = 1:total
    % invariant: Q*R = A
    [u,s] = householder_vector(R(k:diag+k, k));
    R(k,k)=s;
    R(k+1:diag+k,k)=0;
    %Compute the submatrix of R
    R(k:diag+k,k+1:end) = R(k:diag+k,k+1:end)-2*u*(u'*R(k:diag+k,k+1:end));
    ui{k}=u;

end
%truncate the values of the R matrix
R=R(1:n,1:n);

% compute matrix Q
i=0;
for k=total:-1:1
    Q(k:end-i,k:end)=Q(k:end-i,k:end)-2*ui{k}*(ui{k}'*Q(k:end-i,k:end));
    i=i+1;
end
