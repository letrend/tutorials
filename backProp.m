function [cost,NN]=backProp(NN,x,y,y_withoutNL,target)
% This function implements backPropagation through the Neural Network.
% Notice: the derivative of tanh is 1./(cosh(x).^2)

dtanh=@(x) 1./(cosh(x).^2); % This is a so-called inline function. You can now
                            % call 'dtanh' just like any other function

cost=sum(0.5*(y-target).^2)/length(y); % This is the so-called cost function, 
                        % which measures the difference between the output 
                        % of the NN and our target
         
%<YOUR CODE HERE>

end