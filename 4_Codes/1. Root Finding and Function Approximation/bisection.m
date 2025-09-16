function c = bisection (f,a,b,delta)

% Code to find the root of  a univariate function
% To run this fucntion one must guess the initial valus of a and b, which
% corresponds respectively to the lower bound and the upper bounds
% The value of delta is the level of tolerance accepted
% f = @(x)x^2 - 4;

if f(a)*f(b) > 0;
    display('Wrong choice of a and b')
else 
    c = (a+b)/2;
    err = abs(f(c));
    while err > delta
        if f(c) > 0;
            b = c;
        elseif f(c) < 0;
            a = c;
        end
        c = (a+b)/2;
        err = abs(f(c));
    end
end


% Advantages of the bissection method
% Find the zeros of any continuos function
% Disadvanges
% Have to find the initial brackets



