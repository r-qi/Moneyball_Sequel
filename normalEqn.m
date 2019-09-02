function [theta] = normalEqn(X, y)
%   normalEqn(X,y) computes the closed-form solution to linear 
%   regression using the normal equations.


theta = pinv(X'*X) * X' * y;

end
