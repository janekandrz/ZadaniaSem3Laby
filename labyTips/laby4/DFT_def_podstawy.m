% ANALIZA DFT - DEFINICJA, PODSTAWY
% do zadania 05_00af

fs = 10;% szybkoœæ probkowania w probkach/sekundê; badac jej wplyw
A = 1; % wysokosc okienka
L = 10; % dlugosc segmentu sygnalu; badac jej wplyw
x = A*ones(L,1); % sygnal - wektor kolumnowy L jedynek
M = 0; % liczba dopisanych zer; badac ich wplyw
x = [x;zeros(M,1)]; % segment sygnalu uzupelniony zerami
N = length(x); % dlugosc wektora sygnalu i rozmiar DFT
disp(['Rozmiar FFT wynosi N = ',num2str(N),'.'])
T = 0:N - 1; % wektor wierszowy indeksow czasu dyskretnego
K = 0:N - 1; % wektor wierszowy indeksow czestotliwosci
delta_f = fs/N; % rozdzielczoœæ w widmie DFT
disp(['Rozdzielczoœæ widmowa delta_f = ', num2str(delta_f),' Hz.'])
F = K*delta_f; % wektor czestotliwosci wyskalowany w Hz
DN = exp(-1j*2*pi/N*(K'*T)); % macierz NxN transformacji DFT
X = DN*x; % wektor widma DFT
% wyswietlanie wynikow
subplot(411)
stem(F,real(X),'.') % czesc rzeczywista widma
ylabel('Re(X)')
subplot(412)
stem(F,imag(X),'.') % czesc urojona widma
ylabel('Im(X)')
subplot(413)
stem(F,abs(X),'.')% modu³ widma dla ma³ych N ~<= 100
% plot(F,abs(X))% plot modu³u widma dla du¿ych N ~>= 100
ylabel('|X(k)|')
subplot(414)
arg = angle(X);
% arg(abs(X)<1e-9) = 0; % likwidacja szumu fazy dla zerowego modu³u
stem(F,arg,'.') % faza widma dla ma³ych N ~<= 100
% plot (F, arg)% rysunek widma dla du¿ych N ~>= 100

ylabel('arg[X(k)]')
disp('*****************************************')