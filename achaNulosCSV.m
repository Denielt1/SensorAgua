function [freq_nul, quantidade] = achaNulosCSV(s21, freq)

n=2;
quant = 1;
nulos=[];
freq_nul = [];

while n<200
    if (s21(n-1)>s21(n)) && (s21(n)<s21(n+1)) && (s21(n)<-10)
        freq_nul(quant) = freq(n);
        quant = quant+1;
    end
    n = n+1;
end
quantidade = quant;