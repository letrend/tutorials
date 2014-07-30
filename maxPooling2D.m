function [val, idx]=maxPooling2D(data,fS,fragments,featureMaps)
dS=size(data);
ri1=reshape(data,[dS(1) fS(2) dS(2)/fS(2) featureMaps fragments]);
ri2=permute(ri1,[2 1 3 4 5]);
ri3=reshape(ri2,[fS(1)*fS(2) dS(1)*dS(2)/(fS(1)*fS(2)) featureMaps fragments]);
[ri4,idx]=max(ri3,[],1);
val=reshape(ri4,[dS(1)/fS(1) dS(2)/fS(2) featureMaps fragments]);
% collector=zeros([dS prod(fS)]);
% mask=ones([dim(1:2,1,2)',dS(3)]);
% mask(1,:,2)=0;
% mask(:,1,3)=0;
% mask(1,:,4)=0;
% mask(:,1,4)=0;
% lines=dim(1,1,2)-dim(:,:,2);
% for i=1:4
% if lines(:,i)==[0;0]
% elseif lines(:,i)==[1;0]
%         mask(end,:,i)=0;
% elseif lines(:,i)==[0;1]
%         mask(:,end,i)=0;
% elseif lines(:,i)==[1;1]
%         mask(end,:,i)=0;
%         mask(:,end,i)=0;
% end
% end

% for i=1:prod(fS)
% row=dim(1,i,1):dim(1,i,2);
% col=dim(2,i,1):dim(2,i,2);
% collector(1:numel(row),1:numel(col),i)=data(row,col);
% end


% 
% v1=reshape(data,[fS(1)  fS(2) dS(2)/fS(2) dS(2)/fS(2)  ]);
% v2=permute(v1,[2 1 3]);
% v3=reshape(v2,[fS(1)*fS(2) dS(1)*dS(2)/(fS(1)*fS(2))]);
% [vi5,idx2]=max(ri3,[],1);
% val=reshape(ri4,[dS(1)/fS(1) dS(2)/fS(2)]);
% [mi,idx1]=min(ri3,[],1);
% take=ri4<=abs(mi);
% ri4(take)=mi(take);
% idx(take)=idx1(take);

end