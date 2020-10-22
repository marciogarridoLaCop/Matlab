% Exercicio 4.14 
% Função de eficiência incremental LD Banda Larga com casamento resistivo
% Aluno : Filipe Lopes

clear all

eff = @(SL, RS, freq, CL, RL, R_match)...
                (SL^2/RS)*((2*RS)/(2*RS +1i*freq*2*pi*RL*CL*(RS + R_match)))^2;
             


% Ganho de modulação do diodo Laser:
SL = 0.045;
% Resistência da fonte:
RS = 50;
% Resistência do diodo laser em vetor:
RL = [5 2 5 10];
% Resistência de casamento(circuito de casamento) em vetor:
R_match = [0 48 45 40];
% Capacitância do diodo laser:
CL = 20e-12;

freq = 1.e9*(0.01:0.01:100);
freq_ang=(2*pi).*freq;



abs_eff_bandalarga = zeros(size(RL, 2), size(freq, 2));

fc_indice = zeros(size(RL));

diferencial = 3;

for ii = 1:size(RL, 2)
    
   
        
        for i = 1:size(freq, 2)
            % chamando a funcao para calcular
            abs_eff_bandalarga(ii, i) = 10*log10(abs(eff(SL, RS,freq(i), CL, RL(ii), R_match(ii))));

        end
    
   
     % queda de -3dB
    y0 = abs_eff_bandalarga(ii, 1);
    l = find(abs_eff_bandalarga(ii, :) <= y0 - diferencial);
    y_c = l(1);
    fc_indice(ii) = y_c;
end

figure();
semilogx(freq, abs_eff_bandalarga, 'LineWidth', 2);
hold on;
plot(freq(fc_indice), diag(abs_eff_bandalarga(:, fc_indice)), 'o', 'LineWidth', 2);
hold off;

legend({'$R_L = 5 \Omega / R_{MATCH} = 0 \Omega $',... 
        '$R_L = 2 \Omega / R_{MATCH} = 48 \Omega $',... 
        '$R_L = 5 \Omega / R_{MATCH} = 45 \Omega $',... 
        '$R_L = 10 \Omega / R_{MATCH} = 40 \Omega $',...
        'Frequencia de corte'},...
        'Interpreter', 'latex','FontSize', 12);

grid on;
title( sprintf('LD - Banda Larga com casamento resistivo \n (Fc1 R_L = 5 = %0.2f  GHz) \n Fc2 (R_L = 2 = %0.2f  GHz) \n Fc3 (R_L = 5 = %0.2f  GHz) \n Fc4 (R_L = 10 = %0.2f  GHz) \n ', ...
    (fc_indice(1)*0.01), (fc_indice(2)*0.01),(fc_indice(3)*0.01),(fc_indice(4)*0.01)));

xlabel('Frequency (GHz)', 'FontSize', 16);
ylabel('Incremental Modulation Efficiency (dB)', 'FontSize', 16);
ax = gca;
ax.XTick = [1e8 1e9 1e10];
ax.XTickLabel = [0.1 1 10];
ax.YLim = [-60 -35];