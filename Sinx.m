function Sinx(x,n)
    f=x;
    fprintf('sin x = (%0.2f)',f);
if n==1
   
else
    for i = 2:1:n
    k= 2*i-1;
    f = f + ((x^k)*((-1)^(i-1))/factorial(k));
    if (-1)^(i-1)>0
        fprintf('+((%2.2f)^%2.0f/%2.0f) ',x,k,k);
    else
        fprintf('-((%2.2f)^%2.0f/%2.0f) ',x,k,k);
    end
    end
end

er = ((sin(x)-f)/sin(x))*100;
fprintf('\nsin(x) = %0.2f, f = %f, error = %f %% \n',sin(x),f,er);
end
    

