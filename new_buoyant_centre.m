function new_buoyant_centre(A,B,C,D,H,the_need_V,m,z_center_of_m)
%第二种   先积分出出xz方向上的面  然后再y轴上求积分
global angle
a0=[]   
syms x y z

c=0.1
for angle=145:10:145
    
        %求出两个交点
        angle
        x1=(H-c)/tan(angle/180*pi)
        a=A;
        b=(B-tan(angle/180*pi));
        c_=C.*y.^2-c;
        x2=(-b+sqrt(b.^2-4.*a.*c_))/(2.*a)
        a=A;
        b=B;
        c_=C.*y.^2-H;
        x3=(-b+sqrt(b.^2-4.*a.*c_))/(2.*a)
        syms x y z
%         %求出船的X最大值和Y的最大值
%         f=C.*y.^2-H;
%         result_y=solve(f==0,y);
%         Ymax=result_y(2);
%         syms y x
%         f=A.*x.^2+B.*abs(x)-H;
%         result_x=solve(f==0,x);
%         Xmax=result_x(2);
        
        temp=int(1,z,tan(angle/180.*pi).*x+c,H);
        part1=int(temp,x,x1,x2);
        temp=int(1,z,A.*x.^2+B.*abs(x)+C.*y.^2,H);
        part2=int(temp,x,x2,x3);
        all_part=double(int(part1+part2,y,-Ymax,Ymax))
        
        the_need_V
        the_devation=abs((double(all_part)-the_need_V))

        if  abs((double(all_part)-the_need_V))<0.0001
            c
            angle
            Xmax=double(Xmax);
            Ymax=double(Ymax);
            
            temp=int(x,z,tan(angle/180.*pi).*x+c,H);  %x轴浮心
            part1=int(temp,x,x1,x2);
            temp=int(x,z,A.*x.^2+B.*abs(x)+C.*y.^2,H);
            part2=int(temp,x,x2,x3);          
            all_part_x=double(int(part1+part2,y,-Ymax,Ymax));
            buoyant_centre_x=double(all_part_x/all_part)
            
            temp=int(y,z,tan(angle/180.*pi).*x+c,H);  %y轴浮心
            part1=int(temp,x,x1,x2);
            temp=int(y,z,A.*x.^2+B.*abs(x)+C.*y.^2,H);
            part2=int(temp,x,x2,x3);
            all_part_y=double(int(part1+part2,y,-Ymax,Ymax));
            buoyant_centre_y=double(all_part_y/all_part)
            
            temp=int(z,z,tan(angle/180.*pi).*x+c,H);  %z轴浮心
            part1=int(temp,x,x1,x2);
            temp=int(z,z,A.*x.^2+B.*abs(x)+C.*y.^2,H);
            part2=int(temp,x,x2,x3);
            all_part_z=double(int(part1+part2,y,-Ymax,Ymax));
            buoyant_centre_z=double(all_part_z/all_part)
            %moment=(((buoyant_centre_z-0.069662188095083).*cos(angle/180*pi-pi/2)-buoyant_centre_x.*sin(angle/180*pi-pi/2)))*m.*10
            moment=((buoyant_centre_z-z_center_of_m).*cos(angle/180*pi-pi/2)-buoyant_centre_x.*sin(angle/180*pi-pi/2))*m*9.8
            y=[a0,moment];
            a0=y;
            break;
        end
    
 

 
end  
% 
% angle=[135:10:135]
% y
% plot(angle,y)




end