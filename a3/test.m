clear;
A = [1 1 1 1 0 0 0 0 0 0 0 0
     0 0 0 0 1 1 1 1 0 0 0 0
     0 0 0 0 0 0 0 0 1 1 1 1
    ];
b = [25 60 35];

f = [10 0 20 11 12 7 9 20 0 14 16 18];

Aeq = [1 0 0 0 1 0 0 0 1 0 0 0
       0 1 0 0 0 1 0 0 0 1 0 0
       0 0 1 0 0 0 1 0 0 0 1 0
       0 0 0 1 0 0 0 1 0 0 0 1];
beq = [15 45 30 25];
lb = [0 0 0 0 0 0 0 0 0 0 0 0];
ub = [];

tic;
options1 = optimoptions('linprog', 'Algorithm', 'dual-simplex');
[x_s, f_s] = linprog(f,A,b,Aeq,beq,lb,ub,options1);
toc

tic;
options2 = optimoptions('linprog', 'Algorithm', 'interior-point');
[x_i, f_i] = linprog(f,A,b,Aeq,beq,lb,ub,options2);
toc