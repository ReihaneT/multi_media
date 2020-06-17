function [img,W1D] = embed_proj(I,B,a, W2D,k,alpha)
% dct
fun1 = @(block_struct) dct2(block_struct.data);
img_dct2 = blockproc(I,[B B],fun1);


%resize and 1D
[m,n]=size(I);
newlogo=imresize(W2D,[floor(m/B),floor(n/B)]);
newlogo=newlogo>150;
[q,w]=size(newlogo);
W1D=reshape(newlogo, [q*w, 1]);


%radomize
[s,p]=size(W1D);
rand('seed',k);
pp=randperm(s);
W1D=W1D(pp);

%embeded
embeded_img=zeros(m,n);
x=0;
for i=1:B:m-B
    for j=1:B:n-B
        x=x+1;
        embeded_img(i:i+B-1,j:j+B-1)=myFunction(img_dct2(i:i+B-1,j:j+B-1),W1D(x),a,alpha);
    end
    
end


%idct
fun2 = @(block_struct) idct2(block_struct.data);
img_idct2 = blockproc(embeded_img,[B B],fun2);
img=uint8(img_idct2);




end