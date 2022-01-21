%% part1 sec1 and part 2,3
clc; clear all;
syms x y;
assume(x,'real');assume(y,'real');
z=x+1i*y;
eq1 = sinc(z);
real1=simplify(real(eq1));
imaginary1=simplify(imag(eq1));
ux1=simplify(diff(real1,x));
uy1=simplify(diff(real1,y));
vx1=simplify(diff(imaginary1,x));
vy1=simplify(diff(imaginary1,y));
is_harmonic(real1 , imaginary1 , x , y);
pretty(ux1);
pretty(uy1);
pretty(vx1);
pretty(vy1);
fcontour(real1,'r','LineWidth',1);
hold on;
fcontour(imaginary1,'b','LineWidth',1);
axis equal
%% part1 sec2 and part 2,3
clc; clear all;
syms x y;
assume(x,'real');assume(y,'real');
z=x+1i*y;
eq2 = atanh(z);
real2=simplify(real(eq2));
imaginary2=simplify(imag(eq2));
ux2=simplify(diff(real2,x));
uy2=simplify(diff(real2,y));
vx2=simplify(diff(imaginary2,x));
vy2=simplify(diff(imaginary2,y));
is_harmonic(real2 , imaginary2 , x , y);
pretty(ux2);
pretty(uy2);
pretty(vx2);
pretty(vy2);
fcontour(real2,'r','LineWidth',1);
hold on;
fcontour(imaginary2,'b','LineWidth',1);
axis equal
%% part1 sec3 and part 2,3
clc; clear all;
syms x y;
assume(x,'real');assume(y,'real');
z=x+1i*y;
eq3 = z* log(z)/log(exp(1));
real3=simplify(real(eq3));
imaginary3=simplify(imag(eq3));
ux3=simplify(diff(real3,x));
uy3=simplify(diff(real3,y));
vx3=simplify(diff(imaginary3,x));
vy3=simplify(diff(imaginary3,y));
is_harmonic(real3 , imaginary3 , x , y);
pretty(ux3);
pretty(uy3);
pretty(vx3);
pretty(vy3);
fcontour(real3,'r','LineWidth',1);
hold on;
fcontour(imaginary3,'b','LineWidth',1);
axis equal
%% part1 sec4 and part 2,3
clc; clear all;
syms x y;
assume(x,'real');assume(y,'real');
z=x+1i*y;
eq4 = z^2 + z + 1 + 1/z + 1/(z^2) ; 
real4=simplify(real(eq4));
imaginary4=simplify(imag(eq4));
ux4=simplify(diff(real4,x));
uy4=simplify(diff(real4,y));
vx4=simplify(diff(imaginary4,x));
vy4=simplify(diff(imaginary4,y));
is_harmonic(real4 , imaginary4 , x , y);
pretty(ux4);
pretty(uy4);
pretty(vx4);
pretty(vy4);
fcontour(real4,'r','LineWidth',1);
hold on;
fcontour(imaginary4,'b','LineWidth',1);
axis equal
%% part1 sec5 and part 2,3
clc; clear all;
syms x y;
assume(x,'real');assume(y,'real');
z=x+1i*y;
zc=x-1i*y;
eq5 = imag(z^3) + exp(1i*(zc));
real5=simplify(real(eq5));
imaginary5=simplify(imag(eq5));
ux5=simplify(diff(real5,x));
uy5=simplify(diff(real5,y));
vx5=simplify(diff(imaginary5,x));
vy5=simplify(diff(imaginary5,y));
is_harmonic(real5 , imaginary5 , x , y);
pretty(ux5);
pretty(uy5);
pretty(vx5);
pretty(vy5);
fcontour(real5,'r','LineWidth',1);
hold on;
fcontour(imaginary5,'b','LineWidth',1);
axis equal

%% functions
function is_harmonic(u , v , x , y)
    u_x=simplify(diff(u,x));
    v_y=simplify(diff(v,y));
    u_y=simplify(diff(u,y));
    v_x=simplify(diff(v,x));
    u_xx=simplify(diff(u,x,2));
    u_yy=simplify(diff(u,y,2));
    res1 = u_xx + u_yy;
    if (res1 == 0)
         disp('the equation is harmonic');
         
    else 
        disp('the equation is not harmonic');
    end   
    res2 = v_x + u_y;
    res3 = u_x - v_y;
    if(res2 == 0 && res3 == 0)
        disp('the equation is Analytic');
         
    else 
        disp('the equation is not Analytic');
    end   
    
end