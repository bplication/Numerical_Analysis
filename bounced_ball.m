function bounced_ball(v,th)
g = 9.81;
C_R = 0.8;
theta = th*pi/180;
t(1)=0;x=0;y=0;j=2;xx=0;
%%��� ����
plot(x,y,'o','MarkerFaceColor','b','MarkerSize',8)
axis([0 10 -0.2 1])
M(1)=getframe;
dt=1/128;
%%�׷��� ����
for i = 1:1:100 %%v�� 1m/s ���Ϸ� ������������ ����
for j = 2:1000
    t(j)=t(j-1)+dt;
    x = xx+(v*cos(theta)*t(j)); %%������ x�� ��������
    y = v*sin(theta)*t(j)-0.5*g*t(j)^2;
    plot(x,y,'o','MarkerFaceColor','b','MarkerSize',8)
    axis([0 10 -0.2 1])
    M(j)=getframe;
    if y<=0
        xx=x;%%������ x���� ���� 
        break
    end
end
v=C_R*v;
if v<=1,break,end
end
end