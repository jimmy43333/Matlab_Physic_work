%cd 'D:\Desktop\Mars\EPA_Data\103年 高屏空品區'
%[A B C] = xlsread('97年馬公站_20090301.xls');
place = '馬公站'
file1=['97年' place '_20090301.xls'];
airstr = 'RH';
date_start = '2008/12/1';
date_end = '2008/12/31';
[air time] = getplot(file1,airstr,date_start,date_end);

bigger60 = [ 0 ; 0 ];  % 抓出空氣大於60的時間跟數值
index = 1;
airlength = length(air);
for i = 1:airlength
    if air(i) >= 60
        bigger60(1,index) = time(i);
        bigger60(2,index) = air(i);
        index = index + 1;
    end
end

file2=[ '98年' place '_20100331.csv'];
date_start = '2009/1/1';
date_end = '2009/3/31';
[air2 time2] = getplot(file2,airstr,date_start,date_end);

for i = 1:airlength
    if air2(i) >= 60
        bigger60(1,index) = time2(i);
        bigger60(2,index) = air2(i);
        index = index + 1;
    end
end
save(place,'bigger60','place');
    
