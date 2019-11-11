global angle
a0=[]
syms x y z
A=9;
B=0.5;
C=3;
D=0;
H=0.15;
angle=33
k=0.082         %吃水线截距
z_center_of_m   %0.069

%求出两个交点

a=A;
b=B-tan(angle/180.*pi);
c=-k;
x1=(-b-sqrt(b.^2-4.*a.*c))/(2.*a);
x2=(-b+sqrt(b.^2-4.*a.*c))/(2.*a)

y1=-(tan(angle/180.*pi).*x+k-A.*x.^2-B.*abs(x));
y2=(tan(angle/180.*pi).*x+k-A.*x.^2-B.*abs(x));

z1=A.*x.^2+B.*abs(x)+C.*y.^2;
z2=tan(angle/180.*pi).*x+k;


temp=int(1,z,z1,z2);
temp=int(temp,y,y1,y2);
real_V=double(int(temp,x,x1,x2))

the_need_V
the_devation=abs((double(real_V)-the_need_V))

if  abs((double(real_V)-the_need_V))<0.0001
    k
    angle
    
    
    temp=int(x,z,z1,z2);
    temp=int(temp,y,y1,y2);
    real_V_x=int(temp,x,x1,x2);
    center_x= double(real_V_x/real_V)
    
    temp=int(y,z,z1,z2);
    temp=int(temp,y,y1,y2);
    real_V_y=int(temp,x,x1,x2);
    center_y= double(real_V_y/real_V)
    
    temp=int(z,z,z1,z2);
    temp=int(temp,y,y1,y2);
    real_V_z=int(temp,x,x1,x2);
    center_z= double(real_V_z/real_V)
    
    %moment=(((buoyant_centre_z-0.069662188095083).*cos(angle/180*pi-pi/2)-buoyant_centre_x.*sin(angle/180*pi-pi/2)))*m.*10
    moment=double(((center_z-z_center_of_m).*cos(angle/180*pi-pi/2)-center_x.*sin(angle/180*pi-pi/2))*m*9.8)
    y=[a0,moment];
    a0=y;
    deviation=double(solve(tan(angle/180.*pi).*x+k-H,x)-x2)
end

