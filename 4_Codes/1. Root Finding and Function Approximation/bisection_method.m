% Bisection method is a useul and simple way to find a solution of a
% continuos and univariate function on a closed interval [a, b]

% It does not depend on derivatives and always converges to the
% solution, if it exists

% Use the idea of Intermediate Value Theorem. If f(a) and f(b) are opposite
% sign, then there exists x in the interval [a,b] such that f(x) = 0

% The algorithm use the idea: define a lower and upper bounds and after that  
% construct midpoints in the interval [a,b]

% (i) Define lower x and upper bound x of interval: Use x = a and
% x = b.
% (ii) Compute midpoint of interval c = (x+x)/2
% (iii) if f (c) > 0 set x = c, otherwise if f (c) < 0 set x = c.
% (iv) If abs(f(c)) <= epsilon, then stop and call c a root, otherwise go to step (ii).

% Bisection method

% Find the roots of the function f(x) = x^2 -4 for x in the interval [a,b]
a = 1; % Lower bound
b=10; % Upper bound
fa = a^2 - 4; % Value of the function in the lower bound
fb = b^2 - 4; % Value of the function in the upper bound
tol = 0.000001;

if fa*fb > 0
    display ('Wrong Choice of a and b')
else 
    c = (a+b)/2; %Midpoint
    err = (abs(c^2-4));
    while err > tol
        if c^2 - 4 > 0
            b = c;
        elseif c^2 - 4 < 0;
            a = c;
        end 
        c = (a+b)/2;
        err = abs(c^2-4);
    end
end

    
    



