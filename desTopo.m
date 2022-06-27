clear all
close all
clc
s1=[0 0 6 6 5 6 6 4 3 2 2 2 1];
s2=[3 2 2 2 1 0 0 6 6 5 6 6 4];

S1=fft(s1);
S2=fft(s2);

F=(S1.*conj(S2))./abs(S1.*S2);

f=ifft(F);

figure; 
subplot(1,3,1)
stem(s1);
subplot(1,3,2)
stem(s2);
subplot(1,3,3)
stem(abs(f));

pendiente=atand(1-f)
%stem(round(pendiente),f);

S=s1-s2;
S1=ifft(S);
%figure; stem(S);
