clear all
close all
clc

im=imread('C:\Users\belen\Pictures\m5.bmp');
figure;
subplot(2,2,1); imshow(im);

[Y X Z]=size(im);

if Z==3
    im=rgb2gray(im);
    subplot(2,2,2); imshow(im);
end
%im=double(im);
im2=im2bw(im);

L = bwlabel(im2);

subplot(2,2,3);
imshow(im2,[]);
subplot(2,2,4);
imshow(L);
hold on
xc=0;
yc=0;
stats=regionprops(im2,'Centroid');
%xc=round(stats.Centroid(1,1))
%yc=round(stats.Centroid(1,2))
xc=stats.Centroid(1,1)
yc=stats.Centroid(1,2)
plot(xc,yc,'r*')
m00=0;
m01=0;
m10=0;
m11=0;
m20=0;
m02=0;

for i=1:Y
    for j=1:X
       if (im2(i,j)==1)
            m00=1+m00;
            m01=(i-yc)+m01;
            m10=(j-xc)+m10;
            m11=(j-xc)*(i-yc)+m11;
            m20=((j-xc)^2)+m20;
            m02=((i-yc)^2)+m02;
       end
    end
end

m00
m01
m10
m11
m20
m02

