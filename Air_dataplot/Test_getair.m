%cd 'D:\Desktop\Mars\EPA_Data\103�~ ���̪ū~��'
%[A B C] = xlsread('97�~������_20090301.xls');
place = '������'
file1=['97�~' place '_20090301.xls'];
airstr = 'RH';
date_start = '2008/12/1';
date_end = '2008/12/31';
[air time] = getplot(file1,airstr,date_start,date_end);

bigger60 = [ 0 ; 0 ];  % ��X�Ů�j��60���ɶ���ƭ�
index = 1;
airlength = length(air);
for i = 1:airlength
    if air(i) >= 60
        bigger60(1,index) = time(i);
        bigger60(2,index) = air(i);
        index = index + 1;
    end
end

file2=[ '98�~' place '_20100331.csv'];
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
    
