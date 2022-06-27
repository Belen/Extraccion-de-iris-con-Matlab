I=ones(n,n);
for i=1:n
 for j=1:n
     if (i-n/2)^2+(j-n/2)^2<2500
         I(i,j)=0;
     end
 end
end
figure; imshow(I);


I2=ones(n,n);
for i=1:n
 for j=1:n
     if (i-n/2)^2+(j-n/2)^2>1500 && (i-n/2)^2+(j-n/2)^2<4500
         I2(i,j)=0;
     end
 end
end

figure; imshow(I2);

I3=ones(n,n);

for i=1:n
 for j=1:n
     if (i-n/2)^2+(j-n/2)^2>1500
         I3(i,j)=0;
     end
 end
end

figure; imshow(I3);