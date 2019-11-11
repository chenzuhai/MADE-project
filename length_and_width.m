function length_and_width(A,B,C,D,H)
syms y x
f=C.*y.^2-H;
result_y=solve(f==0,y);

long=double(result_y(2)*2)  %³¤¶È

syms y x
f=A.*x.^2+B.*abs(x)-H;
result_x=solve(f==0,x);

breath=double(result_x(2)*2)%¿í¶È

end