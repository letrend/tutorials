function image_bwd = maxPoolingBwd(data,fS,idx)
% image_pooled = maxPoolingBwd(image,fS)
% This function performs the backward maxPooling operation on image with
% PoolingSize fS and indices and returns image_bwd.

image_bwd=zeros(size(data).*fS);

i=1;
for column=1:fS(2):size(image_bwd,2)  % movement along columns
    j=1;
    for row= 1:fS(1):size(image_bwd,1)
        %<YOUR CODE HERE>
        temp=zeros(fS);
        temp(idx(j,i))=data(j,i);
        image_bwd(row:row+fS(1)-1,column:column+fS(2)-1)=temp;
        j=j+1;
    end
    i=i+1;
end

end