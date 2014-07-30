% In this part you are going to implement your own convolution function. 
% You will need to fill in the space saying <YOUR CODE HERE>. 

%% Load Image
clear 
close all
load('alice.mat')
% normalizing the image because usually in grayscale 8-bit images pixel values 
% range from 0-255. This will also be necessary in CNNs later on.
alice=double(normalizeImage(single(alice))); 
figure(1)
imagesc(alice)
colormap('gray')

%% Edit convolve first before evaluating this cell
kernel=[0 1 0;1 -4 1;0 1 0];    % LaPlace Kernel for edge detection
% kernel=[1 1 1;1 -8 1;1 1 1];    % LaPlace Kernel that detects also 45° edges
alice_convolved=convolve(alice,kernel);

clf 
subplot(121)
imagesc(alice)
colormap('gray')
axis equal
title('alice original')
colorbar    % This command puts a colorbar next to the plot

subplot(122)
imagesc(alice_convolved)
colormap('gray')
axis equal
title('alice convolved') 
colorbar    % This command puts a colorbar next to the plot

ref=convn(alice,kernel,'valid');
if sum(size(alice_convolved)==size(alice)-size(kernel)+1)==2 & alice_convolved==convn(alice,kernel,'valid')
    disp('Congratulations, your convolution is working nicely')
else
    error('something is not right, please check your convolution function again')
end