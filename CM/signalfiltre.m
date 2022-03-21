function [y,n,fe]=signalfiltre()
%
% [y,n,fe]=signalfiltre();
%
% Fonction r�alisant la g�n�ration d'un signal synth�tique
% compos� de 2 sinus, d'amplitude et de fr�quence :
%   . A1=1   , f1=100   Hz
%   . A2=0.85, f2=134   Hz
% � la fr�quence d'�chantillonnage fe=955 Hz
% et de longueur N=5000 �chantillons
%
% Sorties :
%  - y  : �chantillons du signal      [5000 x 1]
%  - n  : num�ro d'�chantillon        [5000 x 1]
%  - fe : fr�quence d'�chantillonnage (en H   z)

%% Param�tres g�n�raux
% Fr�quence d'�chantillonnage fe (en Hz)
fe=955;
% Nombre total d'�chantillons
N=5000;
% Vecteur temps (en �chantillons)
n=(0:N-1).';
% Vecteur temps (en secondes)
t=n/fe;

%% G�n�ration du signal synth�tique
% Amplitude, fr�quence et phase sinus 0
A1=1;f1=100;phi1=-2.739;
% Amplitude, fr�quence et phase sinus 1
A2=0.85;f2=134;phi2=1.591;
% Signal synth�tique total
y=A1*sin(2*pi*f1*t+phi1)+A2*sin(2*pi*f2*t+phi2);
