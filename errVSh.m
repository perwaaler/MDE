%M=largest value of N for wich we plot the error.

function globerr = errVSh(A, y0, t0, tf,M)
    globerr = [];
for N=1:M
    [approx,err]=eulerint(A,y0,t0,tf,N);
    globerr = cat(2,globerr,err);
end
    globerr=1;
end