function m=the_m_of_deck(A,B,C,D,H)

%��װ����������
% syms x y
% y1=-sqrt((H-A.*x.^2-B.*x)/C);
% y2=sqrt((H-A.*x.^2-B.*x)/C);
% f1=int(1,y,y1,y2);
% x_=slove_equation(A.*x.^2+B.*x-H);
% f2=int(f1,x,x_(1),x_(2));
% surface=double(f2);
% disp('�װ�����')
% m=surface/(0.5*0.6)*0.5;     %����������ܶ�


%���ܳ�   �󲻳���
% syms x y
% 
% x_=slove_equation(A.*x.^2+B.*x-H)
% 
% f(x)=sqrt((H-A.*x.^2-B.*abs(x))/C)
% 
% f=sqrt(1+diff(f(x)).^2)
% 
% len=int(f,x,x_(1),x_(2))

%�������
%����  1=65*A^2+20*B^2

p=3/2;%���ܶ�
syms y x
f=C.*y.^2-H;
result_y=solve(f==0,y);

syms y x
f=A.*x.^2+B.*abs(x)-H;
result_x=solve(f==0,x);

a=double(result_y(2));
b=double(result_x(2));

S=pi*a*b-pi*(a-0.02).*(b-0.02);

m1=S*p;
m2=0.04*0.15*p     ;                         %������Ҫ��  
m=m1+m2;
end