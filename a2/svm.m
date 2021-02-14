load('new.dat');

%ojb = 1/2 wT * w + C * sigma(xi)

c = 1000;
train_size = 500;

H = diag([ones(1, 30), zeros(1, train_size + 1)]); 
f = [zeros(1, 30), c * ones(1, train_size), 0]'; 
% -1 diff!!!!!
A = [-new(1:train_size, 2) .* new(1:train_size, 3:32), -eye([train_size, train_size]), -new(1:train_size, 2); 
    zeros([train_size 30]), -eye([train_size, train_size]), zeros([train_size 1])];
b = [-ones([train_size 1]); zeros([train_size 1])];
tic;
options=optimoptions('quadprog', 'MaxIter', 500);
%exceeded
x = quadprog(H,f,A,b,[],[],[],[],[],options);
%[x,fval] = quadprog(H,f,A,b);
%disp(x);
%disp(fval);
toc; %1.904726
w = x(1:30, 1);
b_svm = x(531, 1);
cor = 0;
for i = 500 : 569
    if w' * new(i, 3:32)' + b_svm > 0
        flag = 1;
    else
        flag = -1;
    end
    if flag == new(i, 2)
        cor = cor + 1;
    end
end

rate = cor / 70;
disp(rate);
% 0.9857
