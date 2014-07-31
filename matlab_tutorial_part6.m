% Matlab tutorial part 6, single layer neural network
clear
clc

datapoints=200;
%% linear
labels=zeros(100,100);
labelsNN=zeros(100,100);
j=1;
k=1;
for i=1:datapoints
    x=randi(100,1);
    y=randi(100,1);
    if y<-x+100
        pos(:,j)=[x;y];
        labels(pos(1,j),pos(2,j))=1;
        j=j+1;
    else
        neg(:,k)=[x;y];
        labels(neg(1,k),neg(2,k))=-1;
        k=k+1;
    end
end

figure(1)
set(1,'position',[75         634        1808         457]) % Positioning and adjusting size of figure (1)
clf
subplot(131)
imagesc(labels)
axis equal
colormap('gray')
colorbar
xlabel('x1')
ylabel('x2')
set(gca,'YDir','normal')

%% Initialization of Neural Network
neurons=1; % In this tutorial we will use 1 neuron
NN=struct; % Initialize NN as struct, this is a special container in matlab
% (and many other programing languages). You can save multiple
% variables into this container in a very convenient fashion.
% This way your program becomes well organized and easier for
% others to understand.
NN.Ws=randn(neurons,2); % You can add variables to a struct with a '.'. Here
% we initialize the weights of the neuron
NN.dWs=zeros(neurons,2); % Initialization for backProp (Gradient)
NN.Bs=0;   % Initialize the bias for layer 1
NN.dBs=0;  % Initialization for backProp (Gradient)

%% Stocatstic Gradient Descent
% Trainings parameter
iterations=10000;
eta=1e-5;
j=1;
k=1;
% Training for loop
for iter=1:iterations
    if mod(iter,2)==0
        x=pos(:,j)./100;
        target=1;
        if j>=length(pos)
            j=1;
        else
            j=j+1;
        end
    else
        x=neg(:,k)./100;
        target=-1;
        if k>=length(neg)
            k=1;
        else
            k=k+1;
        end
    end
    %% Feed Forward
    [y,y_withoutNL]=feedForward(NN,x);
    %% back Propagation
    [cost(iter),NN]=backProp(NN,x,y,y_withoutNL,target);
    %% Application of gradients
    NN.Ws=NN.Ws-eta*NN.dWs;
    NN.Bs=NN.Bs-eta*NN.dBs;
    
    %% Visualization of your training
    if mod(iter,100)==0 % each 100 iterations plot
        clc
        iter
        ypos=feedForward(NN,pos./100);
        yneg=feedForward(NN,neg./100);
        for i=1:length(pos)
            labelsNN(pos(1,i),pos(2,i))=ypos(i);
        end
        for i=1:length(neg)
            labelsNN(neg(1,i),neg(2,i))=yneg(i);
        end
        costNN(iter)=sum(sum(0.5*(labelsNN-labels).^2))/numel(labelsNN);
        costNN(iter)
        figure(1)
        subplot(131)
        imagesc(labelsNN)
        xlabel('x1')
        ylabel('x2')
        set(gca,'YDir','normal')
        subplot(132)
        title('cost in each iteration')
        hold on
        plot(iter,costNN(iter),'x')
        xlabel('iterations')
        ylabel('cost')
        
        %         title('NN output')
        %         axis equal
    end
end

%% Result
result=zeros(100,100);
for x1=1:100
    for x2=1:100
        result(x1,x2)=feedForward(NN,[x1;x2]./100);
    end
end
subplot(133)
imagesc(result)
colorbar
title('result')
xlabel('x1')
ylabel('x2')
set(gca,'YDir','normal')

if costNN(end)<0.001 && iter==iterations 
   disp('----------------------------------------------------------------------------------------------')
   fprintf('Congratulations!! You trained your neuron to produce an average error of %1.2d on the data. \n --------------well done!!-------------\n',costNN(end))
   open('matlab_tutorial_part7')
else
   error('you will need to decrease the error below 0.001 to succeed in this tutorial') 
end

