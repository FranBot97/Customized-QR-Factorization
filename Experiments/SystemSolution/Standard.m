%Script that calculates the residual of the system and the distance between the matlab solution
%and the solution obtained by the factorization algorithms

rng(42);
r=randn();

%ThinQR
[X, y] = Matrices(r);
fprintf("Times: \n\n")
fprintf("thinQR ")
tic;
[Q,R]=ThinQR(X);
c=Q'*y;
wt=R\c;
toc;

%VariantThinQR
fprintf("Variant QR ")
tic;
[Q,R]=VariantThinQR(X);
c=Q'*y;
wv=R\c;
toc;

%VariantQRDirect

fprintf("Variant QR direct ")
tic;
[Qy,R]=VariantThinQRDirect(X,y);
wvm=R\Qy;
toc;

%QR solutions Matlab
[Q,R]=qr(X,'econ');
c=Q'*y;
wm=R\c;

%Solving direct the system
wd=X\y;

% Compute The residual
residual_wt = norm(X * wt - y)/norm(y);
residual_wv = norm(X * wv - y)/norm(y);
residual_wm = norm(X * wm - y)/norm(y);
residual_wd = norm(X * wd - y)/norm(y);
residual_wvm = norm(X * wvm - y)/norm(y);

fprintf("------------------\n")
fprintf("Residuals: \n\n")

% Show the Residuals
disp(['Residual for Thin qr: ', num2str(residual_wt)]);
disp(['Residual for Variant Thin QR: ', num2str(residual_wv)]);
disp(['Residual for Variant Thin QR direct: ', num2str(residual_wvm)]);
disp(['Residual for Matlab qr: ', num2str(residual_wm)]);
disp(['Residual for Direct Solution: ', num2str(residual_wd)]);

fprintf("------------------\n")
fprintf("Difference in norm: \n\n")
%Show the difference btw the direct solutions e various solutions
disp(['Difference in norm between direct solution and  thinqr: ',num2str(norm((wd-wt)/wd))]);
disp(['Difference in norm between direct solution and  thinqr MAT: ',num2str(norm((wd-wm)/wd))]);
disp(['Difference in norm between direct solution and  Variant thinqr: ',num2str(norm((wd-wv)/wd))]);
disp(['Difference in norm between direct solution and  Variant thinqr molt: ',num2str(norm((wd-wvm)/wd))]);

