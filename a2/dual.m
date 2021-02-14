load('new.dat');

train_size = 500;
%c = 367, rate = 0.9857
max = 0;
final_c = 0;
%for C = 0.01:0.01:1
C = 1000;
H = zeros(train_size, train_size);
for i=1:train_size
    for j=i:train_size
        H(i,j) = new(i, 2) * new(j, 2) * (new(i, 3:32) * new(j, 3:32)');
        H(j,i) = H(i,j);
    end
end
f = -ones([train_size 1]);
Aeq = new(1:train_size, 2)'; 
beq = 0;
lb=zeros(train_size, 1);
ub=C * ones(train_size ,1);
tic;
alpha = quadprog(H,f,[],[],Aeq,beq,lb,ub);
toc;  %0.074002
%AlmostZero=(abs(alpha)<max(abs(alpha))/1e5);
%alpha(AlmostZero)=0;
%S=find(alpha>0 & alpha<C);

%w = zeros([1 30]);
%{
for i = 1:train_size
    w = w + alpha(i) * new(i, 2) * new(i, 3:32);
end
%}

alpha(alpha < 1e-10) = 0;
w = 0;
for i=1:500
    w = w + alpha(i) * new(i,2) * new(i, 3:32);
end

w = w';
b = 0;
cnt = 0;
for i = 1:train_size
    if alpha(i) > 0
        b = b + (new(i, 2) - w' * new(i, 3:32)');
        cnt = cnt + 1;
    end
end
b = b / cnt;

cor = 0;
for i = 500 : 569
    if w' * new(i, 3:32)' + b > 0
        flag = 1;
    else
        flag = -1;
    end
    if flag == new(i, 2)
        cor = cor + 1;
    end
end

rate = cor / 70;
if rate > max
    max = rate;
    final_c = C;
%disp(rate);
end
disp(C);
%end
disp(max);
disp(final_c);


