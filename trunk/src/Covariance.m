function C=Covariance(X)
    % Return covariance given data matrix X (row = object, column = feature)

    [n,k]=size(X);
    Xc=X-repmat(mean(X),n,1);   % centered data
    C=Xc'*Xc/n;                 % covariance

end