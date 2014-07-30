function success=numericalGradientCheck_MLP(NN,data)
% You will need to vary each weight seperately by a small epsilon and use 
% the costfunction to calculate the numerical gradient.
success=0;
cost=@(y,target) 0.5*(y-target).^2;
epsilon=1e-4;

% <YOUR CODE HERE>

if (norm(numgrad-grad)/norm(numgrad+grad))<1e-6
    success=1;
end
end