%% TD1---------------------------------------------------------------------
close all; %ferme toutes les fenetres
clear all; %efface toutes les variables

% LOAD SIGNAL
load consoelq.mat;

fe = 24*365; %cycles par ann�es

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
fe = 24*365; %cycles par ann�es
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

% Compute power
power = trapz(t, No_signal .* No_signal) / t(Radar_Rx_signal.N);

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
ylabel('R�ponses (V)')
grid;


