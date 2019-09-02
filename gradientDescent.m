function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%gradientDescent Performs gradient descent to learn theta
%   taking predetermined num_iters gradient steps with learning rate alpha

m = length(y); % number of training examples
J_history = zeros(num_iters, 1); %J is the output of the cost function 

for iter = 1:num_iters

    error = (X * theta) - y; 
    temp0 = theta(1) - ( alpha /m ) * sum(error.* X(:,1));
    temp1 = theta(2) - ( alpha /m ) * sum(error.* X(:,2));
    theta = [temp0; temp1];
    J_history(iter) = computeCost(X, y, theta);

end

end
