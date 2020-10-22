% programa para calcular eficiencia incremental
% do fotodiodo com casamento intrinsico de impedancia
% com baloon ( transformador)
% Autor : Marcio Garrido 
% Data : 13/10/2018

clc;
clear all;

fprintf('Programa para calcular efiencia do photodiodo com casamento de impedancia \n');

% Relação de espiras no transformador
fprintf(' \n');
ND2 = input('Informe a relacao de espiras do secundario: ');
ND=sqrt(ND2);
% Resistência da carga
fprintf(' \n');
Rload = input('Informe a Resistência da carga em Ohms: ');

% Responsividade do fotodiodo
fprintf(' \n');
rd = input('Informe a responsividade do fotodiodo em A/W: ');

% Capacitância do fotodiodo
fprintf(' \n');
CD = input('Informe a capacitância do fotodiodo em Farad: ');

% Resistência do fotodiodo
fprintf(' \n');
RD = input('Informe a resistência interna fotodiodo em Ohms: ');5;

% condicao de omegas igual a zero
omega=0;

% Formula usada do capitulo do modulo 4 - Pág 55 da Disciplina PFM - UFF

Pload=rd^2*Rload*ND^2;
P2od =(1i * omega * CD * (RD + ND^2 + Rload) + 1) ^ 2; 
Slope=abs((Pload/P2od^2));
Slope= 10*log10(Slope) ;

% sainda de dados em tela
fprintf(' \n');
fprintf('Ganho calculado com sucesso \n');
fprintf(' \n');
fprintf('O valor de ganho obtido foi de %.2f dB \n',round(Slope,1));