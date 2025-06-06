cfg = getConfig();

txSignal=getTxSignal();
rxSignal=channelOutput_simple(txSignal,getTarget());
[pulses, distVector]=pulseCompression(rxSignal);

K = 18;
[filteredSignal, dopplerVelocities] = MTDProcessing(pulses, K, 148);

fig = figure();
yyaxis right;
imagesc(distVector, 1:K, filteredSignal); 
xlabel('Odległość [m]');
ylabel('Indeks filtru');
axis xy;

yyaxis left;
xlabel('Odległość [km]');
ylabel('Prędkość dopplerowskia [m/s])');
sgtitle('Filtracja MTD');
colorbar;
axis xy;

saveas(fig, 'wyniki/zad2_1.eps', 'epsc')
