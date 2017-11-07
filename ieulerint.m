function [approx,err,approx_list] = ieulerint(A,y0,t0,tf,N)
h=(tf-t0)/N           %stepsize
approx_list=[y0]      %vector which contains the approximations y_n
yn=y0
for n=1:N
    yn=ieulerstep(A,yn,h);
    approx_list=cat(2,approx_list,yn);    %stores the approximations y_n in a vector.
end
approx=yn;            %The approximation at t=tf
y_true=expm(A*tf)*y0; %True value computed using the exponential matrix
err=norm(yn-y_true);        %Difference between approximation and true value at tf.
end