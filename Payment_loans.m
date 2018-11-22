function A = Payment_loans( P, i, n )
N = 1:1:(n);
%n개 배열 생성 
A = P.*(i.*(1+i).^N)./((1.+i).^N-1);
%값 계산 식 

fprintf('\n Year \t Payment \n');
for k = 1:1:n  %n개의 테이블 프린트
    fprintf(' %d  \t %5.2f \n',N(k),A(k)); 
end
end