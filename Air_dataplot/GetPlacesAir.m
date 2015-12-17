year = 2008;
airstr = 'O3';
place = {'萬里','陽明','中壢','恆春'};
%------------------以上為修改部分-------------------------------------------
%設定檔案名稱
yearindex = {'97年','98年','99年','100年','101年','102年','103年'};
fnameindex = {'_20090301.xls','_20100331.csv','_20110329.csv','_20120409.csv','_20130424.xls','_20140417','_20150324'};
placesize = size(place);

%找出 空氣資料，存成 air矩陣 跟對應的 time矩陣
%若要跨年度，就啟用file2
for i = 1:placesize(1,2)
    file1=[ yearindex{year-2007} place{i} '站' fnameindex{year-2007}];
    date_start = [ num2str(year) '/1/1'];
    date_end = [ num2str(year) '/4/30'];
    [air1 time1] = getair(file1,airstr,date_start,date_end);
    
%     file2=[ yearindex{year-2006} place{i} '站' fnameindex{year-2006}];
%     date_start = [ num2str(year+1) '/1/1'];
%     date_end = [ num2str(year+1) '/3/31'];
%     [air2 time2] = getair(file2,airstr,date_start,date_end);
%     air = [air1 air2]
%     time = [time1 time2]  

    % 將資料輸出成txt檔，要自行修改檔名filename
    filename = [place{i} airstr '_08.txt'];
    fid = fopen(filename,'w');
    s = size(air1); %size of air and time
    fprintf(fid,'%s\t%s\n',place{1},airstr);
    for i = 1:s(2)
        fprintf(fid,'%8s\t',datestr(time1(1,i),2));
        fprintf(fid,'%8s\t',datestr(time1(1,i),13));
        fprintf(fid,'%f\n',air1(1,i));  
    end
    fclose(fid);    
end

