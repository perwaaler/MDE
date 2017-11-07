function glob_err=logplotRK4(f,y0, t0, tf,N_max)
glob_err = [];        %vector of error for N=1:M
h_list=[];
for N=1:N_max
    [approx,err]=RK4int(f,y0,t0,tf,N);
    glob_err = cat(2,glob_err,abs(err));
    h_list=cat(2,h_list,tf/N);
end
loglog(h_list,glob_err);
grid();
end