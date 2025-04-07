# DPMA_lab_4

Celem ćwiczenia jest zbadanie własności algorytmów estymacji kąta odbioru sygnału.

## Dostępne funkcje:

getConfig()

crandn(n) - funkcja generująca zespolone zmienne losowe o rozkładzie gaussowskim (domyślnie ich wariancja to sqrt(2)),
n - rozmiar wygenerowanego ciągu

a(PhiDeg,M) - funkcja generująca zespoloną odpowiedź szyku antenowego (w postaci wektora wektora sygnałów o rozmiarze odpowiadającym wielkości anteny).
PhiDeg - kąt z którego/na który odbierany jest sygnał [deg]
M - liczba elementów w szyku antenowym (szyk liniowy, równomierny, odstępu lambda/2)

MLE.m

angleDetEstimated=BeamConv(Y)

angleDetEstimated=BeamMVDR(Y)

out=getMeasure(targetDeg,ampl)

[monopulsePolynom, angleRange]=getMonopulsePolynom(M=getConfig().M)

MIMP(Y,polynom=getMonopulsePolynom(),M=getConfig().M)

## Zadania do realizacji

0. Napraw estymatory MLE, BeamMVDR i BeamConv - tak żeby fminsearch był w stanie zlokalizować globalne ekstremum.

1. Zbadanie zachowania różnych estymatorów w przypadku obecności pojedynczego źródła echa
Sprawdzenie MSE dla 4 różnych położeń i 4 różnych SNR (łącznie 16 testów na podstawie 10k realizacji).

2. Zbadanie złożoności obliczeniowej, który z algorytmów jest "najlżejszy"?

3. Dodanie sygnału z odbiciem od powierzchni ziemi i powtórzenie testów z pierwszego podpunktu.
Jak zmieniły się wyniki?
