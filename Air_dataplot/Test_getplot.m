%cd 'D:\Desktop\Mars\EPA_Data\103�~ ���̪ū~��'
[A B C] = xlsread('97�~������_20090301.xls');
file='97�~������_20090301.xls'
airstr = 'O3';
date_start = '2008/1/1';
date_end = '2008/12/31';
[a,b,c,d] = getplot(file,airstr,date_start,date_end);
