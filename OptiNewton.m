function [xopt,fopt,niter] =OptiNewton(x0,maxiter,varmin)

f=@(x1,x2) (x1-2)^2+x1*(x2-1)+3*(x2+1)^2+exp((x1+x2)/10);
grad_f=@(x1,x2) [2*(x1-2)+(x2-1)+1/10*exp((x1+x2)/10) ; x1+6*(x2+1) + 1/10*exp((x1+x2)/10)];
Jacob_f=@(x1,x2) [2+1/100*exp((x1+x2)/10) , 1+1/100*exp((x1+x2)/10) ; 1+1/100*exp((x1+x2)/10) , 6+1/100*exp((x1+x2)/10)];

%initialisation

niter=0;
x=x0;
varf=grad_f(x(1),x(2));

clf;
ezcontour(f,[-10 10 -10 10]);
hold on;

while (niter <= maxiter) & (abs(varf) >= varmin)
    
    varf=grad_f(x(1),x(2));    
    xnew=x-inv(Jacob_f(x(1),x(2)))*grad_f(x(1),x(2));
    
    plot([x(1) xnew(1)] ,[x(2) xnew(2)],'-ko');
    niter = niter + 1;
    x(1)=xnew(1);
    x(2)=xnew(2);
end
xopt=xnew;
fopt=f(xnew(1),xnew(2));
 fzero(grad_f,[0 ; 0])

