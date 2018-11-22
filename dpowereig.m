function [ eval, evect, ea, iter] = dpowereig(A,es,maxit)

%error catch
if nargin<1,error('at least 1 input argument required'),end
if nargin<2||isempty(es), es=0.0001;end
if nargin<3||isempty(maxit), maxit=50; end

format short g
n = length(A);
vect = ones(n,1);
val = 0;iter=0;ea=100;Aval=A; %initial value setting
while(1)
    W = vect/abs(vect);
    valold = val;
    Aval = Aval - val*(W*W');
    vect = Aval*vect;
    val=max(abs(vect));
    vect=vect./val;
    iter=iter+1;
    if val~=0, ea = abs((val-valold)/val)*100;end
    if ea<=es || iter >= maxit,break,end
end
eval=val;evect=vect;

end
