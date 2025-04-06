# DPMA_lab_3

Celem ćwiczenia jest zbadanie własności sygnałów posiadających przesunięcie dopplerowskie.

## Dostępne funkcje:

getConfig()

crandn(n) - funkcja generująca zespolone zmienne losowe o rozkładzie gaussowskim (domyślnie ich wariancja to sqrt(2)),
n - rozmiar wygenerowanego ciągu

getTarget() - funkcja zwracająca obiekt z parametrami obserwowanych celów.

[txSignal, singleChirp]=getTxSignal() - funkcja zwracająca cały sygnał nadany o parametrach pobranych z pliku konfiguracyjnego oraz pojedynczy sygnał LFM (używany na etapie kompresji impulsu).

rxSignal=channelOutput_simple(inputSignal, target) - funkcja pobierająca sygnał nadany oraz wektor celów, zwraca echo z uproszczonym przesunięciem dopplerowskim (tylko obracająca się faza)

rxSignal=channelOutput_better(inputSignal, target) - funkcja pobierająca sygnał nadany oraz wektor celów, zwraca echo z rozszerzonym przesunięciem dopplerowskim (obracająca się faza oraz faktyczne skrócenie czasu trwania impulsu) uwaga: w zależności od parametrów symulacji może wymagać dużo pamięci ram (32GB może być zbyt mało, należy wtedy zmniejszyć cfg.Fs)

[pulses, distVector]=pulseCompression(rxSignal) - funkcja pobierająca jako argument odebrany sygnał i dzieląca go na poszczególne impulsy. 
pulses - macierz o wymiarze cfg.M x cfg.pulseSamplesNo (liczba impulsów x ich długość) z sygnałami pogrupowanymi w impulsy
distVector - wektor pozwalający przekonwertować indeks na odległość.

## Zadania do realizacji

1. Zbadaj zachowanie przetwarzania niekoherentnego (proste sumowanie danych z wszystkich dostępnych impulsów bez ich wyrównywania w fazie czy opóźnieniu).
Użyj do tego celu uproszczonego modelu kanału dopplerowskiego.
Jak zachowuje się echo dla braku, a jak przy maksymalnej prędkości radialnej.
Co dzieje się z echem sygnału po przekroczeniu maksymalnej jednoznacznej prędkości radialnej?

2. Filtracja MTD
Zaprojektuj i napisz funkcję filteredSignal=MTDProcessing(rxData) gdzie rxData jest macierzą pulses z wyjścia funkcji pulseCompression(), a filteredSignal będzie macierzą sygnału po filtracji przy pomocy K filtrów.
Należy napisać funkcję która utworzy K pasmowo-przepustowych filtrów o jednakowej szerokości pasma przepuszczanego.
Przy wykorzystaniu tych filtrów należy wykonać filtrację w dziedzinie sondowań.
Jak zmienia się indeks filtru w którym wykryto maksimum sygnału w zależności od prędkości radialnej?
Czy jest możliwość rozróżnienia kilku (2 lub więcej) obiektów znajdujących się w takiej samej odległości, jednak poruszających się z różnymi prędkościami radialnymi?

3. Badanie dokładniejszego modelu filtracji dopplerowskiej
Zaprojektuj symulację w której obiekt będzie poruszał się na tyle szybko, że w kolejnych sondowaniach znajdzie się w innych komórkach odległościoych.
Jak wpływa to na proces filtracji MTD?

