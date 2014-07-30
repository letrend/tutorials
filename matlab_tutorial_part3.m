% Tutorial part 3
%% Load Image
clear 
close all
load('alice.mat')
load('indices_ref.mat')

figure(1)
imagesc(alice)
colormap('gray')

%% edit maxPooling.m first before evaluating this cell

poolingSize=[2 2];
[alice_pooled, indices]=maxPooling(alice,poolingSize);

clf 
subplot(131)
imagesc(alice)          % Like plot for showing images
colormap('gray')        % gray-scale image
axis equal              % preventing matlabs auto-adjustment
title('alice original') % Giving the plot a title

subplot(132)
imagesc(alice_pooled)
colormap('gray')
axis equal
title('alice max pooled')

subplot(133)
imagesc(indices)
colormap('gray')
axis equal
colorbar
title('pooling indices')


if sum(size(alice_pooled)==size(alice)./poolingSize)==2 & indices==indices_ref
    disp('Congratulations, your maxPooling now also saves the indices correctly')
else
    error('something is not right, please check your maxPooling function again')
end