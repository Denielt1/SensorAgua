function [freq_max_simulacao, quantidade, valores_max] = achaMaximosSimulacao(simul, freq1)

n=2;
quant = 1;



while n<1000
    if (simul(n-1)<simul(n)) && (simul(n)>simul(n+1))
        freq_max_simulacao(quant) = freq1(n);
        valores_max(quant) = simul(n);
        quant = quant+1;
    end
    n = n+1;
end

quantidade = quant;
if length(freq_max_simulacao)<5
    freq_max_simulacao = [freq_max_simulacao 0 0];
    valores_max = [valores_max 0 0];
end
if length(freq_max_simulacao)<6
    freq_max_simulacao = [freq_max_simulacao 0];
    valores_max = [valores_max 0];
end
end