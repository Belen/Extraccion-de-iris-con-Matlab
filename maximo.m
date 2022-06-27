%H1=[1,2,3,18,5,6,7; 8 20 23 22 12 13 14; 15 22 17 23 25 20 21; 22 23 24 25 26 27 28; 28 30 31 32 33 34 35; 36 37 38 39 40 41 42; 43 44 45 46 47 48 49];
clc
clear all
close all
Im=imread('C:\Users\belen\Pictures\ima.bmp');
%im=rgb2gray(Im);
figure; imshow(Im); 
%BW = edge(Im,'canny');
%figure; imshow(BW);
[H1,T,R] = hough(Im,'Theta',-90:1:89);
figure;
%subplot(3,2,2);
imshow(H1,[],'XData',T,'YData',R,'InitialMagnification','fit');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;

%figure; imshow(H1,[])

[Y X]=size(H1);
tam=3;
mat=zeros(tam,tam);
mat2=zeros(tam,3);
res=tam/2-.5;
res2=res;
res3=1;
im2=zeros(Y,X);
for i=1:Y-res
    if i>res
        for j=1:X-res
            if j==1
                        mat2(1,1)=H1(i-res,j);
                        mat2(1,2)=H1(i-res,j+res);
                        
                        mat2(2,1)=H1(i,j);
                        mat2(2,2)=H1(i,j+res);
                        
                        mat2(3,1)=H1(i+res3,j);
                        mat2(3,2)=H1(i+res3,j+res);    
                        m=max(max(mat));
                        
                if mat2(2,1)>70
                      im2(i,j)=1;  
                end
            end
            
            if j>res                      
                        mat(1,1)=H1(i-res,j-res);
                        mat(1,2)=H1(i-res,j);
                        mat(1,3)=H1(i-res,j+res);
                        
                        mat(2,1)=H1(i,j-res);
                        mat(2,2)=H1(i,j);
                        mat(2,3)=H1(i,j+res);
                        
                        mat(3,1)=H1(i+res3,j-res3);
                        mat(3,2)=H1(i+res3,j);
                        mat(3,3)=H1(i+res3,j+res3);
                        
                        m=max(max(mat));
                %if mat(2,2)>67 && mat(2,2)<70
                %      im2(i,j)=1;             
                %end 
                if mat(2,2)>71
                    im2(i,j)=1; 
                end
                
            end %fin if j
            
        end %fin for j   
    end %fin if i        
end %fin for i

%im2;
figure; 
imshow(im2,[],'XData',T,'YData',R,'InitialMagnification','fit');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;

ym=Y/2+.5;
xm=X/2+1;
y=-141;
x=-90;
im=zeros(100,100);
for i=1:Y
        for j=1:X
            if im2(i,j)==1
                    T=x
                    if y<0
                        ro=y
                    else
                        ro=y+1
                    end
                    for k=1:100
                         for t=1:100
                             if ro==round(t*cosd(T)+k*sin(T))
                                 im(k,t)=1;
                             end
                         end
                    end
            end
        x=x+1;
        end
        x=-90;
        y=y+1;
    end
    

figure; imshow(im,[]);

figure;
subplot(1,2,1); imshow(Im);
subplot(1,2,2); imshow(im);
