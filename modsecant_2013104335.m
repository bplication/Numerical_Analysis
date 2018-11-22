function [root,ea,iter] = modsecant_2013104335(f,x,del,es,maxit,varargin)
%input output explain 
%input 
%f = 사용할 함수
%x = 초기 추정값
%del = delta(극소 변화량)
%es = stopping criterion
%maxit = 최대 반복 횟수
%varargin : variation argument input 추가로 쓰이는 변수 입력
%output
%root = f의 해 
%ea = approximation relative error , iter = 반복횟수

%error catch
%nargin : number of arugement input
if nargin<3, del = 1E-6;end %del 입력 안할시 10^-6
if nargin<4 | es<=0, es=0.0001;end %es 입력 안할시 0.0001
if nargin<5 | maxit<=0, maxit=50;end %iter 입력 안할 시 50

%false position
iter = 0; 
while(1)
    xa = x-(f(x)*del*x/(f(x+del*x)-f(x)));
    %modsecant method formula
    iter = iter +1;
    ea = abs((xa-x)/xa)*100;
    %Stopping criterion ea<=es or iter >= maxit
    if ea <= es | iter>=maxit
        break
    end
    x = xa;% x 가 xa 값이 되므로 바꿔줘야함 
end
%solution
root = x;