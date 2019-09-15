clear all, close all, clc

syms x y z 
assume(x,'real')
assume(y,'real')
assume(z,'real')

a=2;    b= 1;    c=1;  d=7;    %example : finish in 17th iterations
e=-1;   f= 3;    g=-1; h=2;
j=1;    k= -1;    m=2;  n=5;

% the Jacobi method does not converge for symmetric positive-definite matrix
% or matrix A is not strictly or irreducibly diagonally dominant. 
%a=2;    b= 1;    c=1;  d=2;    
%e=-1;   f= 1;    g=-1; h=3;     % (3,1,-5)
%j=1;    k= 2;    m=3;  n=-10;



eqn1 = a*x + b*y + c*z == d;
eqn2 = e*x + f*y + g*z == h;
eqn3 = j*x + k*y + m*z == n;


% Actual result
sol = solve([eqn1, eqn2, eqn3], [x, y, z]);
xSol = sol.x;
ySol = sol.y;
zSol = sol.z;

%jacobi result
A=[ a b c d;
    e f g h;
    j k m n];
[x_function, y_function, z_function]=Jacobi_method_f(A);

x_gap2=xSol-x_function;  
y_gap2=ySol-y_function;  
z_gap2=zSol-z_function;  

double (x_gap2)
double (y_gap2)
double (z_gap2)