# DPMA_lab_4

The purpose of the exercise is to study the properties of detection algorithms (different variants of CFAR).

## Available functions:

getConfig()

crandn(n) - function that generates composite random variables with a Gaussian distribution (the default variance is sqrt(2)),
n - the size of the generated string

getTargets(targetIdx) - function that returns a vector of objects with parameters: SNR, amplitude, distance [m] and detection cell (based on data from getConfig)
Takes the target number as an argument - 3 sets are prepared for examination.

[signalProfile, distProfile]=getProfile(target=[]) - returns the distance profile (vector of composite variables).
target - (optional argument) - a list of targets consistent with the output of the getTargets function
signalProfile - distance profile containing the signal
distProfile - vector converting cell number to distance - for graphs

[CFAR_GO_vec, signalProfileSquared]=CFAR_GO(signalProfile) - function that performs a partial CFAR GO operation.
signalProfile - distance profile consistent with the output of the getProfile function
CFAR_GO_vec - vector of the same length as signalProfile with unscaled detection threshold
signalProfileSquared - the square of the signalProfile module - useful at the detection stage

## Tasks to be performed

1. plot the distance profile with the detection threshold plotted, make 3 graphs (for targetIdx=1, 2 and 3).

2. Plot the dependence of the probability of detection on the probability of false alarm in the presence of a single object (targetIdx=1) for a signal with different SNR - use 3dB, 6dB by 12dB.

3. modify the example program so that it is possible to perform the simulation from task 2 when more than one echo source is present (targetIdx=2)

4. run the simulation from subsection 3 for targetIdx=3.
How does the close distance between two echo sources affect the detectability of the weaker one?

5. Write a function [CFAR_OS_vec, signalProfileSquared]=CFAR_OS(signalProfile) that will calculate the detection threshold based on the median rather than the mean as in CFAR_GO.
Using this function, run the simulation from subsection 2 again.
How did the change in the calculation of the detection threshold affect the detectability of an object with a lower echo level?
How did the computational complexity change?
