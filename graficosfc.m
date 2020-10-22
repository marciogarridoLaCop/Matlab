eff_impedancia = @(R_L, R_M, S_L, omegas, C_L, R_S)...
       (S_L^2/R_S)*((2*R_S)/(2*R_S + 1i*omegas*R_L*C_L(R_S + R_M)))^2;
       
        
% Parâmetros fixos
R_L = [5,2,5,10];
R_M = [0,48,45,40];
S_L= 0.045;
C_L=2e-11;

% Resistência da carga
R_S = 50;

%criacao da escala do eixo de frequencia variando 
omegas = 1.e9*(0.01:0.01:100);

abs_eff_pd = zeros(size(R_L, 2), size(omegas, 2));

for ii = 1:size(R_L, 2)
    
    for i = 1:size(omegas, 2)

         abs_eff_pd(ii, i) = 10*log10(abs(eff_impedancia(R_L, R_M(ii), S_L(ii), omegas(i), C_L, R_S)));

    end
    
end
plot(omegas,abs_eff_pd)
%semilogx(omegas, abs_eff_pd, 'LineWidth', 2);
%axis([1e7, 1e11, -60, -25]);
legend({'$Rl5;Rm0$', '$Rl2;Rm48$', '$Rl5;Rm45$', '$Rl10;Rm40$'},...
                                    'Interpreter', 'latex','FontSize', 14)
xlabel('Frequency (Hz)', 'FontSize', 16);
ylabel('Incremental Modulation Efficiency (dB)', 'FontSize', 16);
