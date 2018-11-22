function f_cd = fcd(m,v,t,g)
f_cd =@(cd) sqrt(g*m/cd)*tanh(sqrt(g*cd/m)*t)-v;
