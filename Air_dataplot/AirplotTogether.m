%���{���N airstr �����Ů�L�b�P�@�ifig�ϤW
%�]�w���W�B�Ů�����B���
place ='�U��';
year = 2008;
date_start = '2008/1/1';
date_end = '2008/4/30';
airstr = {'PM10','O3','CO'};
s = size(airstr)
%--------------------------�H�W���קﳡ��-----------------------------
%�]�w�ɮצW��
yearindex = {'97�~','98�~','99�~','100�~','101�~'};
fnameindex = {'_20090301.xls','_20100331.csv','_20110329.csv','_20120409.csv','_20130424.xls'};
file=[ yearindex{year-2007} place '��' fnameindex{year-2007}]

% EPAgetplot��Ʀ^�� air��time��Ӱ}�C
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
    % �]�w�Ϫ����
    t = strcat(date_start,'~',date_end,':',airstr{k},place);
    title(t);
    grid on;
    datetick('x','mm/dd','keepticks'); % �Nx�y����ܬ��ɶ�
    
    %�sfig��
%     figname = [num2str(year) place]
%     saveas(h,figname,'fig');