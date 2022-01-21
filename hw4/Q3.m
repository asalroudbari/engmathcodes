 %% Part 2
clc; clear all;
syms x;
f = @(x) (x+5)./(x.^2-3.*x-4);
z0 = 2;
n = 8;
cauchyderivative(f,z0,n);
%% part 3
clc; clear all;
syms x;
f = @(x) (x+5)./(x.^2-3.*x-4);
z0 = 2;
n = 8;
DF(x) = diff(f ,x, 8);
DF2 = DF(2);
DF2 = double(DF2)
%% functions
function cauchy = cauchyderivative(f,z0,n)
r=1;
syms theta;
g = @(theta) r.*cos(theta)+r.*1i.*sin(theta) + z0;
gprime = @(theta) -r.*sin(theta)+r.*1i.*cos(theta);
cauchy = (r^2).*factorial(n)./(2*pi*1i).*integral(@(t) f(g(t)).*gprime(t)./(g(t)-z0).^(n+1),0,2*pi);
disp(cauchy);
end