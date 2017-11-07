function [t_list,y_list] = adaptiveRK34(f, y0, t0, tf, tol,opt1)
% Adaptive Runge-Kutta34 solver.

k=4                                               %order of method is 4
y_list=y0;
t_list=[t0];
rold=tol;
hold=abs(tf-t0)*tol^.25/(100*(1+norm(test2(t0,y0)) )); %defining h0
h_list=[hold];

while t_list(end)+hold < tf
    if nargin>5
        [y, rnew] = RK34step(f, y_list(:,end), t_list(end), hold,opt1);
    else
        [y, rnew] = RK34step(f, y_list(:,end), t_list(end), hold);
    end
    
    rnew      = norm(rnew);                         %new local error
    t_list    = cat(2,t_list,t_list(end)+hold);     %update time
    hnew      = newstep(tol, rnew, rold, hold,k);   %size of next time-step
    y_list    = [y_list,y];                         %add newest y value
    h_list    = cat(2,h_list,hnew);                 
    rold      = rnew;
    hold      = hnew;
    
end

hf=tf-t_list(end);                                  %length of last interval
if nargin>5
    yf = RK34step(f, y_list(:,end), t_list(end), hf,opt1);
else
    yf = RK34step(f, y_list(:,end), t_list(end), hf);     %value of y at tf
end
t_list=cat(2,t_list,tf);                            
y_list=[y_list,yf];