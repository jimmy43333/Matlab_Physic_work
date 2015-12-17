%這個程式會印出 airstr 中所有的空氣對時間數量圖，並存為fig檔
%設定站名、空氣種類、日期
place ='萬里';
year = 2008; %型態需為int
date_start = '2008/1/1';
date_end = '2008/4/30';
airstr = {'PM10','O3','CO'};

%檔案名稱設定
yearindex = {'97年','98年','99年','100年','101年'};
fnameindex = {'_20090301.xls','_20100331.csv','_20110329.csv','_20120409.csv','_20130424.xls'};
file = [ yearindex{year-2007} place '站' fnameindex{year-2007}];
%--------------------------以上為修改部分-----------------------------------
s = size(airstr);
% getair函數回傳 air 跟 time 兩個陣列
for k = 1:s(2)
    h = figure(k);
    [air time] = getair(file,airstr{k},date_start,date_end);
    plot(time,air,'r')
    
    % 設定圖的相關資料
    t = strcat(date_start,'~',date_end,':',airstr{k},place);
    title(t);
    grid on;
    datetick('x','mm/dd','keepticks'); % 將x座標顯示為時間
    
    %存fig檔，檔名為"年分空氣地方"
    figname = [num2str(year) airstr{k} place]
    saveas(h,figname,'fig');
end