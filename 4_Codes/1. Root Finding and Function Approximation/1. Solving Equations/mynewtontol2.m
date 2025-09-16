function x = mynewtontol2 (f,f1 ,x0 , tol )
x = x0; % set x equal to the initial guess x0.
i =0; % set counter to zero. In this case the value of i represents the number of
% iterations we allow
y = f(x);
while abs (y) > tol & i < 1000
% Do until the tolerence is reached or max iter .
x = x - y/f1(x); % Newton ’s formula
y = f(x);
i = i +1; % increment counter
end