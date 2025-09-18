% Suppose we want to approximate a function f: [a,b] - R, where f belongs
% to C[a,b] (continuous functions on [a,b])
% Th vector space of continuous functions on [a,b] is spanned  by all
% monomials, basis for C[a,b] is {1, x, x^2, ..., x^j,...}

% we can generate approximaions by the follwing function
% f(x) hat = sum from i = 0 to n thetai*x^i
% Or more generaly f(x) hat = sum i = 0 to n thetai*fi(x), where {fi1(x),
% fi2(x),...,fin(x)} is a subset from a family of polynomials that form a
% basis of C[a,b].

% Observe that we can write f(x) hat = theta1*[1;1;...;1] + theta2*[x1;
% x2;...;xn] + theta3*[x1^2;x2^2;...;xn^2] + ... +
% thetan*[x1^n-1;x2^n-1;...;xn^n-1]

% With these column vectors we can do the following matrix that we are
% going to call A and now we are going to determine polynomials fij(x)and
% the find coefficientes theta = {thetaj}j=1 to n such that we obtain the
% following solution

% theta = (A'A)^(-1)A'y, since our problem is such that we are interested
% in min thetai*sum(from i = 1 to n)(f(xi) - sum(j=1 to
% m)(thetai*fij(x)))^2, m < n


% This method is not good for large numbers because, consecutive powers for
% large numbers are close to each other ans they may generate unreliable
% results due to multicolinearity

