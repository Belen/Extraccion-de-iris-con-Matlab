clc
clear all
close all
%Apertura
im=imread('C:\Users\belen\Pictures\objec.jpg');
[Y X Z]=size(im);
if Z==3
    im=rgb2gray(im);
end
figure; imshow(im);
se=strel('disk',4);

imed=imdilate(im,se);
figure; imshow(imed);

ime=imerode(imed,se);
figure; imshow(ime);

new=double(im)-double(ime);

figure; imshow(new);

