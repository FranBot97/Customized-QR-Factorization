function [Q_y,R] = VariantThinQRDirect(A,y)
%This algorithm computes directly the product Qy
[m, n] = size(A);
R = A;

total=min(m,n);
Q_y=y;

%the element on the diagonal
diag=m-n;
for k = 1:total
    % invariant: Q*R = A

    [u,s] = houseolder_vector(R(k:diag+k, k));
    %Compute the matrix R  
    R(k,k)=s;
    R(k+1:diag+k,k)=0;
    R(k:diag+k,k+1:end) = R(k:diag+k,k+1:end)-2*u*(u'*R(k:diag+k,k+1:end));
    %Compute the matrix Q
    Q_y(k:diag+k)=Q_y(k:diag+k)-2*u*(u'*Q_y(k:diag+k));
   
end
%returns only the useful part
R=R(1:n,1:n);
Q_y=Q_y(1:n);
