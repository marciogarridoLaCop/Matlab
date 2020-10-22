% Função de eficiência incremental LD Banda Larga
% Com casamento de Impedancia
% Autor : Marcio Garrido 4.14 do exercicio

clear all

eff_inc_LD_BL = @(s_l, R_S, freq, C_L, R_L, R_MATCH)...
                (s_l^2/R_S)*((2*R_S)/(2*R_S +... 
                 1i*2*pi*freq*R_L*C_L*(R_S + R_MATCH)))^2;
             
eff_inc_LD_BL_2 = @(s_l, R_S, freq, C_L, R_L, R_MATCH)...
                (R_L*s_l^2/(R_L + R_S))*((R_S + R_L)/(R_S + R_L +... 
                 1i*2*pi*freq*R_L*C_L*(R_S + R_MATCH)))^2;
%        
% Parâmetros fixos:
%
% Resistência da fonte:
R_S = 50;
% Ganho de modulação do LD:
s_l = 0.045;
% Capacitância do diodo laser:
C_L = 20*1e-12;
% Resistência do diodo laser:
R_L = [5 2 5 10];
% Resistência de casamento(circuito de casamento):
R_MATCH = [0 48 45 40];

freq = 1e9*(0.1:0.01:10);

abs_eff_inc_LD_BL = zeros(size(R_L, 2), size(freq, 2));

fc_idx = zeros(size(R_L));

delta = 3;

for ii = 1:size(R_L, 2)
    
    if ii == 1
       
        for i = 1:size(freq, 2)

            abs_eff_inc_LD_BL(ii, i) = 10*log10(abs(eff_inc_LD_BL_2(s_l, R_S,... 
            freq(i), C_L, R_L(ii), R_MATCH(ii))));

        end

    else
        
        for i = 1:size(freq, 2)

            abs_eff_inc_LD_BL(ii, i) = 10*log10(abs(eff_inc_LD_BL(s_l, R_S,... 
            freq(i), C_L, R_L(ii), R_MATCH(ii))));

        end
    
    end
    % Pegar o primeiro valor referente ao R_L
    y0 = abs_eff_inc_LD_BL(ii, 1);
    l = find(abs_eff_inc_LD_BL(ii, :) <= y0 - delta);
    y_c = l(1);
    fc_idx(ii) = y_c;
end

figure();
semilogx(freq, abs_eff_inc_LD_BL, 'LineWidth', 2);
hold on;
plot(freq(fc_idx), diag(abs_eff_inc_LD_BL(:, fc_idx)), 'o', 'LineWidth', 2);
hold off;

legend({'$R_L = 5 \Omega / R_{MATCH} = 0 \Omega $',... 
        '$R_L = 2 \Omega / R_{MATCH} = 48 \Omega $',... 
        '$R_L = 5 \Omega / R_{MATCH} = 45 \Omega $',... 
        '$R_L = 10 \Omega / R_{MATCH} = 40 \Omega $',...
        'Frequencia de corte'},...
        'Interpreter', 'latex','FontSize', 12);

grid on;
title( sprintf('LD - Banda Larga com casamento resistivo \n (Fc1 R_L = 5 = %0.2f  GHz) \n Fc2 (R_L = 2 = %0.2f.  GHz) \n Fc3 (R_L = 5 = %0.2f.  GHz) \n Fc4 (R_L = 10 = %0.2f.  GHz) \n ', ...
    (fc_idx(1)*0.01), (fc_idx(2)*0.01),(fc_idx(3)*0.01),(fc_idx(4)*0.01)));

xlabel('Frequency (GHz)', 'FontSize', 16);
ylabel('Incremental Modulation Efficiency (dB)', 'FontSize', 16);
ax = gca;
ax.XTick = [1e8 1e9 1e10];
ax.XTickLabel = [0.1 1 10];
ax.YLim = [-60 -35];