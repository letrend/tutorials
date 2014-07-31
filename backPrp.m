function [cost,NN]=backPrp(NN,x,z,z_withoutNL,y,y_withoutNL,target)
% Reimplement back Propagation from tutorial 6 for the new NN structure. 
dtanh=@(x) 1./(cosh(x).^2); % This is a so-called inline function. You can now
                            % call 'dtanh' just like any other function

cost=sum(0.5*(y-target).^2)/length(y); % This is the so-called cost function, 
                        % which measures the difference between the output 
                        % of the NN and our target

%<YOUR CODE HERE>                 
                        
end

