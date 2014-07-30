% In this tutorial you are going to use the Neural Network of the last
% tutorial on an image classification task. The image you are going to
% classify consists of 4 different items on white background. You are going
% to train your NN on these 4 items. After training you are going to find
% these items in the image. 

%% Load Training Data and setUp neural network
clear
close all

load('heart.mat')
load('square.mat')
load('spiral.mat')
load('triangular.mat')
load('image.mat')

figure(1)
imagesc(image)
colormap('gray')

figure(2)
subplot(141)
imagesc(heart)
colormap('gray')
axis equal
axis off
title('heart')

subplot(142)
imagesc(square)
colormap('gray')
axis equal
axis off
title('square')

subplot(143)
imagesc(spiral)
colormap('gray')
axis equal
axis off
title('spiral')

subplot(144)
imagesc(triangular)
colormap('gray')
axis equal
axis off
title('triangular')


%% Initialization of Neural Network
neurons=10; 
NN=struct; 
NN.layer1=randn(neurons,1); % Here we initialize the weights of the first layer
NN.delta_layer1=zeros(neurons,1); % Initialization for backProp
NN.layer2=randn(4,neurons); % Here we initialize the weights of the second layer
NN.delta_layer1=zeros(1,neurons); % Initialization for backProp
NN.bias_layer1=0;   % Initialize the bias for layer 1
NN.delta_bias_layer1=0;
NN.bias_layer2=0;   % Initialize the bias for layer 2
NN.delta_bias_layer2=0;

%% Training the Neural Network

% Trainingsparameter
iterations=10000;    % amount of epochs
eta=1e-5;      % learning rate

% As you may have already noticed, the size of the weight matrix in the
% last layer has changed to 4x10. This is because we want our network to
% output a vector with 4 entries, one for each item we want to classify. In
% case 2 or more items were overlapping in our image, we would then get activity
% at the corresponding entries. You may wonder how a 2D image is supposed to
% be fed to the network. Well for this we need to increase the amount of
% neurons in the first layer. Each of the training items has a size of 20x20
% pixels which means that we need 20*20=400 neurons in the first layer (one
% for each pixel). Also you will need to resize each trainingitem into a
% vector of the size 400x1. This can be easily done for any matrix by
% using '(:)', e.g. x(:). For training you will need some variable
% containing all training items. In each iteration you should randomly
% choose one training item ('randi' should be useful). Also this time you
% need to define a target for each trainingitem, for the square it could be
% [1;0;0;0]. Think about your squashing function, which values make sense
% ,which don't and why? Also think about the costfunction and its
% dimension.
% After training, implement a function that is scanning over image and
% feeding 20x20 patches into your neural network. Find a way to
% illustrate where your neural network is able to detect the
% trained images in the big 300x400 image.

for iter=1:iterations
    [z,z_withoutNL,y,y_withoutNL]=feedForward(NN,x);
    [cost(iter),NN]=backProp(NN,x,z,z_withoutNL,y,y_withoutNL,target);
    
    NN.layer1=NN.layer1-eta*NN.delta_layer1;
    NN.layer2=NN.layer2-eta*NN.delta_layer2;
    NN.bias_layer1=NN.bias_layer1-eta*NN.delta_bias_layer1;
    NN.bias_layer2=NN.bias_layer2-eta*NN.delta_bias_layer2;
    
    if mod(iter,10)==0 % each 10 iterations plot
        clc
        iter
        % Here you use some way to illustrate the progress of your
        % training, e.g. plotting the costfunction or the output of your NN
        % with the target
    end
end


