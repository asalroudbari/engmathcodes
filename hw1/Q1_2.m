
clc; clear all;
%
A1 = subplot (2 , 2 ,1);
[X , Y] = meshgrid( -2 : 0.1 :2 );
Z = sin (X.^2 + Y.^2);
surfc(X , Y , Z);
zlim([-1 2]);
colorbar;
colormap (A1 ,jet);

%
A2 = subplot (2 , 2 , 2);
X = [1,2,3;2,2,2;1,3,4;3,4,5;2,5,7;...
     3,0,12;7,10,10;2,4,5;1,1,2;1,1,1];
bar3(X,'detached');
xlabel('n');
ylabel('days');
ylim([0 10.5]);
zlabel('coins');
zlim([0 15]);
colormap (A2 ,'default');
%
A3 = subplot(2,2,3);
mu=[0 0] ; 
sigma=[0.7 0.4;0.4 0.7]; 
R=mvnrnd(mu,sigma,1000) ; 
 
histogram2(R(:,1),R(:,2),'NumBins',[15 15],'FaceColor','flat') ; 
set(gca,'ZTick',[0 10 20 30]) ; 
set(gca,'XTick',[-2 0 2]) ; 
set(gca,'YTick',[-2 0 2]) ; 
colorbar ;
colormap(A3,'default');  


%
subplot(2,2,4)
dt = 0.005;
t = 0 : dt : 1-dt;
alpha = 0.35;
X = exp(-alpha * t).*cos(4 * pi .* t);
Y = exp(-alpha * t).*sin(4 * pi .* t);
Z = 6 .* t;
plot3( X, Y ,Z , 'magenta*');
hold on;
stem3(X, Y ,Z , 'magenta*');
zlim([0 6]);
grid on;