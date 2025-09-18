% Chebyshev Polynomials

% The nth Chebyshev Polynomial on [-1,1] is defined recursively as follows:
% T0 (x) = 1, T1 (x) = x, T2 (x) = 2x2 ? 1
% Tn (x) = 2xTn?1 (x) ? Tn?2 (x)

% The weight function is given by w(x) = (1-2x^2)^(-1/2)

% One can also define Tn(x) = cos(n*arcos(x)) 

% Observe that we have the following:

% Some useful properties of the Chebyshev polynomials, for constructing the
% fucntion approximations

% Range: Tn(-1) = -1, Tn(1) = 1 and Tn(z) belongs [-1,1]
% Extrema: Tn(x) has n + 1 extrema equal to -1 or 1
% Roots: Tn(x) has n distinct roots in [-1,1] given by xi=
% -cos((2i-1)pi/2n)
% Discrete orthogonality: If {xi}i =1 to n are the roots of a Chebyshev
% polynomial of order n,then we have the conditions described in the
% Lecture 3

% Chebyshev Regression algorithm