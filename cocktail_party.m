[x1, Fs1] = wavread('~/Academics/Sem4/EE214/source2.wav');
[x2, Fs2] = wavread('~/Academics/Sem4/EE214/source4.wav');
m = size(x1,1);
n = 2;
%A = randn(n, n);
x = A*x;

c = cov(x');
sq = inv(sqrtm(c));
mx = mean(x, 2)';
xx = x - mx'*ones(1, size(x, 2));
xx = sq*xx;

w1 = randn(n, 1);
w1 = w1/norm(w1,2);
w0 = randn(n, 1);
w0 = w0/norm(w0, 2);

while abs(abs(w0'*w1)-1) > 0.001
    w0 = w1;
    w1 = xx*G(w1'*xx)'/m - mean(DG(w1'*xx), 2)*w1;
    w1 = w1/norm(w1, 2);
end

w2 = randn(n, 1);
w2 = w2/norm(w2,2);
w0 = randn(n, 1);
w0 = w0/norm(w0, 2);

while abs(abs(w0'*w2)-1) > 0.001
    w0 = w2;
    w2 = xx*G(w2'*xx)'/m - mean(DG(w2'*xx), 2)*w2;
    w2 = w2 - w2'*w1*w1;
    w2 = w2/norm(w2, 2);
end