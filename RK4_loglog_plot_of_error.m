%% Loop where we create a plot of global error as a as fcn. of using the RK4(non-adaptive) solver
f=@test_fcn; %The rhs of y'=lambda
y0=1
t0=0
tf=3
Nmax=1000
lambda=1
glob_err = [];        %vector that collects endpoint global errors for N=1:Nmax
h_list=[];
for N=1:Nmax
    approx   = RK4int(f,y0,t0,tf,N,lambda);
    true_val = exp(lambda*tf);
    err      = approx-true_val;      %endpoint global error
    glob_err = cat(2,glob_err,abs(err));
    h_list=cat(2,h_list,tf/N);
end
loglog(h_list,glob_err);
grid();
xlabel('stepsize')
ylabel('global error')

% Conclusions: For the interval [0,1], and lambda any number, we get that
% The slope in the loglog diagram is approximately 4 for small h. However,
% as we increase lambda we observe that the y-intercept of the slope goes 
% up, and so the error grows for a fixed h as we increase lambda.