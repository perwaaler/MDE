%% Testing RK4
f=@test_fcn;
lambda=3
y0=1
t0=0
tf=3
N=200

[approx,approx_list] = RK4int(f,y0,t0,tf,N,lambda)



%% Testing RK34step
uold=1
told=0
h=0.00000001
[unew,loc_error]=RK34step(f, uold, told, h)

%% Testing newstep
tol=0.0001
err=0.0001
errold=0.000001
hold=0.00002
k=4
hnew = newstep(tol, err, errold, hold, k)


%% Testing newstep (does not depend on f).
tol=0.0001
err=0.0034
errold=0.0021
hold=0.001
k=4
hnew = newstep(tol, err, errold, hold, k)
%%  Here we test the adaptive RK34 solver using the linear test function
f=@test_fcn;
lambda=[[1,2];[2,2]]
%lambda=2
t0=0;
tf=1;
%y0=1;
y0=[1;1]
tol= 1.0000e-8;
k=4;

[t_list,y_list] = adaptiveRK34(f, y0, t0, tf, tol,lambda)
%% Plot of result from running the above code
plot(t_list,y_list(end))
%plot(t_list,y_list(2,:))

%% and finally, error testing
expm(lambda)*y0 - y_list(:,end)


     