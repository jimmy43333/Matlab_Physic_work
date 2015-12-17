k = 8;
x = 0:1:35000;
y = polyval(C(k,:),x);
plot(H(:,k),D(:,k),'b+');
hold on;
plot(x,y,'r-');
grid on;