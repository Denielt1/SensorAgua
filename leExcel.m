function [freq1, simul, simul_3, simul_3_3,simul_3_6,simul_3_9,simul_4_2,simul_4_5,simul_4_8,...
    simul_5_1,simul_5_4,simul_5_7, simul_6,simul_4_0945] = leExcel()

freq1 = xlsread('Sensor_artigo.xlsx')(:,1);
simul = xlsread('Sensor_artigo.xlsx')(:,2);
simul_3 = xlsread('Sensor3.xlsx')(:,2);
simul_4_5 = xlsread('Sensor4_5.xlsx')(:,2);
simul_5 = xlsread('Sensor5.xlsx')(:,2);
simul_3_3 = xlsread('Sensore_3ao6.xlsx')(:,3);
simul_3_6 = xlsread('Sensore_3ao6.xlsx','', 'D1:D1001','basic');
simul_4_2 = xlsread('Sensore_3ao6.xlsx','', 'F1:F1001','basic');
simul_4_8 = xlsread('Sensore_3ao6.xlsx','', 'H1:H1001','basic');
simul_5_1 = xlsread('Sensore_3ao6.xlsx','', 'I1:I1001','basic');
simul_5_4 = xlsread('Sensore_3ao6.xlsx','', 'J1:J1001','basic');
simul_5_7 = xlsread('Sensore_3ao6.xlsx','', 'K1:K1001','basic');
simul_6 = xlsread('Sensore_3ao6.xlsx','', 'L1:L1001','basic');
simul_3_9 = xlsread('sens3_9.xlsx','','B1:B1001','basic');
simul_4_0945 = xlsread('Sens4_0945.xlsx','','B1:B1001','basic');


freq1 = freq1.*(10^9);
simul = -simul;
simul_3 = -simul_3;
simul_3_3 = -simul_3_3;
simul_3_6 = -simul_3_6;
simul_4_2 = -simul_4_2;
simul_4_5 = -simul_4_5;
simul_4_8 = -simul_4_8;
simul_5 = -simul_5;
simul_5_1 = -simul_5_1;
simul_5_4 = -simul_5_4;
simul_5_7 = -simul_5_7;
simul_6 = -simul_6;
simul_3_9 = -simul_3_9;
simul_4_0945 = -simul_4_0945;