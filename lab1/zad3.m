cfg = getConfig();

duration = 10e-3;
L = duration * cfg.Fs;
fl = [500 500 1000];
fh = [1500 2000 3000];

for n = 1:3
x = getChirp(fl(n), fh(n), duration);
cor = abs(xcorr(x,x));

w = find3db(cor);
m = max(cor);
l = (length(cor)+1)/2;

subplot(3,1,n);
hold on;
plot(((-L+1):(L-1))*1e3/cfg.Fs, cor);
plot([1 1].*(-w/2*1e3/cfg.Fs), [0 m], 'r--');
plot([1 1].*(w/2*1e3/cfg.Fs), [0 m], 'r--');
hold off
xlabel("Przesunięcie [ms]");
ylabel("Autokorelacja");
title(["Zakres "+num2str(fl(n))+"-"+num2str(fh(n))+"Hz", "szerokość pasma 3dB "+num2str(w*1e3/cfg.Fs)+"ms"])

end

function width = find3db(cor)
l = (length(cor)+1)/2;  %indeks próbki o przesunięciu 0
m = cor(l);             %max autokorelacji
width = 0;
above = false;

for n = 1:length(cor)
    if ~above
        if cor(n) >= m/2
            above = true;
            width = width+1;
        end
    else
        width = width+1;
        if cor(n) <= m/2
            break;
        end
    end
end
end