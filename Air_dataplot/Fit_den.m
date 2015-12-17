cd D:\Desktop\mean2010excel
list = dir('*.xlsx');
% 程式會存一個 data.mat 檔
% H 為1~12月的高度矩陣
% D 為1~12月的密度矩陣
% C 為1~12月三次回歸的係數
H = [];
D = [];
C = [];

for j = 1:length(list)
    N = xlsread(list(j,1).name);
    Height = N(2:end,3);
    ND = N(2:end,10);
    sizeH = size(H);
    if length(Height) < sizeH(1) 
        Height((length(Height)+1):size(H),1) = 0;
        ND((length(Height)+1):size(H)) = 0;
    end
    for i=1:length(ND)
      if isnan(ND(i))
         ND(i) = 0;
      end
    end
    [p s] = polyfit(Height,ND,3);
    H(:,j) = Height;
    D(:,j) = ND;
    C(j,:) = p;
end

save('data','H','D','C')

% k = 9;
% x = 0:1:30000;
% y = polyval(Coefficient(k,:),x);
% plot(Height(:,k),Density(:,k),'b+')
% hold on;
% plot(x,y,'r-');
% grid on;

