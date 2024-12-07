function x = fftrecon(a,b,l)% a - abs(ck) b - angle(ck) l- ilosc harmonicznych do rekonstrukcji sygnału
    x = ones(length(a):1);
    for i=1:length(a)
        x(i)=0;
        for k=1:l
        temp=(1/l)*(2*a(k)*cos(2*pi*(k-1)*i/l+b(k)));
        x(i)=x(i)+temp;
        end
    end
end

