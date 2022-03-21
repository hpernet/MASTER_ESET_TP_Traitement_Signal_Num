 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% % PREMIERE PARTIE/ 
 %Calculer la probabilité de fausse alarme
% 1°) Construction d'un bruit de distribution gaussienne
clear all
close all
clc
N=1e3 ;% A COMPLETER nombre de points observés
N_X=N/5;
%
Ag=10; % A COMPLETER amplitude du signal aléatoire
%
noise_g=Ag*randn(1,N);
%
% 2°) Distribution du signal
[Ng,Xg]=hist(noise_g,N_X);
%
figure(1); stairs(Xg,Ng)
%
% 2°) Probabilité de fausse alarme
thr=[-3*Ag:0.001:3*Ag]; % variation du seuil entre -3 sigma et 3 sigma
%
PFA= zeros(1,length(thr)); 
PFA=1/2.*erfc(thr./sqrt(2.*Ag)); % A COMPLETER probabilité de fausse alarme

%
figure(2); semilogy(thr,PFA);
axis tight %Axes ajustés 
grid on %Grille 
%%
figure(3)
sp=subplot(2,1,1)
stairs(Ng);
sp=subplot(2,1,2)
set(sp,'fontsize',12)
hold on
stairs(Xg,cumsum(Ng)/N) % A COMPLETER distribution statistique cumulée
plot(thr,1-PFA,'r--')
axis([-inf inf 0 inf])
grid
ylabel('distribution')
xlabel('amplitude')
text(Ag,3*0.25,'cdf','fontsize',12);
%%
figure(4)
% sp=subplot(2,1,1)
set(sp,'fontsize',12)
hold on
stairs(Xg,1-cumsum(Ng)/N,'k') % A COMPLETER distribution statistique cumulée
plot(thr,PFA,'b--')
axis([-inf inf 0 inf])
grid
ylabel('distribution')
xlabel('amplitude')
text(0,0.25,'1-cdf','fontsize',12);
grid on
axis([-3*Ag 3*Ag 0 1]) 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%% DEUXIEME PARTIE/ DETECTER UN SIGNAL RADAR
% radard=load('radard.mat');
clear all;
close all;
clc
Radar_Tx_Signal=load('Radar_Tx_Signal.mat');
Radar_Rx_signal=canal_radar(Radar_Tx_Signal);
%
Reponse_0=Radar_Tx_Signal.Tx_signal;
t0=Radar_Tx_Signal.time_scale;
%
No_signal=Radar_Rx_signal.No_signal;
Reponse_1=Radar_Rx_signal.Reponse_1;
Reponse_2=Radar_Rx_signal.Reponse_2;
t=Radar_Rx_signal.t;
%
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
ylabel('Réponses (V)')
grid;


%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% TROISIEME PARTIE/ POSITIONNER UN ROBOT 
Robot_Tx_Signal=load('Robot_Tx_Signal.mat');
Robot_Rx_signal=canal_robot(Robot_Tx_Signal);