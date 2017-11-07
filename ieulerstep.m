function y = ieulerstep(A,uold,h)
y = inv(eye(length(A))-h*A)*uold;
end

