function [xopt,fopt, niter]= opt_gradient(x0,maxiter,varmin)
f=@(x1,x2) (x1-2)^2+x1*(x2-1)+3*(x2+1)^2+exp((x1+x2)/10);
grad_f=@(x1,x2) [2*(x1-2)+(x2-1)+1/10*exp((x1+x2)/10) ; x1+6*(x2+1) + 1/10*exp((x1+x2)/10)];
% initialisations

niter=0;
x=x0;
alphak=0.1;
varf=grad_f(x(1),x(2));

clf;
ezcontour(f,[-10 10 -10 10]);
hold on;
while (niter <= maxiter) & (abs(varf) >= varmin)
    % calcul du gradient
    varf=grad_f(x(1),x(2));
    % methode de descente
    xnew=x-alphak*varf;
 
    plot([x(1) xnew(1)] ,[x(2) xnew(2)],'-ko');
    niter = niter + 1;
    x(1)=xnew(1);
    x(2)=xnew(2);
end
xopt=xnew;
fopt=f(xnew(1),xnew(2));
