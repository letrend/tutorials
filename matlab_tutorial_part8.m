% In this tutorial you are going to implement your own neural network and
% teach it to learn a sinus function. In the matlab_tutorial folder you will
% find some reading material on artificial neural networks.
% You will train a feedForward neural network with one hidden layer and 10
% neurons. The training will we a batch training, i.e. using the whole data
% for the backpropagation as opposed to online learning, where only one
% data point is used at a time.

%% Generate Training Data and setUp neural network
clear
close all
x=[-0.5:0.01:0.5];
target=0.5*sin(7*x);

plot(x,target)
title('Training Data')
xlabel('x'); ylabel('target sin(0.5*x)');

%% Initialization of Neural Network
neurons=10; % In this tutorial we will use 10 neuron, but feel free to change
            % number of neurons
NN=struct; 
NN.layer=3;    % Including input layer
NN.inputs=1;
NN.outputs=1;

NN.Ws{2}=randn(neurons,NN.inputs); 
NN.dWs{2}=zeros(neurons,NN.inputs); 
NN.Bs{2}=zeros(neurons,1);   % ones bias for each neuron
NN.dBs{2}=zeros(neurons,1);  
NN.Ws{3}=randn(NN.outputs,neurons); 
NN.dWs{3}=zeros(NN.outputs,neurons); 
NN.Bs{3}=zeros(NN.outputs,1);   % ones bias for each neuron
NN.dBs{3}=zeros(NN.outputs,1);

% For Momentum
prevdWs{2}=NN.dWs{2};
prevdWs{3}=NN.dWs{3};


%% Training the Neural Network
% please complete feedForward.m and backProp.m before evaluation of this
% cell.

% Trainingsparameter
iterations=10000;    % iterations
eta=1e-4;      % learning rate (10^-5), feel free to try other learning rates.
% high learning rates lead to faster learning but can lead to oscillations
% through too big steps.

for iter=1:iterations
%     eta=eta0-iter/iterations*eta0;
    randidx=randi(length(x)); % choose random sample
    %% feed forward    edit feedFwd.m
    [z,z_withoutNL,y,y_withoutNL]=feedFwd(NN,x(randidx));
    %% back propagate    edit backPrp.m
    [cost(iter),NN]=backPrp(NN,x(randidx),z,z_withoutNL,y,y_withoutNL,target(randidx));
    %% apply gradients 
    NN.Ws{2}=NN.Ws{2}-eta*NN.dWs{2};
    NN.Bs{2}=NN.Bs{2}-eta*NN.dBs{2};
    NN.Ws{3}=NN.Ws{3}-eta*NN.dWs{3};
    NN.Bs{3}=NN.Bs{3}-eta*NN.dBs{3};
    
    %% Visualization of your training
    if mod(iter,100)==0 % each 100 iterations plot
        clc 
        for i=1:length(x)
        [~,~,output(i)]=feedFwd(NN,x(i));
        end
        costNN(iter)=sum(0.5*(output-target).^2);
        iter
        costNN(iter)
        figure(1)
        clf
        subplot(121)
        hold on
        plot(x,target)
        plot(x,output,'r')
        subplot(122)
        plot(100:100:iter,costNN(100:100:iter))
    end
    
end


clf
subplot(121)
hold on
plot(x,target)
plot(x,output,'r')
title('Training Neural Network')
legend('target','output neural network')
subplot(122)
plot(cost)
xlabel('Iteration')
ylabel('cost')

if costNN(end)<0.015 && iter==iterations 
   disp('----------------------------------------------------------------------------------------------')
   fprintf('Congratulations!! You trained your neuron to produce an average error of %1.2d on the data. \n --------------well done!!-------------\n',costNN(end))
else
   error('you will need to push the error below 0.015 to succeed in this tutorial') 
end