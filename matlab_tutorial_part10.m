clear
close all
clc
% In this tutorial you are going to implement your NN and the training 
% functions in a more practical way. Also you will use numerical gradient
% check on your implementation So far you have used a struct containing 
% the weights and biases, in fact the whole structure of your network. 
% The problem with this form of implementation is its inflexibility. In 
% order to increase the size of your network you would have to do that 
% manually. Also your feedforward and backprop functions would have to be 
% adjusted. A much handier implementation is to use cells.
%% Initialze Multi-Layer Perceptron (MLP)
NN.layer=3;
NN.nonlinearity=@(x) 1.7159*tanh(0.66*x);
NN.nonlinearityD=@(x) 1.1325./(cosh(0.66*x).^2);
NN.Ws=cell(1,NN.layer);
NN.Bs=cell(1,NN.layer);

neurons=10;
inputsize=1;
outputsize=1;
for lyr=2:NN.layer
    if lyr==2
        NN.Ws{lyr}=0.1*randn(neurons,inputsize);
        NN.dWs{lyr}=zeros(neurons,inputsize);
    elseif lyr==NN.layer
        NN.Ws{lyr}=0.1*randn(outputsize,neurons);
        NN.dWs{lyr}=zeros(outputsize,neurons);
    else
        NN.Ws{lyr}=0.1*randn(neurons,neurons);
        NN.dWs{lyr}=zeros(neurons,neurons);
    end
    NN.Bs{lyr}=0;
    NN.dBs{lyr}=0;
end

%% Feed Forward
data.x=-pi:0.1:pi;     % Input data
data=feedfwd(NN,data);
%% Back Propagation
data.target=sin(-pi:0.1:pi);     % Target data
[cost,NN]=backPrp(NN,data);

%% Numerical gradient check
% Lets make sure our gradients are correct. Implement the function
% numericalGradientCheck_MLP. 
if DEBUG
    if ~numericalGradientCheck_MLP(NN,data)
        error('numerical gradient check failed')
    else
        disp('numerical gradient check successful')
    end
end

%% Training
iterations=1000;    % Training iterations

for iter=1:iterations
    data=feedfwd(NN,data);
    [cost,NN]=backPrp(NN,data);
    NN=gradientPass(NN);
    
    if mod(iter,100)==0
        figure(1)
        clf
        subplot(121)
        hold on
        plot(data.x,data.target)
        plot(data.x,data.y)
        xlabel('input')
        ylabel('target/output')
        subplot(122)
        plot(cost)
        xlabel('iterations')
        ylabel('cost')
    end
end




