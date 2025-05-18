# DPMA_lab_5

Celem ćwiczenia jest zbadanie własności algorytmów estymacji kąta odbioru sygnału.

## Dostępne funkcje:

getConfig()

crandn(n) - funkcja generująca zespolone zmienne losowe o rozkładzie gaussowskim (domyślnie ich wariancja to sqrt(2)),
n - rozmiar wygenerowanego ciągu

a(PhiDeg,M) - funkcja generująca zespoloną odpowiedź szyku antenowego (w postaci wektora wektora sygnałów o rozmiarze odpowiadającym wielkości anteny).
PhiDeg - kąt z którego/na który odbierany jest sygnał [deg]
M - liczba elementów w szyku antenowym (szyk liniowy, równomierny, odstępu lambda/2)

out=getMeasure(targetDeg,ampl) - funkcja pozwalająca na pobranie pomiarów
- targetDeg - wektor kątów na których znajdują się obiekty
- ampl - wektor amplitud obiektów
Metoda zawsze zwraca pomiary z dodatkowym szumem białym o wariancji równej 1.

angleDetEstimated=MLE(Y) - estymator największej wiarygodności.
Jako argument przyjmuje wektor pomiarów, zwracany jest kąt, dla którego wiarygodność estymacji jest największa.
Ważne: estymator bazuje na funkcji fminsearch(), która jako argument początkowy wymaga podania przybliżonej lokalizacji ekstremum globalnego.
Estymator będzie w stanie określić położenie dwóch źródeł sygnału, należy w takim wypadku podać wektor dwóch wartości jako punkt startowy algorytmu fminsearch.

angleDetEstimated=BeamConv(Y) - estymator bazujący na klasycznym formowaniu wiązek.
Jako argument przyjmuje wektor pomiarów, zwracany jest kąt, dla którego korelacja między syntetyczną odpowiedzią anteny a zarejestrowanym sygnałem jest największa.
Ważne: estymator bazuje na funkcji fminsearch(), która jako argument początkowy wymaga podania przybliżonej lokalizacji ekstremum globalnego.
W odróżnieniu od MLE nie ma prostego sposobu na dodanie estymacji położenia drugiego z obiektów.

angleDetEstimated=BeamMVDR(Y) - (Minimum Variance Distortionless Response) estymator bazujący na metodzie Capona
Jako argument przyjmuje wektor pomiarów, zwracany jest kąt, dla którego korelacja między syntetyczną odpowiedzią anteny a zarejestrowanym sygnałem jest największa.
Ważne: estymator bazuje na funkcji fminsearch(), która jako argument początkowy wymaga podania przybliżonej lokalizacji ekstremum globalnego.
W odróżnieniu od MLE nie ma prostego sposobu na dodanie estymacji położenia drugiego z obiektów.

[monopulsePolynom, angleRange]=getMonopulsePolynom(M=getConfig().M) - metoda przygotowująca charakterystyki antenowe do współpracy z metodą monoimpulsową.
Funkcja przybliża charakterystykę kątową za pomocą wielomianu 17 stopnia.
Ze względu na złożoność obliczeniową sugeruje się, aby metodę wywołać raz na starcie i przechowywać w pamięci charakterystyki w postaci wielomianów.

MIMP(Y,polynom=getMonopulsePolynom(),M=getConfig().M) - metoda obliczająca kąt odbioru sygnału za pomocą metody monoimpulsowej
- Y - macierz z pomiarami
- M - liczba elementów antenowych
- polynom - charakterystyki antenowe
Metoda nie pozwala na estymację położenia więcej niż jednego źródła sygnału.

## Zadania do realizacji

1. Naprawa estymatory MLE, BeamMVDR i BeamConv - tak żeby fminsearch był w stanie zlokalizować globalne ekstremum.
> podpowiedź: należy dopisać do algorytmów zgrubne przeszukanie po kątach w zakresie -90 do 90, rozdzielczość należy dobrać samodzielne.
> Z czym wiąże się wysoka rozdzielczość, z czym zbyt niska?

2. Zbadanie zachowania różnych estymatorów w przypadku obecności pojedynczego źródła echa.
Sprawdzenie MSE dla 4 różnych położeń i 4 różnych SNR (łącznie 16 testów na podstawie 10k realizacji).
Przyjąć SNR=20dB.

3. Benchmark wydajności - sprawdzenie który z algorytmów w jakim czasie obliczy 100 tys. estymat. 
Mierzyć należy tylko czas wykonywania estymat, nie generowania pomiarów.

4. Test działania algorytmów w przypadku propagacji wielodrogowej.
Wygeneruj pomiary z obiektem na kątach $phi$ i $-\phi$ symulujących lustrzane odbicie od ziemi. 
Amplituda sygnału odbitego powinna wynosić 0.5 sygnału bezpośredniego oraz losową fazę.
Zmodyfikuj algorytm MLE aby był w stanie estymować położenia dwóch obiektów.
Wykonaj symulacje dla SNR=20dB (głównego echa, nad powierzchnią ziemi).
Wykreśl wartość estymowanego kąta (tylko $\phi$ - nad powierzchnią ziemi) w zależności od wartości $\phi$ dla każdego z estymatorów (nawet jeżeli estymator nie pozwala na szacowanie położenia więcej niż jednego kąta odbioru).
Przyjąć $\phi$ równe 0.1:0.02:10.

