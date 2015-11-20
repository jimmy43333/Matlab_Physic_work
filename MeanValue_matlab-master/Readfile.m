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
%Open the file
filename = input('Input the filename: ','s');
fid = fopen(filename,'r');
while true
    %Seperate the data from the file
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
            data(od,:) = str2num(vector);
            od = od + 1;
        end
    end
    %Calculate the meanvalue
    sum = 0;
    len = size(data);
    sum_arrey = zeros(1,len(2));
    for c = 1:len(2)
        for r = 1:len(1)
            if data(r,c) == 999 || data(r,c) == 999.9
                data(r,c) = 0;
            end
            sum = sum + data(r,c);       
        end
        sum_arrey(1,c) = sum / len(1);
        sum = 0;
    end
    %Print the date
    if ~isempty(string_arrey)
        fprintf(string_arrey);
        fprintf('\n');
        string_arrey = [];
    end
    %Print the output
    fprintf('The meanvalue of the P : %f\n',sum_arrey(1,3));
    fprintf('The meanvalue of the H : %f\n',sum_arrey(1,4));
    fprintf('The meanvalue of the T : %f\n',sum_arrey(1,5));
    fprintf('The meanvalue of the U : %f\n',sum_arrey(1,6));
    fprintf('The meanvalue of the Td : %f\n',sum_arrey(1,7));
    fprintf('The meanvalue of the WD : %f\n',sum_arrey(1,8));
    fprintf('The meanvalue of the WS : %f\n',sum_arrey(1,9));
    %Plot the graph of P & H
    x = data(:,4);
    y = data(:,3);
    switch k ;
        case 1
            %figure(k);
            col = 'ro';
            k = k+1;
        case 2
            %figure(k);
            col = 'cs';
            k = k+1;
        case 3
            %figure(k);
            col = 'gd';
            k = k+1;
        case 4
            %figure(k);
            col = 'y*';
            k = k+1;
    end        
    plot(x,y,col);
    hold on;
    grid on;
    title('Relation of P & H');
    xlabel('H(gpm)');
    ylabel('P(hpa)');
    
    %Check whether the file is over
    if vector == -1
        break;
    else
        vector = [];
        string_arrey = [];
        data = [];
        od = 1;
    end
end
status = fclose(fid)









