load('CIRDataSet.mat');
x = zeros(101,1);
y = zeros(101,1);
x(1) = data(900);
y(1) = 0;

p = [1.092 0.05 0.067];

for i = 1 : 100
    x(i+1) = x(i)+p(1)*(p(2)-x(i))+p(3)*sqrt(x(i))*randn();
    y(i+1) = abs(x(i+1) - data(i+900));
end
subplot(3,1,1);
plot(x);
title('estimate data');
subplot(3,1,2);
plot(data(901:1000));
title('real data');
subplot(3,1,3);
plot(y);
title('absolution difference')