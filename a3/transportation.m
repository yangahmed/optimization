clc;
clear;
A = [1 1 1 1 0 0 0 0 0 0 0 0
     0 0 0 0 1 1 1 1 0 0 0 0
     0 0 0 0 0 0 0 0 1 1 1 1
    -1 0 0 0 -1 0 0 0 -1 0 0 0
     0 -1 0 0 0 -1 0 0 0 -1 0 0
     0 0 -1 0 0 0 -1 0 0 0 -1 0
     0 0 0 -1 0 0 0 -1 0 0 0 -1];
b = [25 55 35 -15 -45 -30 -25];

f = [10 0 20 11 12 7 9 20 0 14 16 18];

Aeq = [];
beq = [];
lb = [0 0 0 0 0 0 0 0 0 0 0 0];
ub = [];


disp("=====================================");
disp("dual-simplex:");
tic;
options1 = optimoptions('linprog', 'Algorithm', 'dual-simplex');
[x_s, f_s] = linprog(f,A,b,Aeq,beq,lb,ub,options1);
toc
%以下是输出
X = zeros(3,4);
for i = 1:3
    for j = 1:4
        X(i,j) = x_s(4*(i-1)+j);
    end
end
disp('X = ');
disp(X);
F = ['f = ',num2str(f_s)];
disp(F);


disp("=====================================");
disp("interior-point:");
tic;
options2 = optimoptions('linprog', 'Algorithm', 'interior-point');
[x_i, f_i] = linprog(f,A,b,Aeq,beq,lb,ub,options2);
toc
%以下是输出
X = zeros(3,4);
for i = 1:3
    for j = 1:4
        X(i,j) = x_i(4*(i-1)+j);
    end
end
disp('X = ');
disp(X);
F = ['f = ',num2str(f_i)];
disp(F);