
% Here we test eulerint for for the simple for the case of y(t)=exp(At), 
% A=5, y0=1,t0=0 and tf=1, using various values for N.

A=5
N=100
t0=0
tf=1
y0=1
[approx,err,approx_list] = eulerint(A,y0,t0,tf,N)


x=linspace(t0,tf,N+1)  
plot(x,approx_list)  %plots the approximations
hold on
plot(x,exp(A*x))     %plots exp(At)
hold off

%%
A=50

M=20
globerr=[]
h_list=[]
for N=1:M
    [approx,err]=eulerint(A,y0,t0,tf,2^N);
    globerr = cat(2,globerr,err);
    h_list=cat(2,h_list,tf/2^N);
end

loglog(h_list,globerr)
grid()

%We see in the plot that for large N, the decline of the slope is
%approximately linear. This implies that the error is proportional to
%N^-1. This fits, since the global error is supposed to be roughly
%proportional to h which is proportional to N^-1
%%

y0=[1;1]

M=20
globerr=[]
h_list=[]
tf=10
for N=1:M
    [approx,err]=eulerint(A,y0,t0,tf,2^N);
    globerr = cat(2,globerr,err);
    h_list=cat(2,h_list,tf/2^N);
end

loglog(h_list,globerr)
grid()
%%
A=5
M=10
t0=0
tf=1
y0=1

littlehelper(A,y0, t0, tf,M)
hold on
ilittlehelper(A,y0, t0, tf,M)
hold off



