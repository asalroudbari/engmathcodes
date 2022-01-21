%%part 1
clc; clear all;
syms z;
eq1=sinh(log(z^2 + 1))== 1i ^ (1i) ;
sol1=solve(eq1);
zplane(sol1);


%% part 2 
clc; clear all;
syms z;
eq2=cos(z^2)== sqrt(1i);
sol2=solve(eq2);
zplane(sol2);

%% part 3
clc; clear all;
syms z; 
eq3=z^6-5*z^2==-1;
sol3=double(solve(eq3));
zplane(sol3);

%% part 4
clc; clear all;
syms z;
eq4=z^6==log(1i);
sol4=solve(eq4);
zplane(sol4);

