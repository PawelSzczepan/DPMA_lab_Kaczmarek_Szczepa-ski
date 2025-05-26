cfg = getConfig();

d=[500 800 1300 2000];
t = d.*2/cfg.c;

fl = 0.1e6;
fh = 1e6;
 
chirp_duration = 10e-3;
duration = 12e-3;
og = getChirp(fl, fh, chirp_duration);
x = zeros(1, round(duration*cfg.Fs));

for n=1:4
    start = round(t(n)*cfg.Fs);
    temp = x(start:(start+chirp_duration*cfg.Fs-1));
    x(start:(start+chirp_duration*cfg.Fs-1)) = temp + og*1e-8;
end

figure;
cor = abs(xcorr(x, og));
L = duration * cfg.Fs;
hold on;
plot(((-L+1):(L-1))/cfg.Fs/2*cfg.c, cor);
for n=1:4
    plot([d(n) d(n)], [0 1e-3], 'r--')
end
hold off;
xlim([0 3000])
xlabel("Odległość [m]")
ylabel("Korelacja")