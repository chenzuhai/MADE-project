function draw(A,B,C,D,H)
t=-1:0.01:1;
[x,y] =meshgrid(t);%%��ʾ����������ƣ�Ŀ����Ϊ����x,y�γɸ�����%%

z=A*x.^2+B.*abs(x)+C*y.^2+D.*abs(y);

surf(x,y,z);

%%������ά����x�ᣬy�ᣬz�ᣬ�����Ӧ���ݼ������������ȡֵ��Χ%%

xlabel('X');

ylabel('Y');

zlabel('Z');

title('surf��ά����ͼ');
axis equal
axis([-0.5 0.5 -0.6 0.6 -inf H]);

end