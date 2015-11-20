cd 'D:\EPA\Airdata\'
listbig = dir('98¦~ *');
for k = 1:length(listbig)
enter = strcat('D:\EPA\Airdata\',listbig(k).name);
path(enter,path)
cd([enter])
list = dir('*.csv');
filenumber = length(list);
for i = 1:filenumber
filename = list(i).name
    for j = 1:12
        dateS = strcat('2009/',num2str(j),'/1');
        switch j
            case 1
                dateE = strcat('2009/',num2str(j),'/31');
            case 2
                dateE = strcat('2009/',num2str(j),'/28');
            case 3
               dateE = strcat('2009/',num2str(j),'/31');
            case 4
                dateE = strcat('2009/',num2str(j),'/30');
            case 5
                dateE = strcat('2009/',num2str(j),'/31');
            case 6
                dateE = strcat('2009/',num2str(j),'/30');
            case 7
                dateE = strcat('2009/',num2str(j),'/31');
            case 8
                dateE = strcat('2009/',num2str(j),'/30');
            case 9
                dateE = strcat('2009/',num2str(j),'/30');
            case 10
                dateE = strcat('2009/',num2str(j),'/31');
            case 11
                dateE = strcat('2009/',num2str(j),'/30');
            case 12
                dateE = strcat('2009/',num2str(j),'/31');
        end        
        getplot(filename,'O3',dateS,dateE);
    end
end
end
%cd 'D:\Mars\Catch_Air\'