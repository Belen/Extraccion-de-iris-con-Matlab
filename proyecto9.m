clc
clear all
close all

%im=imread('C:\Users\belen\Pictures\fibras.bmp');
im=imread('D:\Belen\rosebet\CASIA1\CASIA Iris Image Database (version 1.0)\002\2\002_2_2.bmp');
figure; imshow(im);
[Y X Z]=size(im)
if Z==3
    im=rgb2gray(im);
    figure; imshow(im);
else
    im=im;
end

Im=fft2(im);
figure; imshow(Im);
%fig=Im;
fig=fftshift(Im);

figure; imshow(log(abs(fig)),[]);
[Y X]=size(im);
n=X;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I=ones(Y,X);
v=-1;
for i=1:Y
 for j=1:X
     if ((i-X/2+v)^2+(j-Y/2+v)^2)<5000
         I(i,j)=0;
     end
     
 end
end
figure; imshow(I);
%figure; imshow(log(abs(fftshift(I))),[]);

%I=fftshift(I);
%figure; imshow(log(abs(I)),[]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I2=ones(Y,X);
for i=1:Y
 for j=1:X
     if ((i-X/2+v)^2+(j-Y/2+v)^2)>5000 && ((i-X/2+v)^2+(j-Y/2+v)^2)<20000
         I2(i,j)=0;
     end
 end
end
figure; imshow(I2);
%I2=fft2(fftshift(I2));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I3=ones(Y,X);
for i=1:Y
 for j=1:X
     if (i-X/2+v)^2+(j-Y/2+v)^2>5000
         I3(i,j)=0;
     end
 end
end
figure; imshow(I3);
%I3=fft2(fftshift(I3));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mul=double(fig).*I;
%figure; imshow(mul,[]);
mul2=ifftshift(mul);
mul2a=ifft2(mul2);
%mula=real(double(mul2a));
mula=double(mul2a);
figure; imshow(mula,[]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mul=double(fig).*I2;
mul2=ifftshift(mul);
mul2b=ifft2(mul2);
%mulb=real(double(mul2b));
mulb=double(mul2b);
figure; imshow(mulb,[]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mul=double(fig).*I3;
mul2=ifftshift(mul);
mul2c=ifft2(mul2);
%mulc=real(double(mul2c));
mulc=double(mul2c);
figure; imshow(mulc,[]);