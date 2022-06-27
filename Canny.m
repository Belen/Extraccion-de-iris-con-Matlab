%%%%%%%%%%%%% The Canny.m file  %%%%%%%%%%%%%%%
clear all;
close all;
clc;
% The algorithm parameters:
% 1. Parameters of edge detecting filters:
%    X-axis direction filter:
     Nx1=10;Sigmax1=1;Nx2=10;Sigmax2=1;Theta1=pi/2;
%    Y-axis direction filter:
     Ny1=10;Sigmay1=1;Ny2=10;Sigmay2=1;Theta2=0;
% 2. The thresholding parameter alfa:
     alfa=0.1;
     
% Get the initial image lena.gif
[x, map]=imread('C:\Users\belen\Pictures\lena.gif');               
w=ind2gray(x,map);
%[y,w]=size(im)
figure(1);colormap(gray);
subplot(2,3,1);
imshow(x,map)
title('Image: lena.gif');

% X-axis direction edge detection
subplot(2,3,2);
filterx=d2dgauss(Nx1,Sigmax1,Nx2,Sigmax2,Theta1);
Ix= conv2(w,filterx,'same');
imagesc(Ix);
title('Valor en Ix');

% Y-axis direction edge detection
subplot(2,3,3)
filtery=d2dgauss(Ny1,Sigmay1,Ny2,Sigmay2,Theta2);
Iy=conv2(w,filtery,'same'); 
imagesc(Iy);
title('Valor en Iy');

% Norm of the gradient (Combining the X and Y directional derivatives)
subplot(2,3,4);
NVI=sqrt(Ix.*Ix+Iy.*Iy);
imagesc(NVI);
title('Norma del gradiente');

% Thresholding
I_max=max(max(NVI));
I_min=min(min(NVI));
level=alfa*(I_max-I_min)+I_min;
subplot(2,3,5);
Ibw=max(NVI,level.*ones(size(NVI)));
imagesc(Ibw);
title('Despues de la umbralización');

% Thinning (Using interpolation to find the pixels where the norms of 
% gradient are local maximum.)
subplot(2,3,6);
[n,m]=size(Ibw);
for i=2:n-1,
for j=2:m-1,
	if Ibw(i,j) > level,
	X=[-1,0,+1;-1,0,+1;-1,0,+1];
	Y=[-1,-1,-1;0,0,0;+1,+1,+1];
	Z=[Ibw(i-1,j-1),Ibw(i-1,j),Ibw(i-1,j+1);
	   Ibw(i,j-1),Ibw(i,j),Ibw(i,j+1);
	   Ibw(i+1,j-1),Ibw(i+1,j),Ibw(i+1,j+1)];
	XI=[Ix(i,j)/NVI(i,j), -Ix(i,j)/NVI(i,j)];
	YI=[Iy(i,j)/NVI(i,j), -Iy(i,j)/NVI(i,j)];
	ZI=interp2(X,Y,Z,XI,YI);
		if Ibw(i,j) >= ZI(1) & Ibw(i,j) >= ZI(2)
		I_temp(i,j)=I_max;
		else
		I_temp(i,j)=I_min;
		end
	else
	I_temp(i,j)=I_min;
	end
end
end
imagesc(I_temp);
title('Con adelgazamiento de borde');
colormap(gray);
%%%%%%%%%%%%%% End of the main.m file %%%%%%%%%%%%%%%