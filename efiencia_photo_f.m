% programa para calcular eficiencia incremental
% do fotodiodo com casamento intrinsico de impedancia
% com baloon ( transformador) com frequencia de 1Ghz
% Autor : Marcio Garrido 
% Data : 13/10/2018

clc;
clear all;
% parametros fixos 
% omega =2PI*frequencia(1Ghz)

omegas=2*pi*10^9;

fprintf('Programa para calcular efiencia do photodiodo com casamento de impedancia \n');

% Relação de espiras no transformador
fprintf(' \n');
ND = input('Informe a relacao de espiras do secundario: ');

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


% Formula usada do capitulo do modulo 4 - Pág 58 da Disciplina PFM - UFF

 
Pload =  ND^2 * (24.5 + 1.54 * 10^-22 * (1+ND^2)^2 * (omegas)^2);
P2od  =  round((1+6.25*10^-24*(1+ND^2)^2 * omegas^2),1);
Slope=abs((Pload/P2od^2));
Slope= log10(Slope/ND) * 10 ;

% sainda de dados em tela
fprintf(' \n');
fprintf('Ganho calculado com sucesso \n');
fprintf(' \n');
fprintf('O valor de ganho obtido foi de %.2f dB \n',round(Slope,1));