function z_center_of_m=the_center_of_m(m1,m2,m3,m4,m5,the_center_of_rid)

h=0.02;     %��������ŵĸ߶�Ϊ0.03m
H=0.15;      %���ĸ߶�
%m1��������
%m2Φ������
%m3�װ�����
%m4��������   ����������ʱΪ����1/3�� 
%m5�߹�����  
z_center_of_m=(m1*(h+0.02)+m2*(h+0.25)+m3*H+m4*(H/3)+m5*(the_center_of_rid))/(m1+m2+m3+m4+m5);   %����������Ҫ��ÿ�θı�����¸ı䣬�����Զ��ı�

end