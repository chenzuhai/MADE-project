

A=0.14;
B=0.14*0.53;
C=0.0528;
D=0;
H=5.2;
syms x y z h
h=0.2
y1=-sqrt(z-A.*x.^2-B.*abs(x));
y2=sqrt(z-A.*x.^2-B.*abs(x));
f1=int(1,y,y1,y2)

z1=A.*x.^2+B.*abs(x);
z2=h;
f2=int(f1,z,z1,z2)

result=slove_equation(A.*x.^2+B.*abs(x)-h)

f3=int(f2,x,result(1),result(2))
V_in_water_horizontal=f3
V_in_water_horizontal=double(f3)