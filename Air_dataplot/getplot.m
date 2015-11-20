function [ air dateandtime airmean dtmean] = getplot(file,airstr,date_start,date_end)
%GETPLOT Summary of this function goes here
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
row = length(R);
cut = [];
airmean = [];
aircut = [];
dtmean = [];
%==========================================================================
% Set the start date and the end date,decide the date is exist or not
for i = 1:row
    if strcmp(R{i,1},date_start) && dateS == 0
        dateS = i;
    end
    if strcmp(R{i,1},date_end)
        dateE = i;
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
                        aircut = [aircut aircut(end)];
                    else
                        air = [air 0];
                        aircut = [aircut 0];
                    end
                    cut = strcat(R{i,1},'/',R{1,j},':00:00');
                    dateandtime = [dateandtime datenum(cut)];
                else
                   air = [air R{i,j}];
                   aircut = [aircut R{i,j}];
                   cut = strcat(R{i,1},'/',R{1,j},':00:00');
                   dateandtime = [dateandtime datenum(cut)];
                end
            end
            
            %Calculate the mean value
            if aircut ~= 0
                airmean = [airmean mean(aircut)];
                dtmean = [dtmean datenum(cut)];
                aircut = [];
            end
        end
    end
    
    % Set the graph information
    figure(1);
    plot(dateandtime,air);
    t = strcat(date_start,'~',date_end,':',airstr,localstr);
    title(t);
    datetick('x','mm/dd','keepticks');
    grid on;
    
    figure(2);
    plot(dtmean,airmean);
    datetick('x','mm/dd','keepticks');
    t = strcat(date_start,'~',date_end,':',airstr,localstr,'Mean');
    title(t);
    grid on;
%     set(gca,'Xtick',0:120:length(air));
%     set(gca,'XtickLabel',{'0','5','10','15','20','25','30'});
%     xlabel('¤é´Á');    
    
    
    %Set the graphic name and save the graph
%     cd 'D:\Desktop\Mars\Savedata';
%     filename =[date_start(1:4) localstr '.mat'];
%     figurename = [date_start(1:4) localstr '.fig'];
%     save(filename,'air','date');
%     saveas(gcf,figurename);
else
    fprintf('Date Error\n', strcat( strrep(date_start,'/',' ') , localstr));
end

