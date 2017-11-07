
function unew = RK4step(f, uold, told, h,opt1)
% RK4step Performs a single step of the RK4 method. the function f is the 
% right hand side of the differentaial equation y=f(t,y)
if nargin>4
    yp1 = f(told, uold,opt1);
    yp2 = f(told+h/2, uold + h/2*yp1,opt1);
    yp3 = f(told+h/2, uold + h/2*yp2,opt1);
    yp4 = f(told + h, uold + h*yp3,opt1);
else
    yp1 = f(told, uold);
    yp2 = f(told+h/2, uold + h/2*yp1);
    yp3 = f(told+h/2, uold + h/2*yp2);
    yp4 = f(told + h, uold + h*yp3);
end
unew = uold + h/6*(yp1 + 2*yp2 + 2*yp3 + yp4);
end

