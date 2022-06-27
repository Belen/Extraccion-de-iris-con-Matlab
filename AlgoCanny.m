clc
clear all
close all

Im=imread('C:\Users\belen\Pictures\amor.jpg');
figure; imshow(Im);
[y x z]=size(Im)

if z==3
    im=rgb2gray(Im);
    figure; imshow(im);
else
    im=Im;
end
im=double(im);
%filtro=(1/273)*[1 4 7 4 1; 4 16 26 16 4; 7 26 41 26 7; 4 16 26 16 4; 1 4 7 4 1]

filtro=(1/59)*[2 4 5 4 2; 4 9 12 9 4; 5 12 25 12 5; 4 9 12 9 4; 2 4 5 4 2];

ImFiltro=conv2(im,filtro);
ImFiltro=ImFiltro(2:y+1,2:x+1);

figure; imshow(ImFiltro,[]);

sx=[-1 0 1;-2 0 2; -1 0 1]; %sobel
sy=sx';

Ix= conv2(ImFiltro,sx);
Iy= conv2(ImFiltro,sy);

Ix1=Ix(2:y+1,2:x+1);
Iy1=Iy(2:y+1,2:x+1);

figure; imshow(Ix1,[]);
figure; imshow(Iy1,[]);

G=sqrt(Ix1.*Ix1+Iy1.*Iy1);
figure; imshow(G,[]);

a=atan(Iy1./Ix1);
figure; imshow(a,[]);

I_max=max(max(G));
I_min=min(min(G));

alfa=0.05;

level=alfa*(I_max-I_min)+I_min;

Ibw=max(G,level.*ones(size(G)));

figure; imshow(Ibw,[]);

[n,m]=size(Ibw);
for i=2:n-1,
for j=2:m-1,
	if Ibw(i,j) > level,
	X=[-1,0,+1;-1,0,+1;-1,0,+1];
	Y=[-1,-1,-1;0,0,0;+1,+1,+1];
	Z=[Ibw(i-1,j-1),Ibw(i-1,j),Ibw(i-1,j+1);
	   Ibw(i,j-1),Ibw(i,j),Ibw(i,j+1);
	   Ibw(i+1,j-1),Ibw(i+1,j),Ibw(i+1,j+1)];
	XI=[Ix(i,j)/G(i,j), -Ix(i,j)/G(i,j)];
	YI=[Iy(i,j)/G(i,j), -Iy(i,j)/G(i,j)];
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

figure; imshow(I_temp);
%sy=[.006 .061 .242 .383 .242 .061 .006]