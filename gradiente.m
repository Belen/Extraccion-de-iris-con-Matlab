clc
clear all
close all

im=imread('C:\Users\belen\Downloads\device2 (1)\device2\0000\0000_000.bmp');

[Y X Z]=size(im);

if Z==3
    im=rgb2gray(im);
    subplot(2,2,2); imshow(im);
end

figure; imshow(im);

im=double(im)
[y,x]=size(im);

%sx=[-1 0 0;0 1 0; 0 0 0] %roberts
%sy=[0 0 -1;0 1 0; 0 0 0] ;

%sx=[-1 0 1;-1 0 1; -1 0 1] %prewitt
%sy=-sx';

%sx=[1 0 -1;2 0 -2; 1 0 -1] %sobel
%sy=-sx;
%sx=[-1 0 1;-2 0 2; -1 0 1] %sobel
%sy=sx';

sx= [1,0,-1] %gradiente
sy= [1;0;-1]

gx=conv2(im,sx);
gy=conv2(im,sy);

%gx1=gx(1:y,1:x);
%gy1=gy(1:y,1:x);
%g=sqrt((gx1.*gx1)+(gy1.*gy1));


gx=gx(:,1:x); %gradiente
gy=gy(1:y,:);
g=sqrt((gx.*gx)+(gy.*gy));

a=atan(gy./gx);
%a=atan(gy1./gx1);

%figure; imshow(gx1,[]);
%figure; imshow(gy1,[]);
figure; imshow(gx,[]);
figure; imshow(gy,[]);
figure; imshow(g,[]);
figure; imshow(a,[]);

%I=ones(y,x);
%figure; imshow(I);
for i=1:y
 for j=1:x
     if g(i,j)<35
         I(i,j)=255;
     end
 end
end
figure; imshow(I);


%im2=edge(im,'sobel');
%figure; imshow(im2);