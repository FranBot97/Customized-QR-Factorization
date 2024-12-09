%Script that tests different matrix dimensions, keeping the structure and varying only the rows
diffdim=[200,300,500];
format long;
rng(42);
for i=1:length(diffdim)
    A1=rand(diffdim(i),1000);
    lambda=randn();
    A2=lambda*eye(1000,1000);
    A=[A1;A2];
    fprintf("            Dimension: %d x %d \n\n",diffdim(i)+1000,1000)
    %Variant QR
    fprintf("Variant thin QR ")
    tic;
    [Q, R] = VariantThinQR(A);
    toc;
    %compute the error
    accuracy_1 = norm(A-Q*R)/norm(A);
    fprintf("Variant thin QR error: %e\n\n", accuracy_1);
    
    %thin QR
    fprintf("Thin QR ")
    tic;
    [Q, R] = ThinQR(A);
    toc;
    %compute the error
    accuracy_2 = norm(A-Q*R)/norm(A);
    fprintf("Classic Thin QR error: %e\n\n", accuracy_2);
    fprintf("---------------------------------\n\n")
end
