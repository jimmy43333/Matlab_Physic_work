%設定站名、空氣種類、日期
place = '萬里站';
year = 2010;
date_start = '2010/2/1';
date_end = '2010/2/28';
airstr = 'PM10';
%--------------------------以上為修改部分-----------------------------
%設定檔案名稱
yearindex = {'97年','98年','99年','100年','101年'};
fnameindex = {'_20090301.xls','_20100331.csv','_20110329.csv','_20120409.csv','_20130424.xls'};
file=[ yearindex{year-2007} place fnameindex{year-2007}]

% EPAgetplot函數回傳 air跟time兩個陣列
[air time] = getair(file,airstr,date_start,date_end);
plot(time,air,'r')

% 設定圖的資料
t = strcat(date_start,'~',date_end,':',airstr,place);
title(t);
grid on;
datetick('x','mm/dd','keepticks'); % 將x座標顯示為時間

% hold on;
% [air2,time2] = EPAgetplot(file,'RH',date_start,date_end);
% plot(time2,air2,'b')