function [unew, err] = RK34step(f, uold, told,h,opt1)
% Function that performs a single step of the RK4 method. It also computes
% an estimate of the local error that gets added in the step.
if nargin>4
    yp1= f(told, uold,opt1);
    yp2=f(told+h/2, uold + h/2*yp1,opt1);
    yp3=f(told+h/2, uold + h/2*yp2,opt1);
    yp4=f(told + h, uold + h*yp3,opt1);
    zp3=f(told+h, uold-h*yp1+2*h*yp2,opt1);
else
    yp1= f(told, uold);
    yp2=f(told+h/2, uold + h/2*yp1);
    yp3=f(told+h/2, uold + h/2*yp2);
    yp4=f(told + h, uold + h*yp3);
    zp3=f(told+h, uold-h*yp1+2*h*yp2);
end

unew = uold + h/6*(yp1 + 2*yp2 + 2*yp3 + yp4);   
err = h/6*(2*yp2+zp3-2*yp3-yp4);                
end