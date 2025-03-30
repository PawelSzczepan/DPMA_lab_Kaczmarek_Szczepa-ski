clear
clc
close all
pkg load signal;
cfg=getConfig();

txSignal=getTxSignal();
rxSignal1=channelOutput_simple(txSignal,getTarget());
rxSignal2=channelOutput_better(txSignal,getTarget());

[pulses1, distVector1]=pulseCompression(rxSignal1);
[pulses2, distVector2]=pulseCompression(rxSignal2);

integrated1=sum(pulses1); % simple sum of data from pulses
integrated2=sum(pulses2); % simple sum of data from pulses

figure
plot(distVector1, abs(integrated1))
hold on
plot(distVector2, abs(integrated2),'r--')
xlabel('Range [m]');
ylabel('Correlation')
legend('Doppler simplified','Doppler accurate')

figure
plot(distVector2, abs(pulses2))
xlabel('Range [m]');
ylabel('Correlation')

cellIdx=round(getTarget().r*2/cfg.c*cfg.Fs)

figure
plot(real(pulses1(:,cellIdx)/pulses1(1,cellIdx)))
hold on
plot(real(pulses2(:,cellIdx)/pulses2(1,cellIdx)),'r--')
