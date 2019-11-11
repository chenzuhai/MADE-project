function calculate_the_V_in_water_no_move(A,B,C,D)
%z=Ax^2+B*|x|+Cy^2+D*|y|

%这里先假设y的一次项为0
syms h x y z
y1=-sqrt(z-A.*x.^2-B.*abs(x));
y2=sqrt(z-A.*x.^2-B.*abs(x));
f1=int(1,y,y1,y2);

z1=A.*x.^2+B.*abs(x);
z2=h
f2=int(f1,z,z1,z2);

x=slove_equation(A.*x.^2+B.*abs(x)-h)

f3=int(f2,x,x(0),x(1))

end