function [ c,ceq ] = c1( x )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    c(1)= sqrt(x(1)*x(1)+x(2)*x(2))+sqrt((x(4)-x(1))^2+(x(5)-x(2))^2)-20;
    c(2)= -sqrt((x(4)-x(1))^2+(x(5)-x(2))^2)+(x(3)+x(6));
    ceq=[];
end