function waterline(A,B,C,D,the_need_V)



syms x y z h
%h=0.1;
y1=-sqrt((z-A.*x.^2-B.*abs(x))/C);
y2=sqrt((z-A.*x.^2-B.*abs(x))/C);
f1=int(1,y,y1,y2);


%V_in_water_horizontal=double(f3);%转化为小数


for h=0.07:0.001:0.2     %遍历范围和步长
    h
    z1=A.*x.^2+B.*abs(x);
    z2=h;
    f2=int(f1,z,z1,z2);
    result=slove_equation(A.*x.^2+B.*abs(x)-h);
    f3=int(f2,x,result(1),result(2));
    V_in_water_horizontal=double(f3);
    the_deviation=V_in_water_horizontal-the_need_V
    if abs(V_in_water_horizontal-the_need_V)<0.00001    %精确度
        h
        break;
    end
end


end