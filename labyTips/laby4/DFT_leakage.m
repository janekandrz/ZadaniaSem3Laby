% demonstracja przecieku w widmie DFT
% do zadania 05_02af czêœæ I
clear
% deklaracja danych
f0 = 10; % czestotliwosc generowanej sinusoidy
disp(['Czêstotliwoœæ fali sinusoidalnej f0 = ', num2str(f0), ' Hz.']) 
fs = 100; % szybkoœæ probkowania 
% fs sama z sobie nie zwieksza rozdzielczosci widma delta_f
disp(['Szybkoœæ próbkowania fs = ', num2str(fs), ' próbek/s.']) 
A = 5; % amplituda sinusoidy
r = 5.2; % liczba generowanych okresów dla f0
          % badaæ przypadki nieca³kowitych liczb r
disp(['Liczba generowanych okresów r = ',num2str(r),'.'])
% wyznaczanie parametrow analizy i generacja sygnalu
Ts = 1/fs;
T0 = 1/f0;
T = r*T0; % czas obserwacji sygnalu w sekundach
t = 0:Ts:T - Ts; % wektor czasu w sekundach
x = A*sin(2*pi*f0*t); % wygenerowana fala sinusoidalna
N = length(x); % rozmiar fft
disp(['Rozmiar FFT N = ', num2str(N),'.'])
delta_f = fs/N; % rozdzielczosc widma
disp(['Rozdzielczoœæ widma wynosi ',num2str(delta_f),' Hz.'])
X = fft(x); % two-sided discrete spectrum
figure(2)
stem((0:N - 1)*delta_f,abs(X),'r')
xlabel('Frequency in Hz')
ylabel('Two-sided |X(2 \pi f)|')
figure(1)
subplot(211)
plot(t,x)
%stem(t,x)
xlabel('Time in seconds')
ylabel('Signal x(t)')
% widmo jednostronne Xh (half)
Xh = 2*X(1:floor(N/2 + 1)); % one-sided discrete spectrum
k = 0:1:floor(N/2); % indeksy prazkow
f = k*delta_f;
subplot(212) 
stem(f,abs(Xh),'m') % one-sided apmlitude spectrum
title('NOTE - REAL SIGNAL CASE')
xlabel('Frequency in Hz')
ylabel('One-sided |X(2 \pi f)|')
disp('************  KONIEC  ITERACJI  ************')
disp(' ')