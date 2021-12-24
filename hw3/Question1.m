clc; 
clear;  
close all;

sigma=10;
beta=2.67;
ro=28;
A = [1; 1; 1];
lorenz = @(t,x) [sigma*(x(2)-x(1));(-1*x(3)+ro)*x(1)-x(2);x(1)*x(2)-beta*x(3)];
[~,X] = ode45(lorenz, [0 200], A);
plot3(X(:,1), X(:,2), X(:,3), 'b' , 'linewidth' , 0.05);
grid
xlabel('$x$','Interpreter','latex');
ylabel('$y$','Interpreter','latex');
zlabel('$z$','Interpreter','latex');
%%
clc;
close all;

d = 10^-6;
[T,Y] = ode45(lorenz, [0 200], [1+d; 1+d; 1+d]);
figure;
plot3(X(:,1), X(:,2), X(:,3));
hold on;
plot3(Y(:,1), Y(:,2), Y(:,3));
grid
xlabel('$x$','Interpreter','latex');
ylabel('$y$','Interpreter','latex');
zlabel('$z$','Interpreter','latex');
%%
d = 10^-6;
A = [1; 1; 1];
B = [1+d; 1+d; 1+d];
h=figure;
filename='lorenz1.gif';
for t=0:0.5:200
    d = 10^-6;
    dt = 0.5;
    [~,X] = ode45(lorenz, [t  t+dt], A);
    [T,Y] = ode45(lorenz, [t  t+dt], B);
    plot3(X(:,1), X(:,2), X(:,3),'b');
    grid on; hold on;
    plot3(Y(:,1), Y(:,2), Y(:,3),'g');
    grid on;
    A=[X(end,1),X(end,2),X(end,3)];
    B=[Y(end,1),Y(end,2),Y(end,3)];
    
    frame=getframe(h); 
    im=frame2im(frame); 
    [imind,cm]=rgb2ind(im,250); 
    if t==0
        imwrite(imind,cm,filename,'gif', 'Loopcount',inf,'DelayTime',0.01);
    else
        imwrite(imind,cm,filename,'gif','WriteMode','append','DelayTime',0.01);
    end  
    pause(1/100);


end