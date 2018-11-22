function grade = lettergrade(score)
if score > 100
    disp('점수는 0이상 100이하로 입력해주세요');
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
    disp('점수는 0이상 100이하로 입력해주세요');
end
end

        