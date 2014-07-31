function [image_pooled,indices] = maxPooling(image,fS)
% image_pooled = maxPooling(image,fS)
% This function performs the maxPooling operation on image with
% PoolingSize fS and returns image_pooled and later also indices.

image_pooled=zeros(size(image)./fS);

i=1;
for column=1:fS(2):size(image,2)  % movement along columns
    j=1;
    for row= 1:fS(1):size(image,1)
        %<YOUR CODE HERE>
        j=j+1;
    end
    i=i+1;
end

end