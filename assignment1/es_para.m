load('CIRDataSet.mat');

p0 = [1, 1, 1];
[x, fval] = fminunc(@(p)fun(p,t,data), p0);


disp(x);
disp(fval);

function ojb = fun(p, t, data)
sum = 0;
for i = 2 : 1000
    sum = sum - log(cirpdf(data(i), t(i), data(i-1), t(i-1), p(1), p(2), p(3)));
end
ojb = sum;
end


%{
i = 2:1000;
p0 = [1, 1, 1];
z = -sum(cirpdf(data(i),t(i), data(i-1),t(i-1),p0(1),p0(2),p0(3)))
[x, fval] = fminunc(@(x)(-sum(log(cirpdf(data(i), t(i), data(i-1), t(i-1), x(1), x(2), x(3))))), p0);

disp(x)
disp(fval)

%}
%{
d0 = [1,1,1];
[x, fval] = fminunc(@(x)(-log(cirpdf(data(2), t(2), data(1), t(1), x(1), x(2), x(3)))), d0);
disp(x);
disp(fval);
%}