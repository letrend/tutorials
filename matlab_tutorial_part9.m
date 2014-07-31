% In this tutorial you are going to use the Neural Network of the last
% tutorial on an image classification task. The image you are going to
% classify consists of 4 different items on white background. You are going
% to train your NN on these 4 items. After training you are going to find
% these items in the image. 

%% Load Training Data and setUp neural network
clear
close all
figure(1)
figure(2)
figure(3)
set(1,'position',[45   663   560   420])
set(2,'position',[620   664   560   420])
set(3,'position',[ 1196         664         560         420])

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
NN.layer=3;    % Including input layer
NN.inputs=400; % 20x20 pixel
NN.outputs=4;

NN.Ws{2}=0.1*randn(neurons,NN.inputs); 
NN.dWs{2}=zeros(neurons,NN.inputs); 
NN.Bs{2}=0;   % ones bias for each layer
NN.dBs{2}=0;  
NN.Ws{3}=0.1*randn(NN.outputs,neurons); 
NN.dWs{3}=zeros(NN.outputs,neurons); 
NN.Bs{3}=0;   % ones bias for each layer
NN.dBs{3}=0;

% As you may have already noticed, the size of the weight matrix in the
% last layer has changed to 4x10. This is because we want our network to
% output a vector with four entries, one for each item we want to classify. In
% case two or more items were overlapping in our image, we would then get activity
% at the corresponding entries. You may wonder how a 2D image is supposed to
% be fed to the network. Well for this we need to increase the amount of
% neurons in the first layer. Each of the training items has a size of 20x20
% pixels which means that we need 20*20=400 neurons in the first layer (one
% for each pixel). Also you will need to resize each trainingitem into a
% vector of the size 400x1. This can be easily done for any matrix by
% using '(:)', e.g. x(:). This time you
% need to define a target for each trainingitem, for the square it could be
% [1;0;0;0]. Think about your squashing function, which values make sense
% ,which don't and why? Also think about the costfunction and its
% dimension.
% After training, implement a function that is scanning over image and
% feeding 20x20 patches into your neural network. Find a way to
% illustrate where your neural network is able to detect the
% trained images in the big 300x400 image.
meanimage=mean(image(:));
im=image-meanimage;
stdimage=2*std(im(:));
heart=(heart-meanimage)./(stdimage);
square=(square-meanimage)./(stdimage);
spiral=(spiral-meanimage)./(stdimage);
triangular=(triangular-meanimage)./(stdimage);

x={heart,square,spiral,triangular};
target=-ones(4);target(1,1)=1;target(2,2)=1;target(3,3)=1;target(4,4)=1;

%% Training the Neural Network
% Trainingsparameter
iterations=30000;    % training iterations
eta=1e-3;      % learning rate

for iter=1:iterations
    randidx=randi(4);
    %% feed forward    edit feedFwd.m
    [z,z_withoutNL,y,y_withoutNL]=feedFwd(NN,x{randidx}(:));
    %% back propagate    edit backPrp.m
    [cost(iter),NN]=backPrp(NN,x{randidx}(:),z,z_withoutNL,y,y_withoutNL,target(:,randidx));
    %% apply gradients 
    NN.Ws{2}=NN.Ws{2}-eta*NN.dWs{2};
    NN.Bs{2}=NN.Bs{2}-eta*NN.dBs{2};
    NN.Ws{3}=NN.Ws{3}-eta*NN.dWs{3};
    NN.Bs{3}=NN.Bs{3}-eta*NN.dBs{3};
    
    if mod(iter,100)==0 % each 10 iterations plot
        clc
        iter
        for i=1:4
           [~,~,y(:,i)]=feedFwd(NN,x{i}(:)); 
        end
        figure(3)
        clf
        subplot(121)
        plot(1:4,y)
        axis([1 4 -1 1])
        subplot(122)
        plot(1:iter,cost)
    end
end

%% Scanning the image for targets, edit scanImage.m

targets=scanImage(NN,image);
figure(4)
imagesc(targets)
colormap('default')
colorbar