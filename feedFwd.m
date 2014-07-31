function [z,z_withoutNL,y,y_withoutNL]=feedFwd(NN,x)
% feed forward MLP
z_withoutNL=NN.Ws{2}*x+NN.Bs{2};
z=tanh(z_withoutNL);
y_withoutNL=NN.Ws{3}*z+NN.Bs{3};
y=tanh(y_withoutNL);

end
