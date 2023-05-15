clear all
close all
clc

%%
clf;
f=@(x1,x2) (x1-2)^2+x1*(x2-1)+3*(x2+1)^2+exp((x1+x2)/10);
ezsurf(f,[-10 10 -10 10]);
hold on;

%%
xo=[50; 50];
[xopt,fopt, niter]=opt_gradient(xo,1000,0.000001)

%%

% grad_f=@(x1) [2*(x1-2)+(x2-1)+1/10*exp((x1+x2)/10) ; x1+6*(x2+1) + 1/10*exp((x1+x2)/10)];
% 
% fzero(grad_f,[0; 0])

syms x1 x2
eqns = [2*(x1-2)+(x2-1)+1/10*exp((x1+x2)/10) == 0,  x1+6*(x2+1) + 1/10*exp((x1+x2)/10) ==0];
[solv, solu] = solve(eqns, [x1 x2])