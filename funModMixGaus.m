function [MMG, u_s_gan] = fun_Modelo_Mixto_Gausiano(im,k) 
% Modelo mixto gausiano
% im es la imagen cuyo histograma queremos modelar mediante gausianas
% k es el numero de gausianas que queremos que contenga el modelo

[sy sx sz]=size(im);
if sz==3
    im=rgb2gray(im);
end
h=imhist(im);
h=h';
imd=double(im);

n=0:255;
%%% Esta es una forma de inicializar las medias u
m=min(min(imd));
M=max(max(imd));
pasos=(M-m)/(k-1);
u=m:pasos:M;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Esta es otra forma de inicializar las medias u
% pasos=255/(k+1);
% u=pasos:pasos:255-pasos;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
u=u';
s=ones(k,1)*(60/k);
PI=ones(k,256)/k;

for L=1:1000

for j=1:k
    uu=u(j);
    ss=s(j);
    N(j,:)=(1/(sqrt(2*pi)*ss ))*exp(-((n-uu).*(n-uu))/(2*ss*ss));
end
PIN=PI.*N;
SPIN=sum(PIN);

for j=1:k
    ri(j,:)=PIN(j,:)./SPIN;
end

for j=1:k
    srin(j,:)=ri(j,:).*h;
    srinx(j,:)=srin(j,:).*n;
end
Srin=sum(srin,2);
Srinx=sum(srinx,2);
u2=Srinx./Srin;

for j=1:k
    x_u=n-u2(j); % si no funciona checar con u(j)
    V(j,:)=x_u.*x_u;
    sriVx(j,:)=srin(j,:).*V(j,:);    
end
SriVx=sum(sriVx,2);
V2=SriVx./Srin;

[sy,sx]=size(imd);
sizeim=sx*sy;
PI2=Srin/sizeim;

u=u2;
s=sqrt(V2);

%%%% Si s=0, lo pongo a un valor pequeño para que no se realice ninguna
%%%% division entre cero y PI lo mando a cero para que la Gausiana no tenga
%%%% efecto
[sz]=size(s);
for j=1:sz(1)
    if s(j)==0
%         PI2(j)=0;
        s(j)=1;
    end
end
        
    
for j=1:256
    PI(:,j)=PI2;
end

end

amplitud=sum(h);

figure; hold on;

for j=1:k
    plot(PIN(j,:)*amplitud); 
end

stem(h,'c');
plot(SPIN*amplitud,'r');
MMG=SPIN*amplitud;
ganancia=PI(:,1)*amplitud;
u_s_gan=[u,s,ganancia];

