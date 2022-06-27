%%%Hough
clc
clear all
close all
Im=imread('C:\Users\belen\Pictures\ima.bmp');
Im1=imread('C:\Users\belen\Pictures\ima1.bmp');
Im2=imread('C:\Users\belen\Pictures\ima2.bmp');
Im3=imread('C:\Users\belen\Pictures\ima3.bmp');

%im=rgb2gray(Im);
figure; 
%subplot(3,2,1); 
imshow(Im); 
BW = edge(Im,'canny');
%figure; imshow(BW);
[H1,T,R] = hough(BW,'Theta',-90:1:89);
figure;
%subplot(3,2,2);
imshow(H1,[],'XData',T,'YData',R,'InitialMagnification','fit');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
%colormap(gca,hot)


Im1=rgb2gray(Im1);
figure; imshow(Im1);
BW = edge(Im1,'canny');
%figure; imshow(BW);
[H,T,R] = hough(BW,'Theta',-90:1:89);
figure;
%subplot(2,3,4);
imshow(H,[],'XData',T,'YData',R,'InitialMagnification','fit');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
colormap(gca,hot)


Im2=rgb2gray(Im2);
figure; imshow(Im2);
BW = edge(Im2,'canny');
%figure; imshow(BW);
[H,T,R] = hough(BW,'Theta',-90:1:89);
figure;
%subplot(2,3,6);
imshow(H,[],'XData',T,'YData',R,'InitialMagnification','fit');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
colormap(gca,hot)

Im3=rgb2gray(Im3);
figure; imshow(Im3);
BW = edge(Im3,'canny');
%figure; imshow(BW);
[H,T,R] = hough(Im3,'Theta',-90:1:89);
figure;
imshow(H,[],'XData',T,'YData',R,'InitialMagnification','fit');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
colormap(gca,hot)