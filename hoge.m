%HOUGH
im=imread('C:\Users\belen\Pictures\ima.bmp'); %//la imagen donde quieres ver los bordes
%im=rgb2gray(im);
BW = edge(im,'canny');
figure; imshow(im);
figure; imshow(BW);
[H,T,R]=hough(BW,'Theta',-90:1:89);
figure
%imshow(imadjust(H),'XData',T,'YData',R,'InitialMagnification','fit');
imshow(H,[],'XData',T,'YData',R,'InitialMagnification','fit');

axis on, axis normal;
colormap(gca,hot)
% [H,T,R] = hough(BW,'RhoResolution',0.5,'Theta',-90:0.5:89);
% 
% subplot(2,1,1);
% imshow(ima);
% title('original');
% subplot(2,1,2);
% imshow(imadjust(rescale(H)),'XData',T,'YData',R,...
%       'InitialMagnification','fit');
% title('Hough transform of gantrycrane.png');
% xlabel('\theta'), ylabel('\rho');
% axis on, axis normal, hold on;
% colormap(gca,hot);