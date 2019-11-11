
A=20;
B=0.5;                                                                           
C=3;
D=0;
h=0.089000000000000;

syms y x z
f=C.*y.^2-h;
result_y=solve(f==0,y);




y1=-sqrt((z-A.*x.^2-B.*abs(x))/C);
y2=sqrt((z-A.*x.^2-B.*abs(x))/C);
f1=int(1,y,y1,y2);

z1=A.*x.^2+B.*abs(x);
z2=h;
f2=int(f1,z,z1,z2);

f=A.*x.^2+B.*abs(x)-h;
result_x=solve(f==0,x)
f3=int(f2,x,result_x(1),result_x(2));
V=f3
y1=-sqrt((z-A.*x.^2-B.*abs(x))/C);
y2=sqrt((z-A.*x.^2-B.*abs(x))/C);
f1=int(z,y,y1,y2);

z1=A.*x.^2+B.*abs(x);
z2=h;
f2=int(f1,z,z1,z2);

f=A.*x.^2+B.*abs(x)-h;
result_x=solve(f==0,x)
Mz=int(f2,x,result_x(1),result_x(2))


daan=Mz/V