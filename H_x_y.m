function out=H_x_y(y)
%This function is constant along solution curves
x = y(1);
y = y(2);
out = 15*x+9*y-15*log(x)-3*log(y)
end
