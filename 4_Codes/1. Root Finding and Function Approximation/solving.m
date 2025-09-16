clear all

x0 =1;

maxit = 1000;

crit = 1e-3;

param = 4;

sol = newton ('nexp1' , x0 , param , crit , maxit );
sprintf ( 'x =% g ' , sol (1) )