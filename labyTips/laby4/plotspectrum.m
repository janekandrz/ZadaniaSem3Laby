function [f,amplituda,arg] = plotspectrum(sig,fs)
    len=length(sig);
    sig_t = fft(sig);
    amplituda = abs(sig_t);
    arg=angle(sig_t);

    f=(0:len-1)*(fs/len);

    figure 
    subplot(2,1,1)
    plot(f,amplituda)
    grid on
    title("amplituda")
    xlabel("f[Hz]")
    ylabel("aplituda")

    subplot(2,1,2)
    plot(f,arg)
    grid on 
    title("przesuniecie fazowe")
    xlabel("f[Hz]")
    ylabel("przesuniecie fazowe[rad]")
    
end