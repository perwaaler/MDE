function out=biopop(t,y)
% The right hand side of the differential eq. system relating to
% the predator prey model.
x=y(1);
y=y(2);
out=[3*x-9*x*y;15*x*y-15*y];
end