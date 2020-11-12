function [freq_nul_simulacao, quantidade, valor_nul] = achaNulosSIMULACAO(simul, freq1)

n=2;
quant = 1;
freq_nul_simulacao = [];
valor_nul = [];


while n<1000
    if (simul(n-1)>simul(n)) && (simul(n)<simul(n+1)) && (simul(n)<-10)
        freq_nul_simulacao(quant) = freq1(n);
        valor_nul(quant) = simul(n);
        quant = quant+1;
    end
    n = n+1;
end

quantidade = quant;
if length(freq_nul_simulacao)<5
    freq_nul_simulacao = [freq_nul_simulacao 0 0];
    valor_nul = [valor_nul 0 0];
end
if length(freq_nul_simulacao)<6
    freq_nul_simulacao = [freq_nul_simulacao 0];
    valor_nul = [valor_nul 0];
end
end