function [x,y,z] = Jacobi_method_f(A)
%Jacobi_method Use Jacobi iteration to solve linear equation
%   the Jacobi method does not converge for symmetric positive-definite matrix
%   or matrix A is not strictly or irreducibly diagonally dominant. 
%   Input = matrix A(3x4), Output = [x,y,z]


% Initialization
syms x y z 
assume(x,'real')
assume(y,'real')
assume(z,'real')

a=A(1,1);    b= A(1,2);    c=A(1,3);  d=A(1,4);  
e=A(2,1);   f= A(2,2);    g=A(2,3) ; h=A(2,4);
j=A(3,1);    k= A(3,2);    m=A(3,3);  n=A(3,4);

eqn1 = a*x + b*y + c*z == d;
eqn2 = e*x + f*y + g*z == h;
eqn3 = j*x + k*y + m*z == n;

x=0.0;y=0.0;z=0.0; % initial value
 
for i=1:36
    x_temp= 1.0/a*(d-(b*y + c*z));
    y_temp= 1.0/f*(h-(e*x + g*z));
    z_temp= 1.0/m*(n-(j*x + k*y));
    
    x=x_temp;
    y=y_temp;
    z=z_temp;
end

end
