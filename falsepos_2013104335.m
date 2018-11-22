function [root,fx,ea,iter] = falsepos_2013104335(func,xl,xu,es,maxit,varargin)
%input output explain 
%input 
%func = ����� �Լ�
%xl,xu = ���� ���� xl~xu
%es = stopping criterion
%maxit = �ִ� �ݺ� Ƚ��
%varargin : variation argument input �߰��� ���̴� ���� �Է�
%output
%root = func�� �� / fx = func(root)
%ea = approximation relative error , iter = �ݺ�Ƚ��

%error catch
%nargin : number of arugement input
if nargin<3,error('at least 3 input arguments required'),end
test = func(xl,varargin{:})*func(xu,varargin{:});
if test>0,error('no sign change'),end
if nargin<4 | es<=0, es=0.0001;end %es �Է� ���ҽ� 0.0001
if nargin<5 | maxit<=0, maxit=50;end %iter �Է� ���� �� 50

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
    d = fr*fl; % ��ȣ �Ǻ� 
    if d>0 %��ȣ�� ������ xl�� xr�� ��� ����
        xl = xr;
    elseif d<0 %�ٸ��� xu �� xr�� ����
        xu = xr;
    else % ���� 0 �̶�� xr = xrold �̹Ƿ� ea = 0
        ea = 0;
    end
    %Stopping criterion ea<=es or iter >= maxit
    if ea <= es | iter>=maxit
        break
    end
end
%solution
root = xr; fx = func(xr,varargin{:});