# DPMA_lab_3

The purpose of the exercise is to study the properties of beamforming systems.

## Available functions:

getConfig()

crandn(n) - function that generates composite random variables with a Gaussian distribution (the default variance is sqrt(2)),
n - the size of the generated string

getTarget() - function that returns an object with parameters of the observed targets.

[txSignal, singleChirp]=getTxSignal() - function that returns the entire transmitted signal with parameters taken from the configuration file and a single LFM signal (used at the pulse compression stage).

rxSignal=channelOutput_simple(inputSignal, target) - function taking transmitted signal and target vector, returns echo with simplified Doppler shift (only rotating phase)

rxSignal=channelOutput_better(inputSignal, target) - function taking transmitted signal and vector of targets, returns echo with extended Doppler shift (rotating phase and actual pulse duration shortening) note: depending on simulation parameters it may require a lot of ram memory (32GB may be too little, then reduce cfg.Fs)

[pulses, distVector]=pulseCompression(rxSignal) - function that takes the received signal as an argument and divides it into individual pulses. 
pulses - matrix of dimension cfg.M x cfg.pulseSamplesNo (number of pulses x their length) with signals grouped into pulses
distVector - a vector to convert index to distance.

## Tasks to be performed

1 Investigate the behavior of nikoherent processing (simple summation of data from all available pulses without their alignment in phase or delay).
Use a simplified Doppler channel model for this purpose.
How does the echo behave for none, and how at maximum radial velocity.
What happens to the echo signal after the maximum unambiguous radial velocity is exceeded?

2 MTD filtering
Design and write a function filteredSignal=MTDProcessing(rxData) where rxData is the matrix of pulses from the output of the pulseCompression() function, and filteredSignal will be the matrix of the signal after filtering with K filters.
You need to write a function that will create K band-pass filters with equal pass bandwidth.
Using these filters, perform filtering in the probing domain.
How does the index of the filter in which the maximum of the signal is detected change depending on the radial velocity?
Is it possible to distinguish between several (2 or more) objects at the same distance, but moving at different radial velocities?

3 Investigate a more accurate Doppler filtering model
Design a simulation in which an object moves fast enough to be in different distance cells in subsequent soundings.
How does this affect the MTD filtering process?
