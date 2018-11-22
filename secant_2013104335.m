function [root,ea,iter] = secant_2013104335(f,xb,x,es,maxit,varargin)
%input output explain 
%input 
%f = ����� �Լ�
%xb,x = �ʱ� ������ �ΰ��� x_(i-1),x_i 
%es = stopping criterion
%maxit = �ִ� �ݺ� Ƚ��
%varargin : variation argument input �߰��� ���̴� ���� �Է�
%output
%root = f�� �� 
%ea = approximation relative error , iter = �ݺ�Ƚ��

%error catch
%nargin : number of arugement input
if nargin<4 | es<=0, es=0.0001;end %es �Է� ���ҽ� 0.0001
if nargin<5 | maxit<=0, maxit=50;end %iter �Է� ���� �� 50

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