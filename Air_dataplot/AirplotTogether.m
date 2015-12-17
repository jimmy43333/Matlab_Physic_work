%此程式將 airstr 中的空氣印在同一張fig圖上
%設定站名、空氣種類、日期
place ='萬里';
year = 2008;
date_start = '2008/1/1';
date_end = '2008/4/30';
airstr = {'PM10','O3','CO'};
s = size(airstr)
%--------------------------以上為修改部分-----------------------------
%設定檔案名稱
yearindex = {'97年','98年','99年','100年','101年'};
fnameindex = {'_20090301.xls','_20100331.csv','_20110329.csv','_20120409.csv','_20130424.xls'};
file=[ yearindex{year-2007} place '站' fnameindex{year-2007}]

% EPAgetplot函數回傳 air跟time兩個陣列
for k = 1:s(2)
    [air time] = getair(file,airstr{k},date_start,date_end);
    switch k
        case 1 
            plot(time,air,'r')
            hold on;
        case 2
            plot(time,air,'b')
            hold on;
        case 3
            air = air *100;
            plot(time,air,'k')
            hold on;
    end
end
    % 設定圖的資料
    t = strcat(date_start,'~',date_end,':',airstr{k},place);
    title(t);
    grid on;
    datetick('x','mm/dd','keepticks'); % 將x座標顯示為時間
    
    %存fig檔
%     figname = [num2str(year) place]
%     saveas(h,figname,'fig');