

     
im2=zeros(Y,X);
for i=1:Y
    for j=1:X
        %if (H1(i,j)>350 && H1(i,j)<357 %rojo
        %if (H1(i,j)>39 && H1(i,j)<59)  %amarillo
        if (H1(i,j)>17 && H1(i,j)<23)  %verde
            im2(i,j)=1;
        end
    end
end

figure; imshow(im2,[]);