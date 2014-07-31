function image_convolved = convolve(image,kernel)
% This function is performing a convolution on image with kernel
% Remember, for a convolution you need to shift the kernel across the image
% by one pixel, multiply each kernel entry with the corresponding pixel and
% sum them up. The function 'sum' will be useful.

% Try to understand why the size of the image is reduced after convolution
image_convolved=zeros(size(image)-size(kernel)+1);

% running indices for image_convolved   
i=1;
for column=1:size(image,2)-2
    j=1;
    for row=1:size(image,1)-2
        %<YOUR CODE HERE>
        j=j+1;
    end
    i=i+1;
end