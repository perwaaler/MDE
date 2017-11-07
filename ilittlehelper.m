function ilittlehelper(A, y0, t0, tf,M)
    O = [];        %vector of error for N=1:M
    h_list=[];
for N=1:M
    [approx,err]=ieulerint(A,y0,t0,tf,N);
    O = cat(2,O,abs(err));
    h_list=cat(2,h_list,tf/N);
end
loglog(h_list,O);
grid();
end