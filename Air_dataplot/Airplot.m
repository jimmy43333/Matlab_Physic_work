%�]�w���W�B�Ů�����B���
place = '�U����';
year = 2010;
date_start = '2010/2/1';
date_end = '2010/2/28';
airstr = 'PM10';
%--------------------------�H�W���קﳡ��-----------------------------
%�]�w�ɮצW��
yearindex = {'97�~','98�~','99�~','100�~','101�~'};
fnameindex = {'_20090301.xls','_20100331.csv','_20110329.csv','_20120409.csv','_20130424.xls'};
file=[ yearindex{year-2007} place fnameindex{year-2007}]

% EPAgetplot��Ʀ^�� air��time��Ӱ}�C
[air time] = getair(file,airstr,date_start,date_end);
plot(time,air,'r')

% �]�w�Ϫ����
t = strcat(date_start,'~',date_end,':',airstr,place);
title(t);
grid on;
datetick('x','mm/dd','keepticks'); % �Nx�y����ܬ��ɶ�

% hold on;
% [air2,time2] = EPAgetplot(file,'RH',date_start,date_end);
% plot(time2,air2,'b')