function [the_center_of_rid,m]=the_m_of_rib(A,B,C,D,H)
%z=Ax^2+B|x|+Cy^2
%���߹�����
%�����������߹�
%�����ÿ���߹���x�����ϵľ���λ��

p=5/3;     %���ܶ�

syms y x z
f=C.*y.^2-H;
result=solve(f==0,y);   %������ֱ���y����ĳ���
the_len=result(2)-result(1);
double(the_len);
interval=double((the_len-0.1)/8);      %��Ϊ���ĵ�����Ԥ��10cm
y1=double(0.05)            %Ȼ�����ÿ���߹���y���ϵľ���λ��
y2=double(0.05+interval*1)
y3=double(0.05+interval*2)
y4=double(0.05+interval*3)

f=H-(A.*x.^2+B.*abs(x)+C.*y1^2);        %�ֱ������ĸ����߹ǵ�x�ķ�Χ
x1=double(slove_equation(f))
f=H-(A.*x.^2+B.*abs(x)+C.*y2^2);
x2=double(slove_equation(f))
f=H-(A.*x.^2+B.*abs(x)+C.*y3^2);
x3=double(slove_equation(f))
f=H-(A.*x.^2+B.*abs(x)+C.*y4^2);
x4=double(slove_equation(f))

f1=H-(A.*x.^2+B.*abs(x)+C.*y1^2 ) ;        %�������������������ܶ�
m1=double(int(f1*p,x,x1(1),x1(2)));
f2=H-(A.*x.^2+B.*abs(x)+C.*y2^2 ) ;
m2=double(int(f2*p,x,x2(1),x2(2)));
f3=H-(A.*x.^2+B.*abs(x)+C.*y3^2 ) ;
m3=double(int(f3*p,x,x3(1),x3(2)));
f4=H-(A.*x.^2+B.*abs(x)+C.*y4^2 ) ;
m4=double(int(f4*p,x,x4(1),x4(2)));

m=2*(m1+m2+m3+m4);        %�߹�������


f1=H-(A.*x.^2+B.*abs(x)+C.*y1^2 ) ;        %�߹ǵ�����
m1=double(int(f1*p,x,x1(1),x1(2)));
f2=H-(A.*x.^2+B.*abs(x)+C.*y2^2 ) ;
m2=double(int(f2*p,x,x2(1),x2(2)));
f3=H-(A.*x.^2+B.*abs(x)+C.*y3^2 ) ;
m3=double(int(f3*p,x,x3(1),x3(2)));
f4=H-(A.*x.^2+B.*abs(x)+C.*y4^2 ) ;
m4=double(int(f4*p,x,x4(1),x4(2)));
  

z1=A.*x.^2+B.*abs(x)+C.*y1^2 ;
z2=H;
f1=z*p;
Mxy1=double(int(int(f1,z,z1,z2),x,x1(1),x1(2))/m1);

z1=A.*x.^2+B.*abs(x)+C.*y2^2 ;
z2=H;
f1=z*p;
Mxy2=double(int(int(f1,z,z1,z2),x,x2(1),x2(2))/m2);

z1=A.*x.^2+B.*abs(x)+C.*y3^2 ;
z2=H;
f1=z*p;
Mxy3=double(int(int(f1,z,z1,z2),x,x3(1),x3(2))/m3);
z1=A.*x.^2+B.*abs(x)+C.*y4^2 ;
z2=H;
f1=z*p;
Mxy4=double(int(int(f1,z,z1,z2),x,x4(1),x4(2))/m4);

the_center_of_rid=(Mxy1*m1+Mxy2*m2+Mxy3*m3+Mxy4*m4)/(m1+m2+m3+m4)
end