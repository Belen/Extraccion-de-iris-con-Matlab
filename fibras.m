clc
clear all
close all
im=imread('C:\Users\belen\Pictures\deg.jpg');
im=rgb2gray(im)
figure; imshow(im);

IM=fft2(im);
figure; imshow(IM);
IMc=fftshift(IM);
figure; imshow(abs(IMc),[]);
figure; imshow(log(abs(IMc)),[]);
figure; surfl(fftshift(abs(IMc)));

[Y,X]=size(im)
F=funma

IMcf2
figure

imf2=ifft
figure

fd=ifft
figure
fc=fftshift
figure; imshow
figure; imshow