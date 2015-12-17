%�o�ӵ{���|�L�X airstr ���Ҧ����Ů��ɶ��ƶq�ϡA�æs��fig��
%�]�w���W�B�Ů�����B���
place ='�U��';
year = 2008; %���A�ݬ�int
date_start = '2008/1/1';
date_end = '2008/4/30';
airstr = {'PM10','O3','CO'};

%�ɮצW�ٳ]�w
yearindex = {'97�~','98�~','99�~','100�~','101�~'};
fnameindex = {'_20090301.xls','_20100331.csv','_20110329.csv','_20120409.csv','_20130424.xls'};
file = [ yearindex{year-2007} place '��' fnameindex{year-2007}];
%--------------------------�H�W���קﳡ��-----------------------------------
s = size(airstr);
% getair��Ʀ^�� air �� time ��Ӱ}�C
for k = 1:s(2)
    h = figure(k);
    [air time] = getair(file,airstr{k},date_start,date_end);
    plot(time,air,'r')
    
    % �]�w�Ϫ��������
    t = strcat(date_start,'~',date_end,':',airstr{k},place);
    title(t);
    grid on;
    datetick('x','mm/dd','keepticks'); % �Nx�y����ܬ��ɶ�
    
    %�sfig�ɡA�ɦW��"�~���Ů�a��"
    figname = [num2str(year) airstr{k} place]
    saveas(h,figname,'fig');
end