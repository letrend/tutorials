function toAdd = maxPoolingBwd2D(data, fS, idx)
dS = size(data);
dN = numel(data);
fN = prod(fS);
gr=ones(fS);

%% kron upsampling
% [ia,ib] = meshgrid(1:dS(1),1:fS(1));
% [ja,jb] = meshgrid(1:dS(2),1:fS(2));
xrow=1:dS(1);
ycol=(1:fS(1)).';
ia = xrow(ones(size(ycol)),:); 
ib = ycol(:,ones(size(xrow))); 
xrow=1:dS(2);
ycol=(1:fS(2)).';
ja = xrow(ones(size(ycol)),:); 
jb = ycol(:,ones(size(xrow))); 
data1 = data(ia,ja).*gr(ib,jb);
%% 
if fS==[2 2]
    c=[idx==1;idx==2;idx==3;idx==4];
else
    c=[idx==1;idx==2;idx==3;idx==4;idx==5;idx==6;idx==7;idx==8;idx==9];
end
d=permute(c,[1 3 2 4]);
e=reshape(d,[fS(2) dS(1)*fS(1) dS(2)]);
f=permute(e,[2 1 3 4]);
g=reshape(f, dS.*fS);
toAdd=g.*data1;
end
