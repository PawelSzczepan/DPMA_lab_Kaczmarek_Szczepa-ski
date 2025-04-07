clear
clc
close all

SignalAmplitude=[5 10];
TargetAngle=[-3 3];

SignalAmplitude=100;
TargetAngle=5;
measure=getMeasure(TargetAngle,SignalAmplitude);

BeamConv(measure)
BeamMVDR(measure)
MLE(measure)

% monopulse polynom can be calculated once (i.e. at startup), but it varies with M
monopulsePolynom=getMonopulsePolynom(getConfig().M);

MIMP(measure,monopulsePolynom)
