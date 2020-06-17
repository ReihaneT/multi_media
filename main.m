close all
clear all
I=imread('lena.bmp');
B2W=imread('iut5.bmp');
B=12;
k=19;
alpha=100;
a=7;
[m,n]=size(I);

[img,W1D]=embed_proj(I,B,a,B2W,k,alpha);
peaksnr = psnr(img, I);

imwrite(img, 'W_image40.jpg', 'quality', 40);
imwrite(img, 'W_image60.jpg', 'quality', 60);
imwrite(img, 'W_image80.jpg', 'quality', 80);
imwrite(img, 'W_image100.jpg', 'quality', 100);

W_image40=imread('W_image40.jpg');
W_image60=imread('W_image60.jpg');
W_image80=imread('W_image80.jpg');
W_image100=imread('W_image100.jpg');

S40= extract_proj(W_image40, B, a, k);
S60= extract_proj(W_image60, B, a, k);
S80= extract_proj(W_image80, B, a, k);
S100= extract_proj(W_image100, B, a, k);


 W2D40=reshape(S40,[floor(m/B),floor(n/B)]);
 W2D60=reshape(S60,[floor(m/B),floor(n/B)]);
 W2D80=reshape(S80,[floor(m/B),floor(n/B)]);
 W2D100=reshape(S100,[floor(m/B),floor(n/B)]);
 
 outputname=fullfile('D:\multi media\final project', [ num2str(B) '.' num2str(alpha) '.' num2str(a) '.' '40' '.png']);
 imwrite( W2D40,outputname);
 outputname=fullfile('D:\multi media\final project', [ num2str(B) '.' num2str(alpha) '.' num2str(a) '.' '60' '.png']);
 imwrite( W2D60,outputname);
 outputname=fullfile('D:\multi media\final project', [ num2str(B) '.' num2str(alpha) '.' num2str(a) '.' '80' '.png']);
 imwrite( W2D80,outputname);
 outputname=fullfile('D:\multi media\final project', [ num2str(B) '.' num2str(alpha) '.' num2str(a) '.' '100' '.png']);
 imwrite( W2D100,outputname);
 figure, imshow(W2D40);
 figure, imshow(W2D60);
 figure, imshow(W2D80);
 figure, imshow(W2D100);
 
 
[m,n]=size(W_image100);
[s,p]=size(W1D);
rand('seed',k);
pp=randperm(s);
decoded_W1D=zeros(floor(m/B)*floor(n/B),1);
[n,m]=size(pp);
for i=1:m
 decoded_W1D(pp(1,i)) =  W1D(i);
end

NC40= NC_project(S40, decoded_W1D);
NC60= NC_project(S60, decoded_W1D);
NC80= NC_project(S80, decoded_W1D);
NC100= NC_project(S100, decoded_W1D);
