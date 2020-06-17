function decoded_W1D=extract_proj(W_image, B, a, k)
[m,n]=size(W_image);
W1D=zeros(floor(m/B)*floor(n/B),1);

fun1 = @(block_struct) dct2(block_struct.data);
img_dct2 = blockproc(W_image,[B B],fun1);

x=0;
for i=1:B:m-B
    for j=1:B:n-B
        x=x+1;
        W1D(x)=myFunction2(img_dct2(i:i+B-1,j:j+B-1),a);
    end
end
% % inverse rand
[s,p]=size(W1D);
rand('seed',k);
pp=randperm(s);
decoded_W1D=zeros(floor(m/B)*floor(n/B),1);
[n,m]=size(pp);
for i=1:m
 decoded_W1D(pp(1,i)) =  W1D(i);
end


end