function [numgrad1,numgrad2]= numericalGradientCheck(fcn,x1,x2)
% This function calculates the gradient for the fcn wrt to x1 and x2
% numerically. 
epsilon=1e-4;
pos=fcn(x1+epsilon,x2);
neg=fcn(x1-epsilon,x2);
numgrad1=(pos-neg)./(2*epsilon);

pos=fcn(x1,x2+epsilon);
neg=fcn(x1,x2-epsilon);
numgrad2=(pos-neg)./(2*epsilon);
end

