function zint = interp2_2013104335(x,y,xx,yy,method)
%input
%x = independent variable
%y = independent variable
%z = independent variable
%xx = value of x which the interportaion is calculated
%yy = value of y which the interportaion is calculated
%'method' = argument to select 'Newton' or 'Lagrange'
%
%output
%zint = interpolated value of dependent variable


    n = length(x);
    if length(y) ~= n, error('x and y must to be same lenth'); end

switch method
    case 'Newton'
    %assign dependent variables to the first column of b.
    xn = zeros(n,n);
    yn = zeros(n,n);
    xn(:,1) = z(:);
    yn(:,1) = z(:);
    for j = 2:n
        for i = 1:n-j+1
            xn(i,j) = (xn(i+1,j-1)-xn(i,j-1))/(x(i+j-1)-x(i));
            yn(i,j) = (yn(i+1,j-1)-yn(i,j-1))/(y(i+j-1)-y(i));
        end
    end
    %use the finite devided differences to interpolate
    xt = 1;
    yt = 1;
    zint = xn(1,1);
    for j = 1:n-1
        xt = xt*(xx-x(j));
        yt = yt*(yy-y(j));
        zint = zint+xn(1,j+1)*xt;
    end
    
    case 'Lagrange'
    s = 0; 
    for i = 1:n
        xl = z(i);
        yl = z(i);
        for j = 1:n
            if i ~= j
                xl = xl*(xx-x(j))/(x(i)-x(j));
                yl = yl*(yy-y(j))/(y(i)-y(j));
            end
        end
        s = s+xl;
    end
    zint = s;
end