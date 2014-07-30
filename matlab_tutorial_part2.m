% Tutorial part 2
% In this part you are going to implement your own function. You will need
% to fill in the space saying <YOUR CODE HERE>. Your function is going to
% do the maxPooling operation descripted in the Matlab_tutorial_Script.
%% Load Image
clear 
close all
load('alice.mat')
load('alice_ref.mat')

figure(1)
imagesc(alice)
colormap('gray')

%% edit maxPooling.m first before evaluating this cell

poolingSize=[2 2];
alice_pooled=maxPooling(alice,poolingSize);


clf 
subplot(121)
imagesc(alice)          % Like plot for showing images
colormap('gray')        % gray-scale image
axis equal              % preventing matlabs auto-adjustment
title('alice original') % Giving the plot a title

subplot(122)
imagesc(alice_pooled)
colormap('gray')
axis equal
title('alice max pooled')


if sum(size(alice_pooled)==size(alice)./poolingSize)==2 & alice_pooled==alice_ref
    disp('Congratulations, your maxPooling is working nicely')
else
    error('something is not right, please check your maxPooling function again')
end