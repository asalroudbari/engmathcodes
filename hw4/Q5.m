%% Q1 B
clc;clear all;close all;
escapeVelocity(complex(0,0.4),complex(0.6,0.8),300);
julia (18,complex(-0.8,0.2),80);
%% Functions
function n = escapeVelocity(c,z0,N)
z = zeros(1,N);
flag = 0;
z(1) = (z0).^2 + c;
for i=2:1:N
    z(i) = z(i-1).^2 + c;
    if (abs(z(i))>2 && flag ==0)
        flag = 1;
        n = i;
    end 
end
if (flag ==0 )
    n=N;
end
end
function M = julia (zMax,c,N)
z = zeros(500,500);
m = zeros(500,500);
X = linspace (-zMax,zMax,500)/10;
Y = linspace (-zMax,zMax,500)/10;
for i = 1:1:500
    for j = 1:1:500
        z(i,j) = complex(X(i),Y(j));
        m(i,j) = escapeVelocity(c,z(i,j),N);
    end
end
figure(1);
axis xy;
colormap hot;
imagesc(atan(01*m));
end