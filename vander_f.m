function out=vander_f(t,y,opt1)
% The right hand side of the Van Der Pol equation.
if nargin>2
    mu=opt1;
else
    mu=10;
end
y1=y(1);
y2=y(2);
out=[y2; mu*(1-y1^2)*y2-y1];
end