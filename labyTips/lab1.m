close all 

t = 0:0.05:4;

y = 2.5* sin(2*pi*2*t);

figure
plot(t,y)
grid on 
xlabel('time[s]')
ylabel('signal')
title('sygnal sin')
text(1,1,'sin')

r = 0 + 0.1.*randn(81,1);

y_szum = y + r';

figure 
plot(t,y, 'red')
hold on 
plot(t,y_szum, 'blue')
grid on

sygnal = load("sygnal.dat");

sygnal_norm = Normalizacja(sygnal);

function res=Normalizacja(sygnal)
    res = normalize(sygnal,'range',[-1,1]);
    save('sygnal_norm.dat',"res",'-ascii')
end



