function A = Payment_loans( P, i, n )
N = 1:1:(n);
%n�� �迭 ���� 
A = P.*(i.*(1+i).^N)./((1.+i).^N-1);
%�� ��� �� 

fprintf('\n Year \t Payment \n');
for k = 1:1:n  %n���� ���̺� ����Ʈ
    fprintf(' %d  \t %5.2f \n',N(k),A(k)); 
end
end