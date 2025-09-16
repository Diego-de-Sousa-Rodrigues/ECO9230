syms x
f = x^(-1/2);
t1 = taylor(f, x, 'ExpansionPoint', 1, 'Order', 1);
% generate the first 1 nonzero terms of the Taylor series for f about x = 1.
t2 = taylor(f, x,  'ExpansionPoint', 1, 'Order', 2);
% generate the first 2 nonzero terms of the Taylor series for f about x = 1.
t3 = taylor(f, x,  'ExpansionPoint', 1, 'Order', 3);
% generate the first 3 nonzero terms of the Taylor series for f about x = 1.
t4 = taylor(f, x, 'ExpansionPoint', 1, 'Order', 4);
% generate the first 4 nonzero terms of the Taylor series for f about x = 1.
t5 = taylor(f, x, 'ExpansionPoint', 1, 'Order', 5);
% generate the first 5 nonzero terms of the Taylor series for f about x = 1.
t9 = taylor(f, x, 'ExpansionPoint', 1, 'Order', 9);



fplot(t2)
hold on
fplot(t3)
fplot(t4)
fplot(t5)
fplot(t9)
fplot(f)

xlim([0 2])
ylim ([-0.5 5])

legend('approximation of f in the 1st order',...
'approximation of f in the 2nd order',...
'approximation of f in the 3rd order',...
'approximation of f in the 4th order',...
'approximation of f in the 8th order',...
'f',...
'Location', 'South');

title('Taylor Series Expansion')
hold off


