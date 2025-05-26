cfg = getConfig();

fl = 100;
fh = 1000;

time = [1, 500e-3, 100e-3, 10e-3];
for n=1:4
    duration = time(n);
    L = duration*cfg.Fs;
    noise = sqrt(1e6/2)*crandn([1,L]);

    SNR = 10 * log10(1/var(noise))

    x = getChirp(fl, fh, duration);
    y = x + noise;
    corr = abs(xcorr(x, y));
    m = max(corr);
    subplot(4,1,n)
    plot((-L+1):(L-1), corr);
    title(["Sygnał "+num2str(duration*10^3)+"ms,", "maksimum korelacji = "+num2str(m, '%e')])
    xlabel("Przesunięcie próbek");
    ylabel("|Korelacja|");

end