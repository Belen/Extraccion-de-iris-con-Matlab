clc
clear all
close all
Im=imread('C:\Users\belen\Pictures\noisy.jpg');
figure; imshow(Im);
[Y X Z]=size(Im)
if Z==3
    im=rgb2gray(Im);
    figure; imshow(im);
else
    im=Im;
end

k=0;
tam=7;
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