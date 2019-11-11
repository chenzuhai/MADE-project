function buoyant_centre(A,B,C,D,H,the_need_V,m,z_center_of_m)
%第二种   先积分出出xz方向上的面  然后再y轴上求积分
global angle
a0=[]   

for angle=150:10:150
    for c=0:0.01:0.15
        %求出两个交点
        angle;
        x2=fzero(@(x)(A.*x.^2+B.*abs(x)-(tan(angle/180.*pi).*x+c)),0.1);
        x1=fzero(@(x)(tan(angle/180.*pi).*x+c-H),-0.1);
        % z2=13.*x2.^2+0.5.*abs(x2)
        % z1=H
        syms x y z
        %求出船的X最大值和Y的最大值
        f=C.*y.^2-H;
        result_y=solve(f==0,y);
        Ymax=result_y(2);
        syms y x
        f=A.*x.^2+B.*abs(x)-H;
        result_x=solve(f==0,x);
        Xmax=result_x(2);
        
        temp=int(1,z,tan(angle/180.*pi).*x+c,H);
        part1=int(temp,x,x1,x2);
        temp=int(1,z,A.*x.^2+B.*abs(x)+C.*y.^2,H);
        part2=int(temp,x,x2,Xmax);
        all_part=double(int(part1+part2,y,-Ymax,Ymax))
        
        the_need_V
        the_devation=abs((double(all_part)-the_need_V))
        
        
        
        
        if  abs((double(all_part)-the_need_V))<0.0003
            c
            angle
            Xmax=double(Xmax);
            Ymax=double(Ymax);
            
            temp=int(x,z,tan(angle/180.*pi).*x+c,H);  %x轴浮心
            part1=int(temp,x,x1,x2);
            temp=int(x,z,A.*x.^2+B.*abs(x)+C.*y.^2,H);
            part2=int(temp,x,x2,Xmax);          
            all_part_x=double(int(part1+part2,y,-Ymax,Ymax));
            buoyant_centre_x=double(all_part_x/all_part)
            
            temp=int(y,z,tan(angle/180.*pi).*x+c,H);  %y轴浮心
            part1=int(temp,x,x1,x2);
            temp=int(y,z,A.*x.^2+B.*abs(x)+C.*y.^2,H);
            part2=int(temp,x,x2,Xmax);
            all_part_y=double(int(part1+part2,y,-Ymax,Ymax));
            buoyant_centre_y=double(all_part_y/all_part)
            
            temp=int(z,z,tan(angle/180.*pi).*x+c,H);  %z轴浮心
            part1=int(temp,x,x1,x2);
            temp=int(z,z,A.*x.^2+B.*abs(x)+C.*y.^2,H);
            part2=int(temp,x,x2,Xmax);
            all_part_z=double(int(part1+part2,y,-Ymax,Ymax));
            buoyant_centre_z=double(all_part_z/all_part)
            %moment=(((buoyant_centre_z-0.069662188095083).*cos(angle/180*pi-pi/2)-buoyant_centre_x.*sin(angle/180*pi-pi/2)))*m.*10
            moment=((buoyant_centre_z-z_center_of_m).*cos(angle/180*pi-pi/2)-buoyant_centre_x.*sin(angle/180*pi-pi/2))*m*9.8
            y=[a0,moment];
            a0=y;
            break;
        end
    end
 

 
end  

angle=[150:10:150]
y
plot(angle,y)
%  syms h x
% a0=[]
% for h=0:0.1:5
%     v=double((int((2.*5.^(1./2)*74.^(1/2)*(- 17656.*x.^4 + h).^(3./2))/111, x, -(h./17656).^(1/4), (h./17656).^(1/4))))
%     y=[a0,v];
%     a0=y;
% end
% h=[0:0.1:5]
% 
% plot(y*10.^3-0.1,h)


    %
    % x=[-0.09:0.001:0.09];
    % z1=A.*x.^2+B.*abs(x);
    % z2=-tan(40/180.*pi).*x+c;
    % plot(x,z1);
    % hold on
    % plot(x,z2)






