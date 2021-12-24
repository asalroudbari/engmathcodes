%% part 1
clc ; clear all; close all;
a=9;
b=4;
T0=10;
T1=100;
L_X=(2/5)*a;
U_x=(3/5)*a;
L_y=0;
U_y=b;
A=A_mn(T1,a,b,L_X,U_x,L_y,U_y);
C=C_mn(a,b,T0);
colormap hsv
for t=0:0.08:4
    T=heat_equation(a,b,t,A,C);
    imagesc(T); 
    colorbar
    caxis([0 50])
    title([' t = ' , num2str(t)]);
    pause(0.01);
end


%%  part 2.2
clc ; clear all; close all;
a=9;
b=4;
T0=10;
T1=100;
L_X=(2/5)*a;
U_x=(3/5)*a;
L_y=(2/5)*b;
U_y=(3/5)*b;

A=A_mn(T1,a,b,L_X,U_x,L_y,U_y);
C=C_mn(a,b,T0);
colormap hsv
for t=0:0.08:4
    T=heat_equation(a,b,t,A,C);
    imagesc(T);
    colorbar
    caxis([0 50])
    title([' t = ' , num2str(t)]);
    pause(0.01);
end
%% part 2.3
clc ; clear all; close all;
a=9;
b=4;
T0=10;
T1=100;
L_X=0;
U_x=a;
L_y=(2/5)*b;
U_y=(3/5)*b;

A=A_mn(T1,a,b,L_X,U_x,L_y,U_y);
C=C_mn(a,b,T0);
colormap hsv
for t=0:0.08:4
    T=heat_equation(a,b,t,A,C);
    imagesc(T);
    colorbar
    caxis([0 50])
    title([' t = ' , num2str(t)]);
    pause(0.01);
end



%% 

function [C]=C_mn(a,b,T0)
    C=zeros(1,5);
    for  p=1:5
        p1 = pi * p;
        C(p)=(2*T0/sinh((b/a)*p1))*(1-(-1)^p)/p1;
    end
end

function [A_mn]=A_mn(T1,a,b,T1_Lx,T1_Ux,T1_Ly,T1_Uy)
    syms x y
    a1=pi/a;
    b1=pi/b;
    A_mn=zeros(5,5);
    for m=1:5
        for n=1:5
            na = n*a1*x;
            mb = m*b1*y;
            c = (4/(a*b));
            int1=int(T1*sin(na)*sin(mb),y,T1_Ly,T1_Uy);
            A_mn(m,n)=c*int(int1,x,T1_Lx,T1_Ux);
        end
    end
end


function [answer]=heat_equation(a,b,t,A_mn,C)
    
    a1=pi/a;
    b1=pi/b;
    x=linspace(0,a,100);
    y=linspace(0,b,100);
    sx = size(x,2);
    sy = size(y,2);
    answer=zeros(sx,sy);
    exp_w_mn=zeros(5,5);
    sin_nx=zeros(5,sx);
    sin_my=zeros(5,sy);
    sinh_py=zeros(5,sx);
    
    for n=1:5
        for i=1:sx
            sin_nx(n,i)=sin(n*a1*x(i));
        end
    end
    
    for m=1:5
        for j=1:sy
            sin_my(m,j)=sin(m*b1*y(j));
        end
    end
    
    for p=1:5
        for j=1:sy
            sinh_py(m,j)=sinh(p*a1*y(j));
        end
    end
    
    for n=1:5
        for m=1:5
            exp_w_mn(n,m)=exp(-1*((n*a1)^2+(m*b1)^2)*t);
        end
    end

    for i=1:sx
        for j=1:sy
            for n=1:5
                for m=1:5
                    answer(i,j)=answer(i,j)+ A_mn(n,m)*exp_w_mn(n,m)*sin_nx(n,i)*sin_my(m,j);
                end
            end
            for p=1:5
               answer(i,j)=answer(i,j)+ C(p)* sinh_py(p,j)*sin_nx(n,i);
            end
        end
    end  
end
