x = load("Sawtooth_weve.dat");

x_trans=fft(x);
ck = x_trans;

len = length(x_trans);

ck_abs=abs(ck);
ck_fi=angle(ck);

for i=1:len
    x_recon(i)=0;
    for k=1:len
    temp=(1/len)*(2*ck_abs(k)*cos(2*pi*(k-1)*i/len+ck_fi(k)));
    x_recon(i)=x_recon(i)+temp;
    end
end

for i=1:len
    x_recon2(i)=0;
    for k=1:len/2
    temp=(1/len)*(2*ck_abs(k)*cos(2*pi*(k-1)*i/len+ck_fi(k)));
    x_recon2(i)=x_recon2(i)+temp;
    end
end

figure 
plot(x_recon)

figure 
plot(x_recon2)