function x = newton(func,x0,param,crit,maxit)
for i = 1:maxit
    [f,J]=feval(func,x0,param);
x=x0-inv(J)*f;
if norm(x-x0)<crit;
break
end
x0=x;
end

if i>= maxit
    sprintf('Warning: Maximum numbers of %g iterations was reached', maxit);
end

