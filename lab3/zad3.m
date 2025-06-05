cfg = getConfig();

txSignal=getTxSignal();
rxSignal=channelOutput_better(txSignal,getTarget());
[pulses, distVector]=pulseCompression(rxSignal);

K = 18;
[filteredSignal, dopplerVelocities] = MTDProcessing(pulses, K, 148);

figure()
yyaxis right;
imagesc(distVector, 1:K, filteredSignal); 
xlabel('Odległość [m]');
ylabel('Indeks filtru');
axis xy;

yyaxis left;
imagesc(distVector*1e-3, dopplerVelocities, filteredSignal); 
xlabel('Odległość [km]');
ylabel('Prędkość dopplerowskia [m/s])');
sgtitle('Filtracja MTD');
colorbar;
axis xy;