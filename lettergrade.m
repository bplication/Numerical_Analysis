function grade = lettergrade(score)
if score > 100
    disp('������ 0�̻� 100���Ϸ� �Է����ּ���');
elseif score>=90
    grade = 'A';
elseif score>=80
    grade = 'B';
elseif score>=70
    grade = 'C';
elseif score>=60
    grade = 'D';
elseif score>=0
    grade = 'F';
else
    disp('������ 0�̻� 100���Ϸ� �Է����ּ���');
end
end

        