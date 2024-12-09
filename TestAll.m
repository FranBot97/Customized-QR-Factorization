%Script that tests all the function
Mypath;

r=randn();
[X,y]=Matrices(r);

disp("Executing SystemSolution Standard..");
run('Experiments/QR/Standard.m');

disp("Executing ThinQR..");
[Q,R]=ThinQR(X);
disp("ThinQR Ok");

c=Q'*y;
wt=R\c;

disp("Executing VariantThinQR..");
[Q,R]=VariantThinQR(X);
disp("VariantThinQR Ok");
c=Q'*y;
wv=R\c;

[Q,R]=qr(X,'econ');
c=Q'*y;
wm=R\c;

[X,y]=Matrices(r);
disp("Executing VariantThinQRDirect..");
[Q,R]=VariantThinQRDirect(X, y);
disp("VariantThinQRDirect ok");

disp("Executing DifferentLambdas..");
DifferentLambdas;
disp("DifferentLambdas OK");

disp("Executing MoreRows..");
MoreRows;

disp("Executing QR Standard..");
Standard;

disp("Executing Gradient..");
Gradient;
