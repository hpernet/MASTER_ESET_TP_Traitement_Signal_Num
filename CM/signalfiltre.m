function [y,n,fe]=signalfiltre()
%
% [y,n,fe]=signalfiltre();
%
% Fonction réalisant la génération d'un signal synthétique
% composé de 2 sinus, d'amplitude et de fréquence :
%   . A1=1   , f1=100   Hz
%   . A2=0.85, f2=134   Hz
% à la fréquence d'échantillonnage fe=955 Hz
% et de longueur N=5000 échantillons
%
% Sorties :
%  - y  : échantillons du signal      [5000 x 1]
%  - n  : numéro d'échantillon        [5000 x 1]
%  - fe : fréquence d'échantillonnage (en H   z)

%% Paramètres généraux
% Fréquence d'échantillonnage fe (en Hz)
fe=955;
% Nombre total d'échantillons
N=5000;
% Vecteur temps (en échantillons)
n=(0:N-1).';
% Vecteur temps (en secondes)
t=n/fe;

%% Génération du signal synthétique
% Amplitude, fréquence et phase sinus 0
A1=1;f1=100;phi1=-2.739;
% Amplitude, fréquence et phase sinus 1
A2=0.85;f2=134;phi2=1.591;
% Signal synthétique total
y=A1*sin(2*pi*f1*t+phi1)+A2*sin(2*pi*f2*t+phi2);
