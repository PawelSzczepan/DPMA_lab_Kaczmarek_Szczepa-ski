function [filteredSignal, dopplerVelocities]=MTDProcessing(pulses, amount, order)
cfg = getConfig();
K = amount + 2;

midFreq = 1/K:1/K:1-1/K;
fir = zeros(K-2, order+1);

filteredSignal = zeros(K-2, length(pulses));

% figure;
% hold on;
for n = 1:K-2
    fir(n,:) = fir1(order, [midFreq(n) midFreq(n+1)]);
    [h, w] = freqz(fir(n,:), 1, [], cfg.PRF);
    % plot(w * cfg.c / (2 * cfg.Fc), 20*log10(abs(h)));
end
% hold off;
% xlabel('Prędkość dopplerowska m/s', 'Interpreter','tex')
% xlim([0 cfg.v_max])
% ylabel("|Odpowiedź impulsowa|")
% title("Bank filtrów")

for n = 1:length(pulses)
    for m = 1:K-2
        filteredSignal(m,n) = sum(abs(filter(fir(m,:), 1, pulses(:,n)).^2));
    end
end

dopplerVelocities = midFreq * cfg.v_max;

end