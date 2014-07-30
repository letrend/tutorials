function [y,y_withoutNL]=feedForward(NN,x)
% This function propagates x through the Neural Network NN
% You will need to multiply every weight in each layer with every output of
% the previous layer. In the first layer, the weights are multiplied with
% the input x. Notice that the weight matrices are already formated so that
% you can easily use matrix multiplication: a=A*x. Then you need to add the
% bias and apply the nonlinearity (also called squashing function, we will use
% 'tanh'). Since we will need the output of each layer before application of the nonlinearity
% for backpropagation 
% please name the variables in layer 1: z_withoutNL and z, and the variables in
% layer 2: y and y_withoutNL.

y_withoutNL=NN.Ws*x+NN.Bs;
y=tanh(y_withoutNL);


