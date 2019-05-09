function [x1,x2,x3] = Cardano_formula(a1,a2,a3,a4)
%Cardano_formula Finding roots of a cubic equation using Cardano's
%formula
%input = (a1,a2,a3,a4), coefficients of a1*x^3+a2*x^2+a3*x+a4

a=a2/a1;    
b=a3/a1;
c=a4/a1;

p=b-(a^2)/3;
q=2/27*(a^3)-a*b/3+c;

epsilon = -1/2-1/2*i*sqrt(3);
v1=(-q/2+  sqrt((1/4*q^2)+(1/27*p^3)))  ^(1/3);
w1=(-q/2-  sqrt((1/4*q^2)+(1/27*p^3)))  ^(1/3);

%Roots of the equation
x1=v1+w1;
x2=v1*epsilon+(w1*epsilon^2);
x3=(v1*epsilon^2)+w1*epsilon;


