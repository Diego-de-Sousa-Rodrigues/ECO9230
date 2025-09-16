function x = mynewtontol (f,f1 ,x0 , tol )
x = x0; % set x equal to the initial guess x0
y = f(x);
while abs (y) > tol % Do until the tolerence is reached .
x = x - y/f1(x) % Newton ’s formula
y = f(x)
end