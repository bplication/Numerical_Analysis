function [root,ea,iter] = modsecant_2013104335(f,x,del,es,maxit,varargin)
%input output explain 
%input 
%f = ����� �Լ�
%x = �ʱ� ������
%del = delta(�ؼ� ��ȭ��)
%es = stopping criterion
%maxit = �ִ� �ݺ� Ƚ��
%varargin : variation argument input �߰��� ���̴� ���� �Է�
%output
%root = f�� �� 
%ea = approximation relative error , iter = �ݺ�Ƚ��

%error catch
%nargin : number of arugement input
if nargin<3, del = 1E-6;end %del �Է� ���ҽ� 10^-6
if nargin<4 | es<=0, es=0.0001;end %es �Է� ���ҽ� 0.0001
if nargin<5 | maxit<=0, maxit=50;end %iter �Է� ���� �� 50

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
    x = xa;% x �� xa ���� �ǹǷ� �ٲ������ 
end
%solution
root = x;