clear;
clc;
cfg = getConfig();

txSignal=getTxSignal();

velocity_vec = [0 0.625*cfg.v_max]; 
distance_vec = [5e3 15e3];

txSignal = getTxSignal();

t_final = 10;
dt = 0.1;
time = 0:dt:t_final;

for i = 1:length(velocity_vec)
    dynamic_velocity(:, i) = velocity_vec(i) * ones(length(time),1);
    dynamic_distance = distance_vec + cumsum(dynamic_velocity) * dt;
end

K = 18;
for i = 1:length(time)
    disp([num2str(round(i/length(time)*100))  '%'])
    rxSignal_dynamic(i,:) = channelOutput_simple(txSignal, getCustomTarget(dynamic_velocity(i,:), dynamic_distance(i, :)));
    [rxData_dynamic(i, :, :), distVector] = pulseCompression(rxSignal_dynamic(i, :));
    [filteredSignal_mtd_dynamic(i, :, :), dopplerVelocities] = MTDProcessing(squeeze(rxData_dynamic(i, :, :)), K, 148);
end

filteredSignal = squeeze(sum(filteredSignal_mtd_dynamic, 1));

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
