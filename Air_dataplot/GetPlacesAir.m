%cd 'D:\Desktop\Mars\EPA_Data\103年 高屏空品區'
%[A B C] = xlsread('97年馬公站_20090301.xls');
year = 2008;
airstr = 'O3';
place = {'萬里','觀音','埔里','花蓮','台西','恆春','馬公'};
%------------------以上為修改部分-------------------------------------------
%設定檔案名稱
yearindex = {'97年','98年','99年','100年','101年','102年','103年'};
fnameindex = {'_20090301.xls','_20100331.csv','_20110329.csv','_20120409.csv','_20130424.xls','_20140417','_20150324'};
placesize = size(place);

%找出 12~3月 的 空氣資料，存成 air矩陣 跟對應的 time矩陣
for i = 1:placesize(1,2)
    file1=[ yearindex{year-2007} place{i} '站' fnameindex{year-2007}];
    date_start = [ num2str(year) '/12/1'];
    date_end = [ num2str(year) '/12/31'];
    [air1 time1] = getair(file1,airstr,date_start,date_end);
    
    file2=[ yearindex{year-2006} place{i} '站' fnameindex{year-2006}];
    date_start = [ num2str(year+1) '/1/1'];
    date_end = [ num2str(year+1) '/3/31'];
    [air2 time2] = getair(file2,airstr,date_start,date_end);

    air(i,:) = [air1 air2];
    time(i,:) = [time1 time2];
end

%存檔
savename = [num2str(year) 'AirTime']
save(savename,'air','time','place');
