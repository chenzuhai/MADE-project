function draw(A,B,C,D,H)
t=-1:0.01:1;
[x,y] =meshgrid(t);%%表示区域网格控制，目地是为了让x,y形成格点矩阵%%

z=A*x.^2+B.*abs(x)+C*y.^2+D.*abs(y);

surf(x,y,z);

%%设置三维曲面x轴，y轴，z轴，标题对应内容及三个坐标轴的取值范围%%

xlabel('X');

ylabel('Y');

zlabel('Z');

title('surf三维曲面图');
axis equal
axis([-0.5 0.5 -0.6 0.6 -inf H]);

end