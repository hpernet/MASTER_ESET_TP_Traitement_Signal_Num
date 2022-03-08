function [x,n,fe]=signalanalyse()
%
% [x,n,fe]=signalanalyse();
%
% Fonction réalisant la génération d'un signal synthétique
% composé de 3 sinus, d'amplitude et de fréquence :
%   . A1=1   , f1=100   Hz
%   . A2=0.75, f2=211   Hz
%   . A3=0.05, f3=219 Hz
% à la fréquence d'échantillonnage fe=1024 HZ
% et de longueur N=512 échantillons
%
% Sorties :
%  - x  : échantillons du signal      [512 x 1]
%  - n  : numéro d'échantillon        [512 x 1]
%  - fe : fréquence d'échantillonnage (en Hertz)

%% Paramètres généraux
% Fréquence d'échantillonnage fe (en Hz)
fe=1024;

% Nombre total d'échantillons
N=512;

% Vecteur temps (en échantillons)
n=(0:N-1).';

% Vecteur temps (en secondes)
t=n/fe;

%% Génération du signal synthétique
% Amplitude, fréquence et phase sinus 1
A1=1;
f1=100;
phi1=1.638;

% Amplitude, fréquence et phase sinus 2
A2=0.75;
f2=211;
phi2=-0.835;

% Amplitude, fréquence et phase sinus 3
A3=0.05;
f3=219;
phi3=-2.498;

% Signal synthétique total
x=A1*sin(2*pi*f1*t+phi1)+A2*sin(2*pi*f2*t+phi2)+A3*sin(2*pi*f3*t+phi3);