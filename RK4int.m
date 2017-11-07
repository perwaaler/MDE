function [approx,approx_list] = RK4int(f,y0,t0,tf,N,opt1)
h=(tf-t0)/N;           %stepsize
approx_list=[y0];      %vector in which the approximations y_n will be stored
yn=y0;    
tn=t0;
for n=1:N
    if nargin>5
        yn=RK4step(f, yn, tn, h,opt1);
    else
        yn=RK4step(f, yn, tn, h);
    end
    approx_list=cat(2,approx_list,yn);
    tn=tn+h;
end
 approx=yn;
end
 
    