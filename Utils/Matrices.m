function [X,y]=Matrices(r)
    %INPUT -> Random values for lambda
    %OUTPUT -> Matrix X and vector y
   
    %Use the same Random Seed
    rng(42);
    % ||Xw-y||
    % the function take in input the rand number > 0 which multiplies the
    % Identity matrix
    % y is the  random vector 
    X=readmatrix('Dataset/ML-CUP23-TR.csv');
    %delete the first column (indexes)
    X(:,1)=[];

    %Create scaled identity matrix
    [m,n]=size(X);
    I=eye(m);
    I=r.*I;
    X=[X';I];
    
    [m1,n1]=size(X);
    %Create the random vector y, with the first numbers random and the
    %other values are zero
    y1=randn(n,1);
    y2=zeros(m1-n,1);
    y=[y1;y2];

end
