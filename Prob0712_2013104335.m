x=linspace(-4,4);
y=linspace(-4,4);
[X,Y] = meshgrid(x,y);
H = 1./(1+X.^2+Y.^2+X+X.*Y);
subplot(1,2,1);
cs=contour(X,Y,H);
clabel(cs);
title('Contour');grid;
subplot(1,2,2);
cs=surfc(X,Y,H);
zmin=floor(min(H));
zmax=ceil(max(H));
title('Mesh');

f=@(x) -1/(1+x(1).^2+x(2).^2+x(1)+x(1)*x(2));
[x,fval]=fminsearch(f,[4,4])

