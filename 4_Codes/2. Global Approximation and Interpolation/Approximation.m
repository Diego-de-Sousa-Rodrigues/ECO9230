% Discussion of Interpolation Method

% Suppose that y = g(x) is unknownl but we have a set o data points in R^2
% such that D = {(xo,yo), (x1,y1),...,(xn,yn)}. Our task in such a
% environment is to find a function g(x) hat that best approximates the
% original function g(x).

% The fist method of approximation of a function is approximates a function
% around a point x*. The Taylor expansion is the main tool to do this type of
% approximation, whic is known as local approximation.

% The third type of approximation is interpolation, which uses a finite set
% of data to find a function that best describes the data in hand. In
% particular we use n conditions to determine n free parameters.

% In the case of interpolation we approximate a function g:[a,b] - R, where
% g(x) = sum cj*fij(x) from 1 to m, where m represents the degree of
% interpolation , fij is the basis function as cj are the coefficients

% The first step in Interpolaton methods is to determine the basis
% functions, which are usually polynomials. Then , the second step is to
% determine the coefficients.

% In the second step we have to solve the following problem A*c = y, where
% we have that Aij = fij(xi)
