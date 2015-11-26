list = dir('*.mat')
Output2008O3 = [];
% Output2008O3 is the cell that contain all the data bigger than 60
for n = 1:7
    load(list(n,1).name);
    Output2008O3{1,(2*n-1)} = place;
    [row col] = size(bigger60);
    for i = 1:col
        Output2008O3{i+1,(2*n-1)} = datestr(bigger60(1,i),31);
        Output2008O3{i+1,(2*n)} = bigger60(2,i);
    end
end

% AirData is the double  