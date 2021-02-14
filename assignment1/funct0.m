function l = funct0(p)
load('CIRDataSet.mat');
l = 0;
for i = 2 : 1000
    l = l - log(cirpdf(data(i), t(i), data(1), t(1), p(1), p(2), p(3)));
end