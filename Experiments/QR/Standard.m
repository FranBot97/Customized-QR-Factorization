function Standard
    %Function that measures the error of the solution and the distance between the matlab error and the errors obtained with our algorithms
    rng(42)
    r=randn();
    [X, y] = Matrices(r);

     %Thin QR and its error and the time for computing the results
    fprintf("Thin QR ")
    tic;
    [Q, R] = ThinQR(X);
    toc;
    error_1 = norm(X-Q*R)/norm(X);
    
    fprintf("Thin QR error: %e\n\n", error_1);

     % Variant Thin QR and its error and the time for computing the results
    fprintf("Variant Thin QR ")
    tic;
    [Q, R] = VariantThinQR(X);
    toc;
    error_2 = norm(X-Q*R)/norm(X);
    
    fprintf("Variant Thin QR error: %e\n\n", error_2);
    
  
    % Compute matlab QR and its error and the distances btw errors
    [Q1, R1] = qr(X, "econ");
    error_3 = norm(X-Q1*R1)/norm(X);
    fprintf("Matlab QR error: %e\n\n", error_3);
    fprintf("------------------------\n")
    fprintf("Error Difference: \n \n")
    fprintf("Error difference with our Classic Thin QR: %e\n", abs(error_3-error_1));
    fprintf("Error difference with our Variant Thin QR: %e\n", abs(error_3-error_2));
end
