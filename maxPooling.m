function [image_pooled,indices] = maxPooling(image,fS)
% image_pooled = maxPooling(image,fS)
% This function performs the maxPooling operation on image with
% PoolingSize fS and returns image_pooled.

image_pooled=zeros(size(image)./fS);
indices=image_pooled;
i=1;
for column=1:fS(2):size(image,2)  % movement along columns
    j=1;
    for row= 1:fS(1):size(image,1)
        %<YOUR CODE HERE>
        temp=image(row:row+fS(1)-1,column:column+fS(2)-1);
        [image_pooled(j,i),indices(j,i)]=max(temp(:));
        j=j+1;
    end
    i=i+1;
end

end