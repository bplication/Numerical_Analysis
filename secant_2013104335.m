function [root,ea,iter] = secant_2013104335(f,xb,x,es,maxit,varargin)
%input output explain 
%input 
%f = 사용할 함수
%xb,x = 초기 추정값 두가지 x_(i-1),x_i 
%es = stopping criterion
%maxit = 최대 반복 횟수
%varargin : variation argument input 추가로 쓰이는 변수 입력
%output
%root = f의 해 
%ea = approximation relative error , iter = 반복횟수

%error catch
%nargin : number of arugement input
if nargin<4 | es<=0, es=0.0001;end %es 입력 안할시 0.0001
if nargin<5 | maxit<=0, maxit=50;end %iter 입력 안할 시 50

%false position
iter = 0; 
while(1)
    xa = x-(f(x)*(xb-x)/(f(xb)-f(x)));
    %secant method formula
    iter = iter +1;
    ea = abs((xa-x)/xa)*100;
    %Stopping criterion ea<=es or iter >= maxit
    if ea <= es | iter>=maxit
        break
    end
    xb=x;
    x=xa;
end
%solution
root = xa;