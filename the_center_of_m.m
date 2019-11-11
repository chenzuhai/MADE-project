function z_center_of_m=the_center_of_m(m1,m2,m3,m4,m5,the_center_of_rid)

h=0.02;     %假设重物放的高度为0.03m
H=0.15;      %船的高度
%m1重物质量
%m2桅杆质量
%m3甲板质量
%m4龙骨质量   龙骨质心暂时为估计1/3处 
%m5肋骨质量  
z_center_of_m=(m1*(h+0.02)+m2*(h+0.25)+m3*H+m4*(H/3)+m5*(the_center_of_rid))/(m1+m2+m3+m4+m5);   %所有质心需要在每次改变后重新改变，不会自动改变

end