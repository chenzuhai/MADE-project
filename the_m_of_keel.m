function the_m_of_keel=the_m_of_keel(A,B,C,D,H)
syms y z
p=5/3;
width=0.02;                                                                  %���ǿ��

% 
% y1=-sqrt(H/C);                                                              %������
% y2=sqrt(H/C);
% f=sqrt(1+(2*C.*y.^2).^2);                                                   %�����ֺ���
% f1=int(f,y,y1,y2);
% the_m_of_keel=double(f1*p)*width;                                           %����=���*�ܶ�

surface1=int(int(1,z,C.*y.^2,H),y,-sqrt(H/C),sqrt(H/C));
surface2=int(int(1,z,C.*y.^2+0.02,H),y,-sqrt((H-0.02)/C),sqrt((H-0.02)/C));
the_m_of_keel=double((surface1-surface2)*p);
end