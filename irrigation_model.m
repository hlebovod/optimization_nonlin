%%%%% irrigation optimization   %%%%
% L. Houssin for M2 RODECO

%%%%% field draw %%%%%%%
clf
hold on;
axis equal;

xt=[8/1.4 19-8/2.5];
yt=[8 8];
plot(xt,yt,'r','LineWidth',1.1);

xt=[0 19];
yt=[0 0];
plot(xt,yt,'r','LineWidth',1.1);

xt=[0 8/1.4];
yt=[0 8];
plot(xt,yt,'r','LineWidth',1.1);

xt=[19-8/2.5 19];
yt=[8 0];
plot(xt,yt,'r','LineWidth',1.1);

%%%% objective %%%%
fun=...
 %%%  constraints %%%%
A=...
b=...
Aeq=...
beq=...
lb=...
ub=...

x0=...

[xopt,fval,exitflag,output,lambda,grad] = fmincon(fun,x0,A,b,Aeq,beq,lb,ub,@nonlinearconst);


%%%%% Plot the circles

r = xopt(5)
xc = xopt(1);
yc = xopt(2);

scatter(xc,yc,'g','filled');
theta = linspace(0,2*pi);
u = r*cos(theta) + xc;
v = r*sin(theta) + yc;
plot(u,v,'g','LineWidth',1);


r = xopt(6)
xc = xopt(3);
yc = xopt(4);

scatter(xc,yc,'b','filled');
theta = linspace(0,2*pi);
u = r*cos(theta) + xc;
v = r*sin(theta) + yc;
plot(u,v,'b','LineWidth',1);




display('exitflag');
exitflag
display('iterations number');
output.iterations
display('optimal value');
xopt
display('irrigation area');
-fval



