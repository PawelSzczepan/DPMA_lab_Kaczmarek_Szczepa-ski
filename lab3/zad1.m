cfg = getConfig();

txSignal=getTxSignal();
rxSignal=channelOutput_simple(txSignal,getTarget());
[pulses, distVector]=pulseCompression(rxSignal);

plot(distVector*1e-3, abs(sum((pulses))));
xlabel("Odległość [km]");
ylabel("|Suma pulsów|");

% figure;
% tiledlayout(5,2)
% for n=1:10
%     nexttile
%     plot(distVector, abs(pulses(n,:)))
%     xlim([1.5e4-1e3, 1.5e4+1e3])
% end