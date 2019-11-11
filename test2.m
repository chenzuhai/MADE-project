syms x y z


% f1=int(1,y,-sqrt(z-x.^2),sqrt(z-x.^2));
% f2=int(f1,x,-sqrt(z),sqrt(z));
% f3=int(f2,z,0,0)
% 
% f1=13.*x.^2+0.5.*abs(x);
% f2=-tan(40/180.*pi).*x+0.1
% x=fzero(@(x)13.*x.^2+0.5.*abs(x)-(-tan(40/180.*pi).*x+0.1),0.5)
% 
% 
% 
% x=[-1:0.001:1];
% z1=13.*x.^2+0.5.*abs(x);
% z2=-tan(40/180.*pi).*x+0.1;
% plot(x,z1);
% hold on
% plot(x,z2)

syms x y z c
A=20;
B=0.3;                                                                           
C=3;
D=0;
H=0.15;
x2=fzero(@(x)(A.*x.^2+B.*abs(x)-(-tan(40/180.*pi).*x+c)),0.1)          
x1=fzero(@(x)(-tan(40/180.*pi).*x+c-H),-0.1)
f=C.*y.^2-H;
result_y=solve(f==0,y);
Ymax=result_y(2);
syms y x
f=A.*x.^2+B.*abs(x)-H;
result_x=solve(f==0,x);
Xmax=result_x(2);

temp=int(1,z,-tan(40/180.*pi).*x+c,H);
part1=int(temp,x,x1,x2)
temp=int(1,z,A.*x.^2+B.*abs(x)+C.*y.^2,H);
part2=int(temp,x,x2,Xmax)
all_part=double(int(part1+part2,y,-Ymax,Ymax))

%result=fzero(@(x)all_part-0.0012,0.1)

