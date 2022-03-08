function [S,fr]=spectre4(x,fe)
%
% [S,fr]=spectre4(x,fe);
%
% Fonction réalisant l'estimation du spectre
% d'un signal à l'aide d'une TFD
% 
% Entrée :
%  - x  : échantillons du signal [N x 1]
%  - fe : fréquence d'échantillonnage (en Hertz)
%
% Sorties :
%  - S  : valeur du spectre du signal [Nfft x 1]
%  - fr : fréquence réelle en Hertz [Nfft x 1]

%% Mise en forme du signal (fait)
% Signal en vecteur colonne
x=x(:);
% Nombre d'échantillons temporels du signal
N=length(x);

%% Fenêtre d'apodisation (fait)
g=hanning(N);
%g=boxcar(N);
xa=x.*g;

%% Passage en fréquence (fait) + Interpolation en fréquence (fait)
% TFD
p=128;      %facteur de suréchantillonnage
Nfft=p*N; %nombre de points de la TFD
TFD=fft(xa,Nfft); %passage en fréquence par TFD sur Nfft points
S=abs(TFD);      %estimateur de base du spectre d'amplitude

%% Calibrage des abscisses (fait)
k=0:Nfft-1; %numéro d'échantillon du spectre
l=k/Nfft; %fréquence réduite
fr=l*fe; %fréquence réelle
fr=fr(1:Nfft/2+1); %fréquences réelles positives
S=S(1:Nfft/2+1); %fréquences réelles positives

%% Calibrage des ordonnées (fait)
normalisation=2/abs(sum(g));
S=S*normalisation;
