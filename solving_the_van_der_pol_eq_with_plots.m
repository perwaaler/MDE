%% Solving a stiff ODE: the van der pol equation
f=@vander_f;
mu=10
t0=0
tf=2*mu
y0=[2;0]
tol=1.0e-10

[t_list,y_list] = adaptiveRK34(f, y0, t0, tf, tol,mu)
%odd result for y0=[4;15] and for [4;19] and
%% Plotting the estimation of the vander pol equation
plot(y_list(1,:),y_list(2,:))
title('Phase diagram')
xlabel('y_1')
ylabel('y_2')
%% 4.2 investigating relationship between mu and N.
mu=100
tol=1e-9
t0=0
tf=mu*0.7
y0=[2;0];
[t_list,y_list] = adaptiveRK34(f, y0, t0, tf, tol)
N=length(t_list)-1
%% data saved for each mu
N_list=[681,892,1163,1569,2119,3187,5636,11432,24159,54305,110162,230578,498658]
mu=[10, 15, 22, 33, 47, 68, 100, 150, 220, 330, 470, 680, 1000]
%% loglog plot of Number of intervals vs mu
N_log=log(N_list)
m_log=log(mu)
loglog(mu,N_list,'--bs')
grid()

(N_log(8)-N_log(end))/(m_log(8)-m_log(end)) % Slope of the curve

%We can see that the slope of the curve in the loglog plot is approximately
%2. Hence we conclude that the N is proportional to mu^2.
%% here we test the matlab ode solver ode15s for the same problem
tic

f=@vander_f;
mu=10000000
t0=0
tf=mu*0.7
TSPAN=[t0,tf]
y0=[2,0];
[t_list,y_list] = ode15s(f,TSPAN,y0)
N=length(t_list)-1

toc
%the speed of the function seems to not depend on the size of mu.
%% data saved for each mu for the matlab function ode15s
Nlist=[45,48,49,57,60,62,49,48,46,48,49,49,49]
mu=[10, 15, 22, 33, 47, 68, 100, 150, 220, 330, 470, 680, 1000]

plot(mu,Nlist,'--bs')