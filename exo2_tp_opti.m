clear all
close all
clc

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

fc=@(x) -(pi*x(3)*x(3)+pi*x(6)*x(6));

x1=0;
y1=0;
r1=2;
x2=0;
y2=0;
r2=3;

x=[x1;y1;r1;x2;y2;r2];

A=[-1  0  0  0  0  0 ;
    0  0  0 -1  0  0 ; 
    0 -1  0  0  0  0 ; 
    0  0  0  0 -1  0 ; 
    0  0 -1  0  0  0 ; 
    0  0  0  0  0 -1 ; 
    0  0  1  0  0  0 ; 
    0  0  0  0  0  1 ;
    0  1  0  0  0  0 ;
    0  0  0  0  0  1 ;
    -1.4 1 0 0  0  0 ;
    0  0  0 -1.4 1 0 ;
    2.5 1 0 0  0  0 ;
    0  0  0 2.5 1 0 ];

B=[0;0;0;0;-2;-2;35;35;8;8;0;0;47.5;47.5];

%A(15)=x1*x1+y1*y1+(x2-x1)^2+(y2-y1)^2-400;
%A(16)=(x2-x1)^2+(y2-y1)^2-(r1+r2)^2;
%c1=@(x) x(1)*x(1)+x(2)*x(2)+(x(4)-x(1))^2+(x(5)-x(2))^2-400;
%c2=@(x) (x(4)-x(1))^2+(x(5)-x(2))^2-(x(3)+x(6))^2;


[xopt,fval,exitflag,output]=fmincon(fc,x,A,B,[],[],[],[],@c1);

%%%%% Plot the circles

r = xopt(3)
xc = xopt(1);
yc = xopt(2);

scatter(xc,yc,'g','filled');
theta = linspace(0,2*pi);
u = r*cos(theta) + xc;
v = r*sin(theta) + yc;
plot(u,v,'g','LineWidth',1);


r = xopt(6)
xc = xopt(4);
yc = xopt(5);

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