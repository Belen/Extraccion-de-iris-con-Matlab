cany
pagina 164
pasos
generar una gaussiana unidemenciinal
amplitud del area bajo la curva sea = 1
gaus=(1/()) e();
INCLUIR (1/()) para que el area bajo la curva sea =
derivar la gausiana y quedará simetrica
y convolucionar con (1,-1) = derivada
gausx=[1...0]
gausy=gausx'
convolucionar 
Ix=conv2(im,gausx)
Iy=conv2(im,gausy)
Magnitud
M=sqrt((Ix.*Ix)+(Iy.*Iy))
A=atan(Iy./Ix)
comparar la magnitud del pixel con sus vecions en la direccion del gradiente

dejar el maximo entre sus vecinos

elegir dos umbrales
T1<T2

si pixel 


