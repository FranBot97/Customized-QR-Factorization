function [wt,wv,wm,X,y]=Solvefun
    %This function returns the solution of the least squares problem with
    %the various Methods
    rng(42);
    r=randn();
    % create the matrices from the Dataset
    [X,y]=Matrices(r);
    
    %compute the QR factorization thin QR
    [Q,R]=ThinQR(X);
    c=Q'*y;
    wt=R\c;
      
    %Obtain the solutions with VariantThinQR
    [Q,R]=VariantThinQR(X);
    c=Q'*y;
    wv=R\c;

    %Obtain the Solution with MatlabQR
    [Q,R]=qr(X,'econ');
    c=Q'*y;
    wm=R\c;
    
end
