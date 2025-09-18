N = 10; k = 0:N;
x=cos((2*N+1- 2*k)*pi/2/(N + 1)); %Chebyshev nodes(Eq.(3.3.1))
y=f31(x);
c=newtonp(x,y); %Chebyshev polynomial
xx = [-1:0.02: 1]; %the interval to look over
yy = f31(xx); %graph of the true function
yy1 = polyval(c,xx); %graph of the approximate polynomial function
subplot(221), plot(xx,yy,'k-', x,y,'o', xx,yy1,'b')
subplot(222), plot(xx,yy1-yy,'r') %graph of the error function