function [S,fr]=spectre4(x,fe)
%
% [S,fr]=spectre4(x,fe);
%
% Fonction r�alisant l'estimation du spectre
% d'un signal � l'aide d'une TFD
% 
% Entr�e :
%  - x  : �chantillons du signal [N x 1]
%  - fe : fr�quence d'�chantillonnage (en Hertz)
%
% Sorties :
%  - S  : valeur du spectre du signal [Nfft x 1]
%  - fr : fr�quence r�elle en Hertz [Nfft x 1]

%% Mise en forme du signal (fait)
% Signal en vecteur colonne
x=x(:);
% Nombre d'�chantillons temporels du signal
N=length(x);

%% Fen�tre d'apodisation (fait)
g=hanning(N);
%g=boxcar(N);
xa=x.*g;

%% Passage en fr�quence (fait) + Interpolation en fr�quence (fait)
% TFD
p=128;      %facteur de sur�chantillonnage
Nfft=p*N; %nombre de points de la TFD
TFD=fft(xa,Nfft); %passage en fr�quence par TFD sur Nfft points
S=abs(TFD);      %estimateur de base du spectre d'amplitude

%% Calibrage des abscisses (fait)
k=0:Nfft-1; %num�ro d'�chantillon du spectre
l=k/Nfft; %fr�quence r�duite
fr=l*fe; %fr�quence r�elle
fr=fr(1:Nfft/2+1); %fr�quences r�elles positives
S=S(1:Nfft/2+1); %fr�quences r�elles positives

%% Calibrage des ordonn�es (fait)
normalisation=2/abs(sum(g));
S=S*normalisation;
