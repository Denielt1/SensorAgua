clc
close all
clear all

% Importa valores de frequencia e S21 para valores simulados e medidos-----
[freq, s21] = leCSV('AutoSave1245.csv');
[freq1, simul, simul_3, simul_3_3,simul_3_6,simul_3_9,simul_4_2,simul_4_5,simul_4_8,...
    simul_5_1,simul_5_4,simul_5_7, simul_6,simul_4_0945] = leExcel();

valores = [ simul_3, simul_3_3,simul_3_6,simul_3_9,simul_4_2,simul_4_5,simul_4_8,...
    simul_5_1,simul_5_4,simul_5_7, simul_6];

% Acha valores de frequência para nulos e calcula permissividade-----------


freq_nul_simulacao = [];
freq_max_simulacao = [];
quantidades_nulo = [];
quantidades_maximo = [];
Er_calc_simulado = [];

for i = 1:length(valores(1,:))
    [freq_nul_simulacao(i,:), quantidades_nulo(i,:), valor_nul(i,:)] = achaNulosSIMULACAO(valores(:,i), freq1);
    [freq_max_simulacao(i,:), quantidades_maximo(i,:), maximos(i,:)] = achaMaximosSimulacao(valores(:,i), freq1);
    Er_calc_simulado(i,:) = calculaPermissividadeSIMULADO(freq_nul_simulacao(i,:), quantidades_nulo(i));
end

%Permissividade 4.3
[freq_nul, quantidade] = achaNulosCSV(s21, freq);
Er_calc_medido = calculaPermissividade_Medido(freq_nul, quantidade);

[freq_nul_simulacaosimul, quantidade_simul] = achaNulosSIMULACAO(simul, freq1);
Er_calc_simulado_4_3 = calculaPermissividadeSIMULADO(freq_nul_simulacaosimul, quantidade_simul);


%Erro ------------------------------------------------------------------
figure();
x = 1:(length(Er_calc_simulado(1,:))-1);
erro = [];
soma = 0;

for j = 1:length(Er_calc_simulado(:,1))
    erro(j,:) = (2.7+(0.3*j))./(Er_calc_simulado(j,:));
     for k = 1:length(Er_calc_simulado(1,:))
            if erro(j,k)>1
                erro(j,k) = erro(j,k)-1;
                if k == 3
                    soma = soma+erro(j,k);
                end
            end
            if erro(j,k)>0.9
                erro(j,k) = 1 - erro(j,k);
                if k == 3
                    soma = soma+erro(j,k);
                end
            end
     
    end
    erro1 = erro(j,1:5);
    %erro_geral(j,1:length(erro1)) = erro1;
     plot(x, erro1)
     hold on
end

desvio_erro = std(erro(:,1:4));
Media_erro = [(sum(erro(:,1)))/11 (sum(erro(:,2)))/11 (sum(erro(:,3)))/11 (sum(erro(:,4)))/11];

legend('\bf\epsilon_r = 3','\bf\epsilon_r = 3.3','\bf\epsilon_r = 3.6','\bf\epsilon_r = 3.9',...
    '\bf\epsilon_r = 4.2','\bf\epsilon_r = 4.5','\bf\epsilon_r = 4.8','\bf\epsilon_r = 5.1',...
    '\bf\epsilon_r = 5.4','\bf\epsilon_r = 5.7','\bf\epsilon_r = 6')
xticks([1:5])
grid
xlabel('Nulo (n)')
ylabel('Erro')

media = soma/10;

figure()
freq1 = freq1.*(10^(-9));
freq = freq.*(10^(-9));
plot(freq1, simul_4_0945,'y','LineWidth',2)
hold on
plot(freq, s21,'k','LineWidth',0.5)
xlabel('Frequência (GHz)')
ylabel('S_{21}')
legend('Simulado','Medido')



%Tratando os valores de máximo

figure(3);

p = [];
f1 = [];

for q = 1:11
    
max = maximos(q,:);
if max((length(max)-1)) == 0
    aa = 1:(length(max)-2);
    %max = db2mag(max);
    p(q,:) = polyfit(aa,max(aa),3);
    %f1(q,:) = polyval(p(q,:), aa);
    plot(aa,max(aa))
    hold on

elseif max(length(max)) == 0
    %max = db2mag(max);
    aaa = 1:(length(max)-1);
    p(q,:) = polyfit(aaa,max(aaa),3);
    %f1(q,:) = polyval(p(q,:), aaa);
    plot(aaa,max(aaa))
    hold on
 
else
    %max = db2mag(max);
    aaaa = 1:(length(max));
    p(q,:) = polyfit(aaaa,max(aaaa),3);
    %f1(q,:) = polyval(p(q,:), aaaa);
    plot(aaaa,max)
    hold on
end
    
end

figure();

for qi = 1:11
    
    val_nul = valor_nul(qi,:);
    if val_nul(length(val_nul)-1) == 0
        bb = 1:(length(val_nul)-2);
        plot(bb,val_nul(bb))
        hold on
        
    elseif val_nul(length(val_nul)) == 0
        bbb = 1:(length(val_nul)-1);
        plot(bbb,val_nul(bbb))
        hold on
        
    else
        bbbb = 1:(length(val_nul));
        plot(bbbb,val_nul(bbbb))
        hold on
    end
        
end