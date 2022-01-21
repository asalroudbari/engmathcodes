%% part 1
clc;clear all;
syms x y;
z=x+1i*y;
func1 = @(z) (z + 1./z).^2;
func2 = @(z) 1./(((z.^2 - 1).^2) .* (z.^4 - 6.*z.^2 + 25));
func3 = @(z) (real(z)+imag(z));
realz = @(x) x;
imagz = @(y) 1i*y;

g = @(theta) cos(theta)+1i*sin(theta);
gprime = @(theta) -sin(theta)+1i*cos(theta);

extrafunc2_1 = @(theta) exp(1i*theta)-1;
extraprime2_1 = @(theta) 1i * exp(1i*theta);
extrafunc2_2 = @(theta) 1 + exp(1i*theta);
extraprime2_2 = @(theta) 1i*exp(1i*theta);


extrafunc3_1 = @(t) t+1i*(t+1);
extraprime3_1 = @(t) 1+1i;
extrafunc3_2 = @(theta) exp(1i*theta);
extraprime3_2 = @(theta) 1i*exp(1i*theta);
extrafunc3_3=@(theta) theta+1i*(1-theta);
extraprime3_3=@(theta) 1-1i;

q1 = integral(@(t) func1(g(t)).*gprime(t),0,2*pi);
q2 = integral(@(theta) func2(extrafunc2_1(theta)).*extraprime2_1(theta),0.5*pi,1.5*pi) + integral(@(theta)func2(extrafunc2_2(theta)).*extraprime2_2(theta),-0.5*pi,0.5*pi);
q3 = integral(@(theta) func3(extrafunc3_1(theta)).*extraprime3_1(theta),0,-1)+integral(@(theta) func3(extrafunc3_2(theta)).*extraprime3_2(theta),pi,2*pi)+integral(@(theta) func3(extrafunc3_3(theta)).*extraprime3_3(theta),1,0);

disp(q1);
disp(q2);
disp(q3);

