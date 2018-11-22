function [root,fx,ea,iter] = falsepos_2013104335(func,xl,xu,es,maxit,varargin)
%input output explain 
%input 
%func = 사용할 함수
%xl,xu = 추정 구간 xl~xu
%es = stopping criterion
%maxit = 최대 반복 횟수
%varargin : variation argument input 추가로 쓰이는 변수 입력
%output
%root = func의 해 / fx = func(root)
%ea = approximation relative error , iter = 반복횟수

%error catch
%nargin : number of arugement input
if nargin<3,error('at least 3 input arguments required'),end
test = func(xl,varargin{:})*func(xu,varargin{:});
if test>0,error('no sign change'),end
if nargin<4 | es<=0, es=0.0001;end %es 입력 안할시 0.0001
if nargin<5 | maxit<=0, maxit=50;end %iter 입력 안할 시 50

%false position
iter = 0; xr = xl;
while(1)
    xrold = xr; %previous xr
    fl = func(xl,varargin{:});
    fu = func(xu,varargin{:});
    xr = xu - (fu*(xl-xu)/(fl-fu));
    
    iter = iter + 1; %count loof
    ea = abs((xr-xrold)/xr)*100;
    fr = func(xr,varargin{:});
    d = fr*fl; % 부호 판별 
    if d>0 %부호가 같으면 xl에 xr을 대신 넣음
        xl = xr;
    elseif d<0 %다르면 xu 에 xr을 넣음
        xu = xr;
    else % 곱이 0 이라면 xr = xrold 이므로 ea = 0
        ea = 0;
    end
    %Stopping criterion ea<=es or iter >= maxit
    if ea <= es | iter>=maxit
        break
    end
end
%solution
root = xr; fx = func(xr,varargin{:});