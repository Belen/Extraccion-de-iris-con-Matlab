clear all
clc 
close all
Im=imread('D:\Belen\rosebet\CASIA1\CASIA Iris Image Database (version 1.0)\010\2\010_2_4.bmp');
figure;
imshow(Im)

[h1,x1]=imhist(Im);
figure; plot(h1);
m=min(min(Im));
M=max(max(Im));

imN=(Im-m)*(255/(M-m));
[h,x]=imhist(imN);
figure; imshow(imN);
figure; plot(h);


Im=imN
[Y X Z]=size(Im)
if Z==3
    im=rgb2gray(Im);
    figure; imshow(im);
else
    im=Im;
end

k=0;
tam=11;
vec=zeros(1,tam);
res=tam/2-.5;
res2=res;
res3=1;
im1=im;
for i=1:Y
    for j=1:X-res
        if j>res
            for k=1:tam
                %k
                
                if res2==0
                    %res2
                    vec(1,k)=im(i,j);
                    res2=res+1;
                else if res2<=res && res2>0
                    %res2
                    vec(1,k)=im(i,j-res2);
                    res2=res2-1;
                    else  %res2>res
                    %res3
                    vec(1,k)=im(i,j+res3);
                    res3=res3+1;
                    end  
                end
            end
            res2=res;
            res3=1;
            im1(i,j)=median(vec);
        end
    end
end
figure; imshow(im1);

% [h1,x1]=imhist(im1);
% figure; plot(h1);
% m=min(min(im1));
% M=max(max(im1));
% 
% imN=(im1-m)*(255/(M-m));
% [h,x]=imhist(imN);
% figure; imshow(imN);
% figure; plot(h);
