%% Lotka Volterra equation. Population dymanics. Using the RK34 addaptive solver.

a=3
b=9
c=15
d=15

f=@biopop;

y0=[1;3] % initial populations of rabbits and foxes respectively
tf=100
tol=1e-10

[t_list,y_list] = adaptiveRK34(f, y0, t0, tf, tol);
x=y_list(1,:);
y=y_list(2,:);
%% plotting y as y(x)
%plot3(t_list,y_list(1,:),y_list(2,:)) % 3d plot
plot(x,y)
%% Plot that shows phase difference between x(t) and y(t).
% command for clearing variable: "clear hold"
plot(t_list,x)
hold on
plot(t_list,y)
hold off

%% Investigating potential drifting away from solution
% If solution is accurate then H(x,y)/Hy0-1) should equal 0 for all x,y on
% curve.

f = @biopop;
y0 = [1;3] % initial populations of rabbits and foxes respectively
tf = 100
tol = 1e-10
[t_list,y_list] = adaptiveRK34(f, y0, t0, tf, tol);

drift=[]
Hy0=H_x_y(y0)
for i=1:length(y_list)
    y=y_list(:,i);
    y=[y(1);y(2)];
    drift=[drift,abs(H_x_y(y)/Hy0-1)];
end
plot(t_list,drift)
t_list1000=t_list


