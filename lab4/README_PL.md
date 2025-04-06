# DPMA_lab_4

Celem ćwiczenia jest zbadanie własności algorytmów detekcji (różna warianty CFAR)

## Dostępne funkcje:

getConfig()

crandn(n) - funkcja generująca zespolone zmienne losowe o rozkładzie gaussowskim (domyślnie ich wariancja to sqrt(2)),
n - rozmiar wygenerowanego ciągu

getTargets(targetIdx) - funkcja zwracająca wektor obiektów z parametrami: SNR, amplituda, odległość [m] i komórka wykrycia (na podstawie danych z getConfig)
Jako argument pobiera numer celu - przygotowane są 3 zestawy do zbadania.

[signalProfile, distProfile]=getProfile(target=[]) - zwraca profil odległościowy (wektor zmiennych zespolonych).
target - (argument opcjonalny) - lista celów zgodna z wyjściem funkcji getTargets
signalProfile - profil odległościowy zawierający sygnał
distProfile - wektor konwertujący numer komórki na odległość - do wykresów

[CFAR_GO_vec, signalProfileSquared]=CFAR_GO(signalProfile) - funkcja wykonująca częściową operację CFAR GO.
signalProfile - profil odległościowy zgodny z wyjściem funkcji getProfile
CFAR_GO_vec - wektor o takiej samej długości jak signalProfile z nieprzeskalowanym progiem detekcji
signalProfileSquared - kwadrat modułu signalProfile - użyteczne na etapie detekcji

## Zadania do realizacji

1. Wykreśl profil odległościowy z naniesionym progiem detekcji, wykonaj 3 wykresy (dla targetIdx=1, 2 i 3).

2. Wykreśl zależność prawdopodobieństwa detekcji od prawdopodobieństwa fałszywego alarmu przy obecności pojedynczego obiektu (targetIdx=1) dla sygnału o różnych SNR - użyj 3dB, 6dB o 12dB.

3. Zmodyfikuj przykładowy program aby możliwe było możliwe wykonanie symulacji z zadania 2 w przypadku obecności więcej niż jednego źródła echa (targetIdx=2)

4. Przeprowadź symulację z podpunktu 3 dla targetIdx=3.
W jaki sposób bliska odległość między dwoma źródłami echa wpływa na wykrywalność słabszego z nich?

5. Napisz funkcję [CFAR_OS_vec, signalProfileSquared]=CFAR_OS(signalProfile) która będzie obliczała próg detekcji w oparciu o medianę a nie średnią jak w przypadku CFAR_GO.
Z wykorzystaniem tej funkcji przeprowadź ponownie symulację z podpunktu 2.
Jak zmiana sposobu liczenia progu detekcji wpłynęła na wykrywalność obiektu o niższym poziomie echa?
Jak zmieniła się złożoność obliczeniowa?


