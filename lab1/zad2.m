cfg = getConfig();

fl = 100;
fh = 1000;

figure;
t = tiledlayout("vertical");

figure;
p = tiledlayout("vertical");

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

    nexttile(t)
    plot(((-L+1):(L-1))*1e3/cfg.Fs, corr);
    title(["Sygnał "+num2str(duration*10^3)+"ms,"+" SNR = "+num2str(SNR)+"dB,", "maksimum korelacji = "+num2str(m, '%e')])
    xlabel("Przesunięcie [ms]");
    ylabel("|Korelacja|");

    nexttile(p)
    plot((1:L)*1e3/cfg.Fs, real(y));
    title("Przebieg czasowy o długości "+num2str(duration*10^3)+"ms");
    xlabel("Czas [ms]")
    ylabel("Sygnał LFM + szum")
end