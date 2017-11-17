%% beam deflection
% the problem is M''=q(x), u''=M(x)/(E*I(x)).
% we are assuming homogenous endpoint conditions; M(0)=M(L)=u(0)=u(L)=0.

% endpoint conditions
alpha = 0 ;
beta = 0 ;
L = 10 ;                             % rightmost point 
E = 1.9*10^11 ;                    % Youngs modulus in N/m^2
N = 999 ;                            % number of internal gridpoints
xgrid = linspace(0,L,N+2) ;

qx = -50*10^3;                        % The load distribution N/m
Ivec = I(xgrid,L)' ;                   % twisting moment as fcn of x

qvec = ones(N+2,1) ;                 % vector with rhs for M''=q(x)
qvec = qx*qvec ;

% first we solve M''=q(x)
M = twopBVP(qvec, alpha, beta, L, N) ; 

% Solving u''=M(x)/(I(x)E)
rhs = M./Ivec ;                     %right hand side
rhs = rhs/E ;

u = twopBVP(rhs, alpha, beta, L, N) ;
%% 

plot(xgrid, u)

% The deflection of the beam at the middle is approximately 12 mm.


