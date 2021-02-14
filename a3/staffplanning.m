clear;
A = [ -1 -1 0 0 0 0
      0 -1 -1 0 0 0
      0 0 -1 -1 0 0 
      0 0 0 -1 -1 0
      0 0 0 0 -1 -1 
      -1 0 0 0 0 -1];
b = [-500 -600 -300 -100 -50 -700];

f = [1 1 1 1.5 2 1.5];

Aeq = [];
beq = [];
lb = [0 0 0 0 0 0];
ub = [];

options1 = optimoptions('linprog', 'Algorithm', 'dual-simplex');
x_s = linprog(f,A,b,Aeq,beq,lb,ub,options1);

options2 = optimoptions('linprog', 'Algorithm', 'interior-point');
x_i = linprog(f,A,b,Aeq,beq,lb,ub,options2);