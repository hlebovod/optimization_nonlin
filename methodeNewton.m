clear all
close all
clc

grad_f=@(x1,x2) [2*(x1-2)+(x2-1)+1/10*exp((x1+x2)/10) ; x1+6*(x2+1) + 1/10*exp((x1+x2)/10)];


%%

xo=[70 ; 70];
[xopt,fopt,niter]=OptiNewton(xo,10,0.00000001)

grad_f(xopt(1),xopt(2))