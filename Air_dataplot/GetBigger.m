temp = [];
n = 60;
airsize = size(air);
for i = 1:airsize(1)
    for j = i:airsize(2)
        if air(i,j) > n
            temp(1,end+1) = time(i,j);
            temp(2,end) = i;
            temp(3,end) = j;
        end
    end
end

Result(2:length(place)+1,:) = place';
no=0;
for i = 1:length(temp)
    resultsize = size(Result);
    for j = 1:resultsize(2)
        if temp(1,i) == Result{1,j}
            Result(temp(2,i)+1,j) = {air(temp(2,i),temp(3,i))};
            break;
        else
            no = 1;
        end
    end
    if no ==1
         Result(1,end+1) = {temp(1,i)};
         Result(temp(2,i)+1,end) = {air(temp(2,i),temp(3,i))};
         no = 0;
    end
end
for i = 2:resultsize(2)+1
    Result{1,i} = datestr(Result{1,i});
end