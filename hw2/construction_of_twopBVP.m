%constructing twoBVP solver
%y = twopBVP(fvec, alpha, beta, L, N)
alpha=0;
beta=0;
L=2*pi;
N=1000;
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

%vector with f evaluated at the internal gridpoints.
fvec=f2(xgrid);
fvec=fvec(2:end-1); %trim away the endpoints
fvec=dx^2 * fvec' ; %turn into columnvector

rhs=fvec-BCvec;

%lu factorization of T
[L,U] = lu(T);
%We get LUy=rhs. First solve Lz=rhs, then solve Uy=z
z=linsolve(L,rhs);
y=linsolve(U,z);
y = [alpha; y; beta]



