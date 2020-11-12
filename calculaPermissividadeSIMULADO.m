function Er_calc_simulado = calculaPermissividadeSIMULADO(freq_nul_simulacao, quant)

p = 1;
Er_calc_simulado = [];
h = 1.5;
W = 3.1;
vari = 1/(sqrt(1+(12*h/W)));
while p<quant
    eff_medido_simulado = ((((3e08)/(4*freq_nul_simulacao(p)*0.1)))*((2*p)-1))^2;
    Er_calc_simulado(p) = (eff_medido_simulado - 0.5 + 0.5*(vari))/(0.5+(0.5*vari));
    p = p+1;
end
if length(Er_calc_simulado)<5
    Er_calc_simulado = [Er_calc_simulado 0 0];
end
if length(Er_calc_simulado)<6
    Er_calc_simulado = [Er_calc_simulado 0];
end
end