% Exercicio 4.18
% Função de casamento de impedancia conjugado com frequencia de ressonancia
eff_inc_LD_BL = @(S_l, N_L, R_S, freq, C_L, R_L, L, RML)...
   ((S_l^2)*(N_L.^2)/R_S)*(((-(2*pi*freq)^2)*(C_L*R_L*L)/(2*(RML+R_L)))+((1i*2*pi*freq*0)*((L+(C_L*R_L*RML))/...
                (2*(RML+R_L))+(C_L*R_L)/2))+1)^-2;
            

% Reatância Indutiva:
L = 25e-9;
% Relação de espiras no transformador
N_L = [sqrt(10), sqrt(5), sqrt(2), sqrt(1)];
% Ganho de modulação do LD:
S_l = 0.045;
% Resistência da fonte:
R_S = 50;
% Capacitância do diodo laser:
C_L = 20e-12;
% Resistência do diodo laser:
R_L = [2 5 10 1];


freq = 1e9*(0.01:0.01:10);

abs_eff_inc_LD_BL = zeros(size(N_L, 2), size(R_L, 2), size(freq, 2));

for iii = 1:size(N_L, 2)
    
    for ii = 1:size(R_L, 2) 
        
        RML = R_S/N_L(iii)^2 - R_L(ii); % 
                                     
        
        for i = 1:size(freq, 2)

            abs_eff_inc_LD_BL(iii, ii, i) = 10*log10(abs(eff_inc_LD_BL(S_L, N_L(iii), R_S, freq(i),C_L, R_L(ii), L, RML)));

        end    
    end
end

semilogx(freq, squeeze(abs_eff_inc_LD_BL(:,1,:)), 'LineWidth', 2);
legend({'$N_L^2 = 10$', '$N_L^2 = 5$', '$N_L^2 = 2$', '$N_L^2 = 1$'},...
        'Interpreter', 'latex','FontSize', 12);
title({'Casamento Conjugado'; 'Frequencia de Ressonancia em LD com RL Variando'}, 'FontSize', 14);
grid on;
xlabel('Frequency (GHz)', 'FontSize', 12);
ylabel('Incremental Modulation Efficiency (dB)', 'FontSize', 12);
ax = gca;
ax.XTick = [1e7 1e8 1e9 1e10];
ax.XTickLabel = [0.01 0.1 1 10];
%ax.YLim = [-80 -20];