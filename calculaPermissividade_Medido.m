function Er_calc_medido = calculaPermissividade_Medido(freq_nul, quant)

p = 1;
eff_medido = [];
Er_calc_medido = [];
h = 1.5;
W = 3.1;
vari = 1/(sqrt(1+(12*h/W)));
while p<quant
    eff_medido(p) = ((((3e08)/(4*freq_nul(p)*0.1)))*((2*p)-1))^2;
    Er_calc_medido(p) = (eff_medido(p) - 0.5 + 0.5*(vari))/(0.5+(0.5*vari));
    p = p+1;
end