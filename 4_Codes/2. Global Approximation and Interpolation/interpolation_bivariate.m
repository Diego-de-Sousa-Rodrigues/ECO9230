% Generates a interpolation of bivariate function in the interval -1 to 1

[x, y] = meshgrid(-1:.25:1);
z = sin(x.^2 + y.^2);
[xi, yi] = meshgrid(-1:.05:1); 
zi = interp2(x, y, z, xi, yi, 'linear'); % We can change the method by changing linear to cubic
surf(xi, yi, zi), title('Bilinear interpolant to sin(x^2 + y^2)') 