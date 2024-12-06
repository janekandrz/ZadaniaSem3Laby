%% zad 1
close all
x = load("Sawtooth_weve.dat");

x_trans=fft(x);
ck = x_trans;

f=(1:length(x)-1)*(10/length(x));

figure
subplot(2,1,1)
plot(f,abs(ck))
title("moduł transformaty")

subplot(2,1,2)
plot(f,angle(ck))
title("przesuniecie fazowe")

len = length(x_trans);

ck_abs=abs(ck);
ck_fi=angle(ck);

figure 
plot(fftrecon(ck_abs,ck_fi,len))
title("rekonstrukcaj calego")

%%

for i=1:20:150
figure 
plot(fftrecon(ck_abs,ck_fi,i))
title("Rekonstrukcja na podstawie %d harmonicznchy",i)
end


%% zad 2 

Ts=1/20;
t=0:Ts:2;

signal = cos(4*pi*t);
len = length(signal);

sig_trans = fft(signal);

f=(0:len-1)*(20/len);

figure 
subplot(2,1,1)
plot(f,abs(sig_trans))
title("modul")
xlabel("f [Hz]")
ylabel("amplituda")

subplot(2,1,2)
plot(f,angle(sig_trans))
title("przesuniecie fazowe")
xlabel("f[Hz]")
ylabel("przesuniecie fazowe[rad]")


%% przesuniecia fazowe 
signal1 = cos(4*pi*t+0.1);
signal2 = cos(4*pi*t+ 0.4);
signal3 = cos(4*pi*t+ 1.5);

sig1_t=fft(signal1);
sig2_t=fft(signal2);
sig3_t=fft(signal3);

figure
plot(f,angle(sig1_t),"Color","red")
hold on
plot(f,angle(sig2_t),"Color","blue")
hold on 
plot(f,angle(sig3_t),"Color","green")
hold off
legend("0,1","0,4","1,5")
title("przesuniecia fazowe")
xlabel("f[Hz]")
ylabel("przesuniecie [rad]")

%% zmiana czestotliwosci 

sig_f=cos(24*pi*t);
sig_f_t=fft(sig_f);

figure 
subplot(2,1,1)
plot(f,abs(sig_f_t))
xlabel("f [Hz]")
ylabel("amplituda")

subplot(2,1,2)
plot(f,angle(sig_f_t))
xlabel("f [Hz]")
ylabel("przesuniecie[rad]")


%%
%zad 3 

%brak pliku detekcja dtfm

%zad 4

%brak pliku krokomierz 


