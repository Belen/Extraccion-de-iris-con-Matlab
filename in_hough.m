clear all;
close all;
clc
%ro=distancia
%T=angulo
 im=zeros(100,100);
 ro=-17;
 T=-90;
 for y=1:100
     for x=1:100
         if ro==round(x*cosd(T)+y*sin(T))
             im(y,x)=1;
         end
     end
 end
 
 figure; imshow(im,[]);
 