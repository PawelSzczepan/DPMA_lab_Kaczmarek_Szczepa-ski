# DPMA_lab_5

The purpose of the exercise is to study the properties of signal reception angle estimation algorithms.

## Available functions:

getConfig()

crandn(n) - function that generates composite random variables with a Gaussian distribution (the default variance is sqrt(2)),
n - the size of the generated string

a(PhiDeg,M) - function that generates the composite response of the antenna array (in the form of a vector of signal vectors of size corresponding to the size of the antenna).
PhiDeg - the angle from which/at which the signal is received [deg].
M - number of elements in the antenna array (linear array, uniform array, lambda/2 spacing)

out=getMeasure(targetDeg,ampl) - function to retrieve measurements
- targetDeg - vector of angles at which the objects are located
- ampl - vector of amplitudes of objects
The method always returns measurements with additional white noise with a variance equal to 1.

angleDetEstimated=MLE(Y) - the estimator of the highest reliability.
Takes a vector of measurements as an argument, the angle for which the reliability of the estimation is the highest is returned.
Important: the estimator is based on the fminsearch() function, which requires as an initial argument the approximate location of the global extremum.
The estimator will be able to determine the location of two signal sources, in which case a vector of two values should be given as the starting point of the fminsearch algorithm.

angleDetEstimated=BeamConv(Y) - an estimator based on classical beamforming.
It takes a vector of measurements as an argument, and returns the angle for which the correlation between the synthetic response of the antenna and the recorded signal is the highest.
Important: the estimator is based on the fminsearch() function, which requires as an initial argument the approximate location of the global extremum.
Unlike MLE, there is no simple way to add an estimate of the location of the second object.

angleDetEstimated=BeamMVDR(Y) - (Minimum Variance Distortionless Response) estimator based on Capon's method.
Takes a vector of measurements as an argument, the angle returned is the angle for which the correlation between the synthetic response of the antenna and the recorded signal is the greatest.
Important: the estimator is based on the fminsearch() function, which requires the approximate location of the global extremum as an initial argument.
Unlike MLE, there is no simple way to add an estimate of the location of the second object.

[monopulsePolynom, angleRange]=getMonopulsePolynom(M=getConfig().M) - a method that prepares antenna characteristics to work with the monopulse method.
The function approximates the angular characteristics using a 17th degree polynomial.
Due to the computational complexity, it is suggested that the method be called once at startup and store the characteristics in memory as polynomials.

MIMP(Y,polynom=getMonopulsePolynom(),M=getConfig().M) - a method that calculates the angle of signal reception using the monopulse method
- Y - matrix with measurements
- M - number of antenna elements
- polynom - antenna characteristics
The method does not allow to estimate the position of more than one signal source.

## Tasks to be accomplished

1 Fix MLE, BeamMVDR and BeamConv estimators - so that fminsearch is able to locate global extremes.
> hint: add to the algorithms coarse angle search in the range of -90 to 90, the resolution should be selected independently.
> What is associated with high resolution, what is associated with too low resolution?

2 Investigate the behavior of different estimators when a single echo source is present.
Check MSE for 4 different positions and 4 different SNRs (a total of 16 tests based on 10k realizations).
Assume SNR=20dB.

3. performance benchmark - check which algorithm will calculate 100k estimations in what time. 
Only the time of execution of estimations should be measured, not the generation of measurements.

4. Test the performance of algorithms in the case of multipath propagation.
Generate measurements with the object at $phi$ and $-phi$ angles simulating mirror reflection from the ground. 
The amplitude of the reflected signal should be 0.5 of the direct signal and a random phase.
Modify the MLE algorithm to be able to estimate the positions of two objects.
Perform simulations for SNR=20dB (main echo, above ground).
Plot the value of the estimated angle ($phi$ only - above the ground surface) depending on the value of $phi$ for each estimator (even if the estimator does not allow to estimate the position of more than one receiving angle).
Assume a ${phi$ equal to 0.1:0.02:10.
