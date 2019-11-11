function water_line_tranfrom(A,B,C,D,H)

%ԭ���ĳ�ˮ������ƽ�淽��
syms  x h y z c


f=A.*x.^2+B.*abs(x)-H;
result_x=solve(f==0,x); %���x�ķ�Χ


y1=-sqrt((z-A.*x.^2-B.*abs(x))./C);
y2=sqrt((z-A.*x.^2-B.*abs(x))./C);
z1=tan(40/180*pi).*x-0.02;
z2=H;
x1=result_x(1)
x2=result_x(2)


f1=int(1,y,y1,y2)
f2=int(f1,z,z1,z2)
f3=int(f2,x,x1,x2)
S=double(f3)


end