function [S,k]=spectre(x,fe, fenetre)
%
% [S,k]=spectre(x,fe);
%
% Fonction r�alisant l'estimation du spectre
% d'un signal � l'aide d'une TFD
% 
% Entr�e :
%  - x  : �chantillons du signal [N x 1]
%  - fe : fr�quence d'�chantillonnage (en Hertz)
%
% Sorties :
%  - S : valeur du spectre du signal    [Nfft x 1]
%  - k : num�ro d'�chantillon du spectre [Nfft x 1]

%% Mise en forme du signal (fait)
% Signal en vecteur colonne
x=x(:);
% Nombre d'�chantillons temporels du signal
N=length(x);
    
%% Fen�tre d'apodisation (� faire)
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

%% Passage en fr�quence (fait) + Interpolation en fr�quence (� faire)
% TFD
Nfft=length(x);  %nombre de points de la TFD
TFD=fft(x,Nfft); %passage en fr�quence par TFD sur Nfft points
S=abs(TFD);      %estimateur de base du spectre d'amplitude

%% Calibrage des abscisses (� faire)
k=(0:Nfft-1)./Nfft; %num�ro d'�chantillon du spectre
k = k * fe;

%% Supprimer partie negative

k = k(1:ceil(end/2));

%% Calibrage des ordonn�es (� faire)

S = S / sum(window);

S = S(1:ceil(end/2));
