function l = func(p)
load('CIRDataSet.mat');
l = 0;
for i = 2 : 1000
    l = l - log(cirpdf(data(i), t(i), data(i-1), t(i-1), p(1), p(2), p(3)));
end