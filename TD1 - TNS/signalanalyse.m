function [x,n,fe]=signalanalyse()
%
% [x,n,fe]=signalanalyse();
%
% Fonction r�alisant la g�n�ration d'un signal synth�tique
% compos� de 3 sinus, d'amplitude et de fr�quence :
%   . A1=1   , f1=100   Hz
%   . A2=0.75, f2=211   Hz
%   . A3=0.05, f3=219 Hz
% � la fr�quence d'�chantillonnage fe=1024 HZ
% et de longueur N=512 �chantillons
%
% Sorties :
%  - x  : �chantillons du signal      [512 x 1]
%  - n  : num�ro d'�chantillon        [512 x 1]
%  - fe : fr�quence d'�chantillonnage (en Hertz)

%% Param�tres g�n�raux
% Fr�quence d'�chantillonnage fe (en Hz)
fe=1024;

% Nombre total d'�chantillons
N=512;

% Vecteur temps (en �chantillons)
n=(0:N-1).';

% Vecteur temps (en secondes)
t=n/fe;

%% G�n�ration du signal synth�tique
% Amplitude, fr�quence et phase sinus 1
A1=1;
f1=100;
phi1=1.638;

% Amplitude, fr�quence et phase sinus 2
A2=0.75;
f2=211;
phi2=-0.835;

% Amplitude, fr�quence et phase sinus 3
A3=0.05;
f3=219;
phi3=-2.498;

% Signal synth�tique total
x=A1*sin(2*pi*f1*t+phi1)+A2*sin(2*pi*f2*t+phi2)+A3*sin(2*pi*f3*t+phi3);