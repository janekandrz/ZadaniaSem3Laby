close all
%zad 1 
v=340;
fs=1000000;

short_sent= load("rf_signals/tx_short.dat");
short_recived= load("rf_signals/rx_short.dat");
long_sent= load("rf_signals/tx_long.dat");
long_recived= load("rf_signals/rx_long.dat");

[xcor,index]=xcorr(short_recived,short_sent);

[max_corr, max_index]=max(xcor);

relative_index=max_index-(length(xcor)/2);
time=relative_index/fs;

dist=time*v/2

figure 
plot(index,xcor)
hold on
plot(relative_index,max_corr,"go")
xlabel("m")
ylabel("korelacja")

%%

[xcor2,index2]=xcorr(long_recived,long_sent);

peak_value=zeros(1,10);
peak_index=zeros(1,10);

middle=ceil(length(xcor2)/2);
half_xcor2=xcor2(middle:end);
half_index2=index2(middle:end);

figure 
plot(half_index2,half_xcor2)
hold on

window_size=floor(length(half_xcor2)/10);

for i=1:10
    start_pos = (i-1)*window_size+1;
    end_pos = min(start_pos+window_size, length(half_index2));

    [peak_value(i), local_index]=max(half_xcor2(start_pos:end_pos));
    peak_index(i)=local_index+start_pos-1;
    xline(start_pos,Color="red")
    xline(end_pos,Color="red")
end

plot(peak_index,peak_value,"go")
xlabel("m")
ylabel("korelacja")
hold off

time=(peak_index-800)./fs;

dist2=time.*v/2

%nie mam pojecia dlaczego nie wychodzi dobrze 
%koncepcyjnie biore pod uwage wszystkie aspekty poprzedniego
%zadania i dobrze wykrywam peaks korealcji 


%%
%zad 2 

%brak pliku rozsynchroinizowane sygnaly 

%zad 3 brak pliku liczba plam na słońcu 



















