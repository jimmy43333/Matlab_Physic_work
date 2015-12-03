temp = [0;0;0];
airsize = size(air);
for i = 1:airsize(1)
    for j = i:airsize(2)
        if air(i,j) > 60
            temp(1,end+1) = time(i,j);
            temp(2,end) = i;
            temp(3,end) = j;
        end
    end
end

Result(2:length(place)+1,:) = place';
for i = i:length(temp)
    for j = 1:length(Result)
        if temp(1,i) == Result{1,j}
            Result(temp(2,i)+1,j) = {air(temp(2,i),temp(3,i))};
        else
            Result(1,end+1) = {datestr(temp(1,i))};
            Result(temp(2,i)+1,end) = {air(temp(2,i),temp(3,i))};
        end
    end
end
