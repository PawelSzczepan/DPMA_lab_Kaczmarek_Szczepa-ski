cfg = getConfig();

fl = 100;
fh = 1000;


time = zeros(1,20);
time(1) = 1e-3;
time(2:11) = 10e-3:10e-3:0.1;
time(12:20) = 0.2:0.1:1;

m = zeros(1,20);

for n=1:20
    duration = time(n);
    L = duration*cfg.Fs;
    x = getChirp(fl, fh, duration);
    corr = abs(xcorr(x, x));
    m(n) = max(corr);


end

figure;
plot(time, m, 'bo');
xlabel("Czas trwania sygnału")
ylabel("Maksimu autokorelacji")