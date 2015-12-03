%cd 'D:\Desktop\Mars\EPA_Data\103�~ ���̪ū~��'
%[A B C] = xlsread('97�~������_20090301.xls');
year = 2008;
airstr = 'O3';
place = {'�U��','�[��','�H��','�Ὤ','�x��','��K','����'};
%------------------�H�W���קﳡ��-------------------------------------------
%�]�w�ɮצW��
yearindex = {'97�~','98�~','99�~','100�~','101�~','102�~','103�~'};
fnameindex = {'_20090301.xls','_20100331.csv','_20110329.csv','_20120409.csv','_20130424.xls','_20140417','_20150324'};
placesize = size(place);

%��X 12~3�� �� �Ů��ơA�s�� air�x�} ������� time�x�}
for i = 1:placesize(1,2)
    file1=[ yearindex{year-2007} place{i} '��' fnameindex{year-2007}];
    date_start = [ num2str(year) '/12/1'];
    date_end = [ num2str(year) '/12/31'];
    [air1 time1] = getair(file1,airstr,date_start,date_end);
    
    file2=[ yearindex{year-2006} place{i} '��' fnameindex{year-2006}];
    date_start = [ num2str(year+1) '/1/1'];
    date_end = [ num2str(year+1) '/3/31'];
    [air2 time2] = getair(file2,airstr,date_start,date_end);

    air(i,:) = [air1 air2];
    time(i,:) = [time1 time2];
end

%�s��
savename = [num2str(year) 'AirTime']
save(savename,'air','time','place');
