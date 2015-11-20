%cd 'D:\Desktop\Mars\EPA_Data\103年 高屏空品區'
[A B C] = xlsread('97年馬公站_20090301.xls');
file='97年馬公站_20090301.xls'
airstr = 'O3';
date_start = '2008/1/1';
date_end = '2008/12/31';
[a,b,c,d] = getplot(file,airstr,date_start,date_end);
