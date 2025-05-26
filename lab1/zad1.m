cfg = getConfig();

duration = 10e-3;
fl = 100;
fh = 1000;

x = getChirp(fl, fh, duration);

subplot(2,1,1);
plot((1:(duration*cfg.Fs))/cfg.Fs*10^3, real(x));
xlabel("t [ms]");
ylabel("Real(LMF)");

X = fft(x);
subplot(2,1,2);
l = duration*cfg.Fs;
plot(cfg.Fs/l*(-l/2:l/2-1),abs(fftshift(X)))
xlabel("f [Hz]")
ylabel("|fft(LMF)|")
