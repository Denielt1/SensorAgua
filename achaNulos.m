function [freq_nul, freq_nul_simulacao, quantidade] = achaNulosSIMULACAO(simul, freq1)

n=2;
quant = 1;
nulos=[];
freq_nul = [];

n = 1;
quant = 1;

while n<1000
    if (simul(n-1)>simul(n)) && (simul(n)<simul(n+1)) && (simul(n)<-10)
        freq_nul_simulacao(quant) = freq1(n);
        quant = quant+1;
    end
    n = n+1;
end

quantidade = quant;