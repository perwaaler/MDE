function out=test_fcn(t,y,opt1)
% The right hand side of the linear test equation.
if nargin>2
    lambda=opt1;
else
    lambda=1;
end
out=lambda*y;
end