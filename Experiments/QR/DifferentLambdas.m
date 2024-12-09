function DifferentLambdas
   
   %Function that tests different lambdas and measures the difference between solutions
    lambda=[1e5, 1e3 , 1e-2, 1e-4, 1e-7];
 
    for i=1:length(lambda)
        [X, y] = Matrices(lambda(i));
         %  Thin QR and its accuracy
        [Q, R] = ThinQR(X);
        [Q1, R1] = VariantThinQR(X);
        [Q2, R2]=qr(X,'econ');
        
        %Calculation of the norm of the error of different factorizations
        error_1 = norm(X-Q*R)/norm(X);
        error_2=norm(X-Q1*R1)/norm(X);
        error_mat=norm(X-Q2*R2)/norm(X);
        fprintf("\n Thin QR error: %e ,Variant Thin QR error %e, Matlab QR error %e, lambda: %e\n\n", error_1,error_2,error_mat,lambda(i));
    end
