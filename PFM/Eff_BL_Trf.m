% Exercicio 4.17 
% Função de eficiência incremental LD Banda Larga Com casamento de Impedancia
% Autor : Filipe Lopes


clear all;

        eff = @(SL,RS,freq,NL,CL,RL)((SL^2*NL^2)/RS)*(1/(((1i*freq*2*pi*RL*CL)/2)+1))^2;
    

SL = 0.045;
% Capacitância do diodo Laser:
CL = 20e-11;
% Resistência do Laser
RL = [2 5 10];
% Resistência de casamento(circuito de casamento)
R_Match = [48 45 40];
% Resistência da fonte:
RS = 50;
% Ganho de modulação do Laser



% criando linha de matriz para frequencia
freq = 1.e9*(0.01:0.01:100);


abs_eff = zeros(size(RL, 2), size(freq, 2));

fc_indice = zeros(size(RL));

diferencial = 3;


for ii = 1:size(RL,2);
    
   
    for i = 1:size(freq, 2);
        
    
 NL=sqrt(RS/RL(ii)); 
     abs_eff(ii,i) = 10*log10(abs(eff(SL,RS,freq(i),NL,CL,RL(ii)))); 
    end
    
     % pegar o indice em relacao ao -3dB
    y0 = abs_eff(ii, 1);
    l = find(abs_eff(ii, :) <= y0 - diferencial);
    y_c = l(1);
    fc_indice(ii) = y_c;
end

figure();
semilogx(freq, abs_eff, 'LineWidth', 2);
hold on;
plot(freq(fc_indice), diag(abs_eff(:, fc_indice)), 'o', 'LineWidth', 2);
hold off;

legend({'$RL = 2 \Omega  $',... 
        '$RL = 5 \Omega  $',... 
        '$RL = 10 \Omega $',...
        'Frequencia de corte'},...
        'Interpreter', 'latex','FontSize', 12)

title('Exercicio 4.17 ', 'FontSize', 16);
title( sprintf('LD - Banda Larga com casamento de transformador \n (Frequencia R_L = 2 = %0.2f  GHz) \n Frequencia (R_L = 5 = %0.2f  GHz) \n Frequencia (R_L = 10 = %0.2f  GHz) \n ', ...
    (fc_indice(1)*0.01), (fc_indice(2)*0.01),(fc_indice(3)*0.01)));
grid on;
xlabel('Frequency (GHz)', 'FontSize', 16);
ylabel('Incremental Modulation Efficiency (dB)', 'FontSize', 16);
ax = gca;
ax.XTick = [1e8 1e9 1e10];
ax.YLim = [-60 -25];
ax.XTickLabel = [1e-1 1 1e1];


