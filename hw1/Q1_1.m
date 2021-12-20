clear; clc; close all;

figure
subplot(4,2,[5 7])
dt = 0.001;
t = 0 : dt : 4-dt;
w = 8 .* pi;
y1 = 10.*exp(-t) .* sin(w.*t);
y2 = 10.*exp(-t);
plot(t , y1  , 'linewidth' , 2); hold on;
plot(t , y2 , 'r' , 'linewidth' , 2);
plot(t , -y2 , 'r' , 'linewidth' , 2);
x = [0.28 0.18];
y = [ 0.2 0.2 ];
annotation('textarrow',x,y,'interpreter','latex', 'String','$A e^{-\alpha t}\sin(2 \pi f_0 t)$');
grid;

subplot(4,2,2)
n = -10 : 20;
h = (1/2) .^ n .* stepfun(n,0)+ (2/3).^ n .* stepfun(n , -2);
stem(n ,h ,'k' , 'filled' , 'linewidth' , 2 );
ylabel('h[n]');
ylim([0 2.5]);
grid minor;
t2 = title('$h[n] = (1/2)^n u(n) + (2/3)^n u(n+2)$' , 'Interpreter' , 'latex');
t2.FontSize = 8;

subplot(4,2,[1 3])
dt = 0.001;
t = -3 : dt : 3-dt;
y1 = 2.*sinc(4.*t);
P1 = plot(t,y1 , 'g--' , 'linewidth' , 2); hold on;
y2 = 2.*sawtooth(2.*pi.*t);
y3 = square(pi.*t);
P2 = plot ( t , y3 , 'R : ' , 'linewidth' , 2 );
P3 = plot ( t , y2 , 'b' , 'linewidth' , 2);
xlim ([-3 3]);
ylim([-3.5 2.5]);
grid minor;
ylabel('$y(t)$' , 'Interpreter' , 'latex');
t3 = title ('$y_i(t)$ for $i \in \{1,2,3\}$ on the same figure' , 'Interpreter' , 'latex');
legend( [P1 , P2 , P3] , 'y_1(t)' , 'y_2(t)' , 'y_3(t)');
t3.FontSize = 8;


subplot(4,2,[4 6])
dt = 0.001;
t = -10 : dt : 10-dt;
b = pi ./2 ;
a = b./4;
x = cos(a.*t).*cos(b.*t);
y =sin(a.*t).*cos(b.*t);
plot(x , y , 'b' , 'linewidth' , 2);hold on;
plot(3.*x./4 , 3.*y./4 , 'y' ,'linewidth' , 2  );
plot(2.*x./4 , 2.*y./4 , 'r' ,'linewidth' , 2  );
t4 = title ('$x(t);y(t))$  ' , 'Interpreter' , 'latex');
t4.FontSize = 8;



subplot(4,2,8)
dt = 0.001;
t = 0 : dt : 3-dt;
f0 = 16;
f1 = 1;
A = sin(2.*pi.*f1.*t);
B = sin(2.*pi.*f0.*t);
y = A.*B;
plot(t , y , 'linewidth' , 2); hold on;
y1 = sin(2.*pi.*t);
plot(t , y1 ,'color',[0.9100    0.4100    0.1700] , 'linewidth' , 1);
plot(t , -y1 ,'color',[0.9100    0.4100    0.1700] , 'linewidth' , 1);
t5 = title ('$y_5(t) = A_(t)\sin(2\pi f_0 t)$  ' , 'Interpreter' , 'latex');
t5.FontSize = 8;
grid;


grid on

