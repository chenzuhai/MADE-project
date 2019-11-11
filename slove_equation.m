function result=slove_equation(f)
syms x
%f=x.^2+2.*abs(x);
result=solve(f==0,x);
end