function [col1, col2] = leCSV(file_input)

% DIGITE AQUI O NOME DO ARQUIVO CSV


file_output=strcat('temp_',file_input);

% processamento do arquivo csv (para torna-lo padrao)
fid = fopen(file_input);
output = fopen(file_output,'wt');

tline = fgetl(fid);
flag=0;

while ischar(tline)
    
    %disp(tline);
    tline = fgetl(fid);
    
    if strcmp('END',tline)
        flag=0;
    end
    
    if flag==1
    fprintf(output, strcat(tline,'\n'));   
     
    end
        
    if strcmp('BEGIN',tline)
        flag=1;
    end
end

fclose(fid);
fclose(output);


% Aqui pode abrir o csv e usar

Array=csvread(file_output);
col1 = Array(:, 1);
col2 = Array(:, 2);
%figure
%plot(col1, col2)
end

