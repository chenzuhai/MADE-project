


A=20;
B=0.5;                                                                           
C=3;
D=0;
H=0.15;
syms  x y z c
c=0.13
angle=135

u=sqrt((H-A.*x.^2-B.*x)/C);

a=A;
b=(B-tan(angle/180*pi));
c_=C.*y.^2-c;
tx=(-b+sqrt(b.^2-4.*a.*c_))/(2.*a);

%x3=roots([A B -H])
x3=0.075

f1=int(1,z,tan(angle/180.*pi).*x+c,H)%左边的体积
f2=int(f1,y,-u,u)
f3=int(f2,x,c-0.15,tx)

fx1=int(x,z,tan(angle/180.*pi).*x+c,H);%左边的x
fx2=int(fx1,y,-u,u);
fx3=int(fx2,x,c-0.15,tx);
fx=fx3./f3;
vpa(fx)

fz1=int(z,z,tan(angle/180.*pi).*x+c,H);%左边的z
fz2=int(fz1,y,-u,u);
fz3=int(fz2,x,c-0.15,tx);
fz=fz3./f3;
vpa(fz)

q1=int(1,z,A*x.^2+B*y.^2,H);%右边的体积
q2=int(q1,y,-u,u);
q3=int(q2,x,tx,x3);

qx1=int(x,z,A*x.^2+B*y.^2,H);%右边的x
qx2=int(qx1,y,-u,u);
qx3=int(qx2,x,tx,x3);
qx=qx3./q3
vpa(qx)
qz1=int(z,z,A*x.^2+B*y.^2,H);%右边的z
qz2=int(qz1,y,-u,u);
qz3=int(qz2,x,tx,x3);
qz=qz3./q3
vpa(qz)

%浮心
Xcob=(fx.*f3+qx.*q3)./(f3+q3)
vpa(Xcob)
Zcob=(fz.*f3+qz.*q3)./(f3+q3)
vpa(Zcob)
moment=((Zcob-0.069).*cos(angle/180*pi-pi/2)-Xcob.*sin(angle/180*pi-pi/2))*m*9.8


