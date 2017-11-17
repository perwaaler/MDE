function y = twopBVP(fvec, alpha, beta, L, N)
%Function that solves a 2-point boundary value problem.
%
%fvec = vector containing f evaluated at the grid points, including
%endpoints
%alpha = left boundary condition
%beta = right boundary value
%L = rightmost boundary
%leftmost boundary is 0
%N = number of internal grid points. The total number of gridpoints is N+2.

xgrid = linspace(0,L,N+2);
dx=L/(N+1);

BCvec = zeros(N,1); %boundary condition vector
BCvec(1)= alpha;
BCvec(end)=beta;

%constructing toeplitz matrix
c1=zeros(N,1);
c1(1)=-2;
c1(2)=1;
T=toeplitz(c1);

fvec=fvec(2:end-1);   %trim away the endpoints


rhs=dx^2*fvec-BCvec;  %right hand side of the matrix equation

% Solving the system using lu factorization.

[L,U] = lu(T); 

%We get LUy=rhs. First solve Lz=rhs, then solve Uy=z
z=linsolve(L,rhs);
y=linsolve(U,z);
y = [alpha; y; beta]

end