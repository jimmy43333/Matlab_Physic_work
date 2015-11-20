%This script is used to read data
%Define Variable
%   filename
%   fid             --file id
%   vector          --catch line of the file
%   data            --data into float type
%   string_arrey    --store other information
vector = [];
string_arrey = [];
data = [];
od = 1;
k = 1;
index_day = 1;  %index of day in arrey 'data'
%Open the file
filename = input('Input the filename: ','s');
fid = fopen(filename,'r');
%Read the data from the file and catch what we need
while true
    %Store one day information in the arrey 'data'
    while true
        vector = fgetl(fid);
        if vector == -1
           break;
        end
        if isempty(vector)
            break;
        end
        if isempty(str2num(vector))
            if isempty(string_arrey)
                string_arrey = vector;
            end
        else
            data(od,:,index_day) = str2num(vector);
            od = od + 1;
        end
    end   
    %Check whether the file is over
    if vector == -1
        break;
    else
        vector = [];
        string_arrey = [];
        index_day = index_day + 1;
        od = 1;
    end
end
%Close the file
status = fclose(fid);

%Classify the same height data in the total_arrey
Height = 30368;
partition =input('Please enter the height partiton : ');
row = floor(Height/partition)+1;
%total_arrey = [P,T,U,Td,Wd,Ws]
total_arrey = zeros(row,7);
counting = zeros(row,7);
datalength = length(data(:,:,1));
day = size(data);
for i = 1:row
    total_arrey(i,7) =  (((2*i)-1)*partition)/2;
end
for j = 1:day(3)
    % one day data
    for i = 1:datalength
        if(data(i,4,j) ~= 0)
            p = ceil(data(i,4,j) / partition);
            if 999.9 - data(i,3,j) > 1 || 999.9 - data(i,3,j) < 0 
                total_arrey(p,1) = total_arrey(p,1) + data(i,3,j);
                counting(p,1) = counting(p,1) + 1 ;
            end
            for k = 2:6
                if 999.9 - data(i,k+3,j) > 1 || 999.9 - data(i,k+3,j) < 0
                    total_arrey(p,k) = total_arrey(p,k) + data(i,k+3,j);
                    counting(p,k) = counting(p,k) + 1 ;
                end
            end
        end
    end
end

%output the data
userwant = input('Enter the data you want to find at the same height.\n(P,T,U,Td,Wd,Ws): ','s');
switch userwant
    case 'P' 
        col = 1;
        unit ='P(hpa)';
    case 'T' 
        col = 2;
         unit ='T(¢J)';
    case 'U' 
        col = 3;
         unit ='U(¢H)';
    case 'Td' 
        col = 4;
         unit ='Td(¢J)';
    case 'Wd' 
        col = 5;
         unit ='Wd(360¢X)';
    case 'Ws' 
        col = 6;
         unit ='WS(m/s)';
end
fprintf('Height(gpm)');
fprintf(unit);
for i = 1:row
    if (i-1)*partition < Height
        fprintf('Height %d~%d: ',((i-1)*partition),i*partition);
    else
        fprintf('Height >%d: ',(i-1)*partition)
    end
    fprintf('%f\n',total_arrey(i,col)/counting(i,col));
end
x = total_arrey(:,7)
y = total_arrey(:,col)
plot(x,y)