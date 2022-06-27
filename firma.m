%FIRMA DE UNA IMAGEN
format compact
% close all
% clear all
% clear mex
clc

%Imagen=imread('C:\Users\belen\Pictures\circulo.png');
%Imagen=imread('C:\Users\belen\Pictures\cuadrado.png');
%Imagen=imread('C:\Users\belen\Pictures\pentagono.png');
Imagen=imb
figure; imshow(Imagen,[])


if Z==3
    Im_gris=rgb2gray(Imagen);
    figure; imshow(Im_gris);
else
    Im_gris=Imagen;
end

Im_gris=double(Im_gris);
Imagen=double(Imagen);
Im_bin=im2bw(Im_gris,0.3);
figure,imshow(Im_gris);
figure,imshow(Im_bin);
BW=Im_bin;
stats=regionprops(BW,'Centroid');
boundary=bwboundaries(BW);
for k=1 : length(stats)
   c=stats(k).Centroid;
   bound=boundary(k); 
   x=bound{1,1}(:,1);
   y=bound{1,1}(:,2);
   distances=sqrt((y-c(1)).^2+(x-c(2)).^2);
   t=1:1:length(distances);
   figure(k),
   plot(t,distances);
end