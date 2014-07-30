function image_pooled = maxPooling(image,fS)
% image_pooled = maxPooling(image,fS)
% This function performs the maxPooling operation on image with
% PoolingSize fS and returns image_pooled.

image_pooled=zeros(size(image)./fS);
i=1;
for column=1:2:size(image,2)  % movement along columns
    j=1;
    for row= 1:2:size(image,1)
        %<YOUR CODE HERE>
        image_pooled(j,i)=max(max(image(row:row+1,column:column+1)));
        j=j+1;
    end
    i=i+1;
end

end