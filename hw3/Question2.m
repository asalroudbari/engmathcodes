%% part2
clc ; clear; close all;
syms x y
a=1;
m=2;
n=7;
f=@(x,y) cos(y*pi/4);
disp(vpa(B_mn(f,m,n,a)))
%% part3
clc ; clear; close all;
f=@(x,y) cos(y*pi/4);
a=20;
c=4;
t=50;
plot1(f,a,c,t);
%% part 4.1
clc ; clear; close all;
f=@(x,y) cos(x*pi/4);
a=30;
c=2;
t_max=200;
pause_time=0.02;
time_step=0.2;
wave_animator(f,a,c,t_max,pause_time,time_step);
    

%% part 4.2
clc ; clear; close all;
f=@(x,y) cos(y*pi/4);
a=30;
c=2;
t_max=100;
pause_time=0.02;
time_step=0.5;
wave_animator(f,a,c,t_max,pause_time,time_step);
%% part 4.3
clc ; clear; close all;
f=@(x,y) cos(y.*x*pi/4);
a=10;
c=2;
t_max=100;
pause_time=0.05;
time_step=0.1;
wave_animator(f,a,c,t_max,pause_time,time_step);
%% part 4.4
clc ; clear; close all;
f=@(x,y) cos((x+y)*pi/4);
a=30;
c=1;
t_max=100;
pause_time=0.02;
time_step=0.1;
wave_animator(f,a,c,t_max,pause_time,time_step);
%% part 4.5
clc ; clear; close all;
a=2;
f=@(x,y) (x-(a/2)).^2+(y-(a/2)).^2;
c=1;
t_max=100;
pause_time=0.05;
time_step=0.1;
wave_animator(f,a,c,t_max,pause_time,time_step);
%%
function [int2]=B_mn(f,m,n,a)
    syms x y
    int1=int(f*sin((n*pi/a)*x)*sin((m*pi/a)*y),y,0,a);
    int2=(4/(a*a))*int(int1,x,0,a);
end


function [B_mn]=all_Bmn(f,a,b,high_limit)
    const_a=pi/a;
    const_b=pi/b;
    B_mn=zeros(high_limit,high_limit);
    for m=1:high_limit
        for n=1:high_limit
            func=@(x,y) f(x,y).*sin(n*const_a*x).*sin(m*const_b*y);
            B_mn(m,n)=(4/(a*b))*integral2(func,0,a,0,b);
        end
    end
end


function [answer]=plot1(f,a,c,t)
    x=linspace(0,a,50);
    y=linspace(0,a,50);
    answer=zeros(size(x,2),size(y,2));
    cos_w_mn=zeros(20,20);
    const=pi/a;
    for n=1:20
        for m=1:20
            cos_w_mn(n,m)=cos((c*const)*sqrt(m^2+n^2)*t);
        end
    end
    
    B_mn=all_Bmn(f,a,a,20);
    sin_nx=zeros(20,size(x,2));
    for n=1:20
        for i=1:size(x,2)
            sin_nx(n,i)=sin(n*const*x(i));
        end
    end
    
    for i=1:size(x,2)
        for j=1:size(y,2)
            for n=1:20
                for m=1:20
                    answer(i,j)=answer(i,j)+B_mn(n,m)*cos_w_mn(n,m)*sin_nx(n,i)*sin_nx(m,j);
                end
            end
        end
    end
    [X,Y]=meshgrid(x,y);
    colormap spring;
    surf(X,Y,answer);
end

function [answer]=wave_animator(f,a,c,max_t,pause_time,time_step)
    t=0;
    x=linspace(0,a,50);
    y=linspace(0,a,50);
    answer=zeros(size(x,2),size(y,2));
    cos_w_mn=zeros(20,20);
    const=pi/a;
    
    B_mn=all_Bmn(f,a,a,20);
    sin_nx=zeros(20,size(x,2));
    for n=1:20
        for i=1:size(x,2)
            sin_nx(n,i)=sin(n*const*x(i));
        end
    end
    
    A1 = figure;
    xlabel('x')
    ylabel('y')
    zlabel('u(x,y,t)')
    axis([0 1.2*a 0 1.2*a -5 5]);
    hold on;
    view([-41 24]);
    [X,Y]=meshgrid(x,y);
    h=surf(X,Y,answer);
    while(t <= max_t)
        answer=zeros(size(x,2),size(y,2));
        for n=1:20
            for m=1:20
                cos_w_mn(n,m)=cos((c*const)*sqrt(m^2+n^2)*t);
            end
        end
        
        for i=1:size(x,2)
            for j=1:size(y,2)
                for n=1:20
                    for m=1:20
                        answer(i,j)=answer(i,j)+ B_mn(n,m)*cos_w_mn(n,m)*sin_nx(n,i)*sin_nx(m,j);
                    end
                end
            end
        end
        title([' t = ' , num2str(t)]);
        colormap spring;
        set(h,'zdata',answer);
        drawnow

        
        pause(pause_time);
        t=t+time_step;
    end
end
