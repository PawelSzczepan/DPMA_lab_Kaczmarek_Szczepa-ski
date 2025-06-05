cfg = getConfig();

duration = 10e-3;
L = duration * cfg.Fs;
fl = 1000;
fh = 1500:500:11000;
L = length(fh);
W = zeros(1, L);

for n = 1:L
    x = getChirp(fl, fh(n), duration);
    cor = abs(xcorr(x,x));

    W(n) = find3db(cor);
end

plot((fh-fl).*1e-3, W.*1e3./cfg.Fs, 'bo')
xlabel("f_h - f_l [kHz]")
ylabel("Szerokość pasma 3dB [ms]")


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