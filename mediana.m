clc
clear all
close all
Im=imread('C:\Users\belen\Pictures\arbol.jpg');
im=rgb2gray(Im);
figure; imshow(im);
[Y,X]=size(im)
k=0;
suma=0;
im1=im;
for i=1:Y
    for j=1:X-1
        if j>1
            a=im(i,j-1)/3;
            b=im(i,j)/3;
            c=im(i,j+1)/3;
            prom=a+b+c;
            im1(i,j)=prom;
            prom=0;
        end
    end
end
figure; imshow(im1);
