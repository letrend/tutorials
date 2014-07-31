function image=scanImage(NN,image)
image=normalizeImage(image);
i=10;
for col=1:size(image,2)-20
    j=10;
    for row=1:size(image,1)-20
        x=image(row:row+19,col:col+19);
        [~,~,y]=feedFwd(NN,x(:));
        if y(1)>0.85 & (y(2:4)<-0.85)
            image(j:j+3,i:i+3)=1;
        elseif y(2)>0.85 & (y([1 3 4])<-0.85)
            image(j:j+3,i:i+3)=2;
        elseif y(3)>0.85 & (y([1 2 4])<-0.85)
            image(j:j+3,i:i+3)=3;
        elseif y(4)>0.85 & (y(1:3)<-0.85)
            image(j:j+3,i:i+3)=4;
        end
%         [val,idx]=max(y);
%         if val>0.9 && idx~=5
%             image(j:j+3,i:i+3)=idx;
%         end
        j=j+1;
    end
    i=i+1;
end