function [S,k]=spectre(x,fe, fenetre)
%
% [S,k]=spectre(x,fe);
%
% Fonction réalisant l'estimation du spectre
% d'un signal à l'aide d'une TFD
% 
% Entrée :
%  - x  : échantillons du signal [N x 1]
%  - fe : fréquence d'échantillonnage (en Hertz)
%
% Sorties :
%  - S : valeur du spectre du signal    [Nfft x 1]
%  - k : numéro d'échantillon du spectre [Nfft x 1]

%% Mise en forme du signal (fait)
% Signal en vecteur colonne
x=x(:);
% Nombre d'échantillons temporels du signal
N=length(x);
    
%% Fenêtre d'apodisation (à faire)
switch fenetre
    case "boxcar" 
        window = boxcar(N);
    case "hanning"
        window = hanning(N, 'symmetric');
    case "hamming"
        window = hamming(N,'symmetric');
    case "blackman"
        window = blackman(N);
    otherwise
end

x = x .* window;

% Ajout de zeros a la fin de x :
x = [x; zeros(7*N, 1)];

%% Passage en fréquence (fait) + Interpolation en fréquence (à faire)
% TFD
Nfft=length(x);  %nombre de points de la TFD
TFD=fft(x,Nfft); %passage en fréquence par TFD sur Nfft points
S=abs(TFD);      %estimateur de base du spectre d'amplitude

%% Calibrage des abscisses (à faire)
k=(0:Nfft-1)./Nfft; %numéro d'échantillon du spectre
k = k * fe;

%% Supprimer partie negative

k = k(1:ceil(end/2));

%% Calibrage des ordonnées (à faire)

S = S / sum(window);

S = S(1:ceil(end/2));
