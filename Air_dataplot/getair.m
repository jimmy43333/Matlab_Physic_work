function [ air dateandtime ] = getair(file,airstr,date_start,date_end)
%GETPLOT Summary of this function goes here
% 輸入的參數為xls檔案名稱，空氣種類，起始時間，結束時間
% 輸出 空氣含量 跟 時間 的函數
% Input file : the data file
% Input airstr : the air you want to observe
% Input date_start : the date you start
% Input date_end : the date you end
% ===== Define the variable =============================================== 
[N,A,R] = xlsread(file);
sizeR = size(R);
air = [];
dateandtime = [];
localstr = R{2,2};
dateS = 0;  
dateE = 0;   
cut = [];
airmean = [];
air_day = [];
dtmean = [];
%==========================================================================
% Set the start date and the end date,decide the date is exist or not
for i = 1:sizeR(1)
    if strcmp(R{i,1},date_start) && dateS == 0
        dateS = i;
    end
    if strcmp(R{i,1},date_end)
        dateE = i;
    end
end

%Convert the number minutes to string
for i = 4:sizeR(2)
    if isnumeric(R{1,i})
        R{1,i} = num2str(R{1,i});
    end
end
%If the date is right, then plot the air ,or print the date without data 
if dateS ~= 0 && dateE ~= 0
    % Get the air data, if it doesn't exist, replace it with the last data 
    for i = dateS:dateE
        if strcmp(R{i,3},airstr)
            for j = 4:sizeR(2)
                if ~isa(R{i,j},'double') || isnan(R{i,j})
                    if j ~= 4
                        air = [air air(end)];
                        air_day = [air_day air_day(end)];
                    else
                        air = [air 0];
                        air_day = [air_day 0];
                    end
                    cut = strcat(R{i,1},'/',R{1,j},':00:00');
                    dateandtime = [dateandtime datenum(cut)];
                else
                   air = [air R{i,j}];
                   air_day = [air_day R{i,j}];
                   cut = strcat(R{i,1},'/',R{1,j},':00:00');
                   dateandtime = [dateandtime datenum(cut)];
                end
            end
            
            %Calculate the mean value
            airmean = [airmean mean(air_day)];
            dtmean = [dtmean datenum(cut)];
            air_day = [];
        end
    end 
else
    fprintf('Date Error\n', strcat( strrep(date_start,'/',' ') , localstr));
end

