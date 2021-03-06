%% TD1---------------------------------------------------------------------
close all; %ferme toutes les fenetres
clear all; %efface toutes les variables

% LOAD SIGNAL
load consoelq.mat;

fe = 24*365; %cycles par ann?es

% ANALYSE
[S,k]=spectre4(ce(1,:), fe);

% AFFICHAGE 
figure(1);
subplot(2,1,1);
plot(ce);
subplot(2,1,2);
plot(k,S);

%% TD 2 -------------------------------------------------------------------
close all; %ferme toutes les fenetres
clear all; %efface toutes les variables

% LOAD SIGNAL
load consoelq.mat;

% VARIABLES
fe = 24*365; %cycles par ann?es
N = 700;
fen = hamming(N+1);
f1 = 17/fe;
f2 = 175/fe;

% ANALYSE
[S,k] = spectre4(ce(1,:), fe);

% AFFICHAGE SIGNAL TEMPOREL
figure(1);
subplot(2,1,1);
plot(ce);
subplot(2,1,2);
plot(k,S);

% COMPUTE FILTRE
b_passe_bas   = fir1(N, 2*f1, fen);
b_passe_bande = fir1(N, 2*[f1 f2], fen);
b_passe_haut  = fir1(N, 2*f2, 'high',  fen);

% APPLIQUE FILTRE 
cycle_year  = filter(b_passe_bas,   1, ce);
cycle_month = filter(b_passe_bande, 1, ce);
cycle_day   = filter(b_passe_haut,  1, ce);

% AFFICHE SIGNALE FILTRE TEMP
figure(2);
subplot(3,1,1);
plot(cycle_year);
subplot(3,1,2);
plot(cycle_month);
subplot(3,1,3);
plot(cycle_day);

% ANALYSE SIGNAL FILTRE 
[S_year,k]  = spectre4(cycle_year, fe);
[S_month,k] = spectre4(cycle_month, fe);
[S_day,k]   = spectre4(cycle_day, fe);

%AFFICHE SPECTRE SIGNAL FITREE 
figure(3);
subplot(3,1,1);
plot(k, S_year);
subplot(3,1,2);
plot(k, S_month);
subplot(3,1,3);
plot(k, S_day);

%% TD3---------------------------------------------------------------------
close all; %ferme toutes les fenetres
clear all; %efface toutes les variables

% VARIABLES
Nb_point = 200;

bruit_blanc = 10 * randn(1, Nb_point, 'single'); 

% Compute power
power = sum(bruit_blanc .* bruit_blanc) / Nb_point;

figure(1)
plot(bruit_blanc)

%[counts,centers] = hist(bruit_blanc, Nb_point/5);
figure(2)
subplot(2,1,1);
histogram(bruit_blanc, Nb_point, 'Normalization', 'count');
subplot(2,1,2);
histogram(bruit_blanc, Nb_point, 'Normalization', 'cumcount');

%% TD3 RADAR
% radard=load('radard.mat');
clear all;
close all;
clc

% GET TX AND RX SIGNAL
Radar_Tx_Signal = load('Radar_Tx_Signal.mat');
Radar_Rx_signal = canal_radar(Radar_Tx_Signal);

Reponse_0 = Radar_Tx_Signal.Tx_signal;
t0 = Radar_Tx_Signal.time_scale;
%
No_signal = Radar_Rx_signal.No_signal;
Reponse_1 = Radar_Rx_signal.Reponse_1;
Reponse_2 = Radar_Rx_signal.Reponse_2;
t = Radar_Rx_signal.t;

% AFFICHAGE
figure(1);
subplot(2,1,1)
hold on
plot(t0*1e9,Reponse_0,'b-')
title('Radar')
xlabel('Time(ns)')
ylabel('Signal Radar Emis (V)')
subplot(2,1,2)
hold on
plot(t*1e9,Reponse_1)
plot(t*1e9,Reponse_2,'r--')
legend('T_0 = 0 s', 'T_1 = 1 s')
xlabel('Time(ns)')
ylabel('R?ponses (V)')
grid;

% Compute and plot distribution et stat cumulee
figure(2)
subplot(2,1,1);
histogram(No_signal, 5000, 'Normalization', 'pdf');
subplot(2,1,2);
histogram(No_signal, 5000, 'Normalization', 'cdf');

% Compute power
power = trapz(t, No_signal.^2) / t(Radar_Rx_signal.N);

% Compute stat variables
moyenne = mean(No_signal);
variance = var(No_signal);
ecart_type = sqrt(variance);

% Create Vseuil vector
V_seuil = 1e-7:1e-7:1e-3;

% Compute PFA(Vseuil)
PFA = erfc(V_seuil ./ (ecart_type * sqrt(2))) / 2;

% Plot FPA(Vseuil) 
figure(3)
subplot(2,1,1);
plot(V_seuil, PFA)
subplot(2,1,2);
semilogy(V_seuil, PFA)

% Analyse spactrale 
[S,k] = spectre4(Reponse_0, (1/t(2)));
figure(4)
plot(k,S)

% Analyse des signaux
[corr_1, lags1] = xcorr(Reponse_0, Reponse_1);
indice_1 = find(corr_1 == max(corr_1))
lags1(indice_1)
delta_t1 = t(indice_1(1)) / 2


[corr_2, lags2] = xcorr(Reponse_0, Reponse_2);
indice_2 = find(corr_2 == max(corr_2));
delta_t2 = t(indice_2(1)) / 2

c = 3e8;

d_1 = c * delta_t1
d_2 = c * delta_t2


figure(5)
subplot(2,1,1);
plot(corr_1)
subplot(2,1,2);
plot(corr_2)

