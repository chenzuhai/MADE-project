global angle
a0=[]
syms x y z
A=9;
B=0.5;
C=3;
D=0;
H=0.15;
angle=140
c=0.140
z_center_of_m   %0.069
f=A.*x.^2+B.*abs(x)-H;
result_x=solve(f==0,x)
Xmax=result_x(2)
%求出两个交点

x1=(H-c)/tan(angle/180*pi)
a=A;
b=B-tan(angle/180*pi);
c_=-c;
x2=(-b+sqrt(b.^2-4.*a.*c_))/(2.*a)
x3=Xmax
Ymax=sqrt((H-A.*x.^2-B.*x)/C)


temp=int(1,z,tan(angle/180.*pi).*x+c,H);
temp=int(temp,y,-Ymax,Ymax);
part1=int(temp,x,x1,x2);

temp=int(1,z,A.*x.^2+B.*abs(x)+C.*y.^2,H);
temp=int(temp,y,-Ymax,Ymax);
part2=int(temp,x,x2,x3);

all_part=double(part1+part2)

the_need_V
the_devation=abs((double(all_part)-the_need_V))

if  abs((double(all_part)-the_need_V))<0.0001
    c
    angle

    
temp=int(x,z,tan(angle/180.*pi).*x+c,H);
temp=int(temp,y,-Ymax,Ymax);
part1_x=int(temp,x,x1,x2)/part1;

temp=int(x,z,A.*x.^2+B.*abs(x)+C.*y.^2,H);
temp=int(temp,y,-Ymax,Ymax);
part2_x=int(temp,x,x2,x3)/part2;

center_x=double((part1*part1_x+part2*part2_x)/(part1+part2))

    
temp=int(y,z,tan(angle/180.*pi).*x+c,H);
temp=int(temp,y,-Ymax,Ymax);
part1_y=int(temp,x,x1,x2)/part1;

temp=int(y,z,A.*x.^2+B.*abs(x)+C.*y.^2,H);
temp=int(temp,y,-Ymax,Ymax);
part2_y=int(temp,x,x2,x3)/part2;

center_y=double((part1*part1_y+part2*part2_y)/(part1+part2))
    
temp=int(z,z,tan(angle/180.*pi).*x+c,H);
temp=int(temp,y,-Ymax,Ymax);
part1_z=int(temp,x,x1,x2)/part1;

temp=int(z,z,A.*x.^2+B.*abs(x)+C.*y.^2,H);
temp=int(temp,y,-Ymax,Ymax);
part2_z=int(temp,x,x2,x3)/part2;

center_z=double((part1*part1_z+part2*part2_z)/(part1+part2))

%moment=(((buoyant_centre_z-0.069662188095083).*cos(angle/180*pi-pi/2)-buoyant_centre_x.*sin(angle/180*pi-pi/2)))*m.*10
moment=double(((center_z-z_center_of_m).*cos(angle/180*pi-pi/2)-center_x.*sin(angle/180*pi-pi/2))*m*9.8)
y=[a0,moment];
a0=y;

end

