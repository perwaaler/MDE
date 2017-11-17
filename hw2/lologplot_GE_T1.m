alpha=0;
beta=0;
L=2*pi;
globerr = []
listN=[];
errlist = [];
for N=9:999
    dx = 1/(N+1);
    xgrid = linspace(0,L,N+2);
    fvec = f2(xgrid)';
    y = twopBVP(fvec, alpha, beta, L, N);
    
    solution = sin(xgrid)';
    e = solution - y;
    errlist(N-8) = 1/(N+1)*norm(e);
    listN(N-8)  =  dx;
end

%%
loglog(listN, errlist)

    grid();
    ylabel('Root mean square error')
    xlabel('\Delta x')
    
    ax = gca;
    outerpos = ax.OuterPosition;
    ti = ax.TightInset; 
    left = outerpos(1) + ti(1);
    bottom = outerpos(2) + ti(2);
    ax_width = outerpos(3) - ti(1) - ti(3);
    ax_height = outerpos(4) - ti(2) - ti(4);
    ax.Position = [left bottom ax_width ax_height];

    fig = gcf;
    fig.PaperPositionMode = 'auto'
    fig_pos = fig.PaperPosition;
    fig.PaperSize = [fig_pos(3) fig_pos(4)];
    
    print(fig,'rmstask1','-dpdf')