% Função de eficiência incremental
% Autor : Marcio Garrido 
% Data : 13/10/2018

eff_pd = @(r_d, R_load, N_D, omega, C_D, R_D)...
            r_d^2*R_load*N_D^2/(1i*omega*2*pi*C_D*(R_D + N_D^2*R_load) + 1)^2;
        
% Parâmetros fixos
% Relação de espiras no transformador
N_D = [sqrt(10), sqrt(5), sqrt(2), sqrt(1)];
%N_D = [10, 5, 2, 1];

% Resistência da carga
R_load = 50;
% Responsividade do fotodiodo
r_d = 0.7;
% Capacitância do fotodiodo
C_D = 0.5*1e-12;
% Resistência do fotodiodo
R_D = 5;

%criacao da escala do eixo de frequencia variando 
omegas = 1e9 * (0.01:0.01:100);

abs_eff_pd = zeros(size(N_D, 2), size(omegas, 2));

for ii = 1:size(N_D, 2)
    
    for i = 1:size(omegas, 2)

        abs_eff_pd(ii, i) = 10*log10(abs(eff_pd(r_d, R_load, N_D(ii), omegas(i), C_D, R_D)));

    end
    
end

semilogx(omegas, abs_eff_pd, 'LineWidth', 2);
grid on;
xlabel('Frequency (GHz)', 'FontSize', 16);
ylabel('Incremental Modulation Efficiency (dB)', 'FontSize', 16);
ax = gca;
ax.XTick = [1e8 1e9 1e10];
ax.YLim = [-5 30];
ax.XTickLabel = [1e-1 1 1e1];
axis([1e7, 1e11, -5, 30]);
legend({'$N_D^2 = 10$', '$N_D^2 = 5$', '$N_D^2 = 2$', '$N_D^2 = 1$'},...
                                    'Interpreter', 'latex','FontSize', 14);

