% Tutorial part 4
%% Load Image
clear 
close all
load('pic1.mat')

figure(1)
imagesc(pic1)
colormap('gray')

%% edit maxPoolingBwd.m first before evaluating this cell

poolingSize=[2 2];
[pic1_pooled, indices]=maxPooling(pic1,poolingSize);
pic1_Bwd=maxPoolingBwd(pic1_pooled,poolingSize,indices);

clf 
subplot(311)
imagesc(pic1)          % Like plot for showing images
colormap('gray')        % gray-scale image
axis equal              % preventing matlabs auto-adjustment
axis off
title('pic1 original') % Giving the plot a title

subplot(312)
imagesc(pic1_pooled)
colormap('gray')
axis equal
axis off
title('pic1 max pooled')

subplot(313)
imagesc(pic1_Bwd)
colormap('gray')
axis equal
axis off
title('pic1 max pooled bwd')

message='fill in here the message you see in the bwd pooled image';








load('mes.mat')
if sum(size(pic1_pooled)==size(pic1)./poolingSize)==2 && strcmp(message,sol{2}{3}{4})
    disp('Congratulations, your maxPooling bwd function seems to work, or did you cheat? ;)')
else
    error('something is not right, please check your maxPoolingBwd function again')
end