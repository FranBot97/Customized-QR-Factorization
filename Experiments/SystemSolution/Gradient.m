%Script that checks whether the value of the gradient approaches zero

rng(42);
r=randn();

%thinQR
[X, y] = Matrices(r);
[Q,R]=ThinQR(X);
c=Q'*y;
wt=R\c;

%VariantThinQR
[Q,R]=VariantThinQR(X);
c=Q'*y;
wv=R\c;

%VariantQR Direct
[Qy,R]=VariantThinQRDirect(X,y);
wvm=R\Qy;

%Using Matlab QR
[Q,R]=qr(X,'econ');
c=Q'*y;
wm=R\c;


%Solving direct the system
wd=X\y;

%compute the gradient
Rwd=X'*X*wd-X'*y;
Rwt=X'*X*wt-X'*y;
Rwv=X'*X*wv-X'*y;
Rwvm=X'*X*wvm-X'*y;
fprintf("Residuals: \n\n")
disp(['Residual for MatlabQR, Gradient: ', num2str(norm(Rwd))]);
disp(['Residual for ThinQR, Gradient: ', num2str(norm(Rwt))]);
disp(['Residual for VariantQR, Gradiente: ', num2str(norm(Rwv))]);
disp(['Residual for Variant Multi QR, Gradiente: ', num2str(norm(Rwvm))]);
