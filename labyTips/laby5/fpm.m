function result = fpm(poly1, poly2)
    n = length(poly1) + length(poly2) - 1;
    
    poly1_padded = [poly1, zeros(1, n - length(poly1))];
    poly2_padded = [poly2, zeros(1, n - length(poly2))];
    
    fft_poly1 = fft(poly1_padded);
    fft_poly2 = fft(poly2_padded);
    
    fft_result = fft_poly1 .* fft_poly2;
    
    result = real(ifft(fft_result));
end